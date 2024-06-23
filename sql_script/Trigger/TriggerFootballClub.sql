CREATE TRIGGER trg_UpdateFootballClub
ON FootballClub
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE FootballClub
    SET lastUpdatedDate = CURRENT_TIMESTAMP
    FROM FootballClub S
    INNER JOIN inserted I ON S.clubId = I.clubId;
END;
GO
