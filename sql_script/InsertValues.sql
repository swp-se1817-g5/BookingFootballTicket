USE FootballBookingTicket;
GO

-- Insert values into Role table
INSERT INTO Role (roleName) VALUES
(N'Quản trị viên'),
(N'Người dùng'),
(N'Nhân viên'),
(N'Nhân viên quét vé');
GO

-- Insert values into User table
INSERT INTO [User] (email, [name], roleId, [hashedPassword], phoneNumber, avatar, createdBy) VALUES
('admin@example.com', N'Quản trị viên', 1, '$2a$10$xOmO7JLAf1MZx4ase20PreqTFUWA2dwoD0UlRQsfJxaUnUO.YBf7S', '1234567890', 'Images/avatar/avatar1.jpg', 'admin@example.com'),
('user1@example.com', N'Người dùng', 2, 'hashed_password_user1', '0987654321', 'Images/avatar/avatar2.jpg', 'admin@example.com'),
('user2@example.com', N'Nhân viên', 3, '$2a$10$xOmO7JLAf1MZx4ase20PreqTFUWA2dwoD0UlRQsfJxaUnUO.YBf7S', '1122334455', 'Images/avatar/avatar3.jpg', 'admin@example.com'),
('inspector@example.com', N'Nhân viên quét vé', 4, '$2a$10$xOmO7JLAf1MZx4ase20PreqTFUWA2dwoD0UlRQsfJxaUnUO.YBf7S', '1122334455', 'Images/avatar/avatar3.jpg', 'admin@example.com');
GO


-- Insert values into FootballClub table
INSERT INTO FootballClub (clubName, img, Description, createdBy) VALUES
(N'Hoàng Anh Gia Lai', 'path/to/image1.jpg', 'Description of Football Club A', 'admin@example.com'),
(N'Hà Nội', 'path/to/image1.jpg', 'Description of Football Club A', 'admin@example.com'),
(N'Bình Định', 'path/to/image1.jpg', 'Description of Football Club A', 'admin@example.com'),
(N'Than Quảng Ninh', 'path/to/image1.jpg', 'Description of Football Club A', 'admin@example.com'),
(N'Viettel', 'path/to/image2.jpg', 'Description of Football Club B', 'admin@example.com');
GO

-- Insert values into MatchStatus table
INSERT INTO MatchStatus (statusName) VALUES
(N'Lên lịch'),
(N'Đang bán'),
(N'Đang đấu'),
(N'Hoàn thành'),
(N'Đã huỷ');
GO

-- Insert values into MatchType table
INSERT INTO MatchType ([name]) VALUES
(N'Giao hữu'),
(N'Vòng loại'),
(N'Chung kết'),
(N'Bán kết'),
(N'Tứ kết'),
(N'Tranh hạng ba'),
(N'Loại trực tiếp'),
(N'Siêu cúp'),
(N'Lượt đi'),
(N'Lượt về'),
(N'Thi đấu vòng tròn');
GO

-- Insert values into Season table
INSERT INTO Season (seasonName, startDate, endDate, createdBy) VALUES
(N'V-League 1', '2024-01-01', '2024-04-30', 'admin@example.com'),
(N'U19 Quốc gia', '2024-05-01', '2024-08-31', 'admin@example.com');
GO

-- Insert values into Match table
INSERT INTO Match (team1, team2, seasonId, [startTime], statusId, matchTypeId, createdBy) VALUES
(1, 2, 1, '2024-12-12 15:00:00', 1, 2, 'admin@example.com'),
(3, 4, 1, '2024-12-12 15:00:00', 1, 2, 'admin@example.com'),
(5, 3, 1, '2024-12-12 15:00:00', 1, 2, 'admin@example.com'),
(1, 3, 1, '2024-12-12 15:00:00', 1, 2, 'admin@example.com'),
(3, 2, 1, '2024-12-12 15:00:00', 1, 2, 'admin@example.com');
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
    (1, 1, 10000, 50),
    (2, 1, 15000, 30),
    (3, 2, 20000, 20),
    (4, 2, 25000, 10);
GO

