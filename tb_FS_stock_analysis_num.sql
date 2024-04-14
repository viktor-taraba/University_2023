use [DividendPolicyResearch]

begin

create table [dbo].[tb_FS_stock_analysis_num](
	   [FSLI]			[varchar](30),	
       [2023]			numeric(18,2),
       [2022]			numeric(18,2),
       [2021]			numeric(18,2),
       [2020]			numeric(18,2),
       [2019]			numeric(18,2),
       [2018]			numeric(18,2),
       [2017]			numeric(18,2),
       [2016]			numeric(18,2),	
       [2015]			numeric(18,2),
       [2014]			numeric(18,2),
       [ticker_name]	[varchar](10),
       [FS_type]		varchar(20)
	   constraint FK_ticker_name_SA_num foreign key (ticker_name) references dbo.tb_sp100_tickers(ticker)
);

insert into [dbo].[tb_FS_stock_analysis_num]
select
	   [FSLI],
	   case when [2023] = '-' then null
		    when [2023] like '%[%]%' then cast(replace([2023],'%','') as numeric(18,2))/100
			else cast([2023] as numeric(18,2)) end as [2023],
       case when [2022] = '-' then null
		    when [2022] like '%[%]%' then cast(replace([2022],'%','') as numeric(18,2))/100
			else cast([2022] as numeric(18,2)) end as [2022],
	   case when [2021] = '-' then null
		    when [2021] like '%[%]%' then cast(replace([2021],'%','') as numeric(18,2))/100
			else cast([2021] as numeric(18,2)) end as [2021],
	   case when [2020] = '-' then null
		    when [2020] like '%[%]%' then cast(replace([2020],'%','') as numeric(18,2))/100
			else cast([2020] as numeric(18,2)) end as [2020],
	   case when [2019] = '-' then null
		    when [2019] like '%[%]%' then cast(replace([2019],'%','') as numeric(18,2))/100
			else cast([2019] as numeric(18,2)) end as [2019],
	   case when [2018] = '-' then null
		    when [2018] like '%[%]%' then cast(replace([2018],'%','') as numeric(18,2))/100
			else cast([2018] as numeric(18,2)) end as [2018],
	   case when [2017] = '-' then null
		    when [2017] like '%[%]%' then cast(replace([2017],'%','') as numeric(18,2))/100
			else cast([2017] as numeric(18,2)) end as [2017],
	   case when [2016] = '-' then null
		    when [2016] like '%[%]%' then cast(replace([2016],'%','') as numeric(18,2))/100
			else cast([2016] as numeric(18,2)) end as [2016],
	   case when [2015] = '-' then null
		    when [2015] like '%[%]%' then cast(replace([2015],'%','') as numeric(18,2))/100
			else cast([2015] as numeric(18,2)) end as [2015],
	   case when [2014] = '-' then null
		    when [2014] like '%[%]%' then cast(replace([2014],'%','') as numeric(18,2))/100
			else cast([2014] as numeric(18,2)) end as [2014],
       [ticker_name],
       [FS_type]
from [DividendPolicyResearch].[dbo].[tb_FS_stock_analysis]

end