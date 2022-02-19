\c user_db;

create TABLE users (
  id serial PRIMARY KEY,
  name VARCHAR,
  age INT
);

insert into users(name,age) values('Saarthak',22);