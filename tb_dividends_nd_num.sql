begin

create table [DividendPolicyResearch].[dbo].[tb_dividends_nd_num](
	exOrEffDate_ date,
	[type] varchar(30),
	amount float,
	declarationDate date,
	recordDate date,
	paymentDate date,
	currency varchar(5),
	ticker_name varchar(5)
)

insert into [DividendPolicyResearch].[dbo].[tb_dividends_nd_num]
select	case when [exOrEffDate] = 'N/A' 
			 then null 
			 else cast([exOrEffDate] as date)
		end as exOrEffDate_,
		[type],
		cast(replace([amount],'$','') as float) as amount,
		case when declarationDate = 'N/A' 
			 then null 
			 else cast(declarationDate as date)
		end as declarationDate_,
		case when recordDate = 'N/A' 
			 then null 
			 else cast(recordDate as date)
		end as recordDate_,
		case when paymentDate = 'N/A' 
			 then null 
			 else cast(paymentDate as date)
		end as paymentDate_,
		[currency],
		[ticker_name]
from [DividendPolicyResearch].[dbo].[tb_dividends_nd] as d
where d.type = 'Cash'
and (case when [exOrEffDate] = 'N/A' 
		  then null  else cast([exOrEffDate] as date) end) >= '2013-01-01'

end