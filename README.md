# go-micro-graphql
golang graphql in microservice docker ,This project will provide posts users and comments model using cockroachdb!

#v1.0 features
. using root cockroachdb user to load rootsql.sql for drop database, create database and show database
. grant stan user for all to bbs database
. use stan user to exec load sql for create users, posts, comments tables and insert init rows.
. one user has multi posts. one post has multi comments.

# fist install cockroachdb and running.

# connecting to cockroachdb
note: sslmode=disable must use, otherwise cann't connect ssl.
db, err = sql.Open("postgres", "postgres://stan:888888@10.8.15.167:26257/bbs?sslmode=disable")

# cockroachdb users, posts, comments table file

# user root user exec
#user stan user exec createdb.sql for create posts,users,comments, tables and insert data.
cockroach sql --insecure -e 'GRANT ALL ON DATABASE bbs TO stan' --host 10.8.15.167
cockroach sql --insecure --host=10.8.15.167  < rootdb.sql
cockroach sql -u stan --insecure --host=10.8.15.167 < createdb.sql
# Commands

This application exposes a single endpoints /graphql which accepts both mutations and queries. The following are examples of curl calls to this endpoint:
# query user table's id, email field.
curl -XPOST http://10.8.15.9:8080/graphql -d '{user(id:257448857535250433){id,email}}'
curl -XPOST http://10.8.15.9:8080/graphql -d '{user(id:257448857535184897){name,email}}'

curl -XPOST http://vm:8080/graphql -d 'mutation {createUser(email:"1@x.co"){id, email}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {createUser(email:"2@y.co"){id, email}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {follow(follower:1, followee:2)}'
curl -XPOST http://vm:8080/graphql -d 'mutation {unfollow(follower:1, followee:2)}'
curl -XPOST http://vm:8080/graphql -d '{user(id:2){followers{id, email}}}'
curl -XPOST http://vm:8080/graphql -d '{user(id:1){followers{id, email}}}'
curl -XPOST http://vm:8080/graphql -d '{user(id:2){follower(id:1){ email}}}'
curl -XPOST http://vm:8080/graphql -d '{user(id:1){followees{email}}}'
curl -XPOST http://vm:8080/graphql -d '{user(id:1){followee(id:2){email}}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {createPost(user:1,title:"p1",body:"b1"){id}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {createComment(user:1,post:1,title:"t1",body:"b1"){id}}'
curl -XPOST http://vm:8080/graphql -d 'mutation {removeComment(id:1)}'
curl -XPOST http://vm:8080/graphql -d 'mutation {removePost(id:1)}'
curl -XPOST http://vm:8080/graphql -d '{user(id:1){post(id:2){title,body}}}'
curl -XPOST http://vm:8080/graphql -d '{user(id:1){posts{id,title,body}}}'
curl -XPOST http://vm:8080/graphql -d '{user(id:1){post(id:2){user{id,email}}}}'
