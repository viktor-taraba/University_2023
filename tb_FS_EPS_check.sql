begin

drop table if exists #FS_EPS_Basic;

create table #FS_EPS_Basic(
	ticker			varchar(10),
	[Year]			integer,
	EPS_Basic		numeric(18,4)
);

drop table if exists #FS_EPS_Diluted;

create table #FS_EPS_Diluted(
	ticker			varchar(10),
	[Year]			integer,
	EPS_Diluted		numeric(18,4)
);

drop table if exists [dbo].[tb_FS_EPS_check];

create table [dbo].[tb_FS_EPS_check](
	[Year]						integer,
	ticker_name					varchar(10),
	date_end					date,
	[Basic EPS]					numeric(18,4),
	EPS_Basic					numeric(18,4),
	Diff_EPS					numeric(18,4),
	[EPS - Earnings Per Share]	numeric(18,4),
	EPS_Diluted					numeric(18,4),
	Diff_EPS_Diluted			numeric(18,4)
);

insert into #FS_EPS_Basic
select ticker_name as ticker,
	   2023 as [Year],
	   [2023] as EPS_Basic
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Basic)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2022 as [Year],
	   [2022] as EPS_Basic
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Basic)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2021 as [Year],
	   [2021] as EPS_Basic
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Basic)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2020 as [Year],
	   [2020] as EPS_Basic
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Basic)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2019 as [Year],
	   [2019] as EPS_Basic
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Basic)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2018 as [Year],
	   [2018] as EPS_Basic
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Basic)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2017 as [Year],
	   [2017] as EPS_Basic
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Basic)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2016 as [Year],
	   [2016] as EPS_Basic
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Basic)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2015 as [Year],
	   [2015] as EPS_Basic
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Basic)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2014 as [Year],
	   [2014] as EPS_Basic
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Basic)';
--and ticker_name = 'AAPL';

insert into #FS_EPS_Diluted
select ticker_name as ticker,
	   2023 as [Year],
	   [2023] as EPS_Diluted
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Diluted)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2022 as [Year],
	   [2022] as EPS_Diluted
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Diluted)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2021 as [Year],
	   [2021] as EPS_Diluted
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Diluted)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2020 as [Year],
	   [2020] as EPS_Diluted
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Diluted)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2019 as [Year],
	   [2019] as EPS_Diluted
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Diluted)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2018 as [Year],
	   [2018] as EPS_Diluted
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Diluted)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2017 as [Year],
	   [2017] as EPS_Diluted
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Diluted)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2016 as [Year],
	   [2016] as EPS_Diluted
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Diluted)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2015 as [Year],
	   [2015] as EPS_Diluted
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Diluted)'
--and ticker_name = 'AAPL'
union all
select ticker_name as ticker,
	   2014 as [Year],
	   [2014] as EPS_Diluted
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis_num]
where FS_type = 'PL'
and FSLI = 'EPS (Diluted)';

insert into [dbo].[tb_FS_EPS_check]
select d.[Year],
	   n.ticker_name,
	   n.[Year] as date_end,
	   n.[Basic EPS],
	   eps.EPS_Basic,
	   eps.EPS_Basic - n.[Basic EPS] as Diff_EPS,
	   n.[EPS - Earnings Per Share],
	   eps2.EPS_Diluted,
	   eps2.EPS_Diluted - n.[EPS - Earnings Per Share] as Diff_EPS_Diluted
from [dbo].[tb_FS_income_statement_macrotrends_num] n
join [dbo].[tb_FS_fiscal_year_dates] d
	on d.date_end = n.[Year]
	and n.ticker_name = d.ticker
left join #FS_EPS_Basic eps 
	on eps.ticker = n.ticker_name 
	and eps.[Year] = d.[Year]
left join #FS_EPS_Diluted eps2
	on eps2.ticker = n.ticker_name 
	and eps2.[Year] = d.[Year]
order by n.ticker_name, d.[Year] desc

select * from [dbo].[tb_FS_EPS_check]

end