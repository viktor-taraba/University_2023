begin

create table [DividendPolicyResearch].[dbo].[tb_sp100_split_coefficients](
	[Date] [date],
	lag_date date,
	[ticker] [varchar](5),
	[Stock Splits] float,
	split_coefficient float
)

-- https://stackoverflow.com/questions/5416169/multiplication-aggregate-operator-in-sql
insert into [DividendPolicyResearch].[dbo].[tb_sp100_split_coefficients](date, lag_date, [Stock Splits], ticker, split_coefficient)
select 
	  date,
	  isnull(lag(date) over(partition by [ticker] order by date asc),'1900-01-01') as lag_date,
	  [Stock Splits],
      [ticker],
	  split_coefficient
from (
SELECT date,
	  [Stock Splits],
      [ticker]
	  ,EXP(SUM(LOG([Stock Splits])) over(partition by [ticker] order by date desc)) as split_coefficient
  FROM [DividendPolicyResearch].[dbo].[tb_sp100_splits]
  where date >= '2013-01-01' and Morningstar_check is null
) as a
order by ticker, date desc

end