CREATE TABLE [dbo].[PriorRelationship](
	[StateId] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[NonRelative] [float] NOT NULL,
	[FosterParent] [float] NOT NULL,
	[StepParent] [float] NOT NULL,
	[OtherRelative] [float] NOT NULL,
	[Total] [int] NOT NULL,
	[Missing] [int] NOT NULL,
 CONSTRAINT [PK_PriorRelationship] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC,
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PriorRelationship]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO


