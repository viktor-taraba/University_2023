USE [DividendPolicyResearch]
GO

CREATE TABLE [dbo].[tb_FS_cash_flow_statement_macrotrends](
	[Net Income/Loss]									[varchar](30),
	[Total Depreciation And Amortization - Cash Flow]	[varchar](30),
	[Other Non-Cash Items]								[varchar](30),
	[Total Non-Cash Items]								[varchar](30),
	[Change In Accounts Receivable]						[varchar](30),
	[Change In Inventories]								[varchar](30),
	[Change In Accounts Payable]						[varchar](30),
	[Change In Assets/Liabilities]						[varchar](30),
	[Total Change In Assets/Liabilities]				[varchar](30),
	[Cash Flow From Operating Activities]				[varchar](30),
	[Net Change In Property, Plant, And Equipment]		[varchar](30),
	[Net Change In Intangible Assets]					[varchar](30),
	[Net Acquisitions/Divestitures]						[varchar](30),
	[Net Change In Short-term Investments]				[varchar](30),
	[Net Change In Long-Term Investments]				[varchar](30),
	[Net Change In Investments - Total]					[varchar](30),
	[Investing Activities - Other]						[varchar](30),
	[Cash Flow From Investing Activities]				[varchar](30),
	[Net Long-Term Debt]								[varchar](30),
	[Net Current Debt]									[varchar](30),
	[Debt Issuance/Retirement Net - Total]				[varchar](30),
	[Net Common Equity Issued/Repurchased]				[varchar](30),
	[Net Total Equity Issued/Repurchased]				[varchar](30),
	[Total Common And Preferred Stock Dividends Paid]	[varchar](30),
	[Financial Activities - Other]						[varchar](30),
	[Cash Flow From Financial Activities]				[varchar](30),
	[Net Cash Flow]										[varchar](30),
	[Stock-Based Compensation]							[varchar](30),
	[Common Stock Dividends Paid]						[varchar](30),
	[Year]												[varchar](10),
	ticker_name											[varchar](10),
	[period type]										tinyint,
	date_insert											datetime,
	time_insert											time,
	constraint FK_ticker_name_CF foreign key (ticker_name) references dbo.tb_sp100_tickers(ticker)
) 
GO


