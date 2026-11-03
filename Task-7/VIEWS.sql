SHOW DATABASES;
USE PlayStoreDB;

-- LEVEL -1  --
CREATE VIEW AllApps AS
SELECT * FROM Apps;

CREATE VIEW AppDetails AS
SELECT AppID, AppName, Rating, Price
FROM Apps;

SHOW FULL TABLES 
WHERE Table_type = 'VIEW';

DROP VIEW IF EXISTS AllApps;
DROP VIEW IF EXISTS AppDetails;

CREATE VIEW HighlyRatedApps AS
SELECT *
FROM Apps
WHERE Rating >= 4.5;

SELECT * FROM AllApps;
SELECT * FROM AppDetails;
SELECT * FROM HighlyRatedApps;
 
CREATE VIEW FreeApps AS
SELECT *
FROM Apps
WHERE Price = 0;
SELECT * FROM FreeApps;

SHOW FULL TABLES
WHERE Table_type = 'VIEW';


-- LEVEL -2 --
CREATE VIEW AppDeveloperView AS
SELECT A.AppName, D.DeveloperName
FROM Apps A
JOIN Developers D
ON A.DeveloperID = D.DeveloperID;
SELECT * FROM AppDeveloperView;

CREATE VIEW AppPublisherView AS
SELECT A.AppName, P.PublisherName
FROM Apps A
JOIN Publishers P
ON A.PublisherID = P.PublisherID;
SELECT * FROM AppPublisherView;

CREATE VIEW AppCategoryView AS
SELECT A.AppName, C.CategoryName
FROM Apps A
JOIN Categories C
ON A.CategoryID = C.CategoryID;
SELECT * FROM AppCategoryView;

CREATE VIEW AppDeveloperCountryView AS
SELECT A.*, D.DeveloperName, D.Country
FROM Apps A
JOIN Developers D
ON A.DeveloperID = D.DeveloperID;
SELECT * FROM AppDeveloperCountryView;

CREATE VIEW CategoryAppCount AS
SELECT C.CategoryName, COUNT(A.AppID) AS TotalApps
FROM Categories C
LEFT JOIN Apps A
ON C.CategoryID = A.CategoryID
GROUP BY C.CategoryID, C.CategoryName;

CREATE VIEW DeveloperAppCount AS
SELECT D.DeveloperName, COUNT(A.AppID) AS TotalApps
FROM Developers D
LEFT JOIN Apps A
ON D.DeveloperID = A.DeveloperID
GROUP BY D.DeveloperID, D.DeveloperName;

CREATE VIEW CategoryAvgRating AS
SELECT C.CategoryName, AVG(A.Rating) AS AverageRating
FROM Categories C
LEFT JOIN Apps A
ON C.CategoryID = A.CategoryID
GROUP BY C.CategoryID, C.CategoryName;

CREATE VIEW RatedAppsDevelopers AS
SELECT A.AppName, A.Rating, D.DeveloperName
FROM Apps A
JOIN Developers D
ON A.DeveloperID = D.DeveloperID
WHERE A.Rating > 4.3;

SELECT AppName, Rating
FROM HighlyRatedApps
WHERE Rating >= 4.7;

SHOW CREATE VIEW AppDetails;

-- LEVEL-3--

CREATE VIEW CategoryTotalCount AS
SELECT C.CategoryName, COUNT(A.AppID) AS TotalApps
FROM Categories C
LEFT JOIN Apps A
ON C.CategoryID = A.CategoryID
GROUP BY C.CategoryID, C.CategoryName;

CREATE VIEW MultipleAppDevelopers AS
SELECT D.DeveloperName, COUNT(A.AppID) AS TotalApps
FROM Developers D
JOIN Apps A
ON D.DeveloperID = A.DeveloperID
GROUP BY D.DeveloperID, D.DeveloperName
HAVING COUNT(A.AppID) > 1;

CREATE VIEW CategoryRatingRange AS
SELECT C.CategoryName,
       MAX(A.Rating) AS HighestRating,
       MIN(A.Rating) AS LowestRating
FROM Categories C
LEFT JOIN Apps A
ON C.CategoryID = A.CategoryID
GROUP BY C.CategoryID, C.CategoryName;

CREATE VIEW DeveloperTotalApps AS
SELECT D.DeveloperName, COUNT(A.AppID) AS TotalApps
FROM Developers D
LEFT JOIN Apps A
ON D.DeveloperID = A.DeveloperID
GROUP BY D.DeveloperID, D.DeveloperName;

CREATE VIEW CompleteAppDetails AS
SELECT A.AppID, A.AppName, A.Rating, A.Price, A.Downloads,
       D.DeveloperName, P.PublisherName, C.CategoryName
FROM Apps A
LEFT JOIN Developers D
ON A.DeveloperID = D.DeveloperID
LEFT JOIN Publishers P
ON A.PublisherID = P.PublisherID
LEFT JOIN Categories C
ON A.CategoryID = C.CategoryID;

CREATE VIEW HighlyRatedAppDetails AS
SELECT A.AppName, A.Rating,
       D.DeveloperName, C.CategoryName
FROM Apps A
JOIN Developers D
ON A.DeveloperID = D.DeveloperID
JOIN Categories C
ON A.CategoryID = C.CategoryID
WHERE A.Rating >= 4.5;

CREATE VIEW PublisherAppDownloads AS
SELECT P.PublisherName,
       COUNT(A.AppID) AS TotalApps,
       COALESCE(SUM(A.Downloads), 0) AS TotalDownloads
FROM Publishers P
LEFT JOIN Apps A
ON P.PublisherID = A.PublisherID
GROUP BY P.PublisherID, P.PublisherName;

SELECT *
FROM CompleteAppDetails
WHERE Rating >= 4.5
ORDER BY Rating DESC;


CREATE VIEW UpdateAppRating AS
SELECT AppID, AppName, Rating
FROM Apps;

UPDATE UpdateAppRating
SET Rating = 4.8
WHERE AppID = 1;

SELECT * FROM UpdateAppRating
WHERE AppID = 1;
SELECT * FROM Apps
WHERE AppID = 1;

DROP VIEW IF EXISTS FreeApps;
SHOW FULL TABLES
WHERE Table_type = 'VIEW';
