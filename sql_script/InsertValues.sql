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
(1, 3, '2', 250),
(1, 3, '3', 100),
(1, 3, '4', 150 ),
(1, 3, '5', 100 ),
(1, 1, '6', 150 ),
(1, 2, '7', 200 ),
(1, 5, '8', 250 ),
(1, 5, '9', 100 ),
(1, 5, '10', 150 ),
(1, 5, '11', 100 ),
(1, 2, '12', 150 ),
(1, 4, '13', 50 ),
(1, 4, '14', 50),
(1, 4, '15', 50),
(1, 4, '16', 50);

-- Stand B
INSERT INTO SeatArea (standId, seatClassId, seatName, quantity) VALUES
(2, 1, '1', 200),
(2, 3, '2', 250),
(2, 3, '3', 100),
(2, 3, '4', 150),
(2, 3, '5', 100),
(2, 1, '6', 150),
(2, 2, '7', 200),
(2, 5, '8', 250),
(2, 5, '9', 100),
(2, 5, '10', 150),
(2, 5, '11', 100),
(2, 2, '12', 150),
(2, 4, '13', 50),
(2, 4, '14', 50),
(2, 4, '15', 50),
(2, 4, '16', 50);

-- Stand C
INSERT INTO SeatArea (standId, seatClassId, seatName, quantity) VALUES
(3, 1, '1', 200),
(3, 1, '2', 250),
(3, 1, '3', 200),
(3, 1, '4', 250),
(3, 2, '5', 200),
(3, 2, '6', 250),
(3, 2, '7', 200),
(3, 2, '8', 250);

-- Stand D
INSERT INTO SeatArea (standId, seatClassId, seatName, quantity) VALUES
(4, 1, '1', 200),
(4, 1, '2', 250),
(4, 1, '3', 200),
(4, 1, '4', 250),
(4, 2, '5', 200),
(4, 2, '6', 250),
(4, 2, '7', 200),
(4, 2, '8', 250);
GO

-- Assuming SeatArea and Season tables have some existing data with seatId and seasonId values
INSERT INTO SeasonSeat (seatId, seasonId, price, availability)
VALUES 
    (1, 1, 100.00, 50),
    (2, 1, 150.00, 30),
    (3, 2, 200.00, 20),
    (4, 2, 250.00, 10);
GO
-- Insert v�o b?ng TicketStatus
INSERT INTO TicketStatus (statusName) 
VALUES 
('Still validated'),
('Expire');
GO
-- Insert values into HistoryPurchasedTicketMatchSeat table
INSERT INTO HistoryPurchasedTicketMatchSeat (team1, team2, startTime, seasonName, seatName, quantity, standName, seatClassName, email, qrCode, price, statusId, createdBy)
VALUES 
('Chelsea', 'Arsenal', '2024-12-12 15:00:00', 'Spring 2024', '1', 2, 'A', 'fans-side', 'user1@example.com', 'QRCode1', 100.00, 1, 'admin@example.com'),
('Manchester United', 'Tottenham Hotspur', '2024-12-13 16:00:00', 'Summer 2024', '2', 1, 'B', 'standard', 'user2@example.com', 'QRCode2', 80.00, 1, 'admin@example.com'),
('Liverpool', 'Manchester City', '2024-12-14 17:00:00', 'Spring 2024', '3', 4, 'C', 'vip-stand', 'user1@example.com', 'QRCode3', 200.00, 1, 'admin@example.com'),
('Leicester City', 'Everton', '2024-12-15 18:00:00', 'Summer 2024', '4', 3, 'D', 'on-roof', 'user2@example.com', 'QRCode4', 150.00, 1, 'admin@example.com'),
('West Ham United', 'Crystal Palace', '2024-12-16 19:00:00', 'Spring 2024', '5', 2, 'A', 'under-roof', 'user1@example.com', 'QRCode5', 120.00, 1, 'admin@example.com'),
('Southampton', 'Brighton & Hove Albion', '2024-12-17 20:00:00', 'Summer 2024', '6', 5, 'B', 'fans-side', 'user2@example.com', 'QRCode6', 250.00, 1, 'admin@example.com'),
('Wolverhampton Wanderers', 'Aston Villa', '2024-12-18 21:00:00', 'Spring 2024', '7', 3, 'C', 'standard', 'user1@example.com', 'QRCode7', 150.00, 1, 'admin@example.com'),
('Norwich City', 'Burnley', '2024-12-19 22:00:00', 'Summer 2024', '8', 2, 'D', 'vip-stand', 'user2@example.com', 'QRCode8', 200.00, 1, 'admin@example.com'),
('Brentford', 'Watford', '2024-12-20 23:00:00', 'Spring 2024', '9', 1, 'A', 'on-roof', 'user1@example.com', 'QRCode9', 80.00, 1, 'admin@example.com'),
('Leeds United', 'Newcastle United', '2024-12-21 00:00:00', 'Summer 2024', '10', 6, 'B', 'under-roof', 'user2@example.com', 'QRCode10', 300.00, 1, 'admin@example.com');

