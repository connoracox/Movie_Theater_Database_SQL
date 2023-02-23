DROP TABLE IF EXISTS customer CASCADE;
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(45),
	last_name VARCHAR(45), 
	address VARCHAR(255), 
	billing_info VARCHAR(255) NOT NULL
);

INSERT INTO customer( 
	first_name,
	last_name,
	address,
	billing_info 
)VALUES(
	'Lucas',
	'Lang', 
	'123 Main St Madison, WI',
	'4242-4242-4242-4242'
),(
	'Amanda',
	'Kibbel', 
	'140 Woodside Green Stamford, CT',
	'1234-1234-1234-1234'
);

SELECT * 
FROM customer;

DROP TABLE IF EXISTS ticket cascade;
CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	theater_id INTEGER NOT NULL,
	movie_id INTEGER NOT NULL,
	price FLOAT,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (theater_id) REFERENCES theaters(theater_id),
	FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

INSERT INTO ticket( 
	customer_id,
	theater_id,
	movie_id,
	price
)VALUES(
	1,
	1, 
	1,
	15.00
),(
	2,
	1,
	1,
	15.00
);

SELECT *
FROM ticket;

DROP TABLE IF EXISTS concession_products CASCADE;
CREATE TABLE concession_products(
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR,
	quantity INTEGER,
	description TEXT,
	price FLOAT
);

INSERT INTO concession_products(
	product_name,
	quantity,
	description,
	price
)VALUES(
	'popcorn',
	200,
	'delicious, buttery popcorn',
	7.50
),(
	'Coca-Cola',
	500,
	'Classic, bubbly coca-cola',
	3.25
);

SELECT *
FROM concession_products;

DROP TABLE IF EXISTS concession_product_purchase CASCADE;
CREATE TABLE concession_product_purchase(
	product_purchase_id SERIAL PRIMARY KEY,
	product_id INTEGER NOT NULL,
	purchase_id INTEGER NOT NULL,
	FOREIGN KEY (product_id) REFERENCES concession_products(product_id),
	FOREIGN KEY (purchase_id) REFERENCES concession_purchase(purchase_id)
);

INSERT INTO concession_product_purchase(
	product_id,
	purchase_id
)VALUES(
	1,
	1
),(
	2,
	2
);

SELECT *
FROM concession_product_purchase;

DROP TABLE IF EXISTS concession_purchase CASCADE;
CREATE TABLE concession_purchase(
	purchase_id SERIAL PRIMARY KEY, 
	customer_id INTEGER NOT NULL,
	price FLOAT,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO concession_purchase(
	customer_id,
	price
)VALUES(
	1,
	18.25
),(
	2,
	14.00
);

SELECT *
FROM concession_purchase;

DROP TABLE IF EXISTS movies CASCADE;
CREATE TABLE movies(
	movie_id SERIAL PRIMARY KEY,
	movie_name VARCHAR,
	movie_length INTEGER,
	description TEXT
);

INSERT INTO movies(
	movie_name,
	movie_length,
	description
)VALUES(
	'Into the Wild',
	153,
	'A young mans journey backpacking across the US, eventually ending up in remote ALaska.'
),(
	'Encanto',
	129,
	'A story about a magical family in Columbia'
);

SELECT *
FROM movies;

DROP TABLE IF EXISTS theaters CASCADE;
CREATE TABLE theaters(
	theater_id SERIAL PRIMARY KEY,
	movie_id INTEGER NOT NULL,
	FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

INSERT INTO theaters(
	movie_id
)VALUES(
	1
),(
	2
);

SELECT * 
FROM theaters;







