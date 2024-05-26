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
-- Trigger insert createDate in table News
CREATE TRIGGER trg_InsertNewsCreatedDate
ON News
AFTER INSERT
AS
BEGIN
    -- Set the createdDate to the current time for new rows
    UPDATE News
    SET createdDate = CURRENT_TIMESTAMP
    FROM News
    INNER JOIN inserted ON News.newsId = inserted.newsId;
END;
GO
