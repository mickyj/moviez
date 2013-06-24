drop database moviez;
CREATE DATABASE moviez;
\c moviez
CREATE TABLE moviez (
    id serial8 primary key,
    title varchar(200) unique,
    released varchar(1000),
    rated varchar(3000),
    genre varchar(3000),
    director varchar(3000),
    plot varchar(3000)
  );

