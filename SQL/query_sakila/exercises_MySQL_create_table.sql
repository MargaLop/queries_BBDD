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


-- Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_countries

CREATE TABLE IF NOT EXISTS dup_countries
AS SELECT * FROM countries;


-- Write a SQL statement to create a table countries set a constraint NULL.

CREATE TABLE IF NOT EXISTS countries ( 
country_id INT(11) NOT NULL,
country_name VARCHAR(45) NOT NULL,
region_id INT(11) NOT NULL
);


-- Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.
CREATE TABLE IF NOT EXISTS jobs(
job_id INT(11) NOT NULL,
job_title varchar(45) NOT NULL, 
min_salary INT(11), 
max_salary INT(11)
CHECK(max_salary<=25000)
);


-- Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table.


CREATE TABLE IF NOT EXISTS countries ( 
country_id INT(11) NOT NULL,
country_name VARCHAR(45) NOT NULL,
region_id INT(11) NOT NULL
CHECK(country_name IN('Italy','India','China')) 
);


--  Write a SQL statement to create a table named job_histry including columns employee_id, start_date, end_date, job_id and department_id and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.

CREATE TABLE IF NOT EXISTS job_histry(
employee_id INT(11) NOT NULL, 
start_date date NOT NULL, 
end_date date NOT NULL, 
job_id INT(11) NOT NULL, 
department_id INT(11) NOT NULL,
CHECK (end_date LIKE '--/--/----')
);
