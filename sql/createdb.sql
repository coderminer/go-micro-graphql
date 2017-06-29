-- create bbs database
-- DROP DATABASE IF EXISTS bbs;
-- CREATE DATABASE IF NOT EXISTS bbs;
SET DATABASE = bbs;
SHOW DATABASES;

-- create users table
DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
  id SERIAL  PRIMARY KEY,
  name    STRING(40) UNIQUE,
  email   STRING(100) NOT NULL,
  password STRING(100),
  c_time TIMESTAMPTZ
);
ALTER TABLE users DROP COLUMN IF EXISTS city;
ALTER TABLE users ADD COLUMN city TEXT;
DROP INDEX IF EXISTS users@users_email_index;
CREATE UNIQUE INDEX IF NOT EXISTS users_email_index ON users (email);

-- SERIAL 64bit Hash int auto generate increment.
INSERT INTO users (name, email) VALUES ( 'weizenping', 'weizhenping@qq.com'),('stan', 'stanhangzhou@qq.com'),
                                          ('xupf', 'xupf@qq.com'),   ('maobisheng', 'maobisheng@qq.com'),
                                          ('kaibo', 'kaibo@qq.com'), ('lkp', 'lkp@qq.com'), ('wb', 'wb@qq.com'),
                                          ('wzk', 'wzk@qq.com');

SELECT * from users;										  
-- create posts table
DROP TABLE IF EXISTS posts;
CREATE TABLE IF NOT EXISTS posts (
  id      SERIAL  PRIMARY KEY,
  user_id SERIAL  NOT NULL REFERENCES users(id) ,
  title   STRING(200) NOT NULL,
  body  TEXT NOT NULL
 );

 INSERT INTO posts (user_id, title, body) VALUES ( (SELECT id from users where name = 'stan'), 'bitcoin', 'a new bitcoin news.'),
                                                 ( (SELECT id from users where name = 'stan'), 'bitcoin2', 'a new bitcoin2 news.'),
                                                 ( (SELECT id from users where name = 'weizenping'), 'eth', 'a new eth news.'),
                                                 ( (SELECT id from users where name = 'xupf'), 'snt', 'a new snt news.'),
                                                 ( (SELECT id from users where name = 'maobisheng'), 'mao', 'a new mao news.'),
                                                 ( (SELECT id from users where name = 'kaibo'), 'kaibo', 'a new kaibo news.');

SELECT * from posts;
												 
-- create comments table
DROP TABLE IF EXISTS comments;
CREATE TABLE IF NOT EXISTS comments (
  id SERIAL PRIMARY KEY,
  user_id SERIAL NOT NULL REFERENCES users(id) ,
  post_id SERIAL NOT NULL REFERENCES posts(id) ,
  title STRING(200) NULL,
  body TEXT NOT NULL
);

INSERT INTO comments (user_id, post_id, title, body) VALUES ( (SELECT id from users where name = 'stan'), (SELECT b.id from users a left join posts b on a.id = b.user_id where a.name = 'stan' limit 1), 'bitcoin comments', 'a new bitcoin comments.'),
                                                            ( (SELECT id from users where name = 'weizenping'), (SELECT b.id from users a left join posts b on a.id = b.user_id where a.name = 'weizenping' limit 1), 'eth comments', 'a new eth comments.');

SELECT * from comments;															

-- create followers table
DROP TABLE IF EXIST followers;
CREATE TABLE IF NOT EXISTS followers (
  id SERIAL PRIMARY KEY,
  follower_id SERIAL NOT NULL,
  followee_id SERIAL NOT NULL
);

SELECT * from followers;
