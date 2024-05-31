--use BookingFootballTicket;
CREATE TRIGGER trg_UpdateLastUpdatedDate
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
