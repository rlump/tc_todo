# tc_todo

## todo json api RAILS web server - sqlLite default database

FIRST:
$> rake db:migrate 

THEN: 
$> rails s


Create a user (server running locally http://localhost:3000):

curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d '{ "user": { "first_name" : "john" , "last_name" : "doe", "email": "j@d.com" }}' http://localhost:3000/users

Create a todo for a user with id 1:

curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d '{ "todo" : { "desc" : "must be done", "due_date" : "2015-08-28" }}' http://localhost:3000/users/1/todos

Mark as complete todo with id 1:

curl -i -X PUT  -H "Accept: application/json" -H "Content-Type: application/json" -d '{ "todo": { "completed" : "true" }}' http://localhost:3000/todos/1

Retrieve all todos for user with id 1:

curl -i -H "Accept: application/json" -H "Content-Type: application/json" http://localhost:3000/users/1/todos

Retrieve all incomplete todos for user with id 1:

curl -i -H "Accept: application/json" -H "Content-Type: application/json" http://localhost:3000/users/1/todos?completed=false


