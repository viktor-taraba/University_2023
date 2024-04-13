USE [DividendPolicyResearch]

CREATE TABLE [dbo].[tb_FS_stock_analysis](
	FSLI				[varchar](30),   
	[2023]				[varchar](30),
	[2022]				[varchar](30),
	[2021]				[varchar](30),
	[2020]				[varchar](30),
	[2019]				[varchar](30),
	[2018]				[varchar](30),
	[2017]				[varchar](30),
	[2016]				[varchar](30),
	[2015]				[varchar](30),
	[2014]				[varchar](30),
	ticker_name			[varchar](10),
	FS_type				varchar(20)
	constraint FK_ticker_name_SA foreign key (ticker_name) references dbo.tb_sp100_tickers(ticker)
)