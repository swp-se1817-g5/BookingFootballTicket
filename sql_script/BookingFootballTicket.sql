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
	status BIT DEFAULT 1,
	FOREIGN KEY (roleId) REFERENCES Role(roleId)
);
GO

-- Table tokenForgetPassword
CREATE TABLE tokenForgetPassword (
    id INT IDENTITY(1,1) PRIMARY KEY,
    token VARCHAR(255) NOT NULL,
    expiryTime DATETIME2 NOT NULL,
    isUsed BIT NOT NULL,
    userEmail VARCHAR(50) NOT NULL,
    FOREIGN KEY (userEmail) REFERENCES [User](email)
);
GO

-- Table FootballClub
CREATE TABLE FootballClub (
	clubId INT PRIMARY KEY IDENTITY (1,1),
	clubName NVARCHAR(100) UNIQUE NOT NULL,
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
	statusId INT default 1,
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
	standName NVARCHAR(50) UNIQUE NOT NULL,
	createdBy VARCHAR(50),
	createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	updatedBy VARCHAR(50),
	lastUpdatedDate DATETIME2 NULL,
	isDeleted BIT DEFAULT 0
);
GO

-- Table SeatClass
CREATE TABLE SeatClass (
    seatClassId INT PRIMARY KEY IDENTITY (1,1),
    seatClassName NVARCHAR(50),
    price DECIMAL(10, 0)
);
GO

-- Table SeatArea
CREATE TABLE SeatArea (
    seatId INT PRIMARY KEY IDENTITY (1,1),
    standId INT,
	seatClassId INT,
    seatName NVARCHAR(50),
    quantity INT,
	isActive BIT DEFAULT 1,
    FOREIGN KEY (standId) REFERENCES Stand(standId),
	FOREIGN KEY (seatClassId) REFERENCES SeatClass(seatClassId)
);
GO

-- Table MatchSeat
CREATE TABLE MatchSeat(
	matchSeatId INT PRIMARY KEY IDENTITY (1,1),
	matchId INT,
	seatId INT,
	price DECIMAL(10, 0),
	[availability] INT,
	FOREIGN KEY (matchId) REFERENCES Match(matchId),
	FOREIGN KEY (seatId ) REFERENCES SeatArea(seatId)
);
GO

-- Table SeasonSeat
CREATE TABLE SeasonSeat(
	seasonSeatId INT PRIMARY KEY IDENTITY (1,1),
	seatId INT,
	seasonId INT,
	price DECIMAL(10, 0),
	[availability] INT,
	FOREIGN KEY (seatId) REFERENCES SeatArea(seatId),
	FOREIGN KEY (seasonId ) REFERENCES Season(seasonId)
);
GO
-- Table StatusNews
CREATE TABLE TicketStatus (
   statusId INT PRIMARY KEY IDENTITY(1,1),
   statusName NVARCHAR(30),
   isDeleted BIT DEFAULT 0
);
GO
-- Table HistoryPurchasedTicketMatchSeat
CREATE TABLE HistoryPurchasedTicketMatchSeat (
	ticketMatchSeatId INT PRIMARY KEY IDENTITY (1,1),
	team1 NVARCHAR(100),
	team2 NVARCHAR(100),
	startTime DATETIME2,
	seasonName NVARCHAR(50),
	seatName NVARCHAR(50),
	quantity INT,
	standName NVARCHAR(50),
	seatClassName NVARCHAR(50),
    email VARCHAR(50),
	qrCode VARCHAR(255),
	price DECIMAL(10, 0),
	statusId INT default 1,
	createdBy VARCHAR(50),
	createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	matchSeatId INT,
	FOREIGN KEY (matchSeatId) REFERENCES MatchSeat(matchSeatId),
	FOREIGN KEY (statusId) REFERENCES TicketStatus(statusId),
    FOREIGN KEY (email) REFERENCES [User](email)
);
GO

-- Table HistoryPurchasedTicketSeasonSeat
CREATE TABLE HistoryPurchasedTicketSeasonSeat (
	ticketMatchSeatId INT PRIMARY KEY IDENTITY (1,1),
	startDate DATETIME2,
	endDate DATETIME2,
	seasonName NVARCHAR(50),
	seatName NVARCHAR(50),
	quantity INT,
	standName NVARCHAR(50),
	seatClassName NVARCHAR(50),
    email VARCHAR(50),
	qrCode VARCHAR(255),
	price DECIMAL(10, 0),
	statusId INT,
	createdBy VARCHAR(50),
	createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	matchSeatId INT,
	FOREIGN KEY (matchSeatId) REFERENCES MatchSeat(matchSeatId),
	FOREIGN KEY (statusId) REFERENCES TicketStatus(statusId),
    FOREIGN KEY (email) REFERENCES [User](email)
);
GO

-- Table StatusNews
CREATE TABLE NewsStatus (
   statusId INT PRIMARY KEY IDENTITY(1,1),
   statusName NVARCHAR(30),
   isDeleted BIT DEFAULT 0
);
GO

-- Table StateNews
CREATE TABLE NewsState (
   stateId INT PRIMARY KEY IDENTITY(1,1),
   stateName NVARCHAR(30),
   isDeleted BIT DEFAULT 0
);
GO

-- Table News
CREATE TABLE News (
    newsId INT PRIMARY KEY IDENTITY (1,1),
    title NVARCHAR(255),
    content NVARCHAR(MAX),
	image VARCHAR(255),
	conclusion NVARCHAR(MAX),
    createdBy VARCHAR(50) NOT NULL,
    createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(50) NULL,
    lastUpdatedDate DATETIME2 NULL,
	postOn DATETIME2 NULL,
    isDeleted BIT DEFAULT 0,
	statusId INT,
	stateId INT,
	FOREIGN KEY (statusId) REFERENCES NewsStatus(statusId),
	FOREIGN KEY (stateId) REFERENCES NewsState(stateId)
);
GO

CREATE TABLE BookingTicket (
	bookingId INT PRIMARY KEY IDENTITY (1,1),
	seatName NVARCHAR(50),
	quantity INT,
	standName NVARCHAR(50),
	seatClassName NVARCHAR(50),
    email VARCHAR(50),
	qrCode VARCHAR(255),
	price DECIMAL(10, 0),
	status NVARCHAR(255),
	createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	matchId INT,
	matchSeatId INT,
	FOREIGN KEY (matchId) REFERENCES [Match](matchId),
    FOREIGN KEY (email) REFERENCES [User](email)
);