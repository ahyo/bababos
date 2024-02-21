from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_bcrypt import Bcrypt
from flask_jwt_extended import JWTManager
from app.config.app_config import AppConfig

# flask init
app = Flask(__name__)
app.config.from_object(AppConfig)

# app config
db = SQLAlchemy(app)
migrate = Migrate(app, db)
bcrypt = Bcrypt(app)
jwt = JWTManager(app)

from app import routes, models

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=8000)
