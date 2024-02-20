from app import db


class Customer(db.Model):
    id = db.Column(db.String(100), primary_key=True)
    address = db.Column(db.String(200))
    city = db.Column(db.String(100))
    state = db.Column(db.String(100))

    def findAll():
        return Customer.query.all()

    def findById(id):
        return Customer.query.get(id)
