-- Trigger update lastUpdatedDate in table News
CREATE TRIGGER trg_UpdateLastUpdatedDate
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
