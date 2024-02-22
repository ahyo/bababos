from app import app, db
from flask import Response, json, request
from app.helpers.price import Price
from app.models.Customer import Customer
from app.models.PriceList import PriceList
from app.models.PurchaseOrder import PurchaseOrder
from app.models.Logs import Logs
from datetime import datetime


@app.route("/price/inquiry", methods=["POST"])
def price_inquiry():
    if request.method != "POST":
        return response_error("Unsupported method type")

    # handle headers
    header_json = request.headers.get("Content-Type") == "application/json"
    header_form = (
        request.headers.get("Content-Type") == "application/x-www-form-urlencoded"
    )

    # get all posts request
    if header_json:
        customer_id = request.json.get("customer_id")
        sku_id = request.json.get("sku_id")
        # qty = request.json.get("qty")
    elif header_form:
        customer_id = request.form.get("customer_id")
        sku_id = request.form.get("sku_id")
        # qty = request.form.get("qty")
    else:
        return response_error("Unsupported header type")

    if customer_id == None:
        return response_error("Customer id is required")

    if sku_id == None:
        return response_error("Sku id is required")

    # if qty == None:
    #     return response_error("Qty is required")

    # validate customer
    customer_id = str(customer_id)
    customer = Customer.findById(customer_id)
    if customer == None:
        return response_error("Customer was not found")

    # validate SKU
    sku_id = str(sku_id)
    sku = PriceList.findBySku(sku_id)
    if sku == None:
        return response_error("Sku was not found")

    # check history
    # TODO: move all logic to price class
    history = check_history(customer_id, sku_id)
    if history == None:
        # new price
        note = "new price"
        price = Price(
            desired_profit_margin=0.1,
            cost_price=sku.price * (85 / 100),
            demand_factor=0.05,
            market_best_price=sku.price,
        ).calculate_price()
    else:
        # history price
        note = "from history po"
        price = history.selling_price

        if price > sku.price:
            # market lebih murah?
            note = "from market price"
            price = sku.price
    # save log
    log = Logs(
        customer_id=customer_id, sku_id=sku_id, price=price, timestamp=datetime.now()
    )
    log.save()

    response = {
        "status": 1,
        "message": "Best price",
        "data": {
            "customer_id": customer_id,
            "sku_id": sku_id,
            "price": price,
            "note": note,
        },
    }

    return Response(
        response=json.dumps(response), status=200, mimetype="application/json"
    )


def response_error(msg):
    response = {"status": 0, "message": msg}
    return Response(
        response=json.dumps(response), status=401, mimetype="application/json"
    )


def check_history(customer_id, sku_id):
    return PurchaseOrder.findByHistory(customer_id, sku_id)
