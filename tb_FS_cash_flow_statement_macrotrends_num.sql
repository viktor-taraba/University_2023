use [DividendPolicyResearch]

begin

create table [dbo].[tb_FS_cash_flow_statement_macrotrends_num](
	[Net Income/Loss]									numeric(18,4),
	[Total Depreciation And Amortization - Cash Flow]	numeric(18,4),
	[Other Non-Cash Items]								numeric(18,4),
	[Total Non-Cash Items]								numeric(18,4),
	[Change In Accounts Receivable]						numeric(18,4),
	[Change In Inventories]								numeric(18,4),
	[Change In Accounts Payable]						numeric(18,4),
	[Change In Assets/Liabilities]						numeric(18,4),
	[Total Change In Assets/Liabilities]				numeric(18,4),
	[Cash Flow From Operating Activities]				numeric(18,4),
	[Net Change In Property, Plant, And Equipment]		numeric(18,4),
	[Net Change In Intangible Assets]					numeric(18,4),
	[Net Acquisitions/Divestitures]						numeric(18,4),
	[Net Change In Short-term Investments]				numeric(18,4),
	[Net Change In Long-Term Investments]				numeric(18,4),
	[Net Change In Investments - Total]					numeric(18,4),
	[Investing Activities - Other]						numeric(18,4),
	[Cash Flow From Investing Activities]				numeric(18,4),
	[Net Long-Term Debt]								numeric(18,4),
	[Net Current Debt]									numeric(18,4),
	[Debt Issuance/Retirement Net - Total]				numeric(18,4),
	[Net Common Equity Issued/Repurchased]				numeric(18,4),
	[Net Total Equity Issued/Repurchased]				numeric(18,4),
	[Total Common And Preferred Stock Dividends Paid]	numeric(18,4),
	[Financial Activities - Other]						numeric(18,4),
	[Cash Flow From Financial Activities]				numeric(18,4),
	[Net Cash Flow]										numeric(18,4),
	[Stock-Based Compensation]							numeric(18,4),
	[Common Stock Dividends Paid]						numeric(18,4),
	[Year]												date,
	ticker_name											[varchar](10),
	constraint FK_ticker_name_macrotrends_CF foreign key (ticker_name) references [dbo].[tb_sp100_tickers](ticker)
);

insert into [dbo].[tb_FS_cash_flow_statement_macrotrends_num]
select distinct 
	cast(replace(replace(replace([Net Income/Loss],char(160),''),'$',''),',','.') as numeric(18,4)) as [Net Income/Loss],
	cast(replace(replace(replace([Total Depreciation And Amortization - Cash Flow],char(160),''),'$',''),',','.') as numeric(18,4)) as [Total Depreciation And Amortization - Cash Flow],
	case when [Other Non-Cash Items] = '-' then null 
		 else cast(replace(replace(replace([Other Non-Cash Items],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Other Non-Cash Items],
	cast(replace(replace(replace([Total Non-Cash Items],char(160),''),'$',''),',','.') as numeric(18,4)) as [Total Non-Cash Items],
	case when [Change In Accounts Receivable] = '-' then null 
		 else cast(replace(replace(replace([Change In Accounts Receivable],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Change In Accounts Receivable],
	case when [Change In Inventories] = '-' then null 
		 else cast(replace(replace(replace([Change In Inventories],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Change In Inventories],
	case when [Change In Accounts Payable] = '-' then null 
		 else cast(replace(replace(replace([Change In Accounts Payable],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Change In Accounts Payable],
	case when [Change In Assets/Liabilities] = '-' then null 
		 else cast(replace(replace(replace([Change In Assets/Liabilities],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Change In Assets/Liabilities],
	cast(replace(replace(replace([Total Change In Assets/Liabilities],char(160),''),'$',''),',','.') as numeric(18,4)) as [Total Change In Assets/Liabilities],
	cast(replace(replace(replace([Cash Flow From Operating Activities],char(160),''),'$',''),',','.') as numeric(18,4)) as [Cash Flow From Operating Activities],
	case when [Net Change In Property, Plant, And Equipment] = '-' then null 
		 else cast(replace(replace(replace([Net Change In Property, Plant, And Equipment],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Net Change In Property, Plant, And Equipment],
	case when [Net Change In Intangible Assets] = '-' then null 
		 else cast(replace(replace(replace([Net Change In Intangible Assets],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Net Change In Intangible Assets],
	case when [Net Acquisitions/Divestitures] = '-' then null 
		 else cast(replace(replace(replace([Net Acquisitions/Divestitures],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Net Acquisitions/Divestitures],
	case when [Net Change In Short-term Investments] = '-' then null 
		 else cast(replace(replace(replace([Net Change In Short-term Investments],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Net Change In Short-term Investments],
	case when [Net Change In Long-Term Investments] = '-' then null 
		 else cast(replace(replace(replace([Net Change In Long-Term Investments],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Net Change In Long-Term Investments],
	case when [Net Change In Investments - Total] = '-' then null 
		 else cast(replace(replace(replace([Net Change In Investments - Total],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Net Change In Investments - Total],
	case when [Investing Activities - Other] = '-' then null 
		 else cast(replace(replace(replace([Investing Activities - Other],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Investing Activities - Other],
	cast(replace(replace(replace([Cash Flow From Investing Activities],char(160),''),'$',''),',','.') as numeric(18,4)) as [Cash Flow From Investing Activities],
	case when [Net Long-Term Debt] = '-' then null 
		 else cast(replace(replace(replace([Net Long-Term Debt],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Net Long-Term Debt],
	case when [Net Current Debt] = '-' then null 
		 else cast(replace(replace(replace([Net Current Debt],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Net Current Debt],
	case when [Debt Issuance/Retirement Net - Total] = '-' then null 
		 else cast(replace(replace(replace([Debt Issuance/Retirement Net - Total],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Debt Issuance/Retirement Net - Total],
	case when [Net Common Equity Issued/Repurchased] = '-' then null 
		 else cast(replace(replace(replace([Net Common Equity Issued/Repurchased],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Net Common Equity Issued/Repurchased],
	case when [Net Total Equity Issued/Repurchased] = '-' then null 
		 else cast(replace(replace(replace([Net Total Equity Issued/Repurchased],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Net Total Equity Issued/Repurchased],
	case when [Total Common And Preferred Stock Dividends Paid] = '-' then null 
		 else cast(replace(replace(replace([Total Common And Preferred Stock Dividends Paid],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Total Common And Preferred Stock Dividends Paid],
	case when [Financial Activities - Other] = '-' then null 
		 else cast(replace(replace(replace([Financial Activities - Other],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Financial Activities - Other],
	case when [Cash Flow From Financial Activities] = '-' then null 
		 else cast(replace(replace(replace([Cash Flow From Financial Activities],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Cash Flow From Financial Activities],
	case when [Net Cash Flow] = '-' then null 
		 else cast(replace(replace(replace([Net Cash Flow],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Net Cash Flow],
	case when [Stock-Based Compensation] = '-' then null 
		 else cast(replace(replace(replace([Stock-Based Compensation],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Stock-Based Compensation],
	case when [Common Stock Dividends Paid] = '-' then null 
		 else cast(replace(replace(replace([Common Stock Dividends Paid],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Common Stock Dividends Paid],
	cast([Year] as date) as [Year],
	ticker_name
from [dbo].[tb_FS_cash_flow_statement_macrotrends]

end