/*** SQL Exercises - SUBQUERIES ***/
-- https://www.w3resource.com/sql-exercises/sql-subqueries-exercises.php

Table: employees
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
| EMPLOYEE_ID | FIRST_NAME  | LAST_NAME   | EMAIL    | PHONE_NUMBER       | HIRE_DATE  | JOB_ID     | SALARY   | COMMISSION_PCT | MANAGER_ID | DEPARTMENT_ID |
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+
|         100 | Steven      | King        | SKING    | 515.123.4567       | 2003-06-17 | AD_PRES    | 24000.00 |           0.00 |          0 |            90 |
|         101 | Neena       | Kochhar     | NKOCHHAR | 515.123.4568       | 2005-09-21 | AD_VP      | 17000.00 |           0.00 |        100 |            90 |
|         102 | Lex         | De Haan     | LDEHAAN  | 515.123.4569       | 2001-01-13 | AD_VP      | 17000.00 |           0.00 |        100 |            90 |
|         103 | Alexander   | Hunold      | AHUNOLD  | 590.423.4567       | 2006-01-03 | IT_PROG    |  9000.00 |           0.00 |        102 |            60 |
|         104 | Bruce       | Ernst       | BERNST   | 590.423.4568       | 2007-05-21 | IT_PROG    |  6000.00 |           0.00 |        103 |            60 |
|         105 | David       | Austin      | DAUSTIN  | 590.423.4569       | 2005-06-25 | IT_PROG    |  4800.00 |           0.00 |        103 |            60 |
|         106 | Valli       | Pataballa   | VPATABAL | 590.423.4560       | 2006-02-05 | IT_PROG    |  4800.00 |           0.00 |        103 |            60 |
|         107 | Diana       | Lorentz     | DLORENTZ | 590.423.5567       | 2007-02-07 | IT_PROG    |  4200.00 |           0.00 |        103 |            60 |
|         108 | Nancy       | Greenberg   | NGREENBE | 515.124.4569       | 2002-08-17 | FI_MGR     | 12008.00 |           0.00 |        101 |           100 |
|         109 | Daniel      | Faviet      | DFAVIET  | 515.124.4169       | 2002-08-16 | FI_ACCOUNT |  9000.00 |           0.00 |        108 |           100 |
|         110 | John        | Chen        | JCHEN    | 515.124.4269       | 2005-09-28 | FI_ACCOUNT |  8200.00 |           0.00 |        108 |           100 |
|         111 | Ismael      | Sciarra     | ISCIARRA | 515.124.4369       | 2005-09-30 | FI_ACCOUNT |  7700.00 |           0.00 |        108 |           100 |
|         112 | Jose Manuel | Urman       | JMURMAN  | 515.124.4469       | 2006-03-07 | FI_ACCOUNT |  7800.00 |           0.00 |        108 |           100 |
|         113 | Luis        | Popp        | LPOPP    | 515.124.4567       | 2007-12-07 | FI_ACCOUNT |  6900.00 |           0.00 |        108 |           100 |
|         114 | Den         | Raphaely    | DRAPHEAL | 515.127.4561       | 2002-12-07 | PU_MAN     | 11000.00 |           0.00 |        100 |            30 |
|         115 | Alexander   | Khoo        | AKHOO    | 515.127.4562       | 2003-05-18 | PU_CLERK   |  3100.00 |           0.00 |        114 |            30 |
|         116 | Shelli      | Baida       | SBAIDA   | 515.127.4563       | 2005-12-24 | PU_CLERK   |  2900.00 |           0.00 |        114 |            30 |
|         117 | Sigal       | Tobias      | STOBIAS  | 515.127.4564       | 2005-07-24 | PU_CLERK   |  2800.00 |           0.00 |        114 |            30 |
|         118 | Guy         | Himuro      | GHIMURO  | 515.127.4565       | 2006-11-15 | PU_CLERK   |  2600.00 |           0.00 |        114 |            30 |
|         119 | Karen       | Colmenares  | KCOLMENA | 515.127.4566       | 2007-08-10 | PU_CLERK   |  2500.00 |           0.00 |        114 |            30 |
|         120 | Matthew     | Weiss       | MWEISS   | 650.123.1234       | 2004-07-18 | ST_MAN     |  8000.00 |           0.00 |        100 |            50 |
|         121 | Adam        | Fripp       | AFRIPP   | 650.123.2234       | 2005-04-10 | ST_MAN     |  8200.00 |           0.00 |        100 |            50 |
|         122 | Payam       | Kaufling    | PKAUFLIN | 650.123.3234       | 2003-05-01 | ST_MAN     |  7900.00 |           0.00 |        100 |            50 |
|         123 | Shanta      | Vollman     | SVOLLMAN | 650.123.4234       | 2005-10-10 | ST_MAN     |  6500.00 |           0.00 |        100 |            50 |
|         124 | Kevin       | Mourgos     | KMOURGOS | 650.123.5234       | 2007-11-16 | ST_MAN     |  5800.00 |           0.00 |        100 |            50 |
|         125 | Julia       | Nayer       | JNAYER   | 650.124.1214       | 2005-07-16 | ST_CLERK   |  3200.00 |           0.00 |        120 |            50 |
|         126 | Irene       | Mikkilineni | IMIKKILI | 650.124.1224       | 2006-09-28 | ST_CLERK   |  2700.00 |           0.00 |        120 |            50 |
|         127 | James       | Landry      | JLANDRY  | 650.124.1334       | 2007-01-14 | ST_CLERK   |  2400.00 |           0.00 |        120 |            50 |
|         128 | Steven      | Markle      | SMARKLE  | 650.124.1434       | 2008-03-08 | ST_CLERK   |  2200.00 |           0.00 |        120 |            50 |
|         129 | Laura       | Bissot      | LBISSOT  | 650.124.5234       | 2005-08-20 | ST_CLERK   |  3300.00 |           0.00 |        121 |            50 |
|         130 | Mozhe       | Atkinson    | MATKINSO | 650.124.6234       | 2005-10-30 | ST_CLERK   |  2800.00 |           0.00 |        121 |            50 |
|         131 | James       | Marlow      | JAMRLOW  | 650.124.7234       | 2005-02-16 | ST_CLERK   |  2500.00 |           0.00 |        121 |            50 |
|         132 | TJ          | Olson       | TJOLSON  | 650.124.8234       | 2007-04-10 | ST_CLERK   |  2100.00 |           0.00 |        121 |            50 |
|         133 | Jason       | Mallin      | JMALLIN  | 650.127.1934       | 2004-06-14 | ST_CLERK   |  3300.00 |           0.00 |        122 |            50 |
|         134 | Michael     | Rogers      | MROGERS  | 650.127.1834       | 2006-08-26 | ST_CLERK   |  2900.00 |           0.00 |        122 |            50 |
|         135 | Ki          | Gee         | KGEE     | 650.127.1734       | 2007-12-12 | ST_CLERK   |  2400.00 |           0.00 |        122 |            50 |
|         136 | Hazel       | Philtanker  | HPHILTAN | 650.127.1634       | 2008-02-06 | ST_CLERK   |  2200.00 |           0.00 |        122 |            50 |
|         137 | Renske      | Ladwig      | RLADWIG  | 650.121.1234       | 2003-07-14 | ST_CLERK   |  3600.00 |           0.00 |        123 |            50 |
|         138 | Stephen     | Stiles      | SSTILES  | 650.121.2034       | 2005-10-26 | ST_CLERK   |  3200.00 |           0.00 |        123 |            50 |
|         139 | John        | Seo         | JSEO     | 650.121.2019       | 2006-02-12 | ST_CLERK   |  2700.00 |           0.00 |        123 |            50 |
|         140 | Joshua      | Patel       | JPATEL   | 650.121.1834       | 2006-04-06 | ST_CLERK   |  2500.00 |           0.00 |        123 |            50 |
|         141 | Trenna      | Rajs        | TRAJS    | 650.121.8009       | 2003-10-17 | ST_CLERK   |  3500.00 |           0.00 |        124 |            50 |
|         142 | Curtis      | Davies      | CDAVIES  | 650.121.2994       | 2005-01-29 | ST_CLERK   |  3100.00 |           0.00 |        124 |            50 |
|         143 | Randall     | Matos       | RMATOS   | 650.121.2874       | 2006-03-15 | ST_CLERK   |  2600.00 |           0.00 |        124 |            50 |
|         144 | Peter       | Vargas      | PVARGAS  | 650.121.2004       | 2006-07-09 | ST_CLERK   |  2500.00 |           0.00 |        124 |            50 |
|         145 | John        | Russell     | JRUSSEL  | 011.44.1344.429268 | 2004-10-01 | SA_MAN     | 14000.00 |           0.40 |        100 |            80 |
|         146 | Karen       | Partners    | KPARTNER | 011.44.1344.467268 | 2005-01-05 | SA_MAN     | 13500.00 |           0.30 |        100 |            80 |
|         147 | Alberto     | Errazuriz   | AERRAZUR | 011.44.1344.429278 | 2005-03-10 | SA_MAN     | 12000.00 |           0.30 |        100 |            80 |
|         148 | Gerald      | Cambrault   | GCAMBRAU | 011.44.1344.619268 | 2007-10-15 | SA_MAN     | 11000.00 |           0.30 |        100 |            80 |
|         149 | Eleni       | Zlotkey     | EZLOTKEY | 011.44.1344.429018 | 2008-01-29 | SA_MAN     | 10500.00 |           0.20 |        100 |            80 |
|         150 | Peter       | Tucker      | PTUCKER  | 011.44.1344.129268 | 2005-01-30 | SA_REP     | 10000.00 |           0.30 |        145 |            80 |
|         151 | David       | Bernstein   | DBERNSTE | 011.44.1344.345268 | 2005-03-24 | SA_REP     |  9500.00 |           0.25 |        145 |            80 |
|         152 | Peter       | Hall        | PHALL    | 011.44.1344.478968 | 2005-08-20 | SA_REP     |  9000.00 |           0.25 |        145 |            80 |
|         153 | Christopher | Olsen       | COLSEN   | 011.44.1344.498718 | 2006-03-30 | SA_REP     |  8000.00 |           0.20 |        145 |            80 |
|         154 | Nanette     | Cambrault   | NCAMBRAU | 011.44.1344.987668 | 2006-12-09 | SA_REP     |  7500.00 |           0.20 |        145 |            80 |
|         155 | Oliver      | Tuvault     | OTUVAULT | 011.44.1344.486508 | 2007-11-23 | SA_REP     |  7000.00 |           0.15 |        145 |            80 |
|         156 | Janette     | King        | JKING    | 011.44.1345.429268 | 2004-01-30 | SA_REP     | 10000.00 |           0.35 |        146 |            80 |
|         157 | Patrick     | Sully       | PSULLY   | 011.44.1345.929268 | 2004-03-04 | SA_REP     |  9500.00 |           0.35 |        146 |            80 |
|         158 | Allan       | McEwen      | AMCEWEN  | 011.44.1345.829268 | 2004-08-01 | SA_REP     |  9000.00 |           0.35 |        146 |            80 |
|         159 | Lindsey     | Smith       | LSMITH   | 011.44.1345.729268 | 2005-03-10 | SA_REP     |  8000.00 |           0.30 |        146 |            80 |
|         160 | Louise      | Doran       | LDORAN   | 011.44.1345.629268 | 2005-12-15 | SA_REP     |  7500.00 |           0.30 |        146 |            80 |
|         161 | Sarath      | Sewall      | SSEWALL  | 011.44.1345.529268 | 2006-11-03 | SA_REP     |  7000.00 |           0.25 |        146 |            80 |
|         162 | Clara       | Vishney     | CVISHNEY | 011.44.1346.129268 | 2005-11-11 | SA_REP     | 10500.00 |           0.25 |        147 |            80 |
|         163 | Danielle    | Greene      | DGREENE  | 011.44.1346.229268 | 2007-03-19 | SA_REP     |  9500.00 |           0.15 |        147 |            80 |
|         164 | Mattea      | Marvins     | MMARVINS | 011.44.1346.329268 | 2008-01-24 | SA_REP     |  7200.00 |           0.10 |        147 |            80 |
|         165 | David       | Lee         | DLEE     | 011.44.1346.529268 | 2008-02-23 | SA_REP     |  6800.00 |           0.10 |        147 |            80 |
|         166 | Sundar      | Ande        | SANDE    | 011.44.1346.629268 | 2008-03-24 | SA_REP     |  6400.00 |           0.10 |        147 |            80 |
|         167 | Amit        | Banda       | ABANDA   | 011.44.1346.729268 | 2008-04-21 | SA_REP     |  6200.00 |           0.10 |        147 |            80 |
|         168 | Lisa        | Ozer        | LOZER    | 011.44.1343.929268 | 2005-03-11 | SA_REP     | 11500.00 |           0.25 |        148 |            80 |
|         169 | Harrison    | Bloom       | HBLOOM   | 011.44.1343.829268 | 2006-03-23 | SA_REP     | 10000.00 |           0.20 |        148 |            80 |
|         170 | Tayler      | Fox         | TFOX     | 011.44.1343.729268 | 2006-01-24 | SA_REP     |  9600.00 |           0.20 |        148 |            80 |
|         171 | William     | Smith       | WSMITH   | 011.44.1343.629268 | 2007-02-23 | SA_REP     |  7400.00 |           0.15 |        148 |            80 |
|         172 | Elizabeth   | Bates       | EBATES   | 011.44.1343.529268 | 2007-03-24 | SA_REP     |  7300.00 |           0.15 |        148 |            80 |
|         173 | Sundita     | Kumar       | SKUMAR   | 011.44.1343.329268 | 2008-04-21 | SA_REP     |  6100.00 |           0.10 |        148 |            80 |
|         174 | Ellen       | Abel        | EABEL    | 011.44.1644.429267 | 2004-05-11 | SA_REP     | 11000.00 |           0.30 |        149 |            80 |
|         175 | Alyssa      | Hutton      | AHUTTON  | 011.44.1644.429266 | 2005-03-19 | SA_REP     |  8800.00 |           0.25 |        149 |            80 |
|         176 | Jonathon    | Taylor      | JTAYLOR  | 011.44.1644.429265 | 2006-03-24 | SA_REP     |  8600.00 |           0.20 |        149 |            80 |
|         177 | Jack        | Livingston  | JLIVINGS | 011.44.1644.429264 | 2006-04-23 | SA_REP     |  8400.00 |           0.20 |        149 |            80 |
|         178 | Kimberely   | Grant       | KGRANT   | 011.44.1644.429263 | 2007-05-24 | SA_REP     |  7000.00 |           0.15 |        149 |             0 |
|         179 | Charles     | Johnson     | CJOHNSON | 011.44.1644.429262 | 2008-01-04 | SA_REP     |  6200.00 |           0.10 |        149 |            80 |
|         180 | Winston     | Taylor      | WTAYLOR  | 650.507.9876       | 2006-01-24 | SH_CLERK   |  3200.00 |           0.00 |        120 |            50 |
|         181 | Jean        | Fleaur      | JFLEAUR  | 650.507.9877       | 2006-02-23 | SH_CLERK   |  3100.00 |           0.00 |        120 |            50 |
|         182 | Martha      | Sullivan    | MSULLIVA | 650.507.9878       | 2007-06-21 | SH_CLERK   |  2500.00 |           0.00 |        120 |            50 |
|         183 | Girard      | Geoni       | GGEONI   | 650.507.9879       | 2008-02-03 | SH_CLERK   |  2800.00 |           0.00 |        120 |            50 |
|         184 | Nandita     | Sarchand    | NSARCHAN | 650.509.1876       | 2004-01-27 | SH_CLERK   |  4200.00 |           0.00 |        121 |            50 |
|         185 | Alexis      | Bull        | ABULL    | 650.509.2876       | 2005-02-20 | SH_CLERK   |  4100.00 |           0.00 |        121 |            50 |
|         186 | Julia       | Dellinger   | JDELLING | 650.509.3876       | 2006-06-24 | SH_CLERK   |  3400.00 |           0.00 |        121 |            50 |
|         187 | Anthony     | Cabrio      | ACABRIO  | 650.509.4876       | 2007-02-07 | SH_CLERK   |  3000.00 |           0.00 |        121 |            50 |
|         188 | Kelly       | Chung       | KCHUNG   | 650.505.1876       | 2005-06-14 | SH_CLERK   |  3800.00 |           0.00 |        122 |            50 |
|         189 | Jennifer    | Dilly       | JDILLY   | 650.505.2876       | 2005-08-13 | SH_CLERK   |  3600.00 |           0.00 |        122 |            50 |
|         190 | Timothy     | Gates       | TGATES   | 650.505.3876       | 2006-07-11 | SH_CLERK   |  2900.00 |           0.00 |        122 |            50 |
|         191 | Randall     | Perkins     | RPERKINS | 650.505.4876       | 2007-12-19 | SH_CLERK   |  2500.00 |           0.00 |        122 |            50 |
|         192 | Sarah       | Bell        | SBELL    | 650.501.1876       | 2004-02-04 | SH_CLERK   |  4000.00 |           0.00 |        123 |            50 |
|         193 | Britney     | Everett     | BEVERETT | 650.501.2876       | 2005-03-03 | SH_CLERK   |  3900.00 |           0.00 |        123 |            50 |
|         194 | Samuel      | McCain      | SMCCAIN  | 650.501.3876       | 2006-07-01 | SH_CLERK   |  3200.00 |           0.00 |        123 |            50 |
|         195 | Vance       | Jones       | VJONES   | 650.501.4876       | 2007-03-17 | SH_CLERK   |  2800.00 |           0.00 |        123 |            50 |
|         196 | Alana       | Walsh       | AWALSH   | 650.507.9811       | 2006-04-24 | SH_CLERK   |  3100.00 |           0.00 |        124 |            50 |
|         197 | Kevin       | Feeney      | KFEENEY  | 650.507.9822       | 2006-05-23 | SH_CLERK   |  3000.00 |           0.00 |        124 |            50 |
|         198 | Donald      | OConnell    | DOCONNEL | 650.507.9833       | 2007-06-21 | SH_CLERK   |  2600.00 |           0.00 |        124 |            50 |
|         199 | Douglas     | Grant       | DGRANT   | 650.507.9844       | 2008-01-13 | SH_CLERK   |  2600.00 |           0.00 |        124 |            50 |
|         200 | Jennifer    | Whalen      | JWHALEN  | 515.123.4444       | 2003-09-17 | AD_ASST    |  4400.00 |           0.00 |        101 |            10 |
|         201 | Michael     | Hartstein   | MHARTSTE | 515.123.5555       | 2004-02-17 | MK_MAN     | 13000.00 |           0.00 |        100 |            20 |
|         202 | Pat         | Fay         | PFAY     | 603.123.6666       | 2005-08-17 | MK_REP     |  6000.00 |           0.00 |        201 |            20 |
|         203 | Susan       | Mavris      | SMAVRIS  | 515.123.7777       | 2002-06-07 | HR_REP     |  6500.00 |           0.00 |        101 |            40 |
|         204 | Hermann     | Baer        | HBAER    | 515.123.8888       | 2002-06-07 | PR_REP     | 10000.00 |           0.00 |        101 |            70 |
|         205 | Shelley     | Higgins     | SHIGGINS | 515.123.8080       | 2002-06-07 | AC_MGR     | 12008.00 |           0.00 |        101 |           110 |
|         206 | William     | Gietz       | WGIETZ   | 515.123.8181       | 2002-06-07 | AC_ACCOUNT |  8300.00 |           0.00 |        205 |           110 |
+-------------+-------------+-------------+----------+--------------------+------------+------------+----------+----------------+------------+---------------+


