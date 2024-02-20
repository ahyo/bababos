from app import app, db
from app.models.PurchaseOrder import PurchaseOrder
from flask import request, Response, json, jsonify


@app.route("/purchaseorders", methods=["GET", "POST"])
def po_index():
    if request.method == "GET":
        return get_all_pos()
    if request.method == "POST":
        return register_po()
    return ""


def get_all_pos():
    pos = PurchaseOrder.findAll()
    response = {"success": 1, "message": "Purchase Order data", "data": []}

    for data in pos:
        detail = {
            "id": data.id,
            "customer_id": data.customer_id,
            "order_date": data.order_date,
            "sku_code": data.sku_code,
            "sku_id": data.sku_id,
            "sku_name": data.sku_name,
            "order_qty": data.order_qty,
            "order_unit": data.order_unit,
            "selling_price": data.selling_price,
        }
        response["data"].append(detail)

    return jsonify(response), 200


def register_po():
    pass
