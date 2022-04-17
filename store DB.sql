-- DDL_Create DATABASE
CREATE DATABASE  store;
 USE store;
 
  -- DDL_craete tables
CREATE TABLE countries( 
code INT primary key,
 name VARCHAR(20) UNIQUE, 
 continent_name VARCHAR(20) NOT NULL ); 

 CREATE TABLE users( 
id INT primary key,
 full_name VARCHAR(20), 
 email VARCHAR(20) UNIQUE,
 gender CHAR(1) CHECK (gender = 'm' or gender = 'f'),
 date_of_birth VARCHAR(15),
 created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
 country_code INT,
 FOREIGN KEY (country_code) REFERENCES countries(code) ); 
 
CREATE TABLE orders( 
id INT primary key,
user_id INT,
status VARCHAR(6) CHECK (status = 'start' or status = 'finish'), 
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES users(id) );

CREATE TABLE order_products( 
order_id INT NOT NULL,
product_id INT NOT NULL,
quantity INT DEFAULT 0 ,
CONSTRAINT comp_key PRIMARY KEY (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES orders(id),
FOREIGN KEY (product_id) REFERENCES products(id));

CREATE TABLE products( 
id INT primary key,
name VARCHAR(10) NOT NULL,
price INT DEFAULT 0,
status VARCHAR(10) CHECK (status = 'valid' or status = 'expired'), 
created_at DATETIME DEFAULT CURRENT_TIMESTAMP );

SHOW TABLES;

-- DML_Add row or data to tables
INSERT INTO countries
VALUES (966, 'Saudi Arabia', 'Asia');

INSERT INTO users
VALUES (1, 'Raghad Alnemari', 'AlnemariRaghad@gmail.com', 'F', '1996-8-29', '03-09-20 05:09:15 PM', '966');

INSERT INTO orders
VALUES (5, 1, 'start', '23-08-22 08:05:11 AM' );

INSERT INTO products
VALUES (1, 'Apple Watch', 2000 , 'valid', '28-03-22 11:44:00 AM');

INSERT INTO order_products
VALUES (5, 1, 1);
 
 -- DML_update data from table
UPDATE countries
SET name ='Kingdom Saudi Arabia'
WHERE code = 966;

SELECT * FROM countries;
 
 -- DML delete row or data from table 
DELETE FROM products 
WHERE id = 1;

SELECT * FROM products;

