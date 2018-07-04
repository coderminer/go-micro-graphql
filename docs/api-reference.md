# GraphQL API v1
---

## Overview
Here are some quick links to get you up and running with the GraphQL API v1:
. Authentication
. Root endpoint
. Schema introspection
. Rate limits
. Migrating from REST
. [User](http://api/v1/object/user)


## Connections
 *commitComments* ([CommitCommentConnection!](http://example.com/v1/interface/commitcomments))
A list of commit comments made by this user.

|参数名称|必须|类型|长度|缺省值|描述|
|---|---|---|---|---|---|
| after | yes  | string    | 无 | 无 | Returns the elements in the list that come after the specified cursor. |
| before | yes  | string  | 无 | 无 | Returns the elements in the list that come before the specified cursor. |
| first  | yes  | string  | 无 | 无 |  Returns the first n elements from the list. |
| last | yes  | string  |无 | 无  |  Returns the last n elements from the list. |


 *followers * ([FollowerConnection!](http://example.com/v1/interface/commitcomments))
A list of users the given user is followed by.

|参数名称|必须|类型|长度|缺省值|描述|
|---|---|---|---|---|---|
| after | yes  | string    | 无 | 无 | Returns the elements in the list that come after the specified cursor. |
| before | yes  | string  | 无 | 无 | Returns the elements in the list that come before the specified cursor. |
| first  | yes  | string  | 无 | 无 | Returns the first n elements from the list. |
| last | yes  | string  |无 | 无  |  Returns the last n elements from the list. |
