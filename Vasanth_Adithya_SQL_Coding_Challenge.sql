-- Coding Challenge - PetPals, The Pet Adoption Platform

-- 1. Provide a SQL script that initializes the database for the Pet Adoption Platform ”PetPals”.
IF EXISTS(SELECT * FROM sys.databases WHERE NAME= 'PetPals')
BEGIN
	DROP DATABASE PetPals;
END;
GO

CREATE DATABASE PetPals;

USE PetPals;

-- 2. Create tables for pets, shelters, donations, adoption events, and participants.
-- 3. Define appropriate primary keys, foreign keys, and constraints.
-- 4. Ensure the script handles potential errors, such as if the database or tables already exist.
IF OBJECT_ID(N'dbo.Pets', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Pets];  
GO
IF OBJECT_ID(N'dbo.Shelters', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Shelters];  
GO
IF OBJECT_ID(N'dbo.Donations', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Donations];  
GO
IF OBJECT_ID(N'dbo.AdoptionEvents', N'U') IS NOT NULL  
   DROP TABLE [dbo].[AdoptionEvents];  
GO
IF OBJECT_ID(N'dbo.Participants', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Participants];  
GO
IF OBJECT_ID(N'dbo.Users', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Users];  
GO
IF OBJECT_ID(N'dbo.Adoption', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Adoption];  
GO

CREATE TABLE Pets (
    PetID INT PRIMARY KEY,
    Name VARCHAR(255),
    Age INT,
    Breed VARCHAR(255),
    Type VARCHAR(255),
    AvailableForAdoption BIT
);

CREATE TABLE Shelters (
    ShelterID INT PRIMARY KEY,
    Name VARCHAR(255),
    Location VARCHAR(255)
);

CREATE TABLE Donations (
    DonationID INT PRIMARY KEY,
    DonorName VARCHAR(255),
    DonationType VARCHAR(255),
    DonationAmount DECIMAL,
    DonationItem VARCHAR(255),
    DonationDate DATETIME
);

CREATE TABLE AdoptionEvents (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(255),
    EventDate DATETIME,
    Location VARCHAR(255)
);

CREATE TABLE Participants (
    ParticipantID INT PRIMARY KEY,
    ParticipantName VARCHAR(255),
    ParticipantType VARCHAR(255),
    EventID INT,
    FOREIGN KEY (EventID) REFERENCES AdoptionEvents(EventID)
);

-- Insert 10 entries into Pets table
INSERT INTO Pets (PetID, Name, Age, Breed, Type, AvailableForAdoption) VALUES
    (1, 'Whiskers', 2, 'Labrador', 'Dog', 1),
    (2, 'Luna', 1, 'Husky', 'Dog', 1),
    (3, 'Milo', 3, 'Husky', 'Dog', 0),
    (4, 'Daisy', 1, 'Pomeranian', 'Dog', 1),
    (5, 'Rocky', 2, 'Siamese', 'Cat', 1),
    (6, 'Bella', 4, 'German Shepherd', 'Dog', 1),
    (7, 'Oliver', 1, 'Dachshund', 'Dog', 0),
    (8, 'Cleo', 2, 'Ragdoll', 'Cat', 1),
    (9, 'Max', 1, 'Golden Retriever', 'Dog', 1),
    (10, 'Nala', 3, 'Maine Coon', 'Cat', 1);

-- Insert 10 entries into Shelters table
INSERT INTO Shelters (ShelterID, Name, Location) VALUES
    (1, 'Zen Canine Refuge', 'Mumbai, Maharashtra'),
    (2, 'Happy Tails Retreat', 'Delhi, Delhi'),
    (3, 'Serenity Pups Pavilion', 'Bangalore, Karnataka'),
    (4, 'Radiant Rescues Ranch', 'Chennai, Tamil Nadu'),
    (5, 'Tranquil Tails Oasis', 'Kolkata, West Bengal'),
    (6, 'Grateful Hearts Kennel', 'Hyderabad, Telangana'),
    (7, 'Hopeful Hounds Hideaway', 'Pune, Maharashtra'),
    (8, 'Gentle Guardian Grove', 'Ahmedabad, Gujarat'),
    (9, 'Resilient Rover Retreat', 'Jaipur, Rajasthan'),
    (10, 'Joyful Journeys Junction', 'Lucknow, Uttar Pradesh');

