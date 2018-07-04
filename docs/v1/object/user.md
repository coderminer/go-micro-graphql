## User
A user is an individual's account on GitHub that owns repositories and can make new content.

#### Implements
* [Actor](http://example.com/v1/interface/actor)
* [Node](http://example.com/v1/interface/node)
* [RegistryPackageOwner](http://example.com/v1/interface/regower)
* [RegistryPackageSearch](http://example.com/v1/interface/regower)
* [RepositoryOwner](http://example.com/v1/interface/regower)
* [UniformResourceLocatable](http://example.com/v1/interface/regower)


#### Connections

 *commitComments* ([CommitCommentConnection!](http://example.com/v1/interface/commitcomments))
A list of commit comments made by this user.

|参数名称|必须|类型|长度|缺省值|描述|
|---|---|---|---|---|---|
| after | yes  | string    | 无 | 无 | Returns the elements in the list that come after the specified cursor. |
| before | yes  | string  | 无 | 无 | Returns the elements in the list that come before the specified cursor. |
| first  | yes  | string  | 无 | 无 |  Returns the first n elements from the list. |
| last | yes  | string  |无 | 无  |  Returns the last n elements from the list. |


###### create user 
```
curl -XPOST http://10.8.11.62:8089/graphql -d 'mutation {createUser(name:"stanxii", email:"stan2@yahoo.com"){id, name, email}}'
```