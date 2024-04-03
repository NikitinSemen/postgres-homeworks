-- SQL-команды для создания таблиц
CREATE TABLE customers
(
	customer_id varchar(10),
	company_name varchar(100),
	contact_name varchar(100)
);
CREATE TABLE employees
(
	employee_id int PRIMARY KEY,
	first_name varchar(100),
	last_name varchar(100),
	title varchar(100),
	birth_date date,
	notes text
);
CREATE TABLE orders
(
	order_id int NOT NULL,
	customer_id varchar(10),
	employee_id int NOT NULL,
	order_date date,
	ship_city varchar(50)
)