from app import app, db
from flask import Response,json
from app.helpers.price import Price

@app.route('/price/inquiry')
def price_inquiry():
    price = Price(
        desired_profit_margin=0.1,
        cost_price=1000,
        demand_factor=1,
        market_best_price=900
        )
    
    response = {
        "status":1,
        "message":"Best price",
        "price":price.calculate_price()
    }
    
    return Response(response=json.dumps(response),status=200,mimetype="application/json")