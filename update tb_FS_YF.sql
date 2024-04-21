alter table [DividendPolicyResearch].[dbo].[tb_FS_YF] 
add Year date;

update [DividendPolicyResearch].[dbo].[tb_FS_YF] 
set [Year] = cast([Date] as date)
from [DividendPolicyResearch].[dbo].[tb_FS_YF];