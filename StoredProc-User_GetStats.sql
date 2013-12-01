
/****** Object:  StoredProcedure [dbo].[User_GetStats]    Script Date: 11/29/2013 12:23:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_GetStats]
	@UserID Int,
	@UserHeroID Int
AS
BEGIN
	DECLARE @HeroName varchar(50)
	SET @HeroName = (SELECT Name FROM Hero
		WHERE HeroID = @UserHeroID)

	DECLARE @HeroClass varchar(50)
	SET @HeroClass = (SELECT Class FROM Hero
		WHERE HeroID = @UserHeroID)

	DECLARE @TotalWins Int
	SET @TotalWins = (SELECT COUNT(Outcome) FROM GameStats
	WHERE Outcome = 'Win' AND UserID = @UserID AND UserHero = @UserHeroID)

	SELECT @HeroName As UserHero, @HeroClass As UserHeroClass, @TotalWins AS TotalWins, COUNT(Outcome) AS TotalLoses FROM GameStats
	WHERE Outcome = 'Lose' AND UserID = @UserID AND UserHero = @UserHeroID
END