-- Insert 10 entries into Donations table
INSERT INTO Donations (DonationID, DonorName, DonationType, DonationAmount, DonationItem, DonationDate) VALUES
    (1, 'Arjun', 'Cash', 100.00, NULL, '2023-01-15 10:30:00'),
    (2, 'Aisha', 'Item', NULL, 'Pet Food', '2023-02-02 15:45:00'),
    (3, 'Rajat', 'Cash', 50.00, NULL, '2023-03-10 08:20:00'),
    (4, 'Meera', 'Item', NULL, 'Pet Toys', '2023-04-05 12:10:00'),
    (5, 'Vikram', 'Cash', 75.00, NULL, '2023-05-20 14:55:00'),
    (6, 'Priya', 'Item', NULL, 'Pet Bed', '2023-06-18 09:30:00'),
    (7, 'Siddharth', 'Cash', 120.00, NULL, '2023-07-03 11:40:00'),
    (8, 'Ananya', 'Item', NULL, 'Cat Litter', '2023-08-22 16:15:00'),
    (9, 'Rohan Gupta', 'Cash', 90.00, NULL, '2023-09-14 13:25:00'),
    (10, 'Sanya', 'Item', NULL, 'Dog Leash', '2023-10-30 07:50:00');
	
-- Insert 10 entries into AdoptionEvents table
INSERT INTO AdoptionEvents (EventID, EventName, EventDate, Location) VALUES
    (1, 'Pet Harmony Hour', '2023-01-25 11:00:00', 'Mumbai, Maharashtra'),
    (2, 'Tailwaggers Unite Expo', '2023-03-15 14:30:00', 'Delhi, Delhi'),
    (3, 'Whisker Whirlwind Showcase', '2023-05-05 12:00:00', 'Bangalore, Karnataka'),
    (4, 'Adoption Odyssey', '2023-07-10 10:00:00', 'Chennai, Tamil Nadu'),
    (5, 'Hearts & Paws Rendezvous', '2023-09-02 15:00:00', 'Kolkata, West Bengal'),
    (6, 'Furever Love Fest', '2023-10-18 13:45:00', 'Hyderabad, Telangana'),
    (7, 'Petropolis Adoption Gala', '2023-12-01 09:30:00', 'Pune, Maharashtra'),
    (8, 'Purr-adise Found Fiesta', '2024-02-08 11:20:00', 'Ahmedabad, Gujarat'),
    (9, 'Tails of Joy Jubilee', '2024-04-03 16:00:00', 'Jaipur, Rajasthan'),
    (10, 'Snuggle Stray Soirée', '2024-06-22 10:45:00', 'Lucknow, Uttar Pradesh');

-- Insert 10 entries into Participants table
INSERT INTO Participants (ParticipantID, ParticipantName, ParticipantType, EventID) VALUES
    (1, 'Vedant', 'Shelter', 1),
    (2, 'Esha', 'Adopter', 1),
    (3, 'Aryan', 'Shelter', 2),
    (4, 'Riya', 'Adopter', 2),
    (5, 'Vir', 'Shelter', 3),
    (6, 'Kyra', 'Adopter', 3),
    (7, 'Arnav', 'Shelter', 4),
    (8, 'Avani', 'Adopter', 4),
    (9, 'Reyansh', 'Shelter', 5),
    (10, 'Meher', 'Adopter', 5);

select * from Donations
select * from Participants

select * from Users

select * from pets



























	
--5. Write an SQL query that retrieves a list of available pets (those marked as available for adoption) from the "Pets" table. Include the pet's name, age, breed, and type in the result set. Ensure that the query filters out pets that are not available for adoption.

SELECT Name, Age, Breed, Type
FROM Pets
WHERE AvailableForAdoption = 1;


--6. Write an SQL query that retrieves the names of participants (shelters and adopters) registered for a specific adoption event. Use a parameter to specify the event ID. Ensure that the query joins the necessary tables to retrieve the participant names and types.
-- Assuming @EventID is the parameter for the specific event ID

