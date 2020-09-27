CREATE TABLE [dbo].[SpecialNeeds](
	[StateId] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[Yes] [float] NOT NULL,
	[No] [float] NOT NULL,
	[Total] [int] NOT NULL,
	[Missing] [int] NOT NULL,
 CONSTRAINT [PK_SpecialNeeds] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC,
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SpecialNeeds]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO