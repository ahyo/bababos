from app import app, db
from app.models.Quotation import Quotation
from flask import request, Response, json, jsonify


@app.route("/quotations", methods=["GET", "POST"])
def quotations_index():
    if request.method == "GET":
        return get_all_quotations()
    if request.method == "POST":
        return register_quotation()
    return ""


def get_all_quotations():
    result = Quotation.findAll()
    response = {"success": 1, "message": "Quotation data", "data": []}

    for data in result:
        detail = {
            "id": data.id,
            "customer_id": data.customer_id,
            "sku_id": data.customer_id,
            "qty": data.qty,
            "unit": data.unit,
        }
        response["data"].append(detail)

    return jsonify(response), 200


def register_quotation():
    pass