DECLARE @EventID INT = 1;

SELECT P.ParticipantName, P.ParticipantType
FROM Participants P
JOIN AdoptionEvents A ON P.EventID = A.EventID
WHERE A.EventID = @EventID;


--7. Create a stored procedure in SQL that allows a shelter to update its information (name and location) in the "Shelters" table. Use parameters to pass the shelter ID and the new information. Ensure that the procedure performs the update and handles potential errors, such as an invalid shelter ID.

CREATE PROCEDURE UpdateShelterInformation
@ShelterID INT,
@NewName VARCHAR(255),
@NewLocation VARCHAR(255)
AS
	UPDATE Shelters
    SET Name = @NewName, Location = @NewLocation
    WHERE ShelterID = @ShelterID;

SELECT * FROM Shelters;

EXEC UpdateShelterInformation @ShelterID = 2, @NewName = 'Pets Haven', @NewLocation = 'Hyderabad, Telengana';

SELECT * FROM Shelters;


--8. Write an SQL query that calculates and retrieves the total donation amount for each shelter (by shelter name) from the "Donations" table. The result should include the shelter name and the total donation amount. Ensure that the query handles cases where a shelter has received no donations.

ALTER TABLE Donations ADD ShelterID INT FOREIGN KEY REFERENCES Shelters(ShelterID);

UPDATE Donations SET ShelterID = 1 WHERE DonationID = 1;
UPDATE Donations SET ShelterID = 2 WHERE DonationID = 2;
UPDATE Donations SET ShelterID = 3 WHERE DonationID = 3;
UPDATE Donations SET ShelterID = 4 WHERE DonationID = 4;
UPDATE Donations SET ShelterID = 5 WHERE DonationID = 5;
UPDATE Donations SET ShelterID = 5 WHERE DonationID = 6;
UPDATE Donations SET ShelterID = 7 WHERE DonationID = 7;
UPDATE Donations SET ShelterID = 8 WHERE DonationID = 8;
UPDATE Donations SET ShelterID = 10 WHERE DonationID = 9;
UPDATE Donations SET ShelterID = 10 WHERE DonationID = 10;

SELECT S.Name AS ShelterName, COALESCE(SUM(D.DonationAmount), 0) AS TotalDonationAmount
FROM Shelters S
LEFT JOIN Donations D ON S.ShelterID = D.ShelterID
GROUP BY S.ShelterID, S.Name;


--9. Write an SQL query that retrieves the names of pets from the "Pets" table that do not have an owner (i.e., where "OwnerID" is null). Include the pet's name, age, breed, and type in the result set.

CREATE TABLE Users(
	UserID INT PRIMARY KEY,
	UserName VARCHAR(255)
);

INSERT INTO Users VALUES
	(1, 'Vasanth V'),
	(2, 'Bhaskar B'),
	(3, 'Rohan J');

ALTER TABLE Pets ADD OwnerID INT FOREIGN KEY REFERENCES Users(UserID);

UPDATE Pets SET OwnerID = 2 WHERE PetID = 3;
UPDATE Pets SET OwnerID = 3 WHERE PetID = 7;

SELECT Name, Age, Breed, Type FROM Pets 
WHERE OwnerID IS NULL;


--10. Write an SQL query that retrieves the total donation amount for each month and year (e.g., January 2023) from the "Donations" table. The result should include the month-year and the corresponding total donation amount. Ensure that the query handles cases where no donations were made in a specific month-year.

SELECT FORMAT(DonationDate, 'MMMM yyyy') AS MonthYear, COALESCE(SUM(DonationAmount), 0) AS TotalDonationAmount
FROM Donations
GROUP BY FORMAT(DonationDate, 'MMMM yyyy');


--11. Retrieve a list of distinct breeds for all pets that are either aged between 1 and 3 years or older than 5 years.

SELECT DISTINCT Breed 
FROM Pets
WHERE (Age BETWEEN 1 AND 3) OR (Age > 5);


--12. Retrieve a list of pets and their respective shelters where the pets are currently available for adoption.

ALTER TABLE Pets ADD ShelterID INT FOREIGN KEY REFERENCES Shelters(ShelterID);