INSERT INTO TicketStatus (statusName) 
VALUES 
(N'Chưa quét'),
(N'Đã quét'),
(N'Hết hiệu lực');
GO
-- Insert values into HistoryPurchasedTicketMatchSeat table
INSERT INTO HistoryPurchasedTicketMatchSeat (team1, team2, startTime, seasonName, seatName, quantity, standName, seatClassName, email, qrCode, price, statusId, createdBy, matchSeatId)
VALUES
(N'Hoàng Anh Gia Lai', N'Viettel', '2024-12-12 15:00:00', 'V-League 1 - 2024', N'1', 2, N'A', N'fans-side', 'user1@example.com', 'qrcode1', 300000, 1, 'admin@example.com', 1),
(N'Nam Định', N'Hà Nội', '2024-12-12 15:00:00', 'V-League 2 - 2024', N'2', 3, N'B', N'standard', 'user2@example.com', 'qrcode2', 150000, 1, 'admin@example.com', 2),
(N'Thanh Hóa', N'Becamex Bình Dương', '2024-12-12 15:00:00', N'Siêu Cúp Quốc Gia', N'3', 1, N'C', N'vip-stand', 'inspector@example.com', 'qrcode3', 200000, 1, 'admin@example.com', 3),
(N'Bình Định', N'Hải Phòng', '2024-12-12 15:00:00', N'Giải Hạng Ba Quốc Gia', N'4', 4, N'D', N'on-roof', 'user1@example.com', 'qrcode4', 60000, 1, 'admin@example.com', 4),
(N'Than Quảng Ninh', N'Công An Hà Nội', '2024-12-12 15:00:00', N'Giải Hạng Nhì Quốc Gia', N'5', 5, N'A', N'under-roof', 'user2@example.com', 'qrcode5', 70000, 1, 'admin@example.com', 5);
GO
-- Insert values into HistoryPurchasedTicketSeasonSeat table
--INSERT INTO HistoryPurchasedTicketSeasonSeat (startDate, endDate, seasonName, seatName, quantity, standName, seatClassName, email, qrCode, price, statusId, createdBy)
--VALUES 
--('2024-12-12 15:00:00', '2024-12-12 17:00:00', 'Spring 2024', '1', 2, 'A', 'fans-side', 'user1@example.com', 'QRCode1', 100.00, 1, 'admin@example.com'),
--('2024-12-13 16:00:00', '2024-12-13 18:00:00', 'Summer 2024', '2', 1, 'B', 'standard', 'user2@example.com', 'QRCode2', 80.00, 1, 'admin@example.com'),
--('2024-12-14 17:00:00', '2024-12-14 19:00:00', 'Spring 2024', '3', 4, 'C', 'vip-stand', 'user1@example.com', 'QRCode3', 200.00, 1, 'admin@example.com'),
--('2024-12-15 18:00:00', '2024-12-15 20:00:00', 'Summer 2024', '4', 3, 'D', 'on-roof', 'user2@example.com', 'QRCode4', 150.00, 1, 'admin@example.com'),
--('2024-12-16 19:00:00', '2024-12-16 21:00:00', 'Spring 2024', '5', 2, 'A', 'under-roof', 'user1@example.com', 'QRCode5', 120.00, 1, 'admin@example.com'),
--('2024-12-17 20:00:00', '2024-12-17 22:00:00', 'Summer 2024', '6', 5, 'B', 'fans-side', 'user2@example.com', 'QRCode6', 250.00, 1, 'admin@example.com'),
--('2024-12-18 21:00:00', '2024-12-18 23:00:00', 'Spring 2024', '7', 3, 'C', 'standard', 'user1@example.com', 'QRCode7', 150.00, 1, 'admin@example.com'),
--('2024-12-19 22:00:00', '2024-12-20 00:00:00', 'Summer 2024', '8', 2, 'D', 'vip-stand', 'user2@example.com', 'QRCode8', 200.00, 1, 'admin@example.com'),
--('2024-12-20 23:00:00', '2024-12-21 01:00:00', 'Spring 2024', '9', 1, 'A', 'on-roof', 'user1@example.com', 'QRCode9', 80.00, 1, 'admin@example.com'),
--('2024-12-21 00:00:00', '2024-12-21 02:00:00', 'Summer 2024', '10', 6, 'B', 'under-roof', 'user2@example.com', 'QRCode10', 300.00, 1, 'admin@example.com');

-- Insert values into News table

-- Insert values into News table
INSERT INTO NewsState(stateName) VALUES
(N'Ẩn'),
(N'Hiện');
GO
-- Insert values into News table
INSERT INTO News (title, content,conclusion,stateId,statusId, createdBy) VALUES
(N'Kết quả U19 Đông Nam Á 2024 hôm nay 21/07 ', N'Chiều nay (21/7), U19 Việt Nam bước vào loạt trận thứ 2 bảng B giải U19 Đông Nam Á 2024 gặp U19 Australia. Đây là trận đấu mà U19 Việt Nam phải thắng mới mong có cơ hội vào bán kết.',N'HẾT GIỜ !!! U19 Việt Nam thua 2-6 trước U19 Australia.',1,1, 'admin@example.com'),
(N'U19 Lào xuất sắc lấy điểm của U19 Myanmar, trao cơ hội cho U19 Việt Nam', N'Bị đối thủ dồn ép nhưng U19 Lào đã phản kháng rất tốt để giật lại một trận hòa. Kết quả này giúp U19 Việt Nam sáng cơ hội cán đích ở vị trí nhì bảng, nhưng cánh cửa đi tiếp vẫn là rất mong manh.',N'Nhưng điều đó có lẽ cũng không còn mang ý nghĩa bởi thể thức ở giải đấu năm nay chỉ lấy đội dẫn đầu bảng đi tiếp, trong khi Việt Nam rất khó cạnh tranh vị trí thứ nhì xuất sắc nhất với những đối thủ tiềm năng như Malaysia hay Philippines ở các bảng đấu khác.',1,1, 'admin@example.com'),
(N'Lịch thi đấu U19 Đông Nam Á 2024 hôm nay 20/7: Chờ thêm bất ngờ', N'Sau khi đánh bại U19 Campuchia trong trận ra quân, U19 Timor Leste được chờ đợi sẽ tạo thêm bất ngờ trong trận đấu với U19 Philippines chiều nay.',N'Với những gì đã thể hiện trước U19 Timor Leste, rất khó cho U19 Campuchia ngăn cản được U19 Indonesia lúc này. Với vị thế đang lên, cộng thêm sự cổ vũ của người hâm mộ nhà, U19 Indonesia hứa hẹn sẽ có thêm trận đấu bùng nổ khác.',2,2, 'admin@example.com'),
(N'Quang Hải ký hợp đồng mới với CLB Công an Hà Nội, nhận phí lót tay cao kỷ lục Việt Nam', N'Nguyễn Quang Hải chính thức ký hợp đồng mới kéo dài 3 năm với CLB Công an Hà Nội và nhận mức phí lót tay cao kỷ lục Việt Nam.',N'Ký hợp đồng mới 3 năm với CLB Công an Hà Nội, Nguyễn Quang Hải sẽ nhận mức phí lót tay lên đến 27 tỷ đồng (9 tỷ/ mùa). Đây là con số cao kỷ lục của bóng đá Việt Nam, nhưng được đánh giá là xứng đáng với tài năng và tên tuổi của Quang Hải.',2,2, 'admin@example.com');
GO
