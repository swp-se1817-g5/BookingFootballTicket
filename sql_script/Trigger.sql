-------------------------------------------------------------------- TriggerAutoInsertMatchSeat-------------------------------------------------------------------- 
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




-------------------------------------------------------------------- TriggerNews-------------------------------------------------------------------- 
-- Trigger update lastUpdatedDate in table News
CREATE TRIGGER trg_UpdateLastUpdatedDateNews
ON News
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE n
    SET n.lastUpdatedDate = CURRENT_TIMESTAMP
    FROM News n
    INNER JOIN inserted i ON n.newsId = i.newsId;
END;
GO
CREATE TRIGGER trg_UpdatePostOnDateNews
ON News
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Update postOn only when stateId is changed to 2
    IF UPDATE(stateId)
    BEGIN
        UPDATE n
        SET n.postOn = CURRENT_TIMESTAMP
        FROM News n
        INNER JOIN inserted i ON n.newsId = i.newsId
        WHERE i.stateId = 2; -- Update postOn where stateId is 2
    END
END;
GO





-------------------------------------------------------------------- TriggerSeasion-------------------------------------------------------------------- 
-- Trigger update lastUpdatedDate in table Season
CREATE TRIGGER trg_UpdateLastUpdatedDateSeason
ON Season
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE n
    SET n.lastUpdatedDate = CURRENT_TIMESTAMP
    FROM Season n
    INNER JOIN inserted i ON n.seasonId = i.seasonId;
END;
GO




-------------------------------------------------------------------- TriggerStand-------------------------------------------------------------------- 
--use BookingFootballTicket;
CREATE TRIGGER trg_UpdateStand
ON Stand
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Stand
    SET lastUpdatedDate = CURRENT_TIMESTAMP
    FROM Stand S
    INNER JOIN inserted I ON S.standId = I.standId;
END;
GO




-------------------------------------------------------------------- TriggerUser-------------------------------------------------------------------- 
--use BookingFootballTicket;
CREATE TRIGGER trg_UpdateUser
ON [User]
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [User]
    SET lastUpdatedDate = CURRENT_TIMESTAMP
    FROM [User] U
    INNER JOIN inserted I ON U.email = I.email;
END;
GO
