USE PlayStoreDB;
-- Level 0 --
START TRANSACTION;
-- Q1
UPDATE Apps
SET Rating=4.5
where appid=1004;
COMMIT;
select * from Apps
where appid=1004;


-- Q2
set autocommit=0;
select * from apps
where appid=1006;

update apps
set price=199
where appid=1006;
select * from apps
where appid=1006;
rollback;
select * from apps
where appid=1006;


-- Q3
insert into apps
values(1031,'Google gemini',101,201,301,4.6,50000000,0);
select * from apps
where appid=1031;
commit;


-- Q4
Start transaction;
insert into developers
values(111,'Test developer','india',2020);
select * from developers
where developerid=111;
ROLLBACK;
select * from developers
where developerid=111;




-- Q5
update apps
set rating=4.9
where appid=1008;
SAVEPOINT rating_update;
select * from apps
where appid=1008;



-- =========================
-- level 1
-- ========================

-- Q1
start transaction;
update apps
set rating=4.7
where appid=1002;
SAVEPOINT rating_point;
update apps
set rating=4.1
where appid=1005;
select * from apps
where appid in(1002,1005);



-- Q2
start transaction;
update apps set rating=4.8
where appid=1002;
savepoint rating_point;
update apps set rating =4.9
where appid=1005;
rollback to savepoint rating_point;
select * from apps
where appid in(1002,1005);




-- Q3
start transaction;
insert into apps
values(1012,'test app',101,202,302,4.5,100000,100);
savepoint app_insert;
update apps
set price=200
where appid=1012;
select * from apps
where appid=1012;
rollback to savepoint app_insert;
select * from apps
where appid=1012;


-- Q4
grant select 
on apps
to 'username'@'localhost';


-- Q5
grant select , insert
on apps
to 'student'@'localhost';

-- Q6
revoke insert on apps
from 'student'@'localhost';


-- ====================
-- level 2
-- ===================

-- Q1
start transaction;
update apps set rating =4.8
where appid=1002;
savepoint apps_point;
update apps set rating=4.9
where appid=1005;
update apps set price=199
where appid=1006;
select * from apps
where appid in(1002,1005,1006);
rollback to savepoint apps_point;
select * from apps
where appid in(1002,1005,1006);


-- Q2
start transaction;
insert into categories
values(307,'health',1);
insert into categories
values(308,'travel',1);
savepoint category_point;
rollback to savepoint category_point;
select * from categories
where categoryid in (306,307);


-- Q3
Grant select , insert , update on apps
to 'student '@'localhost';
show grants for 'student'@'localhost';


-- Q4
revoke update on apps
from 'student'@'localhost';
show grants for 'student'@'localhost';


-- Q5
grant select on developers
to 'student'@'localhost';
show grants for 'student'@'localhost';
revoke select
on developers
from 'student'@'localhost';
show grants for 'student'@'localhost';



-- Q6
START TRANSACTION;
UPDATE Apps
SET Rating = 4.7
WHERE AppID = 1002;
UPDATE Apps
SET Price = 199
WHERE AppID = 1006;
INSERT INTO Developers
VALUES
(111, 'Demo Developer', 'India', 2026);
SELECT * FROM Apps
WHERE AppID IN (1002, 1006);

SELECT * FROM Developers
WHERE DeveloperID = 111;
COMMIT;




-- Q7

START TRANSACTION;
UPDATE Apps
SET Rating = 4.8
WHERE AppID = 1002;
COMMIT;
SELECT AppID, AppName, Rating
FROM Apps
WHERE AppID = 1002;

START TRANSACTION;
UPDATE Apps
SET Rating = 3.0
WHERE AppID = 1002;
SELECT AppID, AppName, Rating
FROM Apps
WHERE AppID = 1002;
ROLLBACK;
SELECT AppID, AppName, Rating
FROM Apps
WHERE AppID = 1002;
