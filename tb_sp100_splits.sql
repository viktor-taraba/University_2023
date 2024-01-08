use [DividendPolicyResearch]

create table dbo.tb_sp100_splits(
	[Date]				date,
	ticker				varchar(5),
	[Stock Splits]		float,
	date_insert			date,
	time_insert			time
);