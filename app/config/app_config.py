from datetime import timedelta

class AppConfig(object):
    SQLALCHEMY_DATABASE_URI = "postgresql://postgres:password@localhost/bababos"
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    JWT_SECRET_KEY = '12345qwerasdfzxcv67890'
    JWT_ACCESS_TOKEN_EXPIRES = timedelta(days=1)