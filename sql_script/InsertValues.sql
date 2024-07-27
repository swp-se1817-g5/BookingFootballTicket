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
('admin@example.com', N'Quản trị viên', 1, '$2a$10$xOmO7JLAf1MZx4ase20PreqTFUWA2dwoD0UlRQsfJxaUnUO.YBf7S', '0987654322', 'Images/avatar/avatar1.jpg', 'admin@example.com'),
('user1@example.com', N'Người dùng', 2, '$2a$10$xOmO7JLAf1MZx4ase20PreqTFUWA2dwoD0UlRQsfJxaUnUO.YBf7S', '0987654321', 'Images/avatar/avatar2.jpg', 'admin@example.com'),
('user2@example.com', N'Nhân viên', 3, '$2a$10$xOmO7JLAf1MZx4ase20PreqTFUWA2dwoD0UlRQsfJxaUnUO.YBf7S', '0987654323', 'Images/avatar/avatar3.jpg', 'admin@example.com'),
('user3@example.com', N'Người dùng', 2, '$2a$10$aBcDeFgHiJkLmNoPqRsTuVwXyZaBcDeFgHiJkLmNoPqRsTuVwXyZ', '0987654324', 'Images/avatar/avatar4.jpg', 'admin@example.com'),
('user4@example.com', N'Người dùng', 2, '$2a$10$abcdefgHIJKLmnoPQRSTuvWXYzaBCDEFGHIJKLmnoPQRSTuvWXYz', '0987654325', 'Images/avatar/avatar5.jpg', 'admin@example.com'),
('user5@example.com', N'Người dùng', 2, '$2a$10$12345ABCDE67890FGHIJKLMNOPQRSTUVWX12345ABCDE67890FGHI', '0987654326', 'Images/avatar/avatar6.jpg', 'admin@example.com'),
('user6@example.com', N'Người dùng', 2, '$2a$10$09876ZYXWVUTSRQONMLKJIHGFEDCBAzyxwvutsrqonmlkjihgfedcb', '0987654327', 'Images/avatar/avatar7.jpg', 'admin@example.com'),
('user7@example.com', N'Người dùng', 2, '$2a$10$lkjihgfedcba09876ZYXWVUTSRQONMLKJIHGFEDCBA09876zyxwv', '0987654328', 'Images/avatar/avatar8.jpg', 'admin@example.com'),
('user8@example.com', N'Người dùng', 2, '$2a$10$poiuytrewqLKJHGFDSAmnbvcxzPOIUYTREWQlkjhgfdsamnbvcxz', '0987654329', 'Images/avatar/avatar9.jpg', 'admin@example.com'),
('user9@example.com', N'Người dùng', 2, '$2a$10$zxcvbnmlkjhgfdsapoiuytrewqZXCVBNMLKJHGFDSAPOIUYTREWQ', '0987654330', 'Images/avatar/avatar10.jpg', 'admin@example.com'),
('user10@example.com', N'Người dùng', 2, '$2a$10$qwertyuioplkjhgfdsazxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM', '0987654331', 'Images/avatar/avatar11.jpg', 'admin@example.com'),
('user11@example.com', N'Người dùng', 2, '$2a$10$mnbvcxzlkjhgfdsaqwertyuiopMNBVCXZLKJHGFDSAQWERTYUIOP', '0987654332', 'Images/avatar/avatar12.jpg', 'admin@example.com'),
('user12@example.com', N'Người dùng', 2, '$2a$10$lkjhgfdsamnbvcxzPOIUYTREWQlKJHGFDsaMNBVCXZpoiuytrewq', '0987654333', 'Images/avatar/avatar13.jpg', 'admin@example.com'),
('inspector@example.com', N'Nhân viên quét vé', 4, '$2a$10$xOmO7JLAf1MZx4ase20PreqTFUWA2dwoD0UlRQsfJxaUnUO.YBf7S', '0987654324', 'Images/avatar/avatar3.jpg', 'admin@example.com');
GO

