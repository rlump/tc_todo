# tc_todo

## todo json api web server - sqlLite default database

Create a user:

curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X POST \
 -d '{ "user": { "first_name" : "john" , "last_name" : "doe", "email": "j@d.com" }}' \
  http://localhost:3000/users

Create a todo for a user with id 1:
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X POST \
 -d '{ "todo" : { "desc" : "must be done", "due_date" : "2015-08-28" }}' \
 http://localhost:3000/users/1/todos

Mark as complete todo with id 1:
curl -i -X PUT  -H "Accept: application/json" -H "Content-Type: application/json" \
-d '{ "todo": { "completed" : "false" }}' \
http://localhost:3000/todos/1

Retrieve all todos for user with id 1:
curl -i -H "Accept: application/json" -H "Content-Type: application/json" \
 http://localhost:3000/users/1/todos

Retrieve all incomplete todos for user with id 1:
curl -i -H "Accept: application/json" -H "Content-Type: application/json" \
 http://localhost:3000/users/1/todos?completed=false


