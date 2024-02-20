from app import db


class PriceList(db.Model):
    __tablename__ = "pricelist"
    id = db.Column(db.Integer, primary_key=True)
    supplier_id = db.Column(db.String(100))
    sku_id = db.Column(db.String(100))
    price = db.Column(db.Double)
    stock = db.Column(db.Integer)

    def findAll():
        return PriceList.query.all()

    def findById(id):
        return PriceList.query.get(id)
