-- What are the top 50 worst rated movies? The results should include the movie title and rating and be sorted by the worst rating first.

SELECT title,rating AS Top_50_Worst_Movies FROM movies 
WHERE rating >= 0 ORDER BY rating LIMIT 50;

-- What movies do not have a rating? The results should include just the movie titles in sorted order.


SELECT title,rating AS Never_Rated FROM movies 
WHERE rating IS NULL ORDER BY title;

-- What movies have the word "thrilling" in their synopsis? The results should just include the movie title.

SELECT title AS Thrilling FROM movies 
WHERE synopsis LIKE '%thrilling%';

-- What were the highest rated 'Science Fiction & Fantasy' movies released in the 80's? 
-- The results should include the movie title, the year released, and rating sorted by highest rating first.

SELECT title, year, rating FROM movies WHERE year >= 1980 AND year < 1990 AND genre_id=17 ORDER BY rating DESC;

-- What actors have starred as James Bond? The results should include the actor name, movie title, year released, 
-- and be sorted by year in ascending order (earliest year appears first).

SELECT title, actors, year FROM cast_members 
INNER JOIN actors ON cast_members.actor_id = actors.id 
INNER JOIN movies ON cast_members.movie_id = movies.id  
WHERE character LIKE '%James Bond%' 
ORDER BY year ASC;

-- What movies has Julianne Moore starred in? 
-- The results should include the movie title, year released, and name of the genre, sorted by genre first and then movie title.

-- table names have been shortened for the following code

SELECT title, year, g.name FROM actors 
INNER JOIN cast_members c ON actors.id = c.actor_id
INNER JOIN movies m ON c.movie_id = m.id
INNER JOIN genres g ON m.genre_id = g.id
WHERE actors.name LIKE '%Julianne Moore%'
ORDER BY g.name;

-- sorted by 

SELECT title, year, genres.name FROM actors 
INNER JOIN cast_members ON actors.id = cast_members.actor_id
INNER JOIN movies ON cast_members.movie_id = movies.id
INNER JOIN genres ON movies.genre_id = genres.id
WHERE actors.name LIKE '%Julianne Moore%'
ORDER BY title;

-- What were the five earliest horror movies and what studios produced them? 
-- Include the movie title, year released, and studio name (if any) in the results sorted by year.

SELECT title, year, s.name FROM movies m
INNER JOIN genres g ON m.genre_id = g.id
INNER JOIN studios s ON m.studio_id = s.id
WHERE g.name LIKE '%Horror%'
ORDER BY year ASC
LIMIT 5;