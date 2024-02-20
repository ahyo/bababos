from app import app 

@app.route("/auth/login",methods=["POST"])
def authLogin():
    return auth_user()

@app.route("/auth/logout")
def authLogout():
    return user_logout()

@app.route("/auth/refresh")
def authRefresh():
    return auth_refresh()

def auth_user():
    pass

def user_logout():
    pass

def auth_refresh():
    pass