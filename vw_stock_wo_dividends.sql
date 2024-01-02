create view dbo.vw_stock_wo_dividends as
select t.Ticker
from [dbo].[tb_sp100_tickers] t
left join [dbo].[vw_tb_dividends] d
	on d.ticker = t.Ticker
where d.ticker is null;