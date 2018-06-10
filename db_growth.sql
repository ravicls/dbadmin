USE [Dbadmin]
GO

ALTER TABLE [dbo].[db_growth] DROP CONSTRAINT [AddDateDflt]
GO

ALTER TABLE [dbo].[db_growth] DROP CONSTRAINT [DF__db_growth__Inser__5AEE82B9]
GO

/****** Object:  Table [dbo].[db_growth]    Script Date: 6/10/2018 11:25:57 AM ******/
DROP TABLE [dbo].[db_growth]
GO

/****** Object:  Table [dbo].[db_growth]    Script Date: 6/10/2018 11:25:57 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[db_growth](
	[DBName] [sysname] NOT NULL,
	[Month] [int] NULL,
	[BackupSizeinMB] [decimal](18, 0) NULL,
	[CompressedBackupSizeinMB] [decimal](18, 0) NULL,
	[CompressionRatio] [decimal](18, 0) NULL,
	[Insert_date] [datetime] NULL,
	[AddDate] [smalldatetime] NULL
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[db_growth] ADD  DEFAULT (getdate()) FOR [Insert_date]
GO

ALTER TABLE [dbo].[db_growth] ADD  CONSTRAINT [AddDateDflt]  DEFAULT (getdate()) FOR [AddDate]
GO

