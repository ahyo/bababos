from app import app, db
from app.models.Supplier import Supplier
from flask import request, Response, json, jsonify


@app.route("/suppliers", methods=["GET", "POST"])
def suppliers_index():
    if request.method == "GET":
        return get_all_suppliers()
    if request.method == "POST":
        return register_supplier()
    return ""


def get_all_suppliers():
    result = Supplier.findAll()
    response = {"success": 1, "message": "Supplier data", "data": []}

    for data in result:
        detail = {
            "id": data.id,
            "address": data.address,
            "city": data.city,
            "state": data.state,
        }
        response["data"].append(detail)

    return jsonify(response), 200


def register_supplier():
    pass
