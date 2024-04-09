							/*Assignment Solutions-1*/

----------------------------------------------------------------------------------------------
--  1)Write a SQL query to find the actors who were cast in the movie 'Annie Hall'. Return actor first name, last name and role.
select act_fname,act_lname,movie_cast.role from actors
 inner join movie_cast on actors.act_id=movie_cast.act_id
 inner join movie on movie_cast.mov_id=movie.mov_id
 where mov_title='Annie Hall';
--  2)From the following tables, write a SQL query to find the director who directed a movie that casted a role for 'Eyes Wide Shut'.
--  Return director first name, last name and movie title.
select dir_fname,dir_lname,movie.mov_title from director
inner join movie_direction on director.dir_id=movie_direction.dir_id
inner join movie on movie_direction.mov_id=movie.mov_id
where movie.mov_title='Eyes Wide Shut';
--  3)Write a SQL query to find who directed a movie that casted a role as ‘Sean Maguire’. Return director first name, 
--  last name and movie title.
select dir_fname,dir_lname,movie.mov_title from director
inner join movie_direction on director.dir_id=movie_direction.dir_id
inner join movie_cast on movie_direction.mov_id=movie_cast.mov_id
inner join movie on movie_cast.mov_id=movie.mov_id
where role='Sean Maguire';
--  4)Write a SQL query to find the actors who have not acted in any movie between 1990 and 2000 (Begin and end values are included.).
--  Return actor first name, last name, movie title and release year. 
select act_fname,act_lname,movie.mov_title,movie.mov_year from actors
inner join movie_cast on actors.act_id=movie_cast.act_id
inner join movie on movie_cast.mov_id=movie.mov_id
where movie.mov_year between 1990 and 2000;
-----------------------------------------------------------------------------------------------

