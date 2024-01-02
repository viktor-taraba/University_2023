use [DividendPolicyResearch]

create table dbo.tb_CIK_ticker(
	ticker			varchar(10) not null,
	title			varchar(300),
	cik_str			integer not null
	constraint PK_Ticker_CIK primary key (Ticker),
);