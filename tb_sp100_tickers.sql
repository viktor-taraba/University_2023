use [DividendPolicyResearch]

create table dbo.tb_sp100_tickers(
	Ticker			varchar(10) not null,
	"Name"			varchar(300),
	Sector			varchar(300),
	"Market Value"	varchar(50),
	Shares			varchar(50),
	Price			varchar(20)
	constraint PK_Ticker_sp100 primary key (Ticker),
);