from app import app, db
from app.models.Customer import Customer
from flask import request, Response, json, jsonify


@app.route("/customers", methods=["GET", "POST"])
def customers_index():
    if request.method == "GET":
        return get_all_customers()
    if request.method == "POST":
        return register_customer()
    return ""


def get_all_customers():
    customers = Customer.findAll()
    response = {"success": 1, "message": "Customer data", "data": []}

    for data in customers:
        detail = {
            "id": data.id,
            "address": data.address,
            "city": data.city,
            "state": data.state,
        }
        response["data"].append(detail)

    return jsonify(response), 200


def register_customer():
    pass
