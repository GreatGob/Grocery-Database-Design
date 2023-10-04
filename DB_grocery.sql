CREATE DATABASE grocery;


USE grocery;


CREATE TABLE IF NOT EXISTS units(
	id INT PRIMARY KEY AUTO_INCREMENT,
    unit_name VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS products(
	id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    barcode VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS product_unit(
	id INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT,
    purchase_price DECIMAL(10,2),
    selling_price DECIMAL(10,2),
    avg_price DECIMAL(10,2),
	last_updated DATETIME,
	product_id INT NOT NULL,
    unit_id INT NOT NULL,
    foreign key (product_id) references products(id),
    foreign key (unit_id) references units(id)
);


CREATE TABLE IF NOT EXISTS employees(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    street_address VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100),
    zipcode VARCHAR(20),
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);


CREATE TABLE IF NOT EXISTS customers(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    street_address VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100),
    zipcode VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS suppliers(
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(20),
    street_address VARCHAR(255),
    city VARCHAR(100),
    country VARCHAR(100),
    zipcode VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS purchase_orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
    pur_date DATETIME,
    total_price DECIMAL(10,2),
    employee_id INT NOT NULL,
    supplier_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);


CREATE TABLE IF NOT EXISTS purchase_order_detail(
	id INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT,
    purchase_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    product_id INT NOT NULL,
    purchase_order_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_orders(id)
);


create table if not exists sale_orders(
	id INT PRIMARY KEY AUTO_INCREMENT,
    sale_date DATETIME,
    total_price DECIMAL(10,2),
    employee_id INT NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY  (employee_id) REFERENCES employees(id),
    FOREIGN KEY  (customer_id) REFERENCES customers(id)
);


create table if not exists sale_order_detail(
	id INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT,
    purchase_price DECIMAL(10,2),
    selling_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    product_id INT NOT NULL,
    sale_order_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (sale_order_id) REFERENCES sale_orders(id)
);


SHOW TABLES;


DELIMITER $$
CREATE TRIGGER UpdateProductInfo AFTER UPDATE ON product_unit FOR EACH ROW
BEGIN
	UPDATE sale_order_detail
	SET selling_price = new.selling_price,
		total_amount = new.selling_price * sale_order_detail.quantity
	WHERE sale_order_detail.id = new.id;
END $$
DELIMITER ;

DROP TRIGGER UpdateProductInfo;
SHOW TRIGGERS;


-- Testing
INSERT INTO units (unit_name) VALUES ('Chai'), ('Hộp'),('Thùng');

INSERT INTO products (product_name, barcode) VALUES ('Nước suối Aquafina', '12345'), ('Sữa Ngôi Sao', '67890');

INSERT INTO product_unit (product_id, unit_id, quantity, purchase_price, selling_price, avg_price, last_updated) VALUES (1, 1, 24, 5.00, 10.00, 0.00, '2023-08-10'), (2, 2, 6, 3.00, 5.00, 0.00, '2023-08-15');

INSERT INTO employees (first_name, last_name, phone, street_address, city, country, zipcode, username, password) VALUES ('John', 'Doe', '123-456-7890', '123 Main St', 'Cityville', 'Countryland', '12345', 'johndoe', 'password123');

INSERT INTO customers (first_name, last_name, phone, street_address, city, country, zipcode) VALUES ('Alice', 'Smith', '987-654-3210', '456 Elm St', 'Townville', 'Countryland', '54321');

INSERT INTO suppliers (first_name, last_name, phone, street_address, city, country, zipcode) VALUES ('Supplier', 'Inc.', '555-123-4567', '789 Oak St', 'Supplier City', 'Supplierland', '67890');

INSERT INTO purchase_orders (pur_date, total_price, employee_id, supplier_id) VALUES ('2023-08-20', 100.00, 1, 1);

INSERT INTO purchase_order_detail (quantity, purchase_price, total_amount, purchase_order_id, product_id) VALUES (10, 3.00, 30.00, 1, 1);

INSERT INTO sale_orders (sale_date, total_price, employee_id, customer_id) VALUES ('2023-08-25', 150.00, 1, 1);

INSERT INTO sale_order_detail (quantity, purchase_price, selling_price, total_amount, sale_order_id, product_id) VALUES (15, 5.00, 10.00, 150.00, 1, 1);

UPDATE product_unit 
SET selling_price = 15.00
WHERE id = 1;

SELECT * FROM product_unit;
SELECT * FROM sale_order_detail;

