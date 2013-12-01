
/****** Object:  Table [dbo].[Users]    Script Date: 10/30/2013 10:25:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NOT NULL,
	[Pass] [varchar](20) NULL,
	[TS] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Hero]    Script Date: 10/30/2013 10:25:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Hero](
	[HeroId] [int] NOT NULL,
	[Name] [varchar](40) NULL,
	[Class] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[HeroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[GameStats]    Script Date: 10/30/2013 10:25:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[GameStats](
	[GameStatsId] [int] IDENTITY(1,1) NOT NULL,
	[UserHero] [int] NULL,
	[OpponentHero] [int] NULL,
	[Outcome] [varchar](10) NULL,
	[Manaleft] [int] NULL,
	[Healthleft] [int] NULL,
	[TS] [date] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[GameStatsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[GameStats]  WITH CHECK ADD FOREIGN KEY([OpponentHero])
REFERENCES [dbo].[Hero] ([HeroId])
GO

ALTER TABLE [dbo].[GameStats]  WITH CHECK ADD FOREIGN KEY([UserHero])
REFERENCES [dbo].[Hero] ([HeroId])
GO

ALTER TABLE [dbo].[GameStats]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserId])
GO



