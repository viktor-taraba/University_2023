USE [DividendPolicyResearch]
GO

CREATE TABLE [dbo].[tb_FS_income_statement_macrotrends](
	[Revenue]										[varchar](30),
	[Cost Of Goods Sold]							[varchar](30),
	[Gross Profit]									[varchar](30),
	[Research And Development Expenses]				[varchar](30),
	[SG&A Expenses]									[varchar](30),
	[Other Operating Income Or Expenses]			[varchar](30),
	[Operating Expenses]							[varchar](30),
	[Operating Income]								[varchar](30),
	[Total Non-Operating Income/Expense]			[varchar](30),
	[Pre-Tax Income]								[varchar](30),
	[Income Taxes]									[varchar](30),
	[Income After Taxes]							[varchar](30),
	[Other Income]									[varchar](30),
	[Income From Continuous Operations]				[varchar](30),
	[Income From Discontinued Operations]			[varchar](30),
	[Net Income]									[varchar](30),
	[EBITDA]										[varchar](30),
	[EBIT]											[varchar](30),
	[Basic Shares Outstanding]						[varchar](30),
	[Shares Outstanding]							[varchar](30),
	[Basic EPS]										[varchar](30),
	[EPS - Earnings Per Share]						[varchar](30),
	[Year]											[varchar](10),
	ticker_name										[varchar](10),
	[period type]									tinyint,
	date_insert										datetime,
	time_insert										time,
	constraint FK_ticker_name_I foreign key (ticker_name) references dbo.tb_sp100_tickers(ticker)
) 
GO


