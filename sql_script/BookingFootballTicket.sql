CREATE DATABASE BookingFootballTicket;
GO

USE BookingFootballTicket;
GO

-- Table Role
CREATE TABLE Role (
    roleId INT PRIMARY KEY,
    roleName VARCHAR(255) NOT NULL,
    createdBy VARCHAR(255),
    createDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(255),
    isDelete BIT DEFAULT 0
);
GO

-- Table User
CREATE TABLE [User] (
    userId VARCHAR(255) PRIMARY KEY,
    roleId INT,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    sdt VARCHAR(50),
    image VARCHAR(255),
    name VARCHAR(255),
    createdBy VARCHAR(255),
    createDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(255),
    isDelete BIT DEFAULT 0,
    FOREIGN KEY (roleId) REFERENCES Role(roleId)
);
GO

-- Table FootballClub
CREATE TABLE FootballClub (
    clubId INT PRIMARY KEY,
    clubName VARCHAR(255) NOT NULL,
    createdBy VARCHAR(255),
    createDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(255),
    isDelete BIT DEFAULT 0
);
GO

-- Table MatchStatus
CREATE TABLE MatchStatus (
    statusId INT PRIMARY KEY,
    statusName VARCHAR(255) NOT NULL
);
GO

-- Table MatchType
CREATE TABLE MatchType (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
GO

-- Table Match
CREATE TABLE Match (
    matchId INT PRIMARY KEY,
    team1 INT,
    team2 INT,
    stadiumImg VARCHAR(255),
    time DATETIME2,
    statusId INT,
    matchTypeId INT,
    createdBy VARCHAR(255),
    createDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(255),
    isDelete BIT DEFAULT 0,
    FOREIGN KEY (team1) REFERENCES FootballClub(clubId),
    FOREIGN KEY (team2) REFERENCES FootballClub(clubId),
    FOREIGN KEY (statusId) REFERENCES MatchStatus(statusId),
    FOREIGN KEY (matchTypeId) REFERENCES MatchType(id)
);
GO

-- Table Class
CREATE TABLE Class (
    id INT PRIMARY KEY,
    className VARCHAR(255) NOT NULL
);
GO

-- Table Stand
CREATE TABLE Stand (
    standId INT PRIMARY KEY,
    standName VARCHAR(255) NOT NULL,
    typeId INT,
    price DECIMAL(18, 2),
    classId INT,
    createdBy VARCHAR(255),
    createDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(255),
    isDelete BIT DEFAULT 0,
    number INT,
    FOREIGN KEY (classId) REFERENCES Class(id)
);
GO

-- Table MatchStand
CREATE TABLE MatchStand (
    matchId INT,
    standId INT,
    availability INT,
    PRIMARY KEY (matchId, standId),
    FOREIGN KEY (matchId) REFERENCES Match(matchId),
    FOREIGN KEY (standId) REFERENCES Stand(standId)
);
GO

-- Table HistoryPurchasedTicket
CREATE TABLE HistoryPurchasedTicket (
    ticketId INT PRIMARY KEY,
    matchId INT,
    standId INT,
    qr VARCHAR(255),
    createDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    price DECIMAL(18, 2),
    section VARCHAR(255),
    number INT,
    status VARCHAR(255),
    FOREIGN KEY (matchId) REFERENCES Match(matchId),
    FOREIGN KEY (standId) REFERENCES Stand(standId)
);
GO

-- Table Payment
CREATE TABLE Payment (
    paymentId INT PRIMARY KEY,
    userId VARCHAR(255),
    createdBy VARCHAR(255),
    ticketId INT,
    price DECIMAL(18, 2),
    date DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES [User](userId),
    FOREIGN KEY (ticketId) REFERENCES HistoryPurchasedTicket(ticketId)
);
GO

-- Table News
CREATE TABLE News (
    title VARCHAR(255) PRIMARY KEY,
    content TEXT NOT NULL,
    postTime DATETIME2,
    createdBy VARCHAR(255),
    createDate DATETIME2 DEFAULT CURRENT_TIMESTAMP,
    updatedBy VARCHAR(255),
    isDelete BIT DEFAULT 0
);
GO

--Drop database Sell_Football_Ticket