from app import app 
from flask import Response, json
from app.helpers.check_token import token_required

@app.route("/")
def index(): 
    response = {
        "status" : 1,
        "message" : "Welcome to Bababos Price Engine"
    }
    return Response(response=json.dumps(response),status=200,mimetype="application/json")


# sample for auth
@app.route("/dashboard")
@token_required
def dashboard():
    response = {
        "status": 1,
        "message": "Data dashboard",
        "data":[
            {
                "section":1,
                "title":"Laporan"
            },
            {
                "section":2,
                "title":"Chart"
            }
        ]   
    }
    return Response(response=json.dumps(response),status=200,mimetype="application/json")