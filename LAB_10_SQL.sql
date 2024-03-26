use sakila;

-- How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) AS Apellidos_diferentes
FROM actor;

-- En cuántos idiomas diferentes se produjeron originalmente las películas? (Utilice la columna language_idde la filmtabla)

SELECT COUNT(DISTINCT language_id) AS idiomas_diferentes
FROM FILM;
SELECT COUNT(*) AS pg13_movies

FROM film

WHERE rating = 'PG-13';

-- Consigue 10 de las películas más largas de 2006.
SELECT *
FROM film
WHERE release_year = 2006
ORDER BY length DESC
LIMIT 10;

-- ¿ Cuántos días lleva funcionando la empresa ( DATEDIFF()función de verificación)?
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) AS operating_days

FROM rental;

-- Muestra información de alquiler con columnas adicionales mes y día laborable. Consigue 20.
SELECT *,

	MONTH(rental_date) AS rental_month,

       DAYOFWEEK(rental_date) AS rental_weekday

FROM rental

LIMIT 20;

-- Agregue una columna adicional day_typecon los valores 'fin de semana' y 'día laboral' según el día de alquiler de la semana.

SELECT *,

       CASE 

           WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'

           ELSE 'workday'

       END AS day_type

FROM rental;

-- ¿Cuántos alquileres hubo en el último mes de actividad?
SELECT

 date_format(rental_date, "%Y %m") as fecha_de_aqluiler, COUNT(rental_id)

 FROM rental

 GROUP BY date_format(rental_date, "%Y %m")

 ORDER BY date_format(rental_date, "%Y %m") DESC

 LIMIT 1;

