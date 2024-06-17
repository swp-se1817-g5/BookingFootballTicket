USE BookingFootballTickett;
GO

-- Insert values into Role table
INSERT INTO Role (roleName) VALUES
('Admin'),
('User'),
('Staff');
GO

-- Insert values into User table
INSERT INTO [User] (email, [name], roleId, [hashedPassword], phoneNumber, avatar, createdBy) VALUES
('admin@example.com', 'Admin User', 1, 'hashed_password_admin', '1234567890', 'Images/avatar/avatar1.jpg', 'admin@example.com'),
('user1@example.com', 'User ', 2, 'hashed_password_user1', '0987654321', 'Images/avatar/avatar2.jpg', 'admin@example.com'),
('user2@example.com', 'Staff', 3, 'hashed_password_user2', '1122334455', 'Images/avatar/avatar3.jpg', 'admin@example.com');
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
('fans-side', '150000'),
('standard', '50000'),
('vip-stand', '200000'),
('on-roof', '60000'),
('under-roof', '70000');
GO

-- Stand A
INSERT INTO SeatArea (standId, seatName, quantity) VALUES
(1, '1', 200),
(1, '2', 250),
(1, '3', 100),
(1, '4', 150 ),
(1, '5', 100 ),
(1, '6', 150 ),
(1, '7', 200 ),
(1, '8', 250 ),
(1, '9', 100 ),
(1, '10', 150 ),
(1, '11', 100 ),
(1, '12', 150 ),
(1, '13', 50 ),
(1, '14', 50),
(1, '15', 50),
(1, '16', 50);

-- Stand B
INSERT INTO SeatArea (standId, seatName, quantity) VALUES
(2, '1', 200),
(2, '2', 250),
(2, '3', 100),
(2, '4', 150),
(2, '5', 100),
(2, '6', 150),
(2, '7', 200),
(2, '8', 250),
(2, '9', 100),
(2, '10', 150),
(2, '11', 100),
(2, '12', 150),
(2, '13', 50),
(2, '14', 50),
(2, '15', 50),
(2, '16', 50);

-- Stand C
INSERT INTO SeatArea (standId, seatName, quantity) VALUES
(3, '1', 200),
(3, '2', 250),
(3, '3', 200),
(3, '4', 250),
(3, '5', 200),
(3, '6', 250),
(3, '7', 200),
(3, '8', 250);

-- Stand D
INSERT INTO SeatArea (standId, seatName, quantity) VALUES
(4, '1', 200),
(4, '2', 250),
(4, '3', 200),
(4, '4', 250),
(4, '5', 200),
(4, '6', 250),
(4, '7', 200),
(4, '8', 250);



-- Insert values into MatchSeat table
-- INSERT INTO MatchSeat (matchId, seatId, [availability], createdBy) VALUES
-- (1, 1, 100, 'admin@example.com'),
-- (1, 2, 150, 'admin@example.com');
-- GO

-- Insert values into HistoryPurchasedTicket table
-- INSERT INTO HistoryPurchasedTicket (matchSeatId, email, qrCode, price, quantity, [status], createdBy) VALUES
--(1, 'user1@example.com', 'QRCode1', 50.00, 1, 'Purchased', 'admin@example.com'),
--(2, 'user2@example.com', 'QRCode2', 40.00, 2, 'Purchased', 'admin@example.com');
--GO

-- Insert values into Payment table
/*INSERT INTO Payment (email, ticketId, price) VALUES
('user1@example.com', 1, 50.00),
('user2@example.com', 2, 80.00);
GO
*/
-- Insert values into News table
INSERT INTO News (title, content, createdBy) VALUES
('Title 1','Content 1', 'admin@example.com'),
('Title 2', 'Content 2', 'admin@example.com');
GO