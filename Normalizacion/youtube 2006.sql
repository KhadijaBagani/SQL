CREATE Database Youtube2006
GO
USE Youtube2006
GO

-- Apartado 1: Base
DROP TABLE IF EXISTS Ratings;
DROP TABLE IF EXISTS Videos;
DROP TABLE IF EXISTS Users;


CREATE TABLE Ratings(
	halfstars tinyint, 
	userId int,
	videoId int,
	datetimeRated  datetime, 
	
	PRIMARY KEY (videoId,userId)
)


CREATE TABLE Videos(
	videoId int identity(1,1),
	sumvotes bigint,
	numvotes bigint,
	title nvarchar(50),
	description nvarchar(max)

	PRIMARY KEY (videoId)
)


CREATE TABLE Users(
	userId int identity(1,1), 
	userName NVARCHAR(30),

	PRIMARY KEY (userId)
)