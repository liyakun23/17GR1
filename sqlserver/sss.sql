USE [master]
GO
/****** Object:  User [##MS_PolicyEventProcessingLogin##]    Script Date: 2017/12/15 11:50:12 ******/
CREATE USER [##MS_PolicyEventProcessingLogin##] FOR LOGIN [##MS_PolicyEventProcessingLogin##] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [##MS_AgentSigningCertificate##]    Script Date: 2017/12/15 11:50:12 ******/
CREATE USER [##MS_AgentSigningCertificate##] FOR LOGIN [##MS_AgentSigningCertificate##]
GO
/****** Object:  Table [dbo].[course]    Script Date: 2017/12/15 11:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[cname] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[score]    Script Date: 2017/12/15 11:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[score](
	[scid] [int] IDENTITY(1,1) NOT NULL,
	[sid] [int] NOT NULL,
	[cid] [int] NOT NULL,
	[score] [decimal](5, 1) NULL,
PRIMARY KEY CLUSTERED 
(
	[scid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[student]    Script Date: 2017/12/15 11:50:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[sid] [int] IDENTITY(1,1) NOT NULL,
	[sname] [nvarchar](20) NOT NULL,
	[sex] [nvarchar](1) NOT NULL DEFAULT ('男'),
	[class] [nvarchar](10) NULL,
	[city] [nvarchar](20) NULL,
	[birth] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[score]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[course] ([cid])
GO
ALTER TABLE [dbo].[score]  WITH CHECK ADD FOREIGN KEY([sid])
REFERENCES [dbo].[student] ([sid])
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD CHECK  ((len([sname])>(1)))
GO