Table: departments
+---------------+----------------------+------------+-------------+
| DEPARTMENT_ID | DEPARTMENT_NAME      | MANAGER_ID | LOCATION_ID |
+---------------+----------------------+------------+-------------+
|            10 | Administration       |        200 |        1700 |
|            20 | Marketing            |        201 |        1800 |
|            30 | Purchasing           |        114 |        1700 |
|            40 | Human Resources      |        203 |        2400 |
|            50 | Shipping             |        121 |        1500 |
|            60 | IT                   |        103 |        1400 |
|            70 | Public Relations     |        204 |        2700 |
|            80 | Sales                |        145 |        2500 |
|            90 | Executive            |        100 |        1700 |
|           100 | Finance              |        108 |        1700 |
|           110 | Accounting           |        205 |        1700 |
|           120 | Treasury             |          0 |        1700 |
|           130 | Corporate Tax        |          0 |        1700 |
|           140 | Control And Credit   |          0 |        1700 |
|           150 | Shareholder Services |          0 |        1700 |
|           160 | Benefits             |          0 |        1700 |
|           170 | Manufacturing        |          0 |        1700 |
|           180 | Construction         |          0 |        1700 |
|           190 | Contracting          |          0 |        1700 |
|           200 | Operations           |          0 |        1700 |
|           210 | IT Support           |          0 |        1700 |
|           220 | NOC                  |          0 |        1700 |
|           230 | IT Helpdesk          |          0 |        1700 |
|           240 | Government Sales     |          0 |        1700 |
|           250 | Retail Sales         |          0 |        1700 |
|           260 | Recruiting           |          0 |        1700 |
|           270 | Payroll              |          0 |        1700 |
+---------------+----------------------+------------+-------------+


