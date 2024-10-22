use IMDB
select * from IMDB_Cleaned

--- Number of Movies Per year--
select year, count(title) as Movie_count
from IMDB_Cleaned
group by year
order by Movie_count desc

--- Top 10 Highest Rated Movies
select top 10 Movie, Rating
from (select distinct title as Movie, round(imdbRating,2) as Rating
from IMDB_Cleaned) as sub_query
order by Rating desc

--- Top 5 Directors with most movies
select top 5 director, count(title) as Movie_count
from IMDB_Cleaned where director is not null
group by director
order by Movie_count desc

--- Average run time of movies by genre
select genre, avg(runtime) as Avg_runtime
from IMDB_Cleaned
group by genre
order by Avg_runtime desc

--- Movies produced by each country
select country, count(*) as movie_count
from IMDB_Cleaned
where type = 'movie'
group by country
order by movie_count desc

--- Most common languages

select language, count(*) as language_count
from IMDB_Cleaned
where type = 'movie' and language is not null
group by language
order by language_count desc

--- Average IMDB Rating over the years

select year, avg(imdbRating) as avg_rating
from IMDB_Cleaned
where type = 'movie' and imdbRating is not null
group by year
order by year 

select top 10 value as actor, count(*) as movie_count
from IMDB_Cleaned
cross apply	string_split(cast,',')
where type = 'movie'
group by value
order by movie_count desc

select count(*) as Award_winning_movies
from imdb_cleaned
where type = 'movie' and awards is not null


