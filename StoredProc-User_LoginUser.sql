
/****** Object:  StoredProcedure [dbo].[Users_GetUserID]    Script Date: 11/30/2013 12:06:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Users_LoginUser]
	@Username varchar(30),
	@Pass varchar(20)
AS
BEGIN
	SELECT UserID FROM Users
	WHERE Username = @Username
	  AND Pass = @Pass
END