-- Insert values into FootballClub table
INSERT INTO FootballClub (clubName, img, Description, createdBy) VALUES
(N'Hoàng Anh Gia Lai', 'path/to/image1.jpg', N'HAGL nổi tiếng với lứa cầu thủ trẻ tài năng từ Học viện bóng đá Hoàng Anh Gia Lai – Arsenal JMG. Đội bóng này luôn chơi bóng đá tấn công đẹp mắt và có sự ủng hộ nhiệt tình từ khán giả.', 'admin@example.com'),
(N'Hà Nội FC', 'path/to/image1.jpg', N'Hà Nội FC là một trong những đội bóng mạnh nhất và có nhiều thành tích nhất trong lịch sử V-League. Họ nổi bật với lối chơi kỹ thuật và có nhiều cầu thủ quốc tế xuất sắc.', 'admin@example.com'),
(N'Bình Định FC', 'path/to/image1.jpg', N'Bình Định FC là đội bóng có lịch sử lâu đời và được sự ủng hộ mạnh mẽ từ cổ động viên. Họ luôn nỗ lực thi đấu tốt và đạt kết quả cao.', 'admin@example.com'),
(N'Than Quảng Ninh', 'path/to/image1.jpg', N'Than Quảng Ninh là đội bóng có lối chơi phòng ngự phản công hiệu quả. Họ có sự ủng hộ nhiệt tình từ cổ động viên địa phương và luôn cạnh tranh mạnh mẽ tại V-League.', 'admin@example.com'),
(N'SHB Đà Nẵng', 'path/to/image1.jpg', N'Đà Nẵng là đội bóng mạnh của khu vực miền Trung, với lối chơi chắc chắn và khả năng phản công sắc bén. Họ đã từng giành nhiều danh hiệu trong quá khứ.', 'admin@example.com'),
(N'Becamex Bình Dương', 'path/to/image1.jpg', N'Bình Dương là một trong những đội bóng giàu có và có tiềm lực mạnh mẽ nhờ sự hỗ trợ từ các tập đoàn lớn. Họ có lối chơi mạnh mẽ và thường xuyên cạnh tranh ở top đầu bảng xếp hạng.', 'admin@example.com'),
(N'Sông Lam Nghệ An', 'path/to/image1.jpg', N'SLNA là đội bóng nổi tiếng với lò đào tạo trẻ uy tín và sản sinh ra nhiều tài năng cho bóng đá Việt Nam. Họ có lượng cổ động viên trung thành và sôi động.', 'admin@example.com'),
(N'Thanh Hóa FC', 'path/to/image1.jpg', N'Thanh Hóa FC nổi bật với tinh thần thi đấu mạnh mẽ và lối chơi tấn công máu lửa. Đội bóng này luôn là một trong những đội bóng gây khó khăn cho các đối thủ tại V-League.', 'admin@example.com'),
(N'Hải Phòng FC', 'path/to/image1.jpg', N'Hải Phòng FC có lượng cổ động viên cuồng nhiệt và trung thành. Lối chơi của đội bóng này thường rất nhiệt huyết và quyết tâm.', 'admin@example.com'),
(N'Quảng Nam FC', 'path/to/image1.jpg', N'Quảng Nam FC đã từng giành chức vô địch V-League và luôn cố gắng duy trì vị thế của mình. Đội bóng này có lối chơi kỹ thuật và sự đồng đều trong đội hình.', 'admin@example.com'),
(N'Hồng Lĩnh Hà Tĩnh', 'path/to/image1.jpg', N'Hồng Lĩnh Hà Tĩnh là đội bóng mới nổi nhưng đã thể hiện được sự tiến bộ nhanh chóng. Họ có lối chơi kỷ luật và sự quyết tâm cao.', 'admin@example.com'),
(N'Phù Đổng FC', 'path/to/image1.jpg', N'Phù Đổng FC là đội bóng trẻ và có tiềm năng phát triển. Họ luôn nỗ lực cải thiện và đạt kết quả tốt trong các giải đấu.', 'admin@example.com'),
(N'Bình Thuận FC', 'path/to/image1.jpg', N'Bình Thuận FC là đội bóng mới nổi và đang cố gắng xây dựng đội hình mạnh mẽ để thi đấu tốt ở các giải đấu.', 'admin@example.com'),
(N'Đắk Lắk FC', 'path/to/image1.jpg', N'Đắk Lắk FC là đội bóng trẻ và có tiềm năng phát triển. Họ luôn cố gắng cải thiện và đạt kết quả tốt.', 'admin@example.com'),
(N'Viettel FC', 'path/to/image2.jpg', N'Được xem là một trong những đội bóng giàu truyền thống, Viettel FC kế thừa di sản từ Thể Công, một đội bóng quân đội nổi tiếng trước đây. Họ nổi bật với lối chơi kỷ luật và tinh thần chiến đấu cao.', 'admin@example.com');
GO