Table: locations
+-------------+------------------------------------------+-------------+---------------------+-------------------+------------+
| LOCATION_ID | STREET_ADDRESS                           | POSTAL_CODE | CITY                | STATE_PROVINCE    | COUNTRY_ID |
+-------------+------------------------------------------+-------------+---------------------+-------------------+------------+
|        1000 | 1297 Via Cola di Rie                     | 989         | Roma                |                   | IT         |
|        1100 | 93091 Calle della Testa                  | 10934       | Venice              |                   | IT         |
|        1200 | 2017 Shinjuku-ku                         | 1689        | Tokyo               | Tokyo Prefecture  | JP         |
|        1300 | 9450 Kamiya-cho                          | 6823        | Hiroshima           |                   | JP         |
|        1400 | 2014 Jabberwocky Rd                      | 26192       | Southlake           | Texas             | US         |
|        1500 | 2011 Interiors Blvd                      | 99236       | South San Francisco | California        | US         |
|        1600 | 2007 Zagora St                           | 50090       | South Brunswick     | New Jersey        | US         |
|        1700 | 2004 Charade Rd                          | 98199       | Seattle             | Washington        | US         |
|        1800 | 147 Spadina Ave                          | M5V 2L7     | Toronto             | Ontario           | CA         |
|        1900 | 6092 Boxwood St                          | YSW 9T2     | Whitehorse          | Yukon             | CA         |
|        2000 | 40-5-12 Laogianggen                      | 190518      | Beijing             |                   | CN         |
|        2100 | 1298 Vileparle (E)                       | 490231      | Bombay              | Maharashtra       | IN         |
|        2200 | 12-98 Victoria Street                    | 2901        | Sydney              | New South Wales   | AU         |
|        2300 | 198 Clementi North                       | 540198      | Singapore           |                   | SG         |
|        2400 | 8204 Arthur St                           |             | London              |                   | UK         |
|        2500 | Magdalen Centre, The Oxford Science Park | OX9 9ZB     | Oxford              | Oxford            | UK         |
|        2600 | 9702 Chester Road                        | 9629850293  | Stretford           | Manchester        | UK         |
|        2700 | Schwanthalerstr. 7031                    | 80925       | Munich              | Bavaria           | DE         |
|        2800 | Rua Frei Caneca 1360                     | 01307-002   | Sao Paulo           | Sao Paulo         | BR         |
|        2900 | 20 Rue des Corps-Saints                  | 1730        | Geneva              | Geneve            | CH         |
|        3000 | Murtenstrasse 921                        | 3095        | Bern                | BE                | CH         |
|        3100 | Pieter Breughelstraat 837                | 3029SK      | Utrecht             | Utrecht           | NL         |
|        3200 | Mariano Escobedo 9991                    | 11932       | Mexico City         | Distrito Federal, | MX         |
+-------------+------------------------------------------+-------------+---------------------+-------------------+------------+


