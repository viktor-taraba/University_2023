![image](https://github.com/viktor-taraba/University_2023/assets/55559682/0a91e8fc-6c01-4ba6-9b0f-609aaeea7cd5)# Кваліфікаційна робота магістра  

**Тема**: «Формування дивiдендної полiтики корпорацiї (на прикладi компанiй, що входять до iндексу Standard & Poor’s 100)» 

**Виконав**: студент 2-го курсу денної форми навчання спецiальностi 072 «Фiнанси, банкiвська справа та страхування» освiтньо-наукової програми «Корпоративнi фiнанси» Тараба Вiктор Сергiйович 
 
**Науковий керівник**: доктор економічних наук, доцент Любкiна Олена Вiкторiвна

# Опис репозиторію
| Посилання | Формат| Опис |
|--|--|--|
|[DividendPolicyBackup](https://github.com/viktor-taraba/University_2023/blob/main/backup/DividendPolicyBackup.bak)|.bak|Бекап бази даних|
|[OEF_holdings (tickers input data)](https://github.com/viktor-taraba/University_2023/blob/main/datasets/OEF_holdings%20(tickers%20input%20data).csv)|.csv|Тікери (вхідні дані)|
|[company_tickers](https://github.com/viktor-taraba/University_2023/blob/main/datasets/company_tickers.json)|.json|Мепінг тікер-СІК|
|[Presentation 2024](https://github.com/viktor-taraba/University_2023/blob/main/Presentation%202024.tex)|.tex|Презентація для захисту|
|[Тараба_Презентація](https://github.com/viktor-taraba/University_2023/blob/main/%D0%A2%D0%B0%D1%80%D0%B0%D0%B1%D0%B0_%D0%9F%D1%80%D0%B5%D0%B7%D0%B5%D0%BD%D1%82%D0%B0%D1%86%D1%96%D1%8F.pdf)|.pdf|Скомпільована презентація для захисту|
|[Query for PBI](https://github.com/viktor-taraba/University_2023/blob/main/Query%20for%20PBI.sql)|.sql|Запит для Power BI звіту|
|[Dividend policy](https://github.com/viktor-taraba/University_2023/blob/main/Dividend%20policy.pbix)|.pbix|Power BI звіт (результати роботи, візуалізація та анліз даних)|
|[DividendPolicyResearch_LogBackup_2024-03-25](https://github.com/viktor-taraba/University_2023/blob/main/DividendPolicyResearch_LogBackup_2024-03-25.bak)|.bak|Проміжний бекап бази даних|
|[Create tables](https://github.com/viktor-taraba/University_2023/blob/main/Create%20tables.sql) <br/> [tb_CIK_ticker](https://github.com/viktor-taraba/University_2023/blob/main/tb_CIK_ticker.sql) <br/> [tb_FS_Dividends_check](https://github.com/viktor-taraba/University_2023/blob/main/tb_FS_Dividends_check.sql) <br/> [tb_FS_EPS_check](https://github.com/viktor-taraba/University_2023/blob/main/tb_FS_EPS_check.sql) <br/> [tb_FS_SUB](https://github.com/viktor-taraba/University_2023/blob/main/tb_FS_SUB.sql) <br/> [tb_FS_cash_flow_statement_macrotrends](https://github.com/viktor-taraba/University_2023/blob/main/tb_FS_cash_flow_statement_macrotrends.sql) <br/> [tb_FS_cash_flow_statement_macrotrends_num](https://github.com/viktor-taraba/University_2023/blob/main/tb_FS_cash_flow_statement_macrotrends_num.sql) <br/> [tb_FS_income_statement_macrotrends](https://github.com/viktor-taraba/University_2023/blob/main/tb_FS_income_statement_macrotrends.sql) <br/> [tb_FS_income_statement_macrotrends_num](https://github.com/viktor-taraba/University_2023/blob/main/tb_FS_income_statement_macrotrends_num.sql) <br/> [tb_FS_stock_analysis](https://github.com/viktor-taraba/University_2023/blob/main/tb_FS_stock_analysis.sql) <br/> []()|.sql|Створення об'єктів (таблиці, представлення), обробка даних та приведення їх до єдиного формату, розрахунок показників на рівні БД, порівняння даних з різних джерел та аналіз розбіжностей|
|[]()|||
|[]()|||
|[]()|||
|[]()|||
|[]()|||
|[]()|||
|[]()|||
|[]()|||
|[]()|||
|[]()|||
|[]()|||
|[]()|||
|[]()|||
|[]()|||

# Результати
### Формування бази даних
![Part 1](https://github.com/viktor-taraba/University_2023/blob/main/Data%20Flow%20full.png)
### Види дивiдендної полiтики
![Part 2](https://github.com/viktor-taraba/University_2023/blob/main/Dividend%20policy%20Types.png)
### Випадки, коли DPS >= EPS
![Part 3](https://github.com/viktor-taraba/University_2023/blob/main/EPS%20%20%26%20DPS%20comparison.png)
### Змiни в дивiденднiй полiтицi протягом дослiджуваного перiоду
![Part 4](https://github.com/viktor-taraba/University_2023/blob/main/Dividend%20policy%20Changes.png)
### Прогресивна дивiдендна полiтика з премiальними виплатами
![Part 5](https://github.com/viktor-taraba/University_2023/blob/main/COST.png)

# Висновки

- Для компанiй, що входять до iндексу S&P 100, було зiбрано данi за останнi 10
рокiв, необхiднi для визначення видiв дивiдендної полiтики, процес збору та
обробки даних максимально автоматизовано (python, SQL, Power BI).

- На основi сформованої бази даних було **визначено види дивiдендної
полiтики для кожної з компанiй та проаналiзовано додатковi
характеристики дивiдендної полiтики**, зокрема змiну дивiдендної полiтики
компанiями протягом розглянутого перiоду.

- Запропоновано новий вид дивідендної політики **«прогресивна дивiдендна полiтика з премiальними
виплатами»** на основi аналiзу показникiв Costo Wholesale Corporation.
