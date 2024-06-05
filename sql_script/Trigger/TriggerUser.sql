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
