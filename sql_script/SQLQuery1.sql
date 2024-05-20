create table [Role] (
	roleId INT PRIMARY KEY,
    roleName VARCHAR(255) NOT NULL,
    createBy VARCHAR(255),
    createDate DATETIME,
    updateBy VARCHAR(255),
    isDeleted default 0
);
go
create table FootballClub(
	clubId INT PRIMARY KEY,
    clubName VARCHAR(255) NOT NULL,
    createBy VARCHAR(255),
    createDate DATETIME,
    updateBy VARCHAR(255),
    [status] BIT

);
go
CREATE TABLE MatchStatus (
    statusId INT PRIMARY KEY,
    statusName VARCHAR(255) NOT NULL
	[status] BIT
);
go
CREATE TABLE News (
    title VARCHAR(255) PRIMARY KEY,
    content TEXT NOT NULL,
    postTime DATETIME,
    createBy VARCHAR(255),
    createDate DATETIME,
    updateBy VARCHAR(255),
    [status] BIT
);




