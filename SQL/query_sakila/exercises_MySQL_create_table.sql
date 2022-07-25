--  Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id

CREATE TABLE countries(
country_id INT(11),
country_name VARCHAR(45),
region_id INT(11)
);


-- Write a SQL statement to create a simple table countries including columns country_id,country_name and region_id which is already exists.

CREATE TABLE IF NOT EXISTS countries ( 
country_id INT(11),
country_name VARCHAR(45),
region_id INT(11)
);


-- Write a SQL statement to create the structure of a table dup_countries similar to countries.

CREATE TABLE IF NOT EXISTS dup_countries
LIKE countries;
