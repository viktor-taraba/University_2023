create view [dbo].[vw_tb_sp_tickers_with_CIK] as
select tt.*, 
	   t.cik_str 
from dbo.tb_sp100_tickers tt
join dbo.tb_CIK_ticker t
	on tt.ticker = t.ticker;