-- Insert values into MatchStatus table
INSERT INTO MatchStatus (statusName) VALUES
(N'Lên lịch'),
(N'Đang bán'),
(N'Kết Thúc'),
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
(N'Siêu cúp Quốc gia', '2024-05-01', '2024-05-01', 'admin@example.com'),
(N'V-League 2', '2024-05-02', '2024-08-30', 'admin@example.com'),
(N'Cúp Quốc gia', '2024-08-31', '2024-12-30', 'admin@example.com'),
(N'Giải hạng Nhì Quốc gia', '2025-01-01', '2025-04-30', 'admin@example.com'),
(N'Giải hạng Ba Quốc gia', '2025-05-01', '2025-08-30', 'admin@example.com'),
(N'Giải bóng đá nữ Vô địch Quốc gia', '2025-09-01', '2025-12-30', 'admin@example.com'),
(N'Giải U21 Quốc gia', '2026-01-01', '2026-03-30', 'admin@example.com'),
(N'Giải U19 Quốc gia', '2026-04-01', '2026-06-30', 'admin@example.com'),
(N'Giải bóng đá trẻ em có hoàn cảnh đặc biệt', '2026-07-01', '2026-07-30', 'admin@example.com'),
(N'Giải futsal Vô địch Quốc gia', '2026-08-01', '2026-11-30', 'admin@example.com');
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

-- Insert values into News table
INSERT INTO NewsState(stateName) VALUES
(N'Ẩn'),
(N'Hiện');
GO
-- Insert values into News table
INSERT INTO News (title, content,conclusion,stateId, createdBy) VALUES
(N'Kết quả U19 Đông Nam Á 2024 hôm nay 21/07 ', N'Chiều nay (21/7), U19 Việt Nam bước vào loạt trận thứ 2 bảng B giải U19 Đông Nam Á 2024 gặp U19 Australia. Đây là trận đấu mà U19 Việt Nam phải thắng mới mong có cơ hội vào bán kết.',N'HẾT GIỜ !!! U19 Việt Nam thua 2-6 trước U19 Australia.',1, 'admin@example.com'),
(N'U19 Lào xuất sắc lấy điểm của U19 Myanmar, trao cơ hội cho U19 Việt Nam', N'Bị đối thủ dồn ép nhưng U19 Lào đã phản kháng rất tốt để giật lại một trận hòa. Kết quả này giúp U19 Việt Nam sáng cơ hội cán đích ở vị trí nhì bảng, nhưng cánh cửa đi tiếp vẫn là rất mong manh.',N'Nhưng điều đó có lẽ cũng không còn mang ý nghĩa bởi thể thức ở giải đấu năm nay chỉ lấy đội dẫn đầu bảng đi tiếp, trong khi Việt Nam rất khó cạnh tranh vị trí thứ nhì xuất sắc nhất với những đối thủ tiềm năng như Malaysia hay Philippines ở các bảng đấu khác.',1, 'admin@example.com'),
(N'Lịch thi đấu U19 Đông Nam Á 2024 hôm nay 20/7: Chờ thêm bất ngờ', N'Sau khi đánh bại U19 Campuchia trong trận ra quân, U19 Timor Leste được chờ đợi sẽ tạo thêm bất ngờ trong trận đấu với U19 Philippines chiều nay.',N'Với những gì đã thể hiện trước U19 Timor Leste, rất khó cho U19 Campuchia ngăn cản được U19 Indonesia lúc này. Với vị thế đang lên, cộng thêm sự cổ vũ của người hâm mộ nhà, U19 Indonesia hứa hẹn sẽ có thêm trận đấu bùng nổ khác.',2, 'admin@example.com'),

(N'Hoàng Đức gia hạn hợp đồng với Viettel FC, trở thành cầu thủ nhận lương cao nhất CLB', 
 N'Nguyễn Hoàng Đức chính thức gia hạn hợp đồng thêm 3 năm với Viettel FC và trở thành cầu thủ nhận lương cao nhất CLB.', 
 N'Với việc gia hạn hợp đồng thêm 3 năm, Nguyễn Hoàng Đức sẽ nhận mức lương 500 triệu đồng/tháng, trở thành cầu thủ có mức lương cao nhất trong lịch sử Viettel FC.', 
 2, 'admin@example.com'),

