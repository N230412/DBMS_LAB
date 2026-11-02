USE  PlayStoreDB;

SELECT A.AppName , D.DeveloperName 
FROM Apps A 
INNER JOIN Developers D 
ON A.DeveloperID = D.DeveloperID;

-- LEVEL_0 --
-- Display the application name and corresponding developer name using INNER JOIN. --
SELECT A.AppName , D.DeveloperName 
FROM Apps A 
INNER JOIN Developers D
ON A.DeveloperID = D.DeveloperID;

--  Display the application name and corresponding publisher name using INNER JOIN. --
SELECT A.AppName , P.PublisherName
FROM Apps A 
INNER JOIN Publishers P 
ON A.PublisherID = P.PublisherID;

-- Display the application name and corresponding category name using INNER JOIN. --
SELECT A.AppName , C.CategoryName
FROM Apps A
INNER JOIN Categories C 
ON A.CategoryID = C.CategoryID;

--  Display the application name, developer name, and publisher name using a multi-table INNER JOIN. --
SELECT A.AppName , D.DeveloperName , P.PublisherName 
FROM Apps A 
INNER JOIN Developers D 
ON A.DeveloperID = D.DeveloperID
INNER JOIN Publishers P 
ON A.PublisherID = P.PublisherID;

-- Display the application name, developer name, and category name using INNER JOIN.--
SELECT A.AppName , D.DeveloperName , C.CategoryName
FROM Apps A 
INNER JOIN Developers D 
ON A.DeveloperID = D.DeveloperID
INNER JOIN Categories C 
ON A.CategoryID = C.CategoryID;

-- Display all publishers along with their applications using LEFT JOIN. --

SELECT P.PublisherName, A.AppName 
FROM Publishers P 
LEFT JOIN Apps A 
ON P.PublisherID = A.PublisherID; 

-- Display all categories along with their applications using LEFT JOIN. --
SELECT C.CategoryName , A.AppName
FROM Categories C
LEFT JOIN Apps A 
ON C.CategoryID = A.CategoryID;

-- LEVEL - 1 --
-- Display all publishers and their applications, including publishers that do not have any application. --

SELECT P.PublisherName, A.AppName 
FROM Publishers P 
LEFT JOIN Apps A 
ON P.PublisherID = A.PublisherID; 

-- Display all applications along with their publisher names using RIGHT JOIN. --
SELECT A.AppName , P.PublisherName 
FROM Publishers P 
RIGHT JOIN Apps A 
ON P.PublisherID = A.PublisherID;

--  Display all categories and the applications belonging to each category, including categories that do not have any application. --
SELECT C.CategoryName , A.AppName 
FROM Categories C 
LEFT JOIN Apps A 
ON C.CategoryID = A.CategoryID;

-- Display the AppName, DeveloperName, and Country using a three-table JOIN. --
SELECT A.AppName , D.DeveloperName , D.Country 
FROM Developers D
INNER JOIN Apps A
ON A.DeveloperID = D.DeveloperID;

-- Display the AppName, DeveloperName, PublisherName, and CategoryName using a four-table JOIN. --
SELECT A.AppName , D.DeveloperName , P.PublisherName , C.CategoryName
FROM Apps A 
INNER JOIN Developers D 
ON A.DeveloperID = D.DeveloperID
INNER JOIN Publishers P 
ON A.PublisherID = P.PublisherID
INNER JOIN Categories C 
ON A.CategoryID = C.CategoryID;

--  Display applications developed by developers from USA, showing AppName, DeveloperName, and Country. --

SELECT A.AppName , D.DeveloperName , D.Country
FROM Apps A 
INNER JOIN Developers D 
ON A.DeveloperID = D.DeveloperID
WHERE UPPER(d.Country) = 'USA';

--  Display applications belonging to the Gaming category along with their publisher names. --

SELECT a.AppName, c.CategoryName, p.PublisherName
FROM Apps a
INNER JOIN Categories c 
ON a.CategoryID = c.CategoryID
INNER JOIN Publishers p 
ON a.PublisherID = p.PublisherID
WHERE UPPER(c.CategoryName) = 'GAMING';

--  Display applications with a rating greater than 4.5 along with their developer names. --

SELECT A.AppName , D.DeveloperName
FROM Apps A 
INNER JOIN Developers D 
ON A.DeveloperID = D.DeveloperID 
WHERE UPPER(A.Rating) > 4.5;

-- LEVEL - 02 --

-- Display every publisher along with its applications, including publishers without applications. --

SELECT P.PublisherName, A.AppName
FROM Publishers P
LEFT JOIN Apps A 
ON P.PublisherID = A.PublisherID;

--  Find publishers that currently have no application associated with them using LEFT JOIN. --

SELECT P.PublisherName , A.AppName 
FROM Publishers P 
LEFT JOIN Apps A 
ON P.PublisherID = A.PublisherID 
WHERE A.AppID IS NULL;

-- Display all applications and their corresponding category names, ordered by CategoryName. -- 
SELECT A.AppName , C.CategoryName 
FROM Categories C
INNER JOIN Apps A 
ON A.CategoryID = C.CategoryID 
ORDER BY C.CategoryName;

-- Display AppName, DeveloperName, PublisherName, CategoryName, and Rating for all applications using appropriate JOIN operations--

