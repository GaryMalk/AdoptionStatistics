CREATE TABLE [dbo].[FamilyStructure](
	[StateId] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[Married] [float] NOT NULL,
	[UnMarried] [float] NOT NULL,
	[SingleFemale] [float] NOT NULL,
	[SingleMale] [float] NOT NULL,
	[Total] [int] NOT NULL,
	[Missing] [int] NOT NULL,
 CONSTRAINT [PK_FamilyStructure] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC,
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FamilyStructure]  WITH CHECK ADD  CONSTRAINT [FK_FamilyStructure_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO

ALTER TABLE [dbo].[FamilyStructure] CHECK CONSTRAINT [FK_FamilyStructure_State]
GO


