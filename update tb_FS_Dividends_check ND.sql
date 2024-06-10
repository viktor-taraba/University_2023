begin

alter table [DividendPolicyResearch].[dbo].[tb_FS_Dividends_check]
add dividend_nd float,
	nd_Diff float;

update [DividendPolicyResearch].[dbo].[tb_FS_Dividends_check]
set dividend_nd = nd.dividend_nd,
	nd_Diff = d.[fs_Dividends] - nd.dividend_nd
FROM [DividendPolicyResearch].[dbo].[tb_FS_Dividends_check] as d
left join (
select ticker_name, 
	   year, 
	   sum(dividend_updated) as dividend_nd 
from [DividendPolicyResearch].[dbo].[tb_dividends_nd_num_upd]
where ticker_name in (select distinct ticker 
					  from [DividendPolicyResearch].[dbo].[tb_FS_Dividends_check]
					  where abs(Diff) > 0)
group by ticker_name, year
) as nd
	on d.Year = nd.Year
	and d.[ticker] = nd.ticker_name
	and abs(d.Diff) > 0;

end
