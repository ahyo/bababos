from app import db


class PurchaseOrder(db.Model):
    __tablename__ = "purchase_order"
    id = db.Column(db.Integer, primary_key=True)
    customer_id = db.Column(db.String(100))
    order_date = db.Column(db.Date)
    sku_code = db.Column(db.String(100))
    sku_id = db.Column(db.String(100))
    sku_name = db.Column(db.String(100))
    order_qty = db.Column(db.Integer)
    order_unit = db.Column(db.String(100))
    selling_price = db.Column(db.Double)

    def findAll():
        return PurchaseOrder.query.all()

    def findById(id):
        return PurchaseOrder.query.get(id)

    def findByHistory(c_id, s_id):
        return (
            PurchaseOrder.query.filter_by(customer_id=c_id, sku_id=s_id)
            .order_by(PurchaseOrder.order_date)
            .first()
        )