Table: countries
+------------+--------------------------+-----------+
| COUNTRY_ID | COUNTRY_NAME             | REGION_ID |
+------------+--------------------------+-----------+
| AR         | Argentina                |         2 |
| AU         | Australia                |         3 |
| BE         | Belgium                  |         1 |
| BR         | Brazil                   |         2 |
| CA         | Canada                   |         2 |
| CH         | Switzerland              |         1 |
| CN         | China                    |         3 |
| DE         | Germany                  |         1 |
| DK         | Denmark                  |         1 |
| EG         | Egypt                    |         4 |
| FR         | France                   |         1 |
| IL         | Israel                   |         4 |
| IN         | India                    |         3 |
| IT         | Italy                    |         1 |
| JP         | Japan                    |         3 |
| KW         | Kuwait                   |         4 |
| ML         | Malaysia                 |         3 |
| MX         | Mexico                   |         2 |
| NG         | Nigeria                  |         4 |
| NL         | Netherlands              |         1 |
| SG         | Singapore                |         3 |
| UK         | United Kingdom           |         1 |
| US         | United States of America |         2 |
| ZM         | Zambia                   |         4 |
| ZW         | Zimbabwe                 |         4 |
+------------+--------------------------+-----------+


Table: job_history
+-------------+------------+------------+------------+---------------+
| EMPLOYEE_ID | START_DATE | END_DATE   | JOB_ID     | DEPARTMENT_ID |
+-------------+------------+------------+------------+---------------+
|         102 | 2001-01-13 | 2006-07-24 | IT_PROG    |            60 |
|         101 | 1997-09-21 | 2001-10-27 | AC_ACCOUNT |           110 |
|         101 | 2001-10-28 | 2005-03-15 | AC_MGR     |           110 |
|         201 | 2004-02-17 | 2007-12-19 | MK_REP     |            20 |
|         114 | 2006-03-24 | 2007-12-31 | ST_CLERK   |            50 |
|         122 | 2007-01-01 | 2007-12-31 | ST_CLERK   |            50 |
|         200 | 1995-09-17 | 2001-06-17 | AD_ASST    |            90 |
|         176 | 2006-03-24 | 2006-12-31 | SA_REP     |            80 |
|         176 | 2007-01-01 | 2007-12-31 | SA_MAN     |            80 |
|         200 | 2002-07-01 | 2006-12-31 | AC_ACCOUNT |            90 |
+-------------+------------+------------+------------+---------------+


