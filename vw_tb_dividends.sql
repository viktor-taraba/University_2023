create view [dbo].[vw_tb_dividends] as
select year([date]) as year_
	  ,month([date]) as month_
	  ,[date]
      ,[dividends]
      ,[ticker]
  from [DividendPolicyResearch].[dbo].[tb_dividends]
  where year([date]) >= 2013
		and date_insert = '2024-01-02';
