CREATE DATABASE IF NOT EXISTS PlayStoreDB;
USE PlayStoreDB;
SELECT database();
CREATE TABLE Developers
(
DeveloperID INT PRIMARY KEY,
DeveloperName VARCHAR(60) NOT NULL,
Country VARCHAR(30),
FoundedYear int
);
INSERT INTO Developers (DeveloperID, DeveloperName, Country, FoundedYear)
 VALUES
(101,'Google LLC','usa',1998),
(102,'meta platforms','usa',2003),
(103,'spotify ab','sweden',2006),
(104,'canva pty ltd','australia',2012),
(105,'byjus','india',2011);
SELECT * FROM Developers;
DROP TABLE Publishers;
CREATE TABLE Publishers (
PublisherID INT PRIMARY KEY,
PublisherName VARCHAR(60),
HeadOffice VARCHAR(60),
SupportEmail VARCHAR(60)
);
INSERT INTO Publishers (PublisherID,PublisherName,HeadOffice,SupportEmail)
VALUES
(201, 'Google Play', 'California', 'support@google.com'),
(202, 'Samsung Galaxy Store', 'Seoul', 'support@samsung.com'),
(203, 'Huawei AppGallery', 'Shenzhen', 'support@huawei.com'),
(204, 'Amazon Appstore', 'Seattle', 'support@amazon.com');
SELECT * FROM Publishers;
CREATE TABLE Categories (
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(40),
MinimumAge INT
);
INSERT INTO Categories (CategoryID, CategoryName, MinimumAge) VALUES
(301, 'Education', 3),
(302, 'Productivity', 3),
(303, 'Music', 12),
(304, 'Social', 13),
(305, 'Gaming', 16);
SELECT * FROM Categories;
CREATE TABLE Apps (
    AppID INT PRIMARY KEY,
    AppName VARCHAR(60),
    DeveloperID INT,
    PublisherID INT,
    CategoryID INT,
    Rating DECIMAL(2,1),
    Downloads INT,
    Price DECIMAL(6,2)
);
INSERT INTO Apps (AppID, AppName, DeveloperID, PublisherID, CategoryID, Rating, Downloads, Price)
VALUES
(1001, 'Google Classroom', 101, 201, 301, 4.6, 500000000, 0.00),
(1002, 'Google Keep', 101, 201, 302, 4.5, 1000000000, 0.00),
(1003, 'Instagram', 102, 201, 304, 4.4, 50000000, 0.00),
(1004, 'Spotify', 103, 201, 303, 4.5, 1000000000, 0.00),
(1005, 'Canva', 104, 201, 302, 4.7, 500000000, 0.00),
(1006, 'BYJU\'S Learning', 105, 201, 301, 4.3, 100000000, 299.00),
(1007, 'Candy Crush', 102, 204, 305, 4.6, 1000000000, 0.00),
(1008, 'Temple Run', 104, 203, 305, 4.2, 500000000, 0.00);
SELECT * FROM Apps;
DESCRIBE Apps;
INSERT INTO Developers (DeveloperName, Country, FoundedYear) 
VALUES ('OpenAI', 'USA', 2015);
INSERT INTO Categories (CategoryName, MinAge) 
VALUES ('Artificial Intelligence', 12);
INSERT INTO Apps (AppName, DeveloperID, PublisherID, CategoryID, Price, Rating) 
VALUES ('ChatGPT', 1, 1, 1, 0.00, 4.8);
UPDATE Apps 
SET Rating = 4.5 
WHERE AppName = 'Temple Run';
DELETE FROM Developers 
WHERE DeveloperID = 105;
UPDATE Publishers 
SET SupportEmail = 'support@samsungstore.com' 
WHERE PublisherName = 'Samsung Galaxy Store';
INSERT INTO Apps (AppName, DeveloperID, PublisherID, CategoryID, Price, Rating) 
VALUES 
('Spotify', 1, 1, 1, 0.00, 4.4),
('Minecraft', 1, 1, 1, 6.99, 4.6);
UPDATE Apps 
SET Price = 199.00 
WHERE AppName = "BYJU'S Learning";
DELETE FROM Categories 
WHERE CategoryName = 'Music';
SELECT * FROM Developers;
SELECT * FROM Publishers;
SELECT * FROM Categories;
SELECT * FROM Apps;
