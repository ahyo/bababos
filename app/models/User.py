from app import db, bcrypt

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    fullname = db.Column(db.String(200))
    email = db.Column(db.String(200),unique=True,nullable=False)
    password = db.Column(db.String(), nullable=False)
    
    
    def __repr__(self) -> str:
        return f'User {self.email}'
    
    def set_password(self, password):
        self.password = bcrypt.generate_password_hash(password).decode('utf-8')
    
    def check_password(self, password):
        return bcrypt.check_password_hash(self.password,password)
    
    def create(self):
        db.session.add(self)
        db.session.commit()
        
    def update(self):
        db.session.commit()
        
    def delete(self):
        db.session.delete()
        db.session.commit()
        
    def toDic(self):
        data = {}
        for col in self.__table__.columns:
            if col=='password':
                continue
            data[col.name] = getattr(self,col.name)
        return data
    
    def findAll():
        return User.query.all()
    
    def findById(id):
        return User.query.get(id)
    
    def findByEmail(e):
        return User.query.filter_by(email=e).first()        
        