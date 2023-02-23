-- FUNCTION TO UPDATE BILLING INFO --


CREATE OR REPLACE FUNCTION adjustBilling(
	customerId INTEGER, 
	newBilling VARCHAR
)
RETURNS VARCHAR
LANGUAGE plpgsql AS $$
BEGIN 
	UPDATE customer  
	SET billing_info = newBilling
	WHERE customer_id = customerId;
	RETURN customerId;
END;
$$

SELECT adjustBilling(1, '1111-2222-3333-4444');

SELECT *
FROM customer;


-- PROCEDURE TO ADD A NEW MOVIE --

CREATE OR REPLACE PROCEDURE newMovie(
	movieName VARCHAR,
	mLength INTEGER,
	mDescription TEXT 
)
LANGUAGE plpgsql AS $$
BEGIN 
	INSERT INTO movies(
		movie_name,
		movie_length,
		description
	)VALUES(
		movieName,
		mLength,
		mDescription
	);
	COMMIT;
END;
$$

SELECT *
FROM movies;

CALL newMovie('Palm Springs', 139, 'A Rom-Com about a man and a woman who get stuck in a time loop while attending a wedding.')