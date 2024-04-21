alter table [DividendPolicyResearch].[dbo].[tb_FS_EPS_check]
add EPS_YF_basic numeric(18,2), 
	EPS_YF_diluted numeric(18,2), 
	YF_basic_Diff numeric(18,2), 
	YF_diluted_Diff numeric(18,2);

update [DividendPolicyResearch].[dbo].[tb_FS_EPS_check]
set EPS_YF_basic = yf.[Basic EPS],
	EPS_YF_diluted = yf.[Diluted EPS]
from [DividendPolicyResearch].[dbo].[tb_FS_EPS_check] as eps
left join [DividendPolicyResearch].[dbo].[tb_FS_YF] as yf
	on eps.[date_end] = yf.[Year]
	and yf.ticker_name = eps.ticker_name;

update [DividendPolicyResearch].[dbo].[tb_FS_EPS_check]
set YF_basic_Diff = EPS_YF_basic - EPS_Basic,
	YF_diluted_Diff = EPS_YF_diluted - EPS_Diluted
from [DividendPolicyResearch].[dbo].[tb_FS_EPS_check] as eps;

select *
from [DividendPolicyResearch].[dbo].[tb_FS_EPS_check]
where abs(YF_diluted_Diff) > 0
order by abs(YF_diluted_Diff) desc