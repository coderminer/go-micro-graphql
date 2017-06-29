[root@ickey-master github.com]# cockroach sql -u stan --insecure --host=10.8.15.167
# Welcome to the cockroach SQL interface.
# All statements must be terminated by a semicolon.
# To exit: CTRL + D.
stan@10.8.15.167:26257/> show databases;
+--------------------+
|      Database      |
+--------------------+
| bbs                |
| crdb_internal      |
| information_schema |
| kingic             |
| pg_catalog         |
+--------------------+
(5 rows)
stan@10.8.15.167:26257/> set database=bbs;
SET
stan@10.8.15.167:26257/bbs> show tables;
+----------+
|  Table   |
+----------+
| comments |
| posts    |
| users    |
+----------+
(3 rows)
stan@10.8.15.167:26257/bbs> select * from users;
+--------------------+------------+---------------------+----------+--------+------+
|         id         |    name    |        email        | password | c_time | city |
+--------------------+------------+---------------------+----------+--------+------+
| 257448857535152129 | weizenping | weizhenping@qq.com  | NULL     | NULL   | NULL |
| 257448857535184897 | stan       | stanhangzhou@qq.com | NULL     | NULL   | NULL |
| 257448857535217665 | xupf       | xupf@qq.com         | NULL     | NULL   | NULL |
| 257448857535250433 | maobisheng | maobisheng@qq.com   | NULL     | NULL   | NULL |
| 257448857535283201 | kaibo      | kaibo@qq.com        | NULL     | NULL   | NULL |
| 257448857535315969 | lkp        | lkp@qq.com          | NULL     | NULL   | NULL |
| 257448857535348737 | wb         | wb@qq.com           | NULL     | NULL   | NULL |
| 257448857535381505 | wzk        | wzk@qq.com          | NULL     | NULL   | NULL |
+--------------------+------------+---------------------+----------+--------+------+
(8 rows)
stan@10.8.15.167:26257/bbs> select * from posts;
+--------------------+--------------------+----------+----------------------+
|         id         |      user_id       |  title   |         body         |
+--------------------+--------------------+----------+----------------------+
| 257448860675080193 | 257448857535184897 | bitcoin  | a new bitcoin news.  |
| 257448860675375105 | 257448857535184897 | bitcoin2 | a new bitcoin2 news. |
| 257448860675670017 | 257448857535152129 | eth      | a new eth news.      |
| 257448860675899393 | 257448857535217665 | snt      | a new snt news.      |
| 257448860676161537 | 257448857535250433 | mao      | a new mao news.      |
| 257448860676423681 | 257448857535283201 | kaibo    | a new kaibo news.    |
+--------------------+--------------------+----------+----------------------+
(6 rows)
stan@10.8.15.167:26257/bbs> select * from comments;
+--------------------+--------------------+--------------------+------------------+-------------------------+
|         id         |      user_id       |      post_id       |      title       |          body           |
+--------------------+--------------------+--------------------+------------------+-------------------------+
| 257448865101185025 | 257448857535184897 | 257448860675080193 | bitcoin comments | a new bitcoin comments. |
| 257448865101709313 | 257448857535152129 | 257448860675670017 | eth comments     | a new eth comments.     |
+--------------------+--------------------+--------------------+------------------+-------------------------+
(2 rows)
stan@10.8.15.167:26257/bbs>  

