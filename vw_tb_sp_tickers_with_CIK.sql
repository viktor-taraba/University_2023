create view [dbo].[vw_tb_sp_tickers_with_CIK] as
select tt.*, 
	   t.cik_str,
	   case when wod.ticker is not null then 1 else 0 end as without_dividends
from dbo.tb_sp100_tickers tt
join dbo.tb_CIK_ticker t
	on tt.ticker = t.ticker
left join dbo.vw_stock_wo_dividends as wod
	on wod.ticker = tt.Ticker;