from app import app, db
from app.models.User import User
from flask import request


@app.route("/users", methods=["GET", "POST"])
def user_index():
    if request.method == "GET":
        return get_all_users()
    if request.method == "POST":
        return register_user()


def get_all_users():
    pass


def register_user():
    pass
