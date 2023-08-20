# To recreate the project on locally
### Step 0 : Create a Database and .env file to store its connection info

to create database use flask.sql and create a .env file in the following format
```
database: flask
username:root
host: localhost
password:
```
#### Replace root with your mysql servers username,localhost with your database host name and add password of your mysql servers in the blank space after password:
#### The default values for the xampp server are filled

### Step 1 : Clone the repository 
```
$ git clone https://github.com/Sha1kh4/project-2.git
```
### Step 2 : Change the directory to project folder
```
$ cd project-2
```
### Step 3 : install required packages
```
$ pip install -r req.txt
```

### Step 4 : Run using flask run
```
$ flask run
```

### Note: However this needs active internet connection to render images and css from tailwind and to connect with the planetscale database
