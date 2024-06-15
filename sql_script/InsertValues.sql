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

-- Stand A
INSERT INTO SeatArea (standId, seatName, price, quantity, createdBy) VALUES
(1, '1', 30.00, 200, 'admin@example.com'),
(1, '2', 25.00, 250, 'admin@example.com'),
(1, '3', 50.00, 100, 'admin@example.com'),
(1, '4', 40.00, 150, 'admin@example.com'),
(1, '5', 50.00, 100, 'admin@example.com'),
(1, '6', 40.00, 150, 'admin@example.com'),
(1, '7', 30.00, 200, 'admin@example.com'),
(1, '8', 25.00, 250, 'admin@example.com'),
(1, '9', 50.00, 100, 'admin@example.com'),
(1, '10', 40.00, 150, 'admin@example.com'),
(1, '11', 50.00, 100, 'admin@example.com'),
(1, '12', 40.00, 150, 'admin@example.com'),
(1, '13', 60.00, 50, 'admin@example.com'),
(1, '14', 60.00, 50, 'admin@example.com'),
(1, '15', 60.00, 50, 'admin@example.com'),
(1, '16', 60.00, 50, 'admin@example.com');

-- Stand B
INSERT INTO SeatArea (standId, seatName, price, quantity, createdBy) VALUES
(2, '1', 30.00, 200, 'admin@example.com'),
(2, '2', 25.00, 250, 'admin@example.com'),
(2, '3', 50.00, 100, 'admin@example.com'),
(2, '4', 40.00, 150, 'admin@example.com'),
(2, '5', 50.00, 100, 'admin@example.com'),
(2, '6', 40.00, 150, 'admin@example.com'),
(2, '7', 30.00, 200, 'admin@example.com'),
(2, '8', 25.00, 250, 'admin@example.com'),
(2, '9', 50.00, 100, 'admin@example.com'),
(2, '10', 40.00, 150, 'admin@example.com'),
(2, '11', 50.00, 100, 'admin@example.com'),
(2, '12', 40.00, 150, 'admin@example.com'),
(2, '13', 60.00, 50, 'admin@example.com'),
(2, '14', 60.00, 50, 'admin@example.com'),
(2, '15', 60.00, 50, 'admin@example.com'),
(2, '16', 60.00, 50, 'admin@example.com');

-- Stand C
INSERT INTO SeatArea (standId, seatName, price, quantity, createdBy) VALUES
(3, '1', 30.00, 200, 'admin@example.com'),
(3, '2', 25.00, 250, 'admin@example.com'),
(3, '3', 30.00, 200, 'admin@example.com'),
(3, '4', 25.00, 250, 'admin@example.com'),
(3, '5', 30.00, 200, 'admin@example.com'),
(3, '6', 25.00, 250, 'admin@example.com'),
(3, '7', 30.00, 200, 'admin@example.com'),
(3, '8', 25.00, 250, 'admin@example.com');

-- Stand D
INSERT INTO SeatArea (standId, seatName, price, quantity, createdBy) VALUES
(4, '1', 30.00, 200, 'admin@example.com'),
(4, '2', 25.00, 250, 'admin@example.com'),
(4, '3', 30.00, 200, 'admin@example.com'),
(4, '4', 25.00, 250, 'admin@example.com'),
(4, '5', 30.00, 200, 'admin@example.com'),
(4, '6', 25.00, 250, 'admin@example.com'),
(4, '7', 30.00, 200, 'admin@example.com'),
(4, '8', 25.00, 250, 'admin@example.com');
GO


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
INSERT INTO ImageNews(imageUrl,newsId) VALUES
('images/news/BarcelonaSized.png',18),
('images/news/user.png',18);
GO

