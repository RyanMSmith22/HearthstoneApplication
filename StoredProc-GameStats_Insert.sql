
/****** Object:  StoredProcedure [dbo].[GameStats_Insert]    Script Date: 11/29/2013 12:22:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GameStats_Insert]
	@UserHero Int,
	@OpponentHero Int,
	@Outcome varchar(10),
	@Manaleft Int,
	@Healthleft Int,
	@UserID Int
AS
BEGIN
	INSERT INTO GameStats (UserHero, OpponentHero, Outcome, Manaleft, Healthleft, TS, UserID)
	VALUES (@UserHero, @OpponentHero, @Outcome, @ManaLeft, @Healthleft, GETDATE(), @UserID)
END

/****** Object:  StoredProcedure [dbo].[Hero_GetHeroes]    Script Date: 11/29/2013 12:22:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Hero_GetHeroes]
AS
BEGIN
	SELECT Name, Class, HeroID FROM Hero
END