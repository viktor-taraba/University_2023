select  ticker, 
		Year, 
		case when ticker = 'TGT' and Year = 2022 then yf_Dividends
			 when ticker = 'COF' and Year = 2021 then yf_Dividends
			 when ticker = 'LIN' then yf_Dividends
			 when ticker = 'MA' and Year = 2021 then dividend_nd 
			 when ticker = 'SPG' and Year = 2014 then dividend_nd
			 when ticker = 'DHR' and Year = 2015 then dividend_nd
			 else fs_dividends
		end as amount, 
		'DPS' as type
from [DividendPolicyResearch].[dbo].[tb_FS_Dividends_check]
union all 
select  ticker_name as ticker, 
		Year, 
		case when ticker_name = 'V' then [EPS_Basic]
			else [Basic EPS] 
		end as amount, 
		'EPS' as type
from [DividendPolicyResearch].[dbo].[tb_FS_EPS_check]