USE master;
GO

CREATE DATABASE BookingFootballTickett;
GO

USE BookingFootballTickett;
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

--Table SeatClass
	CREATE TABLE SeatClass (
    seatClassId INT PRIMARY KEY IDENTITY (1,1),
    seatClassName NVARCHAR(50),
    price DECIMAL(10, 2)
);
GO

--Table SeatArea
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
	price DECIMAL(10, 2),
	[availability] INT,
	FOREIGN KEY (matchId) REFERENCES Match(matchId),
	FOREIGN KEY (seatId ) REFERENCES SeatArea(seatId)
);
GO

-- Table MatchSeason
CREATE TABLE SeasonSeat(
	seasonSeatId INT PRIMARY KEY IDENTITY (1,1),
	seatId INT,
	seasonId INT,
	price DECIMAL(10, 2),
	[availability] INT,
	FOREIGN KEY (seatId) REFERENCES SeatArea(seatId),
	FOREIGN KEY (seasonId ) REFERENCES Season(seasonId)
);
GO

-- Table HistoryPurchasedTicket
CREATE TABLE HistoryPurchasedTicket (
	ticketId INT PRIMARY KEY IDENTITY (1,1),
	matchSeatId INT,
	seasonSeatId INT,
    email VARCHAR(50),
	qrCode VARCHAR(255),
	createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
	price DECIMAL(10, 2),
	quantity INT,
	[status] BIT,
	createdBy VARCHAR(50),
	--updatedBy VARCHAR(50) NULL,
	--lastUpdatedDate DATETIME2 NULL,
    FOREIGN KEY (matchSeatId) REFERENCES MatchSeat(matchSeatId),
	FOREIGN KEY (seasonSeatId) REFERENCES SeasonSeat(seasonSeatId),
    FOREIGN KEY (email) REFERENCES [User](email)
);
GO

-- Table Payment
/*CREATE TABLE Payment (
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
*/
-- Table News
CREATE TABLE News (
    newsId INT PRIMARY KEY IDENTITY (1,1),
    title VARCHAR(255),
    content NVARCHAR(MAX),
	image VARCHAR(255),
	conclusion NVARCHAR(MAX),
    createdBy VARCHAR(50) NOT NULL,
    createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(50) NULL,
    lastUpdatedDate DATETIME2 NULL,
    [status] INT DEFAULT 1,
    [state] BIT DEFAULT 0,
    isDeleted BIT DEFAULT 0,
);
GO



