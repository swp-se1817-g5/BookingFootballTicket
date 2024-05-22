use master
CREATE DATABASE BookingFootballTicket;
GO

USE BookingFootballTicket;
GO

-- Table Role
CREATE TABLE Role (
    roleId INT PRIMARY KEY IDENTITY (1,1),
    roleName NVARCHAR(255) NOT NULL,
    createdBy VARCHAR(255),
    createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(255),
    lastUpdatedDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    isDeleted BIT DEFAULT 0
);
GO

-- Table User
CREATE TABLE [User] (
    userId INT PRIMARY KEY IDENTITY (1,1),
    roleId INT,
    userName VARCHAR(255) NOT NULL UNIQUE,
    [password] VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    phoneNumber VARCHAR(50) UNIQUE,
    avatar VARCHAR(255),
    [name] NVARCHAR(255),
    createdBy VARCHAR(255),
    createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(255),
    lastUpdatedDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    isDeleted BIT DEFAULT 0,
    FOREIGN KEY (roleId) REFERENCES Role(roleId)
);
GO

-- Table FootballClub
CREATE TABLE FootballClub (
    clubId INT PRIMARY KEY IDENTITY (1,1),
    clubName NVARCHAR(255) NOT NULL,
	img VARCHAR(255),
    createdBy VARCHAR(255),
    createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(255),
    lastUpdatedDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    isDeleted BIT DEFAULT 0
);
GO

-- Table MatchStatus
CREATE TABLE MatchStatus (
    statusId INT PRIMARY KEY IDENTITY (1,1),
    statusName NVARCHAR(255) NOT NULL,
    createdBy VARCHAR(255),
    createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(255),
    lastUpdatedDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    isDeleted BIT DEFAULT 0
);
GO

-- Table MatchType
CREATE TABLE MatchType (
    TypeId INT PRIMARY KEY IDENTITY (1,1),
    [name] NVARCHAR(255) NOT NULL,
    createdBy VARCHAR(255),
    createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(255),
    lastUpdatedDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    isDeleted BIT DEFAULT 0
);
GO

-- Table Season
CREATE TABLE Season (
    seasonId INT PRIMARY KEY IDENTITY (1,1),
    seasonName NVARCHAR(255) NOT NULL,
    startDate DATETIME2,
    endDate DATETIME2,
    createdBy VARCHAR(255),
    createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(255),
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
    stadiumImg VARCHAR(255),
    [time] DATETIME2,
    statusId INT,
    matchTypeId INT,
    createdBy VARCHAR(255),
    createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(255),
    lastUpdatedDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    isDeleted BIT DEFAULT 0,
    FOREIGN KEY (team1) REFERENCES FootballClub(clubId),
    FOREIGN KEY (team2) REFERENCES FootballClub(clubId),
    FOREIGN KEY (statusId) REFERENCES MatchStatus(statusId),
    FOREIGN KEY (matchTypeId) REFERENCES MatchType(TypeId),
    FOREIGN KEY (seasonId) REFERENCES Season(seasonId)
);
GO

-- Table StandClass
CREATE TABLE StandClass (
    classId INT PRIMARY KEY IDENTITY (1,1),
    className NVARCHAR(255) NOT NULL,
    createdBy VARCHAR(255),
    createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(255),
    lastUpdatedDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    isDeleted BIT DEFAULT 0
);
GO

-- Table Stand
CREATE TABLE Stand (
    standId INT PRIMARY KEY IDENTITY (1,1),
    standName VARCHAR(255) NOT NULL,
    price DECIMAL(18, 2),
    classId INT,
    quantity INT,
    createdBy VARCHAR(255),
    createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(255),
    lastUpdatedDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    isDeleted BIT DEFAULT 0,
    FOREIGN KEY (classId) REFERENCES StandClass(classId)
);
GO

-- Table MatchStand
CREATE TABLE MatchStand (
	matchStandId INT PRIMARY KEY IDENTITY (1,1),
    matchId INT,
    standId INT,
    [availability] INT,
    createdBy VARCHAR(255),
    createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(255),
    lastUpdatedDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    isDeleted BIT DEFAULT 0,
	FOREIGN KEY (matchId) REFERENCES Match(matchId),
	FOREIGN KEY (standId) REFERENCES Stand(standId)
);
GO

-- Table HistoryPurchasedTicket
CREATE TABLE HistoryPurchasedTicket (
    ticketId INT PRIMARY KEY IDENTITY (1,1),
    matchStandId INT,
    qrCode VARCHAR(255),
    createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    price DECIMAL(18, 2),
    number INT,
    [status] VARCHAR(255),
    createdBy VARCHAR(255),
    updatedBy VARCHAR(255),
    lastUpdatedDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    isDeleted BIT DEFAULT 0,
	FOREIGN KEY (matchStandId) REFERENCES MatchStand(matchStandId)
);
GO

-- Table Payment
CREATE TABLE Payment (
    paymentId INT PRIMARY KEY IDENTITY (1,1),
    userId INT,
    createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    isDeleted BIT DEFAULT 0,
    ticketId INT,
    price DECIMAL(18, 2),
    date DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES [User](userId),
    FOREIGN KEY (ticketId) REFERENCES HistoryPurchasedTicket(ticketId)
);
GO

-- Table News
CREATE TABLE News (
    newsId INT PRIMARY KEY IDENTITY (1,1),
	userId INT,
    title VARCHAR(255),
    content NVARCHAR(MAX) NOT NULL,
    postTime DATETIME2,
    createdBy VARCHAR(255),
    createdDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy NVARCHAR(255),
    lastUpdatedDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    isDeleted BIT DEFAULT 0,
	FOREIGN KEY (userId) REFERENCES [User](userId)
	);
GO

