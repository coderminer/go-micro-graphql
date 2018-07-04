[root@ickey-master graphql-go-example]# curl -XPOST http://10.8.11.62:8089/graphql -d '{user(id:257448857535250433){name,email}}'
{"data":{"user":{"email":"maobisheng@qq.com","name":"maobisheng"}}}
[root@ickey-master graphql-go-example]# curl -XPOST http://10.8.11.62:8089/graphql -d '{user(id:257448857535250433){name,email,posts {id,title,body, comments{title,body}}}}'
{"data":{"user":{"email":"maobisheng@qq.com","name":"maobisheng","posts":[{"body":"a new mao news.","comments":[],"id":"257448857535250433","title":"mao"}]}}}

[root@ickey-master graphql-go-example]# curl -XPOST http://10.8.11.62:8089/graphql -d '{user(id:257448857535184897){name,email,posts {id,title,body, comments{title,body}}}}'
{"data":{"user":{"email":"stanhangzhou@qq.com","name":"stan","posts":[{"body":"a new bitcoin news.","comments":[],"id":"257448857535184897","title":"bitcoin"},{"body":"a new bitcoin2 news.","comments":[],"id":"257448857535184897","title":"bitcoin2"}]}}}


## mutation
#### createUser for create a user
curl -XPOST http://10.8.11.62:8089/graphql -d 'mutation {createUser(name:"stanxii", email:"stan2@y.co"){id, name, email}}'


## stan following to weizhenping.
curl -XPOST http://10.8.11.62:8089/graphql -d 'mutation {follow(follower:257448857535184897, followee:257448857535152129)}
curl -XPOST http://10.8.11.62:8089/graphql -d 'mutation {createUser(email:"2@y.co"){id, email}}'

## stan following to weizhenping.
curl -XPOST http://10.8.11.62:8089/graphql -d 'mutation {follow(follower:257448857535184897, followee:257448857535152129)}'
curl -XPOST http://10.8.11.62:8089/graphql -d 'mutation {unfollow(follower:1, followee:2)}'
curl -XPOST http://10.8.11.62:8089/graphql -d '{user(id:2){followers{id, email}}}'
curl -XPOST http://10.8.11.62:8089/graphql -d '{user(id:1){followers{id, email}}}'
curl -XPOST http://10.8.11.62:8089/graphql -d '{user(id:2){follower(id:1){ email}}}'
curl -XPOST http://10.8.11.62:8089/graphql -d '{user(id:1){followees{email}}}'
curl -XPOST http://10.8.11.62:8089/graphql -d '{user(id:1){followee(id:2){email}}}'
curl -XPOST http://10.8.11.62:8089/graphql -d 'mutation {createPost(user:1,title:"p1",body:"b1"){id}}'
curl -XPOST http://10.8.11.62:8089/graphql -d 'mutation {createUser(email:"1@x.co"){id, email}}'
curl -XPOST http://10.8.11.62:8089/graphql -d 'mutation {createComment(user:1,post:1,title:"t1",body:"b1"){id}}'
curl -XPOST http://10.8.11.62:8089/graphql -d 'mutation {removeComment(id:1)}'
curl -XPOST http://10.8.11.62:8089/graphql -d 'mutation {removePost(id:1)}'
curl -XPOST http://10.8.11.62:8089/graphql -d '{user(id:1){post(id:2){title,body}}}'
curl -XPOST http://10.8.11.62:8089/graphql -d '{user(id:1){posts{id,title,body}}}'
curl -XPOST http://10.8.11.62:8089/graphql -d '{user(id:1){post(id:2){user{id,email}}}}