Table: jobs
+------------+---------------------------------+------------+------------+
| JOB_ID     | JOB_TITLE                       | MIN_SALARY | MAX_SALARY |
+------------+---------------------------------+------------+------------+
| AD_PRES    | President                       |      20080 |      40000 |
| AD_VP      | Administration Vice President   |      15000 |      30000 |
| AD_ASST    | Administration Assistant        |       3000 |       6000 |
| FI_MGR     | Finance Manager                 |       8200 |      16000 |
| FI_ACCOUNT | Accountant                      |       4200 |       9000 |
| AC_MGR     | Accounting Manager              |       8200 |      16000 |
| AC_ACCOUNT | Public Accountant               |       4200 |       9000 |
| SA_MAN     | Sales Manager                   |      10000 |      20080 |
| SA_REP     | Sales Representative            |       6000 |      12008 |
| PU_MAN     | Purchasing Manager              |       8000 |      15000 |
| PU_CLERK   | Purchasing Clerk                |       2500 |       5500 |
| ST_MAN     | Stock Manager                   |       5500 |       8500 |
| ST_CLERK   | Stock Clerk                     |       2008 |       5000 |
| SH_CLERK   | Shipping Clerk                  |       2500 |       5500 |
| IT_PROG    | Programmer                      |       4000 |      10000 |
| MK_MAN     | Marketing Manager               |       9000 |      15000 |
| MK_REP     | Marketing Representative        |       4000 |       9000 |
| HR_REP     | Human Resources Representative  |       4000 |       9000 |
| PR_REP     | Public Relations Representative |       4500 |      10500 |
+------------+---------------------------------+------------+------------+


/* 1. Write a query to display the name (first name and last name) for those employees who gets more salary than the employee whose ID is 163. */

SELECT first_name,
       last_name
  FROM employees
  WHERE salary > (SELECT salary
                    FROM employees
                    WHERE employee_id = 163);


/* 2. Write a query to display the name (first name and last name), salary, department id, job id for those employees who works in the same designation as the employee works whose id is 169. */