UPDATE Pets SET ShelterID = 1 WHERE PetID = 1;
UPDATE Pets SET ShelterID = 2 WHERE PetID = 2;
UPDATE Pets SET ShelterID = 2 WHERE PetID = 3;
UPDATE Pets SET ShelterID = 4 WHERE PetID = 4;
UPDATE Pets SET ShelterID = 5 WHERE PetID = 5;
UPDATE Pets SET ShelterID = 6 WHERE PetID = 6;
UPDATE Pets SET ShelterID = 7 WHERE PetID = 7;
UPDATE Pets SET ShelterID = 8 WHERE PetID = 8;
UPDATE Pets SET ShelterID = 10 WHERE PetID = 9;
UPDATE Pets SET ShelterID = 10 WHERE PetID = 10;

SELECT P.Name AS PetName, P.Breed, P.Type, S.Name AS ShelterName
FROM Pets P
left JOIN Shelters S ON P.ShelterID = S.ShelterID
WHERE P.AvailableForAdoption = 1;


--13. Find the total number of participants in events organized by shelters located in specific city. Example: City=Chennai

SELECT COUNT(P.ParticipantID) AS TotalParticipants
FROM Participants P
JOIN AdoptionEvents AE ON P.EventID = AE.EventID
JOIN Shelters S ON AE.Location = S.Location
WHERE P.ParticipantType = 'Shelter' AND S.Location = 'Mumbai, Maharashtra';


--14. Retrieve a list of unique breeds for pets with ages between 1 and 5 years.

SELECT DISTINCT Breed
FROM Pets
WHERE Age BETWEEN 1 AND 5;


--15. Find the pets that have not been adopted by selecting their information from the 'Pet' table.

SELECT *
FROM Pets
WHERE NOT AvailableForAdoption = 0;


--16. Retrieve the names of all adopted pets along with the adopter's name from the 'Adoption' and 'User' tables.

CREATE TABLE Adoption(
	AdoptionID INT PRIMARY KEY,
	PetID INT FOREIGN KEY REFERENCES Pets(PetID),
	UserID INT FOREIGN KEY REFERENCES Users(UserID)
);

INSERT INTO Adoption VALUES 
	(1, 3, 1),
	(2, 7, 2);

SELECT P.Name AS PetName, U.UserName AS AdopterName
FROM Adoption A
JOIN Pets P ON A.PetID = P.PetID
JOIN Users U ON A.UserID = U.UserID;


--17. Retrieve a list of all shelters along with the count of pets currently available for adoption in each shelter.

SELECT S.ShelterID, S.Name AS ShelterName, COUNT(P.PetID) AS AvailablePetsCount
FROM Shelters S
LEFT JOIN Pets P ON S.ShelterID = P.ShelterID
WHERE P.AvailableForAdoption = 1 OR P.AvailableForAdoption IS NULL
GROUP BY S.ShelterID, S.Name;


--18. Find pairs of pets from the same shelter that have the same breed.

SELECT P1.PetID, P1.Name, P1.Breed, P1.ShelterID FROM Shelters S 
JOIN Pets P1 ON S.ShelterID = P1.ShelterID 
JOIN Pets P2 ON P1.Breed = P2.Breed AND P1.PetID <> P2.PetID;


--19. List all possible combinations of shelters and adoption events.

SELECT S.ShelterID, S.Name AS ShelterName, AE.EventID, AE.EventName, AE.EventDate, AE.Location AS EventLocation
FROM Shelters S
CROSS JOIN AdoptionEvents AE;


--20. Determine the shelter that has the highest number of adopted pets.

SELECT ShelterID, 
	(SELECT Name FROM Shelters WHERE ShelterID = Pets.ShelterID) AS [Shelter Name], 
	COUNT(PetID) AS [Number of Pets] FROM Pets
	WHERE availableforadoption = 1
GROUP BY ShelterID
HAVING COUNT(PetID) = 
	(SELECT TOP 1 count(*) FROM Pets WHERE availableforadoption = 1 GROUP BY ShelterID ORDER BY count(*) DESC)
ORDER BY [Shelter Name];