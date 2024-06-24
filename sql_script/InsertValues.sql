USE BookingFootballTicket;
GO

-- Insert values into Role table
INSERT INTO Role (roleName) VALUES
('Admin'),
('User'),
('Staff');
GO

-- Insert values into User table
INSERT INTO [User] (email, [name], roleId, [hashedPassword], phoneNumber, avatar, createdBy) VALUES
('admin@example.com', 'Admin', 1, '$2a$10$xOmO7JLAf1MZx4ase20PreqTFUWA2dwoD0UlRQsfJxaUnUO.YBf7S', '1234567890', 'Images/avatar/avatar1.jpg', 'admin@example.com'),
('user1@example.com', 'User 1', 2, 'hashed_password_user1', '0987654321', 'Images/avatar/avatar2.jpg', 'admin@example.com'),
('user2@example.com', 'Staff ', 3, '$2a$10$xOmO7JLAf1MZx4ase20PreqTFUWA2dwoD0UlRQsfJxaUnUO.YBf7S', '1122334455', 'Images/avatar/avatar3.jpg', 'admin@example.com');
GO

-- Insert values into FootballClub table
INSERT INTO FootballClub (clubName, img, Description, createdBy) VALUES
('Football Club A', 'path/to/image1.jpg', 'Description of Football Club A', 'admin@example.com'),
('Football Club B', 'path/to/image2.jpg', 'Description of Football Club B', 'admin@example.com');
GO

-- Insert values into MatchStatus table
INSERT INTO MatchStatus (statusName) VALUES
('Scheduled'),
('Ongoing'),
('Completed'),
('Cancelled');
GO

-- Insert values into MatchType table
INSERT INTO MatchType ([name]) VALUES
('Friendly'),
('League'),
('Cup');
GO

-- Insert values into Season table
INSERT INTO Season (seasonName, startDate, endDate, createdBy) VALUES
('Spring 2024', '2024-01-01', '2024-04-30', 'admin@example.com'),
('Summer 2024', '2024-05-01', '2024-08-31', 'admin@example.com');
GO

-- Insert values into Match table
INSERT INTO Match (team1, team2, seasonId, [startTime], statusId, matchTypeId, createdBy) VALUES
(1, 2, 1, '2024-12-12 15:00:00', 1, 2, 'admin@example.com');
GO

-- Insert values into Stand table
INSERT INTO Stand (standName, createdBy) VALUES
('A', 'admin@example.com'),
('B', 'admin@example.com'),
('C', 'admin@example.com'),
('D', 'admin@example.com');
GO

-- Insert values into SeatClass table
INSERT INTO SeatClass (seatClassName, price) VALUES
('fans-side', 150000),
('standard', 50000),
('vip-stand', 200000),
('on-roof', 60000),
('under-roof', 70000);
GO

-- Stand A
INSERT INTO SeatArea (standId, seatClassId, seatName, quantity) VALUES
(1, 1, '1', 200),
(1, 1, '2', 250),
(1, 1, '3', 100),
(1, 1, '4', 150 ),
(1, 2, '5', 100 ),
(1, 2, '6', 150 ),
(1, 2, '7', 200 ),
(1, 2, '8', 250 ),
(1, 3, '9', 100 ),
(1, 3, '10', 150 ),
(1, 3, '11', 100 ),
(1, 3, '12', 150 ),
(1, 4, '13', 50 ),
(1, 4, '14', 50),
(1, 4, '15', 50),
(1, 4, '16', 50);

-- Stand B
INSERT INTO SeatArea (standId, seatClassId, seatName, quantity) VALUES
(2, 1, '1', 200),
(2, 1, '2', 250),
(2, 1, '3', 100),
(2, 1, '4', 150),
(2, 2, '5', 100),
(2, 2, '6', 150),
(2, 2, '7', 200),
(2, 2, '8', 250),
(2, 3, '9', 100),
(2, 3, '10', 150),
(2, 3, '11', 100),
(2, 3, '12', 150),
(2, 4, '13', 50),
(2, 4, '14', 50),
(2, 4, '15', 50),
(2, 4, '16', 50);

-- Stand C
INSERT INTO SeatArea (standId, seatClassId, seatName, quantity) VALUES
(3, 1, '1', 200),
(3, 1, '2', 250),
(3, 2, '3', 200),
(3, 2, '4', 250),
(3, 3, '5', 200),
(3, 3, '6', 250),
(3, 4, '7', 200),
(3, 4, '8', 250);

-- Stand D
INSERT INTO SeatArea (standId, seatClassId, seatName, quantity) VALUES
(4, 1, '1', 200),
(4, 1, '2', 250),
(4, 2, '3', 200),
(4, 2, '4', 250),
(4, 3, '5', 200),
(4, 3, '6', 250),
(4, 4, '7', 200),
(4, 4, '8', 250);
GO

-- Assuming SeatArea and Season tables have some existing data with seatId and seasonId values
INSERT INTO SeasonSeat (seatId, seasonId, price, availability)
VALUES 
    (1, 1, 100.00, 50),
    (2, 1, 150.00, 30),
    (3, 2, 200.00, 20),
    (4, 2, 250.00, 10);
GO
-- Insert vào b?ng TicketStatus
INSERT INTO TicketStatus (statusName) 
VALUES 
('Still validated'),
('Expire');
GO
-- Insert values into HistoryPurchasedTicketMatchSeat table
INSERT INTO HistoryPurchasedTicketMatchSeat (team1, team2, startTime, seasonName, seatName, quantity, standName, seatClassName, email, qrCode, price, statusId, createdBy)
VALUES 
('Team A', 'Team B', '2024-07-01 18:00:00', 'Season 2024', 'Seat 1A', 2, 'Stand A', 'Class A', 'user1@example.com', 'QR12345', 100.00, 1, 'admin'),
('Team C', 'Team D', '2024-08-01 19:00:00', 'Season 2024', 'Seat 2B', 1, 'Stand B', 'Class B', 'user2@example.com', 'QR67890', 30.00, 2, 'admin');


-- Insert values into HistoryPurchasedTicketSeasonSeat table
/*INSERT INTO HistoryPurchasedTicketSeasonSeat (seasonSeatId, email, qrCode, price, quantity, [status], createdBy) VALUES
(1, 'user1@example.com', 'QRCode1', 50.00, 1, 1, 'admin@example.com'),
(2, 'user2@example.com', 'QRCode2', 40.00, 2, 1, 'admin@example.com');
GO
*/
-- Insert values into News table

INSERT INTO NewsStatus(statusName) VALUES
('Rejected'),
('Pending'),
('Approved');
GO
-- Insert values into News table
INSERT INTO NewsState(stateName) VALUES
('Hide'),
('Show');
GO
-- Insert values into News table
INSERT INTO News (title, content,stateId,statusId, createdBy) VALUES
('Title 1', 'Content 1',1,1, 'admin@example.com'),
('Title 2', 'Content 2',1,1, 'admin@example.com'),
('Title 3', 'Content 1',2,2, 'admin@example.com'),
('Title 4', 'Content 2',2,2, 'admin@example.com'),
('Title 5', 'Content 1',1,3, 'admin@example.com'),
('Title 6', 'Content 2',1,3, 'admin@example.com');
GO