SELECT first_name,
       last_name,
       salary,
       department_id,
       job_id
  FROM employees
  WHERE job_id = (SELECT job_id
                    FROM employees
                    WHERE employee_id = 169);


/* 3. Write a query to display the name (first name and last name), salary, department id for those employees who earn such amount of salary which is the smallest salary of any of the departments.

SELECT first_name,
       last_name,
       salary,
       department_id
  FROM employees
  WHERE salary IN (SELECT MIN(salary)
                     FROM employees
                     GROUP BY department_id);


/* 4. Write a query to display the employee id, employee name (first name and last name) for all employees who earn more than the average salary.

SELECT employee_id,
       first_name,
       last_name
  FROM employees
  WHERE salary > (SELECT AVG(salary)
                    FROM employees);


/* 5. Write a query to display the employee name (first name and last name), employee id and salary of all employees who report to Payam.

SELECT first_name,
       last_name,
       employee_id,
       salary
  FROM employees
  WHERE manager_id = (SELECT employee_id
                        FROM employees
                        WHERE first_name = 'Payam');


/* 6. Write a query to display the department number, name (first name and last name), job_id and department name for all employees in the Finance department.

SELECT e.department_id,
       e.first_name,
       e.last_name,
       e.job_id,
       d.department_name
  FROM employees e
  INNER JOIN departments d
  ON e.department_id = d.department_id
  WHERE d.department_name = 'Finance';


/* 7. Write a query to display all the information of an employee whose salary and reporting person id is 3000 and 121, respectively. */

SELECT *
  FROM employees
  WHERE salary = 3000.00
    AND manager_id = 121;

-- Note: This also works using subquery.

SELECT *
  FROM employees 
  WHERE (salary, manager_id) = (SELECT 3000, 121);


/* 8. Display all the information of an employee whose id is any of the number 134, 159 and 183. */

SELECT *
  FROM employees
  WHERE employee_id IN (134, 159, 183);


/* 9. Write a query to display all the information of the employees whose salary is within the range 1000 and 3000. */

SELECT *
  FROM employees
  WHERE salary BETWEEN 1000.00 AND 3000.00;


/* 10. Write a query to display all the information of the employees whose salary is within the range of smallest salary and 2500.

SELECT *
  FROM employees
  WHERE salary BETWEEN (SELECT MIN(salary)
                          FROM employees) AND 2500.00;


/* 11. Write a query to display all the information of the employees who does not work in those departments where some employees works whose manager id within the range 100 and 200. */

SELECT *
  FROM employees
  WHERE department_id NOT IN (SELECT department_id
                                FROM departments
                                WHERE manager_id BETWEEN 100 AND 200);


/* 12. Write a query to display all the information for those employees whose id is any id who earn the second highest salary. */

SELECT *
  FROM employees
  WHERE employee_id IN (SELECT employee_id
                          FROM employees
                          WHERE salary IN (SELECT MAX(salary)
                                             FROM employees
                                             WHERE salary < (SELECT MAX(salary)
                                                               FROM employees)));


/* 13. Write a query to display the employee name (first name and last name) and hire date for all employees in the same department as Clara. Exclude Clara

SELECT first_name,
       last_name,
       hire_date
  FROM employees
  WHERE department_id = (SELECT department_id
                           FROM employees
                           WHERE first_name = 'Clara')
    AND first_name != 'Clara';


/* 14. Write a query to display the employee number and name (first name and last name) for all employees who work in a department with any employee whose name contains a T. */

SELECT employee_id,
       first_name,
       last_name
  FROM employees
  WHERE department_id IN (SELECT department_id
                            FROM employees
                            WHERE first_name LIKE '%T%');


/* 15. Write a query to display the employee number, name (first name and last name), and salary for all employees who earn more than the average salary and who work in a department with any employee with a J in their name. */

SELECT employee_id,
       first_name,
       last_name,
       salary
  FROM employees
  WHERE salary > (SELECT AVG(salary)
                    FROM employees)
    AND department_id IN (SELECT department_id
                            FROM employees
                            WHERE first_name LIKE '%J%');


/* 16. Display the employee name (first name and last name), employee id, and job title for all employees whose department location is Toronto.

SELECT first_name,
       last_name,
       employee_id,
       job_id
  FROM employees
  WHERE department_id IN (SELECT department_id
                            FROM departments
                            WHERE location_id IN (SELECT location_id
                                                    FROM locations
                                                    WHERE city = 'Toronto'));


/* 17. Write a query to display the employee number, name (first name and last name) and job title for all employees whose salary is smaller than any salary of those employees whose job title is MK_MAN. */

SELECT employee_id,
       first_name,
       last_name,
       job_id
  FROM employees
  WHERE salary < ANY (SELECT salary
                        FROM employees
                        WHERE job_id = 'MK_MAN');


/* 18. Write a query to display the employee number, name (first name and last name) and job title for all employees whose salary is smaller than any salary of those employees whose job title is MK_MAN. Exclude Job title MK_MAN. */

SELECT employee_id,
       first_name,
       last_name,
       job_id
  FROM employees
  WHERE salary < ANY (SELECT salary
                        FROM employees
                        WHERE job_id = 'MK_MAN')
    AND job_id != 'MK_MAN';


/* 19. Write a query to display the employee number, name (first name and last name) and job title for all employees whose salary is more than any salary of those employees whose job title is PU_MAN. Exclude job title PU_MAN.

SELECT employee_id,
       first_name,
       last_name,
       job_id
  FROM employees
  WHERE salary > ANY (SELECT salary
                        FROM employees
                        WHERE job_id = 'PU_MAN')
    AND job_id != 'PU_MAN';


/* 20. Write a query to display the employee number, name (first name and last name) and job title for all employees whose salary is more than any average salary of any department. */

SELECT employee_id,
       first_name,
       last_name,
       job_id
  FROM employees
  WHERE salary > ANY (SELECT AVG(salary)
                        FROM employees
                        GROUP BY department_id);


