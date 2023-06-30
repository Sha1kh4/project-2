from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///database.db'
app.config['SECRET_KEY'] = '123'

db = SQLAlchemy(app)

class User(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(20), nullable=False,unique=True)
    password = db.Column(db.String(20), nullable=False)


@app.route("/")
def hello_world():
    return render_template("index.html", title="Index")

@app.route("/login")
def login():
    return render_template("login.html", title="Login")

@app.route("/signup")
def signup():
    return render_template("signup.html", title="Sign up")

@app.route("/sources")
def Sources():
    return render_template("Sources.html", title="Source")

if __name__ == '__main__':
    app.run()
