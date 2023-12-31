from flask import Flask, session, request, g, render_template, redirect, url_for,flash
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import select
from flask_mysqldb import MySQL
import mysql.connector as sql
import os
from dotenv import load_dotenv
load_dotenv()

# import sqlite3  
# con = sqlite3.connect("employee.db")  
app = Flask(__name__)
app.secret_key = "1234"

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+mysqlconnector://'+os.getenv("DB_USERNAME")+':'+os.getenv("DB_PASSWORD")+'@'+os.getenv("DB_HOST")+':3306'+'/'+os.getenv("DB_NAME")
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)
 

class contents(db.Model):
    no = db.Column(db.Integer, primary_key=True)
    bgimg = db.Column(db.String(255), nullable=False)
    href1 = db.Column(db.String(255), nullable=False)
    title = db.Column(db.String(20), nullable=False)
    href2 = db.Column(db.String(255), nullable=False)
    info = db.Column(db.String(1024), nullable=False)


class user(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(100), nullable=False)
    username = db.Column(db.String(50), nullable=False)
    password = db.Column(db.String(100), nullable=False)
    lavel = db.Column(db.Integer,  nullable=False)
    
@app.route("/")
def index():

    content = contents.query.all()

    return render_template("index.html", title="AnimeInsights", content=content)


@app.route('/login', methods=['GET', 'POST'])
def login():
    if 'user' not in session:
        cur = db.session.connection()
        error = None

        if request.method == 'POST':
            session.pop('user',None)
            username = request.form.get("username")
            password = request.form.get("password")
            result=user.query.filter_by(username=username).first()
            
            if password!=result.password:
                flash('Invalid Credentials. Please try again.')
            else:
                session['lavel']=result.lavel 
                session['user']=username
                return redirect(url_for("index"))
        return render_template("login.html", title="Login",error=error)
    return redirect(url_for("index"))
   

@app.route("/signup", methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        email = request.form.get('Email')
        username = request.form.get('username')
        password = request.form.get('password')
        entry = user(email=email, username=username, password=password,lavel=1)
        db.session.add(entry)
        db.session.commit()
    return render_template("signup.html", title="Sign up")

@app.route("/dash")
def dash():
    if 'user' in session:
        if session['lavel'] == 1 or 2:
            content = contents.query.all()

            return render_template("dash.html", title="dashboard",content=content)

    return redirect(url_for("login"))

@app.route("/admin")
def admin():
    if 'user' in session:
        if session['lavel'] == 2:
            users = user.query.all()
            return render_template("admin.html", title="Admin Panel",users=users)
    return redirect(url_for("login"))


@app.route("/form", methods=['GET', 'POST'])
def form():
    if g.user:
        if(request.method=='POST'):
            title  = request.form.get('title')
            bgimg = request.form.get('bgimg')
            href1 = request.form.get('href1')
            href2 = request.form.get('href2')
            info = request.form.get('info')

            entry=contents(title=title,bgimg=bgimg,href1=href1,href2=href2,info=info)
            db.session.add(entry)
            db.session.commit()

        return render_template('form.html', title="Form")
    return redirect(url_for("login"))


@app.before_request
def before_request():
    g.user = None
    if 'user' in session:
        g.user = session['user']

@app.route("/edit/<string:user_slug>", methods=['POST','GET'])
def edit(user_slug):
    if 'user' in session: 
            if session['lavel'] == 1 or 2 :
                content = contents.query.filter_by(title=user_slug).first()
                if(request.method=='POST'):
                    content.title  = request.form.get('title')
                    content.bgimg = request.form.get('bgimg')
                    content.href1 = request.form.get('href1')
                    content.href2 = request.form.get('href2')
                    content.info = request.form.get('info')
                    try:
                        db.session.commit()
                        return redirect('/dash')
                    except:
                        return "there was an error"
            return render_template('edit.html',title="info",content=content)
    return redirect(url_for('index'))
    
@app.route('/logout')
def logout():
    session.pop('user')
    return redirect(url_for('index'))

@app.route("/sources")
def Sources():  
    return render_template("Sources.html", title="Source")


@app.route("/dash/<string:user_slug>", methods=['GET'])
def info(user_slug):    
    if 'user' in session:
        content = contents.query.filter_by(title=user_slug).first()
        return render_template('info.html',content=content )
    return redirect(url_for('index'))


@app.route("/<string:user_slug>/delete")
def delete(user_slug):
    if 'user' in session:
        if session['lavel'] == 1 or 2 :
            contents.query.filter_by(title=user_slug).delete()
            db.session.commit()
            return redirect(url_for('dash'))
    else:
        return redirect(url_for('index'))

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template('404.html',title="404 xD")
