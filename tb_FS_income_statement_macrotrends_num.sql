use [DividendPolicyResearch]

begin

create table [dbo].[tb_FS_income_statement_macrotrends_num](
	[Revenue]										numeric(18,4),
	[Cost Of Goods Sold]							numeric(18,4),
	[Gross Profit]									numeric(18,4),
	[Research And Development Expenses]				numeric(18,4),
	[SG&A Expenses]									numeric(18,4),
	[Other Operating Income Or Expenses]			numeric(18,4),
	[Operating Expenses]							numeric(18,4),
	[Operating Income]								numeric(18,4),
	[Total Non-Operating Income/Expense]			numeric(18,4),
	[Pre-Tax Income]								numeric(18,4),
	[Income Taxes]									numeric(18,4),
	[Income After Taxes]							numeric(18,4),
	[Other Income]									numeric(18,4),
	[Income From Continuous Operations]				numeric(18,4),
	[Income From Discontinued Operations]			numeric(18,4),
	[Net Income]									numeric(18,4),
	[EBITDA]										numeric(18,4),
	[EBIT]											numeric(18,4),
	[Basic Shares Outstanding]						numeric(18,4),
	[Shares Outstanding]							numeric(18,4),
	[Basic EPS]										numeric(18,4),
	[EPS - Earnings Per Share]						numeric(18,4),
	[Year]											date,
	ticker_name										[varchar](10)
	constraint FK_ticker_name_macrotrends_I foreign key (ticker_name) references [dbo].[tb_sp100_tickers](ticker)
);

insert into [dbo].[tb_FS_income_statement_macrotrends_num]
select distinct 
	   cast(replace(replace(replace([Revenue],char(160),''),'$',''),',','.') as numeric(18,4)) as [Revenue],
	   case when [Cost Of Goods Sold] = '-' then null 
			else cast(replace(replace(replace([Cost Of Goods Sold],char(160),''),'$',''),',','.') as numeric(23,3)) end as [Cost Of Goods Sold],
	   cast(replace(replace(replace([Gross Profit],char(160),''),'$',''),',','.') as numeric(18,4)) as [Gross Profit],
	   case when [Research And Development Expenses] = '-' then null 
			else cast(replace(replace(replace([Research And Development Expenses],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Research And Development Expenses],
	   case when [SG&A Expenses] = '-' then null 
			else cast(replace(replace(replace([SG&A Expenses],char(160),''),'$',''),',','.') as numeric(18,4)) end as [SG&A Expenses],
	   case when [Other Operating Income Or Expenses] = '-' then null 
			else cast(replace(replace(replace([Other Operating Income Or Expenses],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Other Operating Income Or Expenses],
	   case when [Operating Expenses] = '-' then null 
			else cast(replace(replace(replace([Operating Expenses],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Operating Expenses],
	   cast(replace(replace(replace([Operating Income],char(160),''),'$',''),',','.') as numeric(18,4)) as [Operating Income],
	   case when [Total Non-Operating Income/Expense] = '-' then null 
			else cast(replace(replace(replace([Total Non-Operating Income/Expense],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Total Non-Operating Income/Expense],
	   cast(replace(replace(replace([Pre-Tax Income],char(160),''),'$',''),',','.') as numeric(18,4)) as [Pre-Tax Income],
	   cast(replace(replace(replace([Income Taxes],char(160),''),'$',''),',','.') as numeric(18,4)) as [Income Taxes],
	   cast(replace(replace(replace([Income After Taxes],char(160),''),'$',''),',','.') as numeric(18,4)) as [Income After Taxes],
	   case when [Other Income] = '-' then null 
			else cast(replace(replace(replace([Other Income],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Other Income],
	   cast(replace(replace(replace([Income From Continuous Operations],char(160),''),'$',''),',','.') as numeric(18,4)) as [Income From Continuous Operations],
	   case when [Income From Discontinued Operations] = '-' then null 
			else cast(replace(replace(replace([Income From Discontinued Operations],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Income From Discontinued Operations],
	   cast(replace(replace(replace([Net Income],char(160),''),'$',''),',','.') as numeric(18,4)) as [Net Income],
	   case when [EBITDA] = '-' then null 
			else cast(replace(replace(replace([EBITDA],char(160),''),'$',''),',','.') as numeric(18,4)) end as [EBITDA],
	   case when [EBITDA] = '-' then null 
			else cast(replace(replace(replace([EBIT],char(160),''),'$',''),',','.') as numeric(18,4)) end as [EBIT],
	   cast(replace(replace(replace([Basic Shares Outstanding],char(160),''),'$',''),',','.') as integer) as [Basic Shares Outstanding],
	   cast(replace(replace(replace([Shares Outstanding],char(160),''),'$',''),',','.') as integer) as [Shares Outstanding],
	   case when [Basic EPS] = '-' then null else cast(replace(replace(replace([Basic EPS],char(160),''),'$',''),',','.') as numeric(18,4)) end as [Basic EPS],
	   case when [EPS - Earnings Per Share] = '-' then null else cast(replace(replace(replace([EPS - Earnings Per Share],char(160),''),'$',''),',','.') as numeric(18,4)) end as [EPS - Earnings Per Share],
	   cast([Year] as date) as [Year],
       [ticker_name]
FROM [DividendPolicyResearch].[dbo].[tb_FS_income_statement_macrotrends]
order by ticker_name, cast([Year] as date)

end