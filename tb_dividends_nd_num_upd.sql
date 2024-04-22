begin

create table [DividendPolicyResearch].[dbo].[tb_dividends_nd_num_upd](
	exOrEffDate_ date,	
	type varchar(10),
	amount float,
	declarationDate	date,
	recordDate date,
	paymentDate	date,
	currency varchar(3),
	ticker_name	varchar(5),
	Year int,	
	split_coefficient float,	
	dividend_updated float
);

insert into [DividendPolicyResearch].[dbo].[tb_dividends_nd_num_upd]
select d.*,
	   fy.Year,
	   isnull(s.split_coefficient,1) as split_coefficient,
	   d.amount / isnull(s.split_coefficient,1) as dividend_updated
from [DividendPolicyResearch].[dbo].[tb_dividends_nd_num]  as d
left join [DividendPolicyResearch].[dbo].[tb_FS_fiscal_year_dates] as fy
	on fy.ticker = d.ticker_name
	and d.exOrEffDate_ > fy.date_start
	and d.exOrEffDate_ <= fy.date_end
left join [DividendPolicyResearch].[dbo].[tb_sp100_split_coefficients] as s
	on s.ticker = d.ticker_name
	and d.exOrEffDate_ >= s.lag_date
	and d.exOrEffDate_ <= s.Date
where fy.Year is not  null

end