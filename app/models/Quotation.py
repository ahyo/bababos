from app import db


class Quotation(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    customer_id = db.Column(db.String(100))
    sku_id = db.Column(db.String(100))
    qty = db.Column(db.Integer)
    unit = db.Column(db.String(100))

    def findAll():
        return Quotation.query.all()

    def findById(id):
        return Quotation.query.get(id)
