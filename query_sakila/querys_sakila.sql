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
