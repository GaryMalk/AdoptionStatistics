CREATE TABLE [dbo].[FinalAge](
	[StateId] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[Age_LT_1_YR] [float] NOT NULL,
	[Age_1_YR] [float] NOT NULL,
	[Age_2_YR] [float] NOT NULL,
	[Age_3_YR] [float] NOT NULL,
	[Age_4_YR] [float] NOT NULL,
	[Age_5_YR] [float] NOT NULL,
	[Age_6_YR] [float] NOT NULL,
	[Age_7_YR] [float] NOT NULL,
	[Age_8_YR] [float] NOT NULL,
	[Age_0_TO_8_YR] [float] NOT NULL,
	[Age_9_YR] [float] NOT NULL,
	[Age_10_YR] [float] NOT NULL,
	[Age_11_YR] [float] NOT NULL,
	[Age_12_YR] [float] NOT NULL,
	[Age_13_YR] [float] NOT NULL,
	[Age_14_YR] [float] NOT NULL,
	[Age_15_YR] [float] NOT NULL,
	[Age_16_YR] [float] NOT NULL,
	[Age_17_YR] [float] NOT NULL,
	[Age_18_YR] [float] NOT NULL,
	[Age_19_YR] [float] NOT NULL,
	[Age_20_YR] [float] NOT NULL,
	[Total] [int] NOT NULL,
	[Missing] [int] NOT NULL,
	[Mean] [float] NOT NULL,
	[Meridian] [float] NOT NULL,
 CONSTRAINT [PK_FinalAge] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC,
	[Year] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FinalAge]  WITH CHECK ADD  CONSTRAINT [FK_FinalAge_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO

ALTER TABLE [dbo].[FinalAge] CHECK CONSTRAINT [FK_FinalAge_State]
GO