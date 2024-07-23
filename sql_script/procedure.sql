USE FootballBookingTicket;
GO

CREATE PROCEDURE UpdateMatchSeatAvailability
AS
BEGIN
    -- Tăng giá trị availability trong bảng MatchSeat
    UPDATE ms
    SET ms.availability = ms.availability + bt.TotalQuantity
    FROM MatchSeat ms
    INNER JOIN (
        SELECT matchSeatId, SUM(quantity) AS TotalQuantity 
        FROM BookingTicket 
        WHERE DATEDIFF(MINUTE, createdDate, GETDATE()) > 2
        AND status = 'unPayment'
        GROUP BY matchSeatId
    ) bt ON ms.matchSeatId = bt.matchSeatId;

    -- Cập nhật trạng thái 'unPayment' thành 'cancel'
    UPDATE BookingTicket
    SET status = 'cancel'
    WHERE DATEDIFF(MINUTE, createdDate, GETDATE()) > 2
    AND status = 'unPayment';
END;
GO