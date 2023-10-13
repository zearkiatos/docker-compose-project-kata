CREATE USER postgres;
CREATE DATABASE books OWNER postgres;
ALTER USER postgres WITH PASSWORD 'books';
exit