SELECT A.AppName, D.DeveloperName, P.PublisherName,C.CategoryName, A.Rating
FROM Apps A
LEFT JOIN Developers D
ON A.DeveloperID = D.DeveloperID
LEFT JOIN Publishers P 
ON A.PublisherID = P.PublisherID
LEFT JOIN Categories C 
ON A.CategoryID = C.CategoryID;

--  Display applications developed by companies from USA and published through Google Play. --

SELECT A.AppName, D.DeveloperName, D.Country, P.PublisherName
FROM Apps A
INNER JOIN Developers D ON A.DeveloperID = D.DeveloperID
INNER JOIN Publishers P ON A.PublisherID = P.PublisherID
WHERE UPPER(D.Country) = 'USA'
  AND UPPER(P.PublisherName) = 'GOOGLE PLAY';
  
  -- Display all developers and their applications, including developers who do not have any application. -- 
  
  SELECT D.DeveloperName , A.AppName 
  FROM Apps A 
  LEFT JOIN Developers D 
  ON A.DeveloperID = D.DeveloperID;
  
  -- Use a SELF JOIN on the Developers table to display pairs of developers that belong to the same country.-- 
  
  SELECT D1.DeveloperName AS Developer1, 
  D2.DeveloperName AS Developer2, D1.Country 
  FROM Developers D1 
  JOIN Developers D2 
  ON D1.Country = D2.Country 
  AND D1.DeveloperID < D2.DeveloperID; 
  
  -- Use CROSS JOIN to display every possible combination of PublisherName and CategoryName. --
  
  SELECT P.PublisherName, C.CategoryName 
  FROM Publishers P 
  CROSS JOIN Categories C; 
  
  -- Implement a FULL OUTER JOIN equivalent between Publishers and Apps using LEFT JOIN, RIGHT JOIN, and UNION. --
  
  SELECT P.PublisherID, P.PublisherName, A.AppName 
  FROM Publishers P 
  LEFT JOIN Apps A 
  ON P.PublisherID = A.PublisherID 
  UNION SELECT P.PublisherID, P.PublisherName, A.AppName 
  FROM Publishers P 
  RIGHT JOIN Apps A 
  ON P.PublisherID = A.PublisherID; 
  
  -- Display applications whose category is Gaming or Social, along with their developer and publisher names using multiple JOINs. --
  
SELECT a.AppName, c.CategoryName, d.DeveloperName, p.PublisherName
FROM Apps a
INNER JOIN Categories c ON a.CategoryID = c.CategoryID
INNER JOIN Developers d ON a.DeveloperID = d.DeveloperID
INNER JOIN Publishers p ON a.PublisherID = p.PublisherID
WHERE UPPER(c.CategoryName) IN ('GAMING', 'SOCIAL');  
  
  -- Display the application name, developer name, and category name for applications having a rating between 4.3 and 4.7. --
  
SELECT a.AppName, d.DeveloperName, c.CategoryName, a.Rating
FROM Apps a
INNER JOIN Developers d ON a.DeveloperID = d.DeveloperID
INNER JOIN Categories c ON a.CategoryID = c.CategoryID
WHERE a.Rating BETWEEN 4.3 AND 4.7;

  -- Display developers and their applications where the developer’s country is not India. --
  
  SELECT d.DeveloperName, d.Country, a.AppName
FROM Developers d
INNER JOIN Apps a ON d.DeveloperID = a.DeveloperID
WHERE UPPER(d.Country) <> 'INDIA';

-- LEVEL OPTIONAL BUT RECOMMMENDED --

SELECT d.DeveloperName, d.Country,
       COUNT(a.AppID) AS NumberOfApplications,
       ROUND(AVG(a.Rating), 2) AS AverageRating
FROM Developers d
INNER JOIN Apps a ON d.DeveloperID = a.DeveloperID
GROUP BY d.DeveloperID, d.DeveloperName, d.Country
HAVING COUNT(a.AppID) > 1;


SELECT UPPER(a.AppName) AS AppName,
       UPPER(d.DeveloperName) AS DeveloperName,
       UPPER(d.Country) AS Country
FROM Apps a
INNER JOIN Developers d ON a.DeveloperID = d.DeveloperID
WHERE UPPER(d.Country) = 'USA';

SELECT p.PublisherName,
       COUNT(a.AppID) AS TotalApplications,
       NVL(SUM(a.Downloads), 0) AS TotalDownloads
FROM Publishers p
LEFT JOIN Apps a ON p.PublisherID = a.PublisherID
GROUP BY p.PublisherID, p.PublisherName
ORDER BY TotalDownloads DESC;

SELECT a.AppName, d.DeveloperName, c.CategoryName,
       ROUND(a.Rating) AS RoundedRating
FROM Apps a
INNER JOIN Developers d ON a.DeveloperID = d.DeveloperID
INNER JOIN Categories c ON a.CategoryID = c.CategoryID;

SELECT d.DeveloperName, a.AppName, p.PublisherName,
       TO_CHAR(d.FoundedYear) AS FoundedYear
FROM Developers d
INNER JOIN Apps a ON a.DeveloperID = d.DeveloperID
INNER JOIN Publishers p ON a.PublisherID = p.PublisherID;

SELECT c.CategoryName,
       COUNT(a.AppID) AS NumberOfApplications,
       ROUND(AVG(a.Rating), 2) AS AverageRating
FROM Categories c
INNER JOIN Apps a ON a.CategoryID = c.CategoryID
GROUP BY c.CategoryID, c.CategoryName
HAVING AVG(a.Rating) > 4.3
ORDER BY AverageRating DESC;
