
/****** Object:  StoredProcedure [dbo].[Hero_GetOppSpecificStats]    Script Date: 11/29/2013 12:23:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Hero_GetOppSpecificStats]
	@UserHeroID int,
	@OppHeroID int,
	@UserID int
AS
BEGIN

	DECLARE @OppHeroName varchar(50)
	SET @OppHeroName = (SELECT Name FROM Hero
		WHERE HeroID = @OppHeroID)

	DECLARE @OppHeroClass varchar(50)
	SET @OppHeroClass = (SELECT Class FROM Hero
		WHERE HeroID = @OppHeroID)

	DECLARE @TotalWins Int
	SET @TotalWins = (SELECT COUNT(Outcome) FROM GameStats
	WHERE Outcome = 'Win' AND UserID = @UserID AND UserHero = @UserHeroID AND OpponentHero = @OppHeroID)

	SELECT @OppHeroName As OppHero, @OppHeroClass As OppHeroClass, @TotalWins AS TotalWins, COUNT(Outcome) AS TotalLoses FROM GameStats
	WHERE Outcome = 'Lose' AND UserID = @UserID AND UserHero = @UserHeroID AND OpponentHero = @OppHeroID
END