/* 21. Write a query to display the employee name( first name and last name ) and department for all employees for any existence of those employees whose salary is more than 3700.

SELECT first_name,
       last_name,
       department_id
  FROM employees
  WHERE EXISTS (SELECT *
                  FROM employees
                  WHERE salary > 3700.00);


/* 22. Write a query to display the department id and the total salary for those departments which contains at least one employee. */

SELECT department_id,
       SUM(salary)
  FROM employees
  WHERE department_id IN (SELECT department_id
                            FROM departments)
  GROUP BY department_id
  HAVING COUNT(department_id) >= 1;


/* 23. Write a query to display the employee id, name (first name and last name) and the job id column with a modified title SALESMAN for those employees whose job title is ST_MAN and DEVELOPER for whose job title is IT_PROG. /*

SELECT employee_id,
       first_name,
       last_name,
       CASE WHEN job_id = 'ST_MAN' THEN 'SALESMAN'
            WHEN job_id = 'IT_PROG' THEN 'DEVELOPER'
            ELSE job_id END AS job_id_mod
  FROM employees;


/* 24. Write a query to display the employee id, name (first name and last name), salary and the SalaryStatus column with a title HIGH and LOW respectively for those employees whose salary is more than and less than the average salary of all employees. */

SELECT employee_id,
       first_name,
       last_name,
       salary,
       CASE WHEN salary >= (SELECT AVG(salary) FROM employees) THEN 'HIGH'
            ELSE 'LOW' END AS salary_status
  FROM employees;


/* 25. Write a query to display the employee id, name (first name and last name), Salary, AvgCompare (salary - the average salary of all employees) and the SalaryStatus column with a title HIGH and LOW respectively for those employees whose salary is more than and less than the average salary of all employees. */

SELECT employee_id,
       first_name,
       last_name,
       salary AS salary_drawn,
       ROUND(salary - (SELECT AVG(salary) FROM employees), 2) AS avg_compare,
       CASE WHEN salary >= (SELECT AVG(salary) FROM employees) THEN 'HIGH'
                 ELSE 'LOW' END AS salary_status
  FROM employees;


/* 26. Write a subquery that returns a set of rows to find all departments that do actually have one or more employees assigned to them. */

SELECT department_name
  FROM departments
  WHERE department_id IN (SELECT DISTINCT department_id
                            FROM employees);


/* 27. Write a query that will identify all employees who work in departments located in the United Kingdom. */

SELECT *
  FROM employees
  WHERE department_id IN (SELECT department_id
                            FROM departments
                            WHERE location_id IN (SELECT location_id
                                                    FROM locations
                                                    WHERE country_id IN (SELECT country_id
                                                                           FROM countries
                                                                           WHERE country_name = 'United Kingdom')));


/* 28. Write a query to identify all the employees who earn more than the average and who work in any of the IT departments. */

SELECT *
  FROM employees
  WHERE salary > (SELECT AVG(salary)
                    FROM employees)
    AND department_id IN (SELECT department_id
                            FROM departments
                            WHERE department_name LIKE ('%IT%'));


/* 29. Write a query to determine who earns more than Mr. Ozer. */

SELECT first_name,
       last_name,
       salary
  FROM employees
  WHERE salary > (SELECT salary
                    FROM employees
                    WHERE last_name = 'Ozer');


/* 30. Write a query to find out which employees have a manager who works for a department based in the US. */

SELECT first_name,
       last_name
  FROM employees
  WHERE manager_id IN (SELECT employee_id
                         FROM employees
                         WHERE department_id IN (SELECT department_id
                                                   FROM departments
                                                   WHERE location_id IN (SELECT location_id
                                                                           FROM locations
                                                                           WHERE country_id = 'US')));


/* 31. Write a query which is looking for the names of all employees whose salary is greater than 50% of their department’s total salary bill. */

SELECT e1.first_name,
       e1.last_name
  FROM employees e1
  WHERE salary > (SELECT SUM(salary)*0.5
                    FROM employees e2
                    WHERE e1.department_id =  e2.department_id);


/* 32. Write a query to get the details of employees who are managers. */

SELECT *
  FROM employees
  WHERE employee_id IN (SELECT manager_id
                          FROM departments);


/* 33. Write a query to get the details of employees who manage a department. */

SELECT * 
  FROM employees 
  WHERE employee_id = ANY (SELECT manager_id
                             FROM departments);


/* 34. Write a query to display the employee id, name (first name and last name), salary, department name and city for all the employees who gets the salary as the salary earn by the employee which is maximum within the joining person January 1st, 2002 and December 31st, 2003. */

SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.salary,
       d.department_name,
       l.city
  FROM employees e
  INNER JOIN departments d
    ON e.department_id = d.department_id
  INNER JOIN locations l
    ON d.location_id = l.location_id
  WHERE e.salary = (SELECT MAX(salary)
                      FROM employees
                      WHERE hire_date BETWEEN '2002-01-01' AND '2003-12-31');


/* 35. Write a query in SQL to display the department code and name for all departments which located in the city London. */

SELECT department_id,
       department_name
  FROM departments
  WHERE location_id IN (SELECT location_id
                          FROM locations
                          WHERE city = 'London');


/* 36. Write a query in SQL to display the first and last name, salary, and department ID for all those employees who earn more than the average salary and arrange the list in descending order on salary. */

SELECT first_name,
       last_name,
       salary,
       department_id
  FROM employees
  WHERE salary > (SELECT AVG(salary)
		    FROM employees)
  ORDER BY salary DESC;


/* 37. Write a query in SQL to display the first and last name, salary, and department ID for those employees who earn more than the maximum salary of a department which ID is 40. */

SELECT first_name,
       last_name,
       salary,
       department_id
  FROM employees
  WHERE salary > (SELECT MAX(salary)
		    FROM employees
                    WHERE department_id = 40);


