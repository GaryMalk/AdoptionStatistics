CREATE TABLE [dbo].[TPR_Adopt](
	[StateId] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[Tpr_LT_1Mo] [float] NOT NULL,
	[Tpr_1_to_5Mo] [float] NOT NULL,
	[Tpr_6_to_11Mo] [float] NOT NULL,
	[Tpr_12_to_17Mo] [float] NOT NULL,
	[Tpr_18_to_23Mo] [float] NOT NULL,
	[Tpr_24_to_29Mo] [float] NOT NULL,
	[Tpr_30_to_35Mo] [float] NOT NULL,
	[Tpr_3_to_4YR] [float] NOT NULL,
	[Tpr_MT_5YR] [float] NOT NULL,
	[Total] [int] NOT NULL,
	[Missing] [int] NOT NULL,
	[Mean] [float] NOT NULL,
	[Meridian] [int] NOT NULL,
 CONSTRAINT [[PK_TPR_Adopt]]] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC,
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TPR_Adopt]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO