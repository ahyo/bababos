from functools import wraps
import json
from flask import Response, request

def token_required(function):
    @wraps(function)
    def decorateFunc(*args, **kwargs):
        token = request.headers.get('Authorization')
        if not token:
            response = {
                "status": 0,
                "message": "Auth required"
            }
            return Response(response=json.dumps(response),mimetype="application/json",status=401)
        
        return function(*args, **kwargs)
    
    return decorateFunc
