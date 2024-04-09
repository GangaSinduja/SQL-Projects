										/* Mandatory Assignment(ADV) */
			-------------------------------------------------------------------------------------------------
-- 1) Create an ER diagram or draw a schema for the given database.

-- 2) We want to reward the user who has been around the longest, Find the 5 oldest users.
-- users

select * from users
order by created_at
limit 5;

-- 3) To understand when to run the ad campaign, figure out the day of the week most users register on? 
-- users

select dayname(created_at) day,count(*) total_regis
from users 
group by day
order by total_regis desc limit 2;

-- 4) To target inactive users in an email ad campaign, find the users who have never posted a photo.
-- photos,users

select username
from users
left join photos p on users.id = p.user_id
where p.id is null;

-- 5) Suppose you are running a contest to find out who got the most likes on a photo. Find out who won?
-- likes,photos,users

select u.username, count(photo_id) photo_likes,p.image_url photo from likes 
inner join photos p on p.id= likes.photo_id
inner join users u on u.id = likes.user_id
group by p.image_url
order by count(photo_id) desc limit 1;

-- 6) The investors want to know how many times does the average user post.
-- photos,users

select username,count(*) posts from users u
inner join photos p on u.id= p.user_id
group by username
order by posts desc;

select round((select count(*)from photos)/(select count(*) from users),2) average_posts;

-- 7) A brand wants to know which hashtag to use on a post, and find the top 5 most used hashtags.
-- tags,photo_tags

select tag_name, count(tag_id) total
from tags t
inner join photo_tags pt on t.id = pt.tag_id
group by t.id
order by total desc limit 5;

-- 8) To find out if there are bots, find users who have liked every single photo on the site.
-- users,likes

select u.id,u.username,count(user_id) like_photo from likes l
inner join users u on l.user_id=u.id
group by u.id
having like_photo =(select count(*) from photos);

-- 9) To know who the celebrities are, find users who have never commented on a photo.
-- users,comments

select u.username,comment_text from users u
left join comments c on u.id=c.user_id
group by u.id
having comment_text is null;

-- 10) Now it's time to find both of them together, find the users who have never commented on any photo or have commented on every photo.
-- users,comments,likes

select * from 
(select count(*) not_comment_count from
(select u.username,comment_text from users u
left join comments c on u.id=c.user_id
group by u.id
having comment_text is null) 
as not_commented)
as t1
 join
(select count(*) comment_count from 
(select u.id,u.username,count(user_id) like_photo from likes l
inner join users u on l.user_id=u.id
group by u.id
having like_photo =(select count(*) from photos))
as commented)
as t2;
