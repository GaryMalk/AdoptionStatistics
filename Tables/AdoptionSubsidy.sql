CREATE TABLE [dbo].[AdoptionSubsidy](
	[StateId] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[Yes] [float] NOT NULL,
	[No] [float] NOT NULL,
	[Total] [int] NOT NULL,
	[Missing] [int] NOT NULL,
 CONSTRAINT [PK_AdoptionSubsidy] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC,
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[AdoptionSubsidy]  WITH CHECK ADD  CONSTRAINT [FK_AdoptionSubsidy_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO

ALTER TABLE [dbo].[AdoptionSubsidy] CHECK CONSTRAINT [FK_AdoptionSubsidy_State]
GO


