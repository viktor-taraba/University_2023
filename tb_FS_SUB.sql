use [DividendPolicyResearch]

create table dbo.tb_FS_SUB(
	Ticker		varchar(10), 
	adsh		varchar(20), 
	[name]		varchar(150), 
	sic			smallint, 
	ein			integer, 
	former		varchar(150), 
	changed		integer, 
	afs			varchar(5),
	fye			smallint, 
	form		varchar(10), 
	[period]	integer, 
	fy			smallint, 
	fp			varchar(2), 
	filed		integer, 
	prevrpt		integer,
    detail		tinyint, 
	instance	varchar(32), 
	nciks		tinyint, 
	aciks		varchar(120), 
	[file_name] varchar(6), 
	cik_		integer
);