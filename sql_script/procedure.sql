USE BookingFootballTicket;
GO

CREATE PROCEDURE UpdateMatchSeatQuantity
AS
BEGIN
    UPDATE ms
    SET ms.availability = ms.availability + bt.TotalQuantity
    FROM MatchSeat ms
    INNER JOIN (
        SELECT matchSeatId, SUM(quantity) AS TotalQuantity 
        FROM BookingTicket 
        WHERE DATEDIFF(MINUTE, createdDate, GETDATE()) > 2 
        GROUP BY matchSeatId
    ) bt ON ms.matchSeatId = bt.matchSeatId;
END;
GO