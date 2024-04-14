use [DividendPolicyResearch]

begin

drop table if exists [dbo].[tb_FS_fiscal_year_dates];

create table [dbo].[tb_FS_fiscal_year_dates](
	[Year]			integer,
	ticker			varchar(10),
	date_end		date,
	date_start		date
);

drop table if exists #FS_dates;

create table #FS_dates(
	ticker			varchar(10),
	last_date		date
);

drop table if exists #FS_dividends;

create table #FS_dividends(
	ticker			varchar(10),
	[Year]			integer,
	Dividends		numeric(18,4)
);

drop table if exists #YF_dividends;

create table #YF_dividends(
	ticker			varchar(10),
	[Year]			integer,
	Dividends		numeric(18,4)
);

drop table if exists [dbo].[tb_FS_Dividends_check];

create table [dbo].[tb_FS_Dividends_check](
	ticker			varchar(10),
	[Year]			integer,
	yf_Dividends	numeric(18,4),
	fs_Dividends	numeric(18,4),
	Diff			numeric(18,4)
);

insert into #FS_dates(ticker, last_date)
select ticker_name, 
	   max([Year])
from [dbo].[tb_FS_income_statement_macrotrends_num]
group by ticker_name;

insert into [dbo].[tb_FS_fiscal_year_dates]
select 2023 as [Year],
	   ticker, 
	   last_date as date_end,
	   dateadd(year, -1, last_date) as date_start
from #FS_dates
union all
select 2022 as [Year],
	   ticker, 
	   dateadd(year, -1, last_date) as date_end,
	   dateadd(year, -2, last_date) as date_start
from #FS_dates
union all
select 2021 as [Year],
	   ticker, 
	   dateadd(year, -2, last_date) as date_end,
	   dateadd(year, -3, last_date) as date_start
from #FS_dates
union all
select 2020 as [Year],
	   ticker, 
	   dateadd(year, -3, last_date) as date_end,
	   dateadd(year, -4, last_date) as date_start
from #FS_dates
union all
select 2019 as [Year],
	   ticker, 
	   dateadd(year, -4, last_date) as date_end,
	   dateadd(year, -5, last_date) as date_start
from #FS_dates
union all
select 2018 as [Year],
	   ticker, 
	   dateadd(year, -5, last_date) as date_end,
	   dateadd(year, -6, last_date) as date_start
from #FS_dates
union all
select 2017 as [Year],
	   ticker, 
	   dateadd(year, -6, last_date) as date_end,
	   dateadd(year, -7, last_date) as date_start
from #FS_dates
union all
select 2016 as [Year],
	   ticker, 
	   dateadd(year, -7, last_date) as date_end,
	   dateadd(year, -8, last_date) as date_start
from #FS_dates
union all
select 2015 as [Year],
	   ticker, 
	   dateadd(year, -8, last_date) as date_end,
	   dateadd(year, -9, last_date) as date_start
from #FS_dates
union all
select 2014 as [Year],
	   ticker, 
	   dateadd(year, -9, last_date) as date_end,
	   dateadd(year, -10, last_date) as date_start
from #FS_dates;

drop table #FS_dates;

insert into #YF_dividends
select ticker,
	   [Year],
	   cast(sum([dividends]) as numeric(18,4)) as Dividends
from (
select d.[date],
       d.[dividends],
       d.[ticker],
	   fy.date_start,
	   fy.date_end,
	   fy.[Year]
from [dbo].[vw_tb_dividends] d
join [dbo].[tb_FS_fiscal_year_dates] fy
	on d.[date] > fy.date_start 
	and d.[date] <= fy.date_end
	and d.ticker = fy.ticker
) as a 
group by ticker,[Year]

insert into #FS_dividends
select ticker_name as ticker,
	   2023 as [Year],
	   [2023] as Dividends
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'Dividend Per Share'
union all
select ticker_name as ticker,
	   2022 as [Year],
	   [2022] as Dividends
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'Dividend Per Share'
union all
select ticker_name as ticker,
	   2021 as [Year],
	   [2021] as Dividends
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'Dividend Per Share'
union all
select ticker_name as ticker,
	   2020 as [Year],
	   [2020] as Dividends
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'Dividend Per Share'
union all
select ticker_name as ticker,
	   2019 as [Year],
	   [2019] as Dividends
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'Dividend Per Share'
union all
select ticker_name as ticker,
	   2018 as [Year],
	   [2018] as Dividends
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'Dividend Per Share'
union all
select ticker_name as ticker,
	   2017 as [Year],
	   [2017] as Dividends
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'Dividend Per Share'
union all
select ticker_name as ticker,
	   2016 as [Year],
	   [2016] as Dividends
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'Dividend Per Share'
union all
select ticker_name as ticker,
	   2015 as [Year],
	   [2015] as Dividends
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'Dividend Per Share'
union all
select ticker_name as ticker,
	   2014 as [Year],
	   [2014] as Dividends
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'Dividend Per Share';

insert into [dbo].[tb_FS_Dividends_check]
select d.ticker,
	   d.[Year],
	   round(d.Dividends,2) as yf_Dividends,
	   fs.Dividends as fs_Dividends,
	   fs.Dividends - round(d.Dividends,2) as Diff
from #YF_dividends d 
left join #FS_dividends as fs
	on fs.[Year] = d.[Year]
	and fs.ticker = d.ticker
order by d.ticker, d.[Year] desc

select * from [dbo].[tb_FS_Dividends_check]

end