(N'Tiến Linh chuyển đến CLB TP Hồ Chí Minh với bản hợp đồng kỷ lục', 
 N'Nguyễn Tiến Linh chuyển đến CLB TP Hồ Chí Minh với bản hợp đồng kéo dài 4 năm và mức lương kỷ lục.', 
 N'Nguyễn Tiến Linh đã ký hợp đồng 4 năm với CLB TP Hồ Chí Minh với mức lương lên đến 600 triệu đồng/tháng, con số cao kỷ lục tại CLB.', 
 2, 'admin@example.com'),

(N'Trọng Hoàng trở lại thi đấu cho SLNA với mức phí lót tay khủng', 
 N'Nguyễn Trọng Hoàng chính thức trở lại thi đấu cho Sông Lam Nghệ An và nhận mức phí lót tay cao.', 
 N'Nguyễn Trọng Hoàng đã ký hợp đồng trở lại với SLNA với mức phí lót tay 15 tỷ đồng, một trong những con số cao nhất lịch sử CLB.', 
 2, 'admin@example.com'),

(N'Văn Toàn gia nhập Hoàng Anh Gia Lai, mức phí chuyển nhượng cao kỷ lục', 
 N'Nguyễn Văn Toàn chính thức gia nhập Hoàng Anh Gia Lai với mức phí chuyển nhượng cao kỷ lục trong lịch sử CLB.', 
 N'Với mức phí chuyển nhượng lên đến 20 tỷ đồng, Nguyễn Văn Toàn trở thành cầu thủ có mức phí chuyển nhượng cao nhất trong lịch sử Hoàng Anh Gia Lai.', 
 2, 'admin@example.com'),

(N'Đức Huy ký hợp đồng 5 năm với CLB Hải Phòng, nhận mức lương khủng', 
 N'Phạm Đức Huy đã ký hợp đồng 5 năm với CLB Hải Phòng và nhận mức lương khủng.', 
 N'Phạm Đức Huy sẽ nhận mức lương 450 triệu đồng/tháng trong 5 năm tới tại CLB Hải Phòng, một con số đáng ngưỡng mộ trong giới bóng đá Việt Nam.', 
 2, 'admin@example.com'),

(N'Văn Hậu trở lại Hà Nội FC với mức phí lót tay kỷ lục', 
 N'Đoàn Văn Hậu chính thức trở lại Hà Nội FC với bản hợp đồng 3 năm và mức phí lót tay kỷ lục.', 
 N'Đoàn Văn Hậu đã ký hợp đồng trở lại Hà Nội FC với mức phí lót tay lên đến 25 tỷ đồng (8,3 tỷ/mùa), cao nhất trong lịch sử CLB.', 
 2, 'admin@example.com'),

(N'Tấn Trường gia hạn hợp đồng với Bình Dương FC, nhận mức lương cao nhất sự nghiệp', 
 N'Bùi Tấn Trường đã gia hạn hợp đồng với Bình Dương FC và nhận mức lương cao nhất sự nghiệp.', 
 N'Với việc gia hạn hợp đồng, Bùi Tấn Trường sẽ nhận mức lương 400 triệu đồng/tháng, mức lương cao nhất sự nghiệp của anh.', 
 2, 'admin@example.com'),

(N'Xuân Trường ký hợp đồng mới với CLB Nam Định, trở thành cầu thủ nhận lương cao nhất CLB', 
 N'Lương Xuân Trường chính thức ký hợp đồng mới với CLB Nam Định và trở thành cầu thủ nhận lương cao nhất CLB.', 
 N'Lương Xuân Trường sẽ nhận mức lương 550 triệu đồng/tháng sau khi ký hợp đồng mới với CLB Nam Định, một con số cao kỷ lục trong lịch sử CLB.', 
 2, 'admin@example.com'),

(N'Quang Hải ký hợp đồng mới với CLB Công an Hà Nội, nhận phí lót tay cao kỷ lục Việt Nam', N'Nguyễn Quang Hải chính thức ký hợp đồng mới kéo dài 3 năm với CLB Công an Hà Nội và nhận mức phí lót tay cao kỷ lục Việt Nam.',N'Ký hợp đồng mới 3 năm với CLB Công an Hà Nội, Nguyễn Quang Hải sẽ nhận mức phí lót tay lên đến 27 tỷ đồng (9 tỷ/ mùa). Đây là con số cao kỷ lục của bóng đá Việt Nam, nhưng được đánh giá là xứng đáng với tài năng và tên tuổi của Quang Hải.',2, 'admin@example.com');
GO
