USE PlayStoreDB;
-- LEVEL 0
SELECT COUNT(*) AS 
Total_Applications 
FROM Apps;
SELECT AVG(Rating) AS Average_Rating
FROM Apps;
SELECT MAX(Rating) AS Highest_Rating
FROM Apps;
SELECT MIN(Rating) AS Lowest_Rating
FROM Apps;
SELECT SUM(Downloads) AS
Total_Downloads 
FROM Apps;
SELECT *
FROM Apps
ORDER BY Rating DESC;
-- LEVEL 1
SELECT CategoryID , COUNT(*) AS
Application_Count
FROM Apps
GROUP BY CategoryID;
SELECT CategoryID , AVG(Rating) AS
Average_Rating 
FROM Apps
GROUP BY CategoryID;
SELECT MAX(Price) AS Maximum_Price,
	   MIN(Price) AS Minimum_Price
FROM Apps;
SELECT *
FROM Apps 
ORDER BY Downloads DESC;
SELECT DeveloperID , COUNT(*) AS 
Application_Count
FROM Apps
GROUP BY DeveloperID;
SELECT CategoryID , COUNT(*) AS 
Application_Count
FROM Apps 
GROUP BY CategoryID
HAVING COUNT(*) > 1;
-- LEVEL2
SELECT DeveloperID ,
		SUM(Downloads) AS 
Total_Downloads
FROM Apps
GROUP BY DeveloperID;
SELECT PublisherID,
		AVG(Rating) AS 
Average_Rating
FROM Apps
GROUP BY PublisherID;
SELECT DeveloperID ,
		COUNT(*) AS Application_Count
FROM Apps
GROUP BY DeveloperID
HAVING COUNT(*) > 1;
SELECT CategoryID,
		AVG(Rating) as Average_Rating 
FROM Apps
GROUP BY CategoryID
HAVING AVG(Rating) > 4.3;
SELECT CategoryID ,
		COUNT(*) AS Application_Count
FROM Apps 
GROUP BY CategoryID 
ORDER BY Application_Count DESC;
SELECT AppName,Rating
FROM Apps 
WHERE Rating = (
		SELECT MAX(Rating)
        FROM Apps
);
SELECT DeveloperID ,
		SUM(Price) AS Total_Price
FROM Apps
GROUP BY DeveloperID;
