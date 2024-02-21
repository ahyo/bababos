from app import db


class Logs(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    customer_id = db.Column(db.String(100))
    sku_id = db.Column(db.String(100))
    timestamp = db.Column(db.String(100))
    price = db.Column(db.Double)

    def findAll():
        return Logs.query.all()

    def save(self):
        db.session.add(self)
        db.session.commit()
