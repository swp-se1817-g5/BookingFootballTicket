USE master;
GO

CREATE DATABASE BookingFootballTicket;
GO

USE BookingFootballTicket;
GO

-- Table Role
CREATE TABLE Role (
	roleId INT PRIMARY KEY IDENTITY (1,1),
	roleName NVARCHAR(100) NOT NULL
);
GO

-- Table User
CREATE TABLE [User] (
	email VARCHAR(50) PRIMARY KEY,
	[name] NVARCHAR(50),
	roleId INT,
	[hashedPassword] VARCHAR(100),
	phoneNumber VARCHAR(10) NULL,
	avatar VARCHAR(255),
	createdBy VARCHAR(50),
	createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	updatedBy VARCHAR(50),
	lastUpdatedDate DATETIME2 Null,
	isDeleted BIT DEFAULT 0,
	FOREIGN KEY (roleId) REFERENCES Role(roleId)
);
GO

-- Table FootballClub
CREATE TABLE FootballClub (
	clubId INT PRIMARY KEY IDENTITY (1,1),
	clubName NVARCHAR(100) unique NOT NULL,
	img VARCHAR(255),
    Description VARCHAR(255),
	createdBy VARCHAR(50),
	createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	updatedBy VARCHAR(50),
	lastUpdatedDate DATETIME2 NULL,
	isDeleted BIT DEFAULT 0
);
GO

-- Table MatchStatus
CREATE TABLE MatchStatus (
	statusId INT PRIMARY KEY IDENTITY (1,1),
	statusName NVARCHAR(50) NOT NULL,
	isDeleted BIT DEFAULT 0
);
GO

-- Table MatchType
CREATE TABLE MatchType (
	TypeId INT PRIMARY KEY IDENTITY (1,1),
	[name] NVARCHAR(50) NOT NULL,
	isDeleted BIT DEFAULT 0
);
GO

-- Table Season
CREATE TABLE Season (
	seasonId INT PRIMARY KEY IDENTITY (1,1),
	seasonName NVARCHAR(50) NOT NULL,
	startDate DATETIME2,
	endDate DATETIME2,
	createdBy VARCHAR(50),
	createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	updatedBy VARCHAR(50),
	lastUpdatedDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	isDeleted BIT DEFAULT 0
);
GO

-- Table Match
CREATE TABLE Match (
	matchId INT PRIMARY KEY IDENTITY (1,1),
	team1 INT,
	team2 INT,
	seasonId INT,
	[startTime] DATETIME2,
	statusId INT,
	matchTypeId INT,
	createdBy VARCHAR(50),
	createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	updatedBy VARCHAR(50),
	lastUpdatedDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	isDeleted BIT DEFAULT 0,
	FOREIGN KEY (team1) REFERENCES FootballClub(clubId),
	FOREIGN KEY (team2) REFERENCES FootballClub(clubId),
	FOREIGN KEY (statusId) REFERENCES MatchStatus(statusId),
	FOREIGN KEY (matchTypeId) REFERENCES MatchType(TypeId),
	FOREIGN KEY (seasonId) REFERENCES Season(seasonId)
);
GO

-- Table Stand
CREATE TABLE Stand (
	standId INT PRIMARY KEY IDENTITY (1,1),
	standName NVARCHAR(50) unique NOT NULL,
	createdBy VARCHAR(50),
	createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	updatedBy VARCHAR(50),
	lastUpdatedDate DATETIME2 NULL,
	isDeleted BIT DEFAULT 0
);
GO

--Table SeatArea
    CREATE TABLE SeatArea (
    seatId INT PRIMARY KEY IDENTITY (1,1),
    standId INT,
    seatName NVARCHAR(50) unique NOT NULL,
    price DECIMAL(10, 2),
    quantity INT,
    createdBy VARCHAR(50),
	createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	updatedBy VARCHAR(50),
	lastUpdatedDate DATETIME2 NULL,
    FOREIGN KEY (standId) REFERENCES Stand(standId)
);
GO

-- Table MatchSeat
CREATE TABLE MatchSeat(
	matchSeatId INT PRIMARY KEY IDENTITY (1,1),
	matchId INT,
	seatId INT,
	[availability] INT,
	createdBy VARCHAR(50),
	createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	updatedBy VARCHAR(50),
	lastUpdatedDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	isDeleted BIT DEFAULT 0,
	FOREIGN KEY (matchId) REFERENCES Match(matchId),
	FOREIGN KEY (seatId ) REFERENCES SeatArea(seatId)
);
GO

-- Table HistoryPurchasedTicket
CREATE TABLE HistoryPurchasedTicket (
	ticketId INT PRIMARY KEY IDENTITY (1,1),
	matchSeatId INT,
    email VARCHAR(50),
	qrCode VARCHAR(255),
	createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	price DECIMAL(10, 2),
	number INT,
	[status] VARCHAR(50),
	createdBy VARCHAR(50),
	updatedBy VARCHAR(50) NULL,
	lastUpdatedDate DATETIME2 NULL,
	isDeleted BIT DEFAULT 0,
    FOREIGN KEY (matchSeatId) REFERENCES MatchSeat(matchSeatId),
    FOREIGN KEY (email) REFERENCES [User](email)
);
GO

-- Table Payment
CREATE TABLE Payment (
	paymentId INT PRIMARY KEY IDENTITY (1,1),
	email VARCHAR(50),
	createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	isDeleted BIT DEFAULT 0,
	ticketId INT,
	price DECIMAL(10, 2),
	date DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (email) REFERENCES [User](email),
	FOREIGN KEY (ticketId) REFERENCES HistoryPurchasedTicket(ticketId)
);
GO

-- Table News
CREATE TABLE News (
	newsId INT PRIMARY KEY IDENTITY (1,1),
    mainTitle VARCHAR(255),
	title VARCHAR(255),
    mainContent VARCHAR(255),
	content NVARCHAR(MAX),
    [location] VARCHAR(255),    
    postTime DATETIME2 ,
	createdBy VARCHAR(50) NOT NULL,
	createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	updatedBy VARCHAR(50) NULL,
	lastUpdatedDate DATETIME2 NULL,
    [status] BIT DEFAULT 0,
	isDeleted BIT DEFAULT 0
    );

GO