/* 38. Write a query in SQL to display the department name and Id for all departments where they located, that Id is equal to the Id for the location where department number 30 is located. */

SELECT department_name,
       department_id
  FROM departments
  WHERE location_id = (SELECT location_id
                         FROM departments 
                         WHERE department_id = 30);


/* 39. Write a query in SQL to display the first and last name, salary, and department ID for all those employees who work in that department where the employee works who hold the ID 201. */

SELECT first_name,
       last_name,
       salary,
       department_id
  FROM employees
  WHERE department_id = (SELECT department_id
		           FROM employees
                           WHERE employee_id = 201);


/* 40. Write a query in SQL to display the first and last name, salary, and department ID for those employees whose salary is equal to the salary of the employee who works in that department which ID is 40. */

SELECT first_name,
       last_name,
       salary,
       department_id
  FROM employees
  WHERE salary IN (SELECT salary
		     FROM employees
                     WHERE department_id = 40);


/* 41. Write a query in SQL to display the first and last name, and department code for all employees who work in the department Marketing. */

SELECT first_name,
       last_name,
       department_id
  FROM employees
  WHERE department_id IN (SELECT department_id
		            FROM departments
                            WHERE department_name = 'Marketing');


/* 42. Write a query in SQL to display the first and last name, salary, and department ID for those employees who earn more than the minimum salary of a department which ID is 40. */

SELECT first_name,
       last_name,
       salary,
       department_id
  FROM employees
  WHERE salary > (SELECT MIN(salary)
		    FROM employees
          	    WHERE department_id = 40);


/* 43. Write a query in SQL to display the full name, email, and hire date for all those employees who was hired after the employee whose ID is 165. */

SELECT CONCAT(first_name, ' ', last_name) AS full_name,
       email,
       hire_date
  FROM employees
  WHERE hire_date > (SELECT hire_date
                       FROM employees
                       WHERE employee_id = 165);


/* 44. Write a query in SQL to display the first and last name, salary, and department ID for those employees who earn less than the minimum salary of a department which ID is 70. */

SELECT first_name,
       last_name,
       salary,
       department_id
  FROM employees
  WHERE salary < (SELECT MIN(salary)
		    FROM employees
          	    WHERE department_id = 70);


/* 45. Write a query in SQL to display the first and last name, salary, and department ID for those employees who earn less than the average salary, and also work at the department where the employee Laura is working as a first name holder. */

SELECT first_name,
       last_name,
       salary,
       department_id
  FROM employees
  WHERE salary < (SELECT AVG(salary)
		    FROM employees)
    AND department_id = (SELECT department_id
                           FROM employees
                           WHERE first_name = 'Laura');


/* 46. Write a query in SQL to display the first and last name, salary, and department ID for those employees whose department is located in the city London. */

SELECT first_name,
       last_name,
       salary,
       department_id 
  FROM employees
  WHERE department_id IN (SELECT department_id
                            FROM departments
                            WHERE location_id IN (SELECT location_id
                                                    FROM locations
                                                    WHERE city = 'London'));


/* 47. Write a query in SQL to display the city of the employee whose ID 134 and works there. */

SELECT city
  FROM locations
  WHERE location_id IN (SELECT location_id
                          FROM departments
                          WHERE department_id IN (SELECT department_id
                                                    FROM employees
                                                    WHERE employee_id = 134));


/* 48. Write a query in SQL to display the the details of those departments which max salary is 7000 or above for those employees who already done one or more jobs. */

SELECT *
  FROM departments
  WHERE department_id IN (SELECT department_id
                            FROM employees
                            WHERE employee_id IN (SELECT employee_id
                                                    FROM job_history
                                                    GROUP BY employee_id
                                                    HAVING COUNT(*) > 1)
                            GROUP BY department_id
                            HAVING MAX(salary) > 7000);


/* 49. Write a query in SQL to display the detail information of those departments which starting salary is at least 8000. */

SELECT *
  FROM departments
  WHERE department_id IN (SELECT department_id
                            FROM employees
                            GROUP BY department_id
                            HAVING MIN(salary) >= 8000);


/* 50. Write a query in SQL to display the full name (first and last name) of manager who is supervising 4 or more employees.

SELECT CONCAT(first_name, ' ', last_name) AS full_name
  FROM employees
  WHERE employee_id IN (SELECT manager_id
                          FROM employees
                          GROUP BY manager_id
                          HAVING COUNT(*) >= 4);


/* 51. Write a query in SQL to display the details of the current job for those employees who worked as a Sales Representative in the past. */

SELECT *
  FROM jobs
  WHERE job_id IN (SELECT job_id
                     FROM employees
                     WHERE employee_id IN (SELECT employee_id
                                             FROM job_history
                                             WHERE job_id = 'SA_REP'));


/* 52. Write a query in SQL to display all the information about those employees who earn second lowest salary of all the employees. */

SELECT *
  FROM employees
  WHERE salary IN (SELECT MIN(salary)
                     FROM employees
                     WHERE salary > (SELECT MIN(salary)
                                       FROM employees));


/* 53. Write a query in SQL to display the details of departments managed by Susan. */

SELECT *
  FROM departments
  WHERE manager_id IN (SELECT employee_id
                         FROM employees
                         WHERE first_name = 'Susan');


/* 54. Write a query in SQL to display the department ID, full name (first and last name), salary for those employees who is highest salary drawer in a department. */

SELECT department_id,
       CONCAT(first_name, ' ', last_name) AS full_name,
       salary
  FROM employees e
  WHERE salary IN (SELECT MAX(salary)
                     FROM employees
                     WHERE department_id = e.department_id);


/* 55. Write a query in SQL to display all the information of those employees who did not have any job in the past. */

SELECT *
  FROM employees
  WHERE employee_id NOT IN (SELECT employee_id
                              FROM job_history);
