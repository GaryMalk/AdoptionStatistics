CREATE TABLE [dbo].[Race](
	[StateId] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[NativeAmerican] [float] NOT NULL,
	[Asian] [float] NOT NULL,
	[Black] [float] NOT NULL,
	[PacificIslander] [float] NOT NULL,
	[Hispanic] [float] NOT NULL,
	[White] [float] NOT NULL,
	[Unknown] [float] NOT NULL,
	[Multiracial] [float] NOT NULL,
	[Total] [int] NOT NULL,
	[Missing] [int] NOT NULL,
 CONSTRAINT [PK_Race] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC,
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Race]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO