-- PELICULAS QUE MÁS HA GENERADO
SELECT 
	title,
    count(film_id) * rental_rate * rental_duration AS ganancias_peliculas
    
FROM 
	payment
    
LEFT JOIN rental USING (rental_id)
LEFT JOIN inventory USING (inventory_id)
LEFT JOIN film USING (film_id)
GROUP BY(film_id)
ORDER BY ganancias_peliculas DESC;


-- ACTOR/ACTRIZ MÁS RENTABLE
SELECT 
    first_name,
    last_name,
    sum(rental_rate*rental_duration) AS ganancias
FROM actor
LEFT JOIN film_actor using (actor_id)
LEFT JOIN film USING(film_id)
GROUP BY(first_name)
ORDER BY ganancias DESC;


-- PAIS QUE  MÁS GENERA
SELECT 
	country,
    sum(rental_rate*rental_duration) AS ganancias_peliculas
FROM 
	film
    
LEFT JOIN inventory USING (film_id)
LEFT JOIN store USING (store_id)
LEFT JOIN address USING (address_id)
LEFT JOIN city USING (city_id)
LEFT JOIN country USING (country_id)

GROUP BY(country_id)
ORDER BY ganancias_peliculas DESC;


-- PAIS QUE MAS HA VISTO 'CENTER DINOSAUR'
SELECT 
	count(country_id) as vistas_pais,
    country,
    title
    
FROM 
	film
    
LEFT JOIN inventory USING (film_id)
LEFT JOIN store USING (store_id)
LEFT JOIN address USING (address_id)
LEFT JOIN city USING (city_id)
LEFT JOIN country USING (country_id)

WHERE title = 'CENTER DINOSAUR'
GROUP BY(film_id)
ORDER BY vistas_pais DESC;


-- ACTOR MÁS FAMOSO POR PAIS / MÁS RENTABLE POR PAIS
SELECT 
	country,
    first_name,
    last_name,
    sum(rental_rate*rental_duration) AS ganancias
    
FROM 
	actor
LEFT JOIN film_actor using (actor_id)
LEFT JOIN film USING(film_id)
LEFT JOIN inventory USING (film_id)
LEFT JOIN store USING (store_id)
LEFT JOIN address USING (address_id)
LEFT JOIN city USING (city_id)
LEFT JOIN country USING (country_id)
GROUP BY(country_id)
ORDER BY ganancias;


-- LISTA DE PELICULAS Y ACTORES/ATRICES PARTICIPANTES
SELECT 
	country,
    GROUP_CONCAT(first_name) AS actores
FROM 
	actor
LEFT JOIN film_actor using (actor_id)
LEFT JOIN film USING(film_id)
LEFT JOIN inventory USING (film_id)
LEFT JOIN store USING (store_id)
LEFT JOIN address USING (address_id)
LEFT JOIN city USING (city_id)
LEFT JOIN country USING (country_id)
GROUP BY(country_id);


--  Actores que tienen de primer nombre ‘Scarlett’.
SELECT 
    * 
FROM 
    actor 
WHERE upper(first_name) = 'SCARLETT';



-- Actores que contengan una ‘O’ en su nombre.
SELECT 
    * 
FROM 
    actor 
WHERE upper(first_name) LIKE '%O%';


-- Actores que contengan dos ‘O’ en su nombre y en una ‘A’ en su apellido.
SELECT 
    * 
FROM 
    actor 
WHERE upper(first_name) LIKE '%O%O%'
AND upper(last_name) LIKE '%A%';


--Actores donde su tercera letra sea ‘B’.
SELECT 
    * 
FROM 
    actor 
WHERE upper(first_name) LIKE '__B%';


-- Direcciones de california que tengan ‘274’ en el número de teléfono
SELECT
	*
FROM
	sakila.address
WHERE district = 'California'
AND phone LIKE '%274%';


-- Películas ‘Épicas’ (Epic) o ‘Brillantes’ (brilliant) que duren más de 180 minutos

SELECT
	*
FROM
	sakila.film
WHERE (description LIKE '%Epic%' 
OR description LIKE '%brilliant%') 
AND length >180;


-- Películas que duren entre 100 y 120 minutos o entre 50 y 70 minutos

SELECT
	*
FROM
	sakila.film
WHERE length between 100 AND 120 
OR length between 50 AND 70;


-- Películas que cuesten 0.99, 2.99 y tengan un rating ‘g’ o ‘r’ y que hablen de cocodrilos (cocodrile)

SELECT
	*
FROM
	sakila.film
WHERE description LIKE '%crocodile%' AND rental_rate IN ( 0.99, 2.99) 
AND rating IN ( 'R', 'G');


-- Direcciones de ontario o de punjab o que su código postal acabe en 5 o que su teléfono acabe en 5

SELECT * FROM sakila.address
WHERE district='ontario' 
    OR district='punjab'
    OR postal_code like '%5' 
    OR phone like '%5';