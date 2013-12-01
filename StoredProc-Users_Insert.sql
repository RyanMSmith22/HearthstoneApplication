
/****** Object:  StoredProcedure [dbo].[Users_Insert]    Script Date: 11/29/2013 11:55:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Users_Insert]
	@Username varchar(30),
	@Pass varchar(20)
AS
BEGIN
	INSERT INTO Users (Username, Pass, TS)
	VALUES (@Username, @Pass, GETDATE())
	SELECT SCOPE_IDENTITY()
END