-- Insert values into HistoryPurchasedTicketSeasonSeat table
INSERT INTO HistoryPurchasedTicketSeasonSeat (team1, team2, startDate, endDate, seasonName, seatName, quantity, standName, seatClassName, email, qrCode, price, statusId, createdBy)
VALUES 
('Chelsea', 'Arsenal', '2024-12-12 15:00:00', '2024-12-12 17:00:00', 'Spring 2024', '1', 2, 'A', 'fans-side', 'user1@example.com', 'QRCode1', 100.00, 1, 'admin@example.com'),
('Manchester United', 'Tottenham Hotspur', '2024-12-13 16:00:00', '2024-12-13 18:00:00', 'Summer 2024', '2', 1, 'B', 'standard', 'user2@example.com', 'QRCode2', 80.00, 1, 'admin@example.com'),
('Liverpool', 'Manchester City', '2024-12-14 17:00:00', '2024-12-14 19:00:00', 'Spring 2024', '3', 4, 'C', 'vip-stand', 'user1@example.com', 'QRCode3', 200.00, 1, 'admin@example.com'),
('Leicester City', 'Everton', '2024-12-15 18:00:00', '2024-12-15 20:00:00', 'Summer 2024', '4', 3, 'D', 'on-roof', 'user2@example.com', 'QRCode4', 150.00, 1, 'admin@example.com'),
('West Ham United', 'Crystal Palace', '2024-12-16 19:00:00', '2024-12-16 21:00:00', 'Spring 2024', '5', 2, 'A', 'under-roof', 'user1@example.com', 'QRCode5', 120.00, 1, 'admin@example.com'),
('Southampton', 'Brighton & Hove Albion', '2024-12-17 20:00:00', '2024-12-17 22:00:00', 'Summer 2024', '6', 5, 'B', 'fans-side', 'user2@example.com', 'QRCode6', 250.00, 1, 'admin@example.com'),
('Wolverhampton Wanderers', 'Aston Villa', '2024-12-18 21:00:00', '2024-12-18 23:00:00', 'Spring 2024', '7', 3, 'C', 'standard', 'user1@example.com', 'QRCode7', 150.00, 1, 'admin@example.com'),
('Norwich City', 'Burnley', '2024-12-19 22:00:00', '2024-12-20 00:00:00', 'Summer 2024', '8', 2, 'D', 'vip-stand', 'user2@example.com', 'QRCode8', 200.00, 1, 'admin@example.com'),
('Brentford', 'Watford', '2024-12-20 23:00:00', '2024-12-21 01:00:00', 'Spring 2024', '9', 1, 'A', 'on-roof', 'user1@example.com', 'QRCode9', 80.00, 1, 'admin@example.com'),
('Leeds United', 'Newcastle United', '2024-12-21 00:00:00', '2024-12-21 02:00:00', 'Summer 2024', '10', 6, 'B', 'under-roof', 'user2@example.com', 'QRCode10', 300.00, 1, 'admin@example.com');

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
INSERT INTO News (title, content,conclusion,stateId,statusId, createdBy) VALUES
('Austria and England win their groups', 'As the group stage of Euro 2024 concludes, the tournament has already seen its fair share of drama, surprises, and heartbreaks. Groups C and D, in particular, have delivered intense football action, leaving fans and pundits with much to discuss. Here�s a detailed look at the outcomes and narratives emerging from these groups.','The conclusion of the group stages sets the stage for an intriguing knockout phase. England must address their attacking woes if they are to meet the expectations back home. Denmark will need to improve their finishing to stand a chance against stronger opponents. The Netherlands, despite their shaky form, have the talent to cause upsets, but they must find cohesion quickly. France, still among the favorites, will look to bounce back from their disappointing draw and leverage their star power in the next rounds.',1,1, 'admin@example.com'),
('Hungary and Italy in waiting room after finishing third', 'The European Championship 2024 group stage came to an electrifying conclusion as the final matches in Groups A and B brought unexpected twists and turns. The outcomes of these matches not only determined the teams advancing to the knockout stages but also showcased some intense football drama.Group A','With the first two groups ended, Hungary is now in a good place to reach the knockout stages. Germany and Switzerland are qualified from Group A. Spain and Italy join them from Group B. This means we now know the first round of 16 tie is going to be Switzerland versus Italy on the 29th of June. Hungary and Croatia are in the waiting room in third place. Hungary is currently close to qualification, since only the worst two numbers 3 drop out of the tournament. The first Euro 2024 tickets for the knockout stages are available now!',1,1, 'admin@example.com'),
('Portugal third team to win first two matches', 'Portugal joins Germany and Spain as the third team to win their first two matches in Euro 2024. The tournament heats up with intense competition as teams vie for knockout stage spots.','Today is the start of the third round in the group stage. On Wednesday evening we know which 16 teams are qualified for the knockout stages. Euro 2024 tickets are getting more and more popular now the tournament heads towards the most exciting part of the tournament. Book yours now and support your team in its attempt to win the title.',2,2, 'admin@example.com'),
('Poor performances cost England favourites status', 'Germany and France are the new shared favourites to win the Euro 2024. England dropped a bit below them, while Spain is the real dark horse of the tournament.','It sounds strange to call a huge football nation like Spain the dark horse, but they aren�t amongst the top favourites according to the bookmakers. When you ask any follower of the tournament which team impressed the most, Spain will definitely come to mind. Lamine Yamal and Nico Williams are two top quality youngsters, who make Spain a real force to reckon with!',2,2, 'admin@example.com'),
('Title 5', 'Content 1',1,3, 'admin@example.com'),
('Title 6', 'Content 2',1,3, 'admin@example.com');
GO
