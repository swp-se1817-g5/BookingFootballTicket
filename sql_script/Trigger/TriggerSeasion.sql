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
