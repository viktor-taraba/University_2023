import pandas as pd
from sqlalchemy import create_engine
import urllib
from zipfile import ZipFile
pd.options.display.max_columns = None

#file_name = '2021q1_notes'
file_name = '2024_02_notes'

quoted = urllib.parse.quote_plus("Driver={SQL Server Native Client 11.0};Server=VIKTOR-PC-2001;Database=DividendPolicyResearch;Trusted_Connection=yes;")
engine = create_engine('mssql+pyodbc:///?odbc_connect={}'.format(quoted))

result = engine.execute('SELECT [Ticker], cik_str FROM [dbo].[vw_tb_sp_tickers_with_CIK] where without_dividends <> 1')
df_dividend_companies = pd.DataFrame(result.fetchall())
df_dividend_companies.columns = ['Ticker','cik']
df_dividend_companies = df_dividend_companies.set_index('cik')

zip_file = ZipFile('d:\\fs and notes\\{}.zip'.format(file_name))

df_sub = pd.read_csv(zip_file.open('sub.tsv'), sep="\t", low_memory=False)
df_sub.drop(['countryba','stprba','cityba','zipba','bas1','bas2','baph','countryma','stprma','cityma','zipma','mas1','mas2','countryinc','stprinc','accepted','wksi','floatmems','pubfloatusd','floatdate','floataxis','instance','prevrpt','afs','ein','sic'], axis=1, inplace=True)
df_sub = df_sub[(df_sub['fp']=='FY')]
df_sub['file_name'] = file_name;
df_sub = df_sub.set_index('cik')
df_sub['cik_'] = df_sub.index
df_sub = df_sub.join(df_dividend_companies, on='cik',how='inner')

df_sub.to_sql('tb_FS_SUB', schema='dbo', con = engine, if_exists='append',index=False)

df_sub_for_join = df_sub[['adsh','Ticker']]
df_sub_for_join = df_sub_for_join.set_index('adsh')

#df_num = pd.read_csv(zip_file.open('num.tsv'), sep="\t", low_memory=False)
mylist = []

for chunk in  pd.read_csv(zip_file.open('num.tsv'), sep="\t", chunksize=20000):
    mylist.append(chunk)

df_num = pd.concat(mylist, axis= 0)
del mylist

df_num.drop(['coreg','durp','datp','dcml'], axis=1, inplace=True)
df_num = df_num.set_index('adsh')
df_num = df_num.join(df_sub_for_join, on='adsh',how='inner')
df_num['file_name'] = file_name;
df_num['adsh_'] = df_num.index

df_num.to_sql('tb_FS_NUM', schema='dbo', con = engine, if_exists='append',index=False)