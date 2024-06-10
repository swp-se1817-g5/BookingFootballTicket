USE BookingFootballTicket;
GO

CREATE TRIGGER trg_AfterInsertMatch
ON Match
AFTER INSERT
AS
BEGIN
    -- Declare variables
    DECLARE @matchId INT;

    -- Set values from the inserted row
    SELECT @matchId = inserted.matchId
    FROM inserted;

    -- Insert corresponding SeatArea records into MatchSeat
    INSERT INTO MatchSeat (matchId, seatId, availability)
    SELECT 
        @matchId,
        seatId,
        quantity
    FROM SeatArea;
END;
GO
