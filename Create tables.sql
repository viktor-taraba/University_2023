begin

use [DividendPolicyResearch]

create table dbo.tb_sp500_tickers(
	ticker				varchar(5),
	date_insert			datetime,
	constraint PK_ticker primary key (ticker),
);

create table dbo.tb_company_info(
	city				varchar(50),
	"state"				varchar(50),
	zip					varchar(50),
	website				varchar(100),
	industry			varchar(200),
	sector				varchar(200),
	longBusinessSummary varchar(5000),
    marketCap			bigint,
	symbol				varchar(5),
	underlyingSymbol	varchar(5),
	shortName			varchar(300),
	longName			varchar(500),
	date_insert			datetime,
	constraint FK_symbol foreign key (symbol)
	references dbo.tb_sp500_tickers(ticker)
);

create table dbo.tb_dividends(
	"date"				date,
	dividends			numeric(7,6),
	ticker				varchar(5),
	date_insert			datetime,
	constraint FK_ticker foreign key (ticker)
	references dbo.tb_sp500_tickers(ticker)
);

end