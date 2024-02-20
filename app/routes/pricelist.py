from app import app, db
from app.models.PriceList import PriceList
from flask import request, Response, json, jsonify


@app.route("/pricelist", methods=["GET", "POST"])
def pricelist_index():
    if request.method == "GET":
        return get_all_prices()
    if request.method == "POST":
        return register_price()
    return ""


def get_all_prices():
    prices = PriceList.findAll()
    response = {"success": 1, "message": "Pricelist data", "data": []}

    for data in prices:
        detail = {
            "id": data.id,
            "supplier_id": data.supplier_id,
            "sku_id": data.sku_id,
            "price": data.price,
            "stock": data.stock,
        }
        response["data"].append(detail)

    return jsonify(response), 200


def register_price():
    pass
