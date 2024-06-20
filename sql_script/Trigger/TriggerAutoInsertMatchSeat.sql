USE BookingFootballTicket;
GO
CREATE TRIGGER trg_AfterInsertMatch
ON Match
AFTER INSERT
AS
BEGIN
    -- Insert into MatchSeat using data from inserted rows and existing SeatArea data
    INSERT INTO MatchSeat (matchId, seatId, price, [availability])
    SELECT 
        i.matchId, 
        sa.seatId, 
        sc.price, 
        sa.quantity AS availability
    FROM 
        inserted i
    CROSS JOIN 
        SeatArea sa
    INNER JOIN 
        SeatClass sc ON sa.seatClassId = sc.seatClassId;
END;
GO