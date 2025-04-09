${__time(YYMMDD)}
${__javaScript(Math.max(1,5,6))}
${__threadNum} - retruns currently running thread number from 1-max thread in thread group
${__threadGroupName}-returns currently runnning thread group name
${__intSum(1,1,2)} - teturns 4
${__intSum(1,2,MYVAR)} - MYVAR stores the computed value 3
${MYVAR}=5
${__intSum(5,5,{MYVAR})}- returns 15
${__longSum(1,1,2)} - teturns 4
${__longSum(1,2,MYVAR)} - MYVAR stores the computed value 3
${MYVAR}=5
${__longSum(5,5,{MYVAR})}- returns 15
