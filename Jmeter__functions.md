${__time(YYMMDD)}
${__javaScript(Math.max(1,5,6))}
${__threadNum} - retruns currently running thread number from 1-max thread in thread group
${__threadGroupName}-returns currently runnning thread group name
${__intSum(1,1,2)} - teturns 4
${__intSum(1,2,MYVAR)} - MYVAR stores the computed value 3
${MYVAR}=5
${__intSum(5,5,{MYVAR})}- returns 15

long values from  -2147483648 to 2147483647
${__longSum(1,1,2)} - teturns 4
${__longSum(1,2,MYVAR)} - MYVAR stores the computed value 3
${MYVAR}=5
${__longSum(5,5,{MYVAR})}- returns 15
${__StringFromFile} -reads the strings from a file
${__StringFromFile(PIN#'.'DAT,,1,2)} - reads PIN1.DAT, PIN2.DAT
${__StringFromFile(PIN.DAT,,,2)} - reads PIN.DAT twice
Note that the "." in PIN.DAT above should not be quoted. In this case the start number is omitted, so the file name is used exactly as is.
${__machineName} - returns machinem name
${__machineIP} - returns machine IP address
