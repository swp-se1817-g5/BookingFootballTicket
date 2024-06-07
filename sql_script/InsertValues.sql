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
('Season 2024', '2024-01-01', '2024-12-31', 'admin@example.com');
GO

-- Insert values into Match table
INSERT INTO Match (team1, team2, seasonId, [startTime], statusId, matchTypeId, createdBy) VALUES
(1, 2, 1, '2024-06-01 15:00:00', 1, 2, 'admin@example.com');
GO

-- Insert values into Stand table
INSERT INTO Stand (standName, createdBy) VALUES
('North Stand', 'admin@example.com'),
('South Stand', 'admin@example.com');
GO

-- Insert values into SeatArea table
INSERT INTO SeatArea (standId, seatName, price, quantity, createdBy) VALUES
(1, 'North Stand - Area 1', 50.00, 100, 'admin@example.com'),
(2, 'South Stand - Area 1', 40.00, 150, 'admin@example.com');
GO

-- Insert values into MatchSeat table
INSERT INTO MatchSeat (matchId, seatId, [availability], createdBy) VALUES
(1, 1, 100, 'admin@example.com'),
(1, 2, 150, 'admin@example.com');
GO

-- Insert values into HistoryPurchasedTicket table
INSERT INTO HistoryPurchasedTicket (matchSeatId, email, qrCode, price, quantity, [status], createdBy) VALUES
(1, 'user1@example.com', 'QRCode1', 50.00, 1, 'Purchased', 'admin@example.com'),
(2, 'user2@example.com', 'QRCode2', 40.00, 2, 'Purchased', 'admin@example.com');
GO

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
-- Insert values into NewsImages table
INSERT INTO NewsImages (NewsId, imageUrl) VALUES 
(1,'http://example.com/image1.jpg'),
(1,'http://example.com/image2.jpg'),
(1,'http://example.com/image3.jpg');
GO
