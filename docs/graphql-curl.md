[root@ickey-master graphql-go-example]# curl -XPOST http://10.8.15.9:8080/graphql -d '{user(id:257448857535250433){name,email}}'
{"data":{"user":{"email":"maobisheng@qq.com","name":"maobisheng"}}}
[root@ickey-master graphql-go-example]# curl -XPOST http://10.8.15.9:8080/graphql -d '{user(id:257448857535250433){name,email,posts {id,title,body, comments{title,body}}}}'
{"data":{"user":{"email":"maobisheng@qq.com","name":"maobisheng","posts":[{"body":"a new mao news.","comments":[],"id":"257448857535250433","title":"mao"}]}}}

[root@ickey-master graphql-go-example]# curl -XPOST http://10.8.15.9:8080/graphql -d '{user(id:257448857535184897){name,email,posts {id,title,body, comments{title,body}}}}'
{"data":{"user":{"email":"stanhangzhou@qq.com","name":"stan","posts":[{"body":"a new bitcoin news.","comments":[],"id":"257448857535184897","title":"bitcoin"},{"body":"a new bitcoin2 news.","comments":[],"id":"257448857535184897","title":"bitcoin2"}]}}}

