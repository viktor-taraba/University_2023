create view [dbo].[vw_tb_sp100_splits] as
select	[Date],
		ticker,
		[Stock Splits],
		date_insert,
		time_insert
from dbo.tb_sp100_splits
where year([Date]) >= 2012