from app import db


class Logs(db.Model):
    id = db.Column(db.String(100), primary_key=True)
    address = db.Column(db.String(200))
    city = db.Column(db.String(100))
    state = db.Column(db.String(100))

    def findAll():
        return Logs.query.all()
