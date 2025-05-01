*** Jmeter Tool UI***
jmeter-template: (pre configured test plan or a structure)adds a default structure to the testplan priorly so depend on the requirement we can choose the corresponding template. recording, recording with think time
jmeter-toggle- enable and diables the selected elements
jmeter start- start the testplan and executes
jmeter start-no puse - ignore all the timers and execute the tests without any pause.
jmeter stop- abruput ending- means-forcefully stop execution
jmeter shutdown button- gracefull ending.means- once the current thread execution completed then it would stop
jmeter clear button- clears the current element 
jmeter clear all button - clears all the elements and refreshes.
jmeter search- can search for elements
jmeter reset serach- erases search
jmeter function helper- can choose the function and generate the syntax and use from it
jmtere help- opens the jmeter documentation
-
***Thread grop***

- using it we can define the virtual users(load), how long they run(duration),  we can use thread lifetime to define how long the load should be on hold.
concurency thread group
stepping threadgroup supports throupit shaping timer where we can define RPS nog the users. rampup tps, hold rps,rampdown rps.

stepping threadgroup is suitable for scalability testing..
rampup and rampdown will be launched as steps

***Architecture***
microservices based architecture : a big app will be hosted devided into its services and hosted individually.

for mobile dialer app: 

contacts service
messages service
serach service
voicemail service
AI transcription service



***Jmeter-Listners***

Listners- shows the request and reponse info like payload and reponse with diffrent metrics depend on the listerner we choose 

view results tree listner(not recommonded only use for debugging consumes much resources)- shows the rquest body nd reponse body, response headers, load time, connect time, message, status code.

View results in table: sample#, start time, threadname, status, received bytes, sent bytes, error %, throughput.
aew  `  
Summary report:

View results in table: sample#, start time, threadname, status, received bytes, sent bytes, error %, throughput.

grapgh results: avarage, median, throughput, deviation.

simple data writer (for highload performance testing): if we upload the csv file in this listener it will append the results to it after the run.

assertion results listner: this listener shows the asserion results passed or failed

***

*** Jmeter-Assertions***

Assertion : it is check to valiadte the jmeter response

types: 

Response assertion: check the response message, status code, response text by comapring the actual and expected values.

Duration assertion: checks the response duartion by provideing expected value in the assertion config part

size assertion: checks the size in bytes and copare the expected size with actual
XML assertion: checks if the response parsed into well formated xml format

HTML assertion: jmeter response is formates using interner jmeter HTML parser so it checks for any errors or warnings exists in the HTML response parsed like broken tags, incompleted elemenents, structural errors. so we will provide threashhold error and warnings counts if actual error and warnings are more than expcted or provided it fails.

Xpath assertion: it checksfor the nodes in the response which matches the provided xpath we can also store the matchings into afile using this, it no matches assertion fails.

Json assertion:

defaultly wont be there so we have to add a plugin-json to write a json expression user.id.job = "engineer" if it matches it pass.

***Jmeter Variables***
Variable stores the values which are defined by user.
syntax: ${userName}
Types: 
1. Local variables: set under the thread level using config elements > user defined variables
2. Global variables: defined in the testplan level 
local variables override the global variables.

***Jmeter controllers***

if controller:

the child elemenst under this will be executed whwne the given conditiojn in the groovy is true. other wise it will be fails. this we can use to faiul next requests if the login request itseld is failed.

Transcation controller:

this we can use to summarize the scenario. if a scenario having 3 steps or 3 reueasts under a transcation controller then aggreage or ssummary reprot listener will show the overall scenario metrics.

loop controller:

it will loop the child samplers under it with the execution times/loop times given to the loop controller. if a csv has 50 user and password user data we can give 50 times to the reuest using loop controller

while controller:
to iterate number of times deoends on a condition:'
under while controller if we send a HTML link parser it will execute all the links.

also if you define a variable count 0
and in the controller if you write a groovy function
${__groovy(vars.get("count") get as int<=10)}
it will run 10 times

critical section controller:
execute one after anothe thread which maintains syncranization which is critical in testing. if 100 users writing a csv file all are try to write at a same time but here at a time only one thread writes.

throughput controller:

contolles how often of the percenatge of the load should execute. so that we can controll the throughput on a server.

Random controller:

piks any one of its child and execute

random order controller:

execute the threads in a random order.

simple controller:

just groups the elements for neat scripting

once only controller: even the the thread is under a looping controller its skips the rules and runs only once.

runtime controller: we can choose hoe much time it should run.

recordning controller: captures broswer while doing recording with HTTP TEST SCROPT recorder

interlative controller: loops up the childs in a series manner so that no thread will be free from execution.

***LOg levels***

OFF
FATAL
ERRORS
WARN
INFO
DEBUG
TRACE

****

How to upload and download file testing 

file upload:

in the sampler request we have to give the file path name and mime type of the file

c:/user/data/jmeter/bin/1.text text/plain 
c:/user/data/jmeter/bin/1.pdf application/pdf


we can store in a CSV and upload bulk using the csv data set config.

File download:

save response to a file will show up the downlaoded files.

think time: delay between the transcations which we can usually define with constant timer.
pacing: delay between iterations which we can define using flow controller action sampler depend on the forumala we can add pacing





***Jmeter Functions***

functions are values that can populate fields of samplers or other elements

Syntax: ${__functionName(),(),()}
${_log"info"}
${__threadNum}
${__threadGroupName}
${__intSum(1,5) value}
${__time (dd MM YYYY)}
${__random(6,abcdefx)}
${__machineName}
${__machineIP}
${__StringToFile}
${__StringFromFile}

controll users rampup and down from the CLI jmeter -n -t "path to jmx" -l "results.jtl"-jusers=10 -jrampup=5 -loopcount=5 
${__p(users,1)}
${__p(rampup,1)}
${__p(rampdown,1)}


*** DistributedLoad Master-Slave***

Master will controll the work nodes. 
jmeter should be installed on all the machine and the version should be same
java should be installed in all the machines
all the machines should be in the same network
then > in the master machine jmeter properties remote machines and rmi section add the salve IP's and comment the current IP of the master.

once its done > start the server and give the command to connect slave IP> it shows conncted > open jmeter remote run the test plan or you can run the jmx by providing -r IP in the test run command.

***Basic Autherization***

testplan > threadgroup > sampler > config eklement > HTTP AUTHORIZATION MANGER > add base url , username, password, type basic 


***post processing elements*** mostly used for corelation
1. json extractor - we will copy the body of previous response and paste it in the json formatter > we will identify the path of an element text and store it in a variable to use in subsequent requests. json path expression may look like $data.[0]id.first_name

2. regular expression extractor

***Thread***
Programm contain a process and it process includes threads.
multiple proceess includes multiple threads.
monotoring thread helath is required to identify bottlenecks.
if high cpu utilization or high elapsed time than expected we may take thread dump to analyse the thread status

usually thread status are: running / blocked / waiting if not then they might struck, stall on, deadlock, high cpu consumption, contention (multiple threads waiting for resources)

with 5 sec gap we have to collect the thread dump

ways to collect:
1. we can directly collect the thread dump if we have access to the app server.
using jstack(Jstack <PID> threaddump.txt ),visual VM
2. if we dont have access then infra team will install agents on the server and then the agent sends the thread health to monotoring server and using url we can get the detailed metrics in a dashboard.

we can do the thread dump analysis manually by observing the cpu utilization time and status or we can use the tools like fast thread by uploading the threaddump file in the tools.

***Heap***
it is a memory occumpied by the object and its references.
GC: garabage collector it is a process or program to clear or kill the unused objects so that there will be a memory for new objects.

common heap errors: 
java.lang.ouofMemoryError.java heap: due to the full of heap there will be no space for new objects.
memory leak: unused objects refrence still exist so the heap will be high

when to take heapsnapshot: outofmemory and low mmory performance, testing new programmes, lags, suggle case.

how to take: we collect this on server side as it hosts the app.
using jcmd command:
jcmd jps: give the process id
jcmd pid GC.heapdump.txt collects the heap. jdk should be installed.
using jmap command:
jmap -dump:live, format=b, file="path//.heapdump.prof 956(PID)

if you are confused using commands JvisualVM is the way we can capture both thread dump and heap dump directly running the process. it will export the file of dumps. just right click on process riunning under visualvm > and click on thread dump or heap dump.

we can profile the heap dump file by exporting it in to eclipse memory anayliser EMAT and it auto triggers and shows the heap details typr of error, shallow heap, retain heap all details.

***challenge you have faced and how to solve it***

While working with NMS project it holds 1 lack user base the maximum concurent and simulatanious users were alwsys below 2000 but at the month end to download the electricity usage statement and billing scenarios there was a very low reponse time then we analysed the cause what scenarios are affecting the performance then we modified the critical scenarios and looked logs from all the app, web, db all are working fine but there is an issue in the DB server cpu utilization and dynatrace also triggred davis AI shown the logs then we collected and raised bug with trace so dev fixed and we retested like this we have optimized some scenarios and finally the app was stable till now.

***Metric definitions***


Vusers: Replica of a real user which mimics the real user behaviour.
Bottleneck : if a resource restrict to perform that issue is a bottleneck.
Scalability : scaling up or scaling down the capacity of the system whenever needed.
Latency: is the time taken to move the datapacket from source to destination.
Request Latency: time taken to reach the data from client to server.
Response latency: time taken to reach the data packets from server back to client.
Round trip latency: Request latency + Response latency.
Throughput: Number of trnscations/requests/data processed by system during the given time frame. it might be requests/sec (RPS) or KB/sec or transcations/sec (TPS) depends on the context.
Response time: time taken to receive the response after the rquest made. it includes time taken to send the reqest + processing by system + sending back to client says as round trip response time.
Average response time: total response time % number of samplers. 3 sampelers 1 sec 3sec 1sec % 3 =1.66 if it is low performance is high.
median response time: middle value before which 50% of the responses were collected and 50% were late to this value.
standard deviation: indicate variation in the response time. it should be close to the average median for good performance should not too low or high to the median line.

starndard deviation population = sqrt of i=1 to N (xi-mean)2%N 1+2+3/3=2 2-1=1sqare =1 > like tat 3-1sr=2 +1-1sqr%3=3/3=0

90% line ex:320ms: 90% of the sampler responses reached before 320ms and remining are received after 320ms
95% line: 95% of the sampler responses reached before 320ms and remining are received after 320ms
99% line: 99% of the sampler responses reached before 320ms and remining are received after 320ms
minimum response time: it is minimum time taken to get the rsponse 
maximum response time: it is the maximum time taken to get the response.
received KB, sent KB: kb received and sent.
Rampup time: gradually launches the users from 0 to its maximum users to mimic the real time load and to avoid spikes and crashes.
Rampdown: gradually push back the load to 0 to mimic the real time load.
steadystate: this is whre we can collect the metrics as the defined peak load holds for the given time.
Saturation: peak point at which the maximum utilization of a resource occurs.
memory utilaztaion: percentage of the memory consumption to process a request.
CPU utilization: percentage of CPU computing power cosumed to process a request.
Concurent users: multiple usres are using the system at the same time but sending diffrent requests/performing diffrent tasks.
Simultationious users: multiple users ar3e using the system at the same time and also sending the same requests or doinsame task.
Think time: simulated time delay between two consequetive actions or requests to mimic the real user behaviour.
Peak time: anticipated busiest time of the server.
Peak load: (TTP: time to peak) highest expected user load on a sarver



*** Performance testing life cycle or process: ***

it includes 11 steps:

1. Requiremt gathering and analysis

in this phase we identify the performance golas such as response time, throuhput time, resource utilization by refering the BRS.
we understand the application archituture and infrastruture.
analyse the expected user patterns/use cases and workload models no of users load, type of tests, gegraphic location using the app.

2. planning and design

in this phase we define testing scope which is under scope which is out of scope.
objectives of testing and test strategy
testing approach we will be follwing
define the workload models and environment setup based on user behaviour.
identifying the risk, timeline, resources required.

3. Environment setup:

we make sure comparing the PROD and Testbeds which should as match as close to PROD environment.
necessary hardware and software and network we mirror with PROD env.

4. Tool selection

depend on the sills of resources
scope
extension
open source depend on these we choose tool

5. Test design
untit test
integration test
whole scenario testing
and verifying the test accuracy
test script generation depend on the real usage patters and senarios.
oprimiize the script using parametrzation and corelation.

6. Test execution

we do execute the scripts

7. Monitoring and analyis 

collect and monitor the KPI's such as response time, avarage time, resource utilization and objectives as part of SLA
identifying the bottle necks

8. Tuning & Optimization

Dev gives fix to tune apps

9. Retest:

we perform retest to verify the fix 
we also perform regression to check the overall helath of existing system

10. Reports:

we generate and create reports

11. Continous monotoring

we do moniotor the helath and report if any issues found

***
how to read a large json body for a POST, PUT, PATCH requests.

we create the json external file and keep the json bosy into it.
in the request body using ${__FileToString(pathof the file),(encryptionoptional),(variable optional)}
we provide the fuction then it will read from the file through function.

***
while doing Load test with 4K threads within 1hr we hold for 66 users per min instead of finishing the 66 users in seconds?

we use arrival thread group to achieve this

Testpalan > arrival thread group > arrivals/min or targetrate/min = 66 , Rampup = 1min, Rampup step count= 10, Hold traget rate time in min =60

it will launch 66 users per min and it holds for 1 hr.

***
how to corelate session ID or customer token ID while authenticating?

from one of the login request response we will see session id generated > we store the ID by writing a regexpression session_ID="(.*?)" > token as variable name so > from the next post requests we use the ${token} variable to post and use the same session ID stored cause it is dynamic in nature every logout it will change

***

How to load ramp up period of 60 seconds, and steady state load for 60 sec  nd rampdown 60 seconds and filter only the steadystte results workloadmodel?

jmeter plugins > install filterresults plugin.


Testplan > ultimate thread group > thread count 10 , Startup time 60 sec, shtdowntime 60 sec, hold load for 60 sec > results tree > save jmx run in cl mode

jmeter -n -t "path to the jmx" -l "path to the results.jtl"

results.jtl will be generated > now, we should keep the terminal directory in to jmeter bin and run the follwing command to trim the first 60 sec and last 60 sec from results.

filterresults.bat --output-file"path/filteredresults.csv" --input-file"path/results.jtl" --startoffset-60 --endoffset-60

we have to make sure the cmdrunnerjar version should be same in the filterresults.bat file otherwise it throws error.

like the same way we can filter patterns like specific http requests using reg expression in the same command including.


*** monitor server metrics using perfmon plugin ***

1. install pluginmanager if not 
2. install perfmon plugin in jmeter
3. install serverAgent on the target device and start the agent before running the jmater test so that it listen the port 4444
4. add perfmon metrics collector lister which shows only when plugin added in jmeter
5. in the listner add IP of the traget device and port 4444 add metrics like CPU, memory, network, disk I/o 
6. run the listener so it collects the server metrics we can compare with native taskmanager to check and then export.
7, we can also combine both jmeter resukts and sever metrics performon collector results and generate report unsing influx db + gafana

***interview questions***


performance testig: it is NFT where we can assess the system stability, scalability, speed under diffrent realistic user load conditions so that by collecting the server health matrics we can identify the bottlenecks and tune the app to optimize the user experience.

Load testing : its a type of testing we always perform under anticipated or expected/normal load for example if a system is having the load of 1000 conc users we do test in that borders only 500-1000 users. 

stress testing: testing the system beyond the normal load to identify the breaking point. with 1500 users if normal load is 1000 users. if it perfroms well with 1500 users we will add another step of load with 1800 then it still performs well we test with 2k users. this is to identify the system stability limmits and future growth.

endurance/soak testing: to identify the memory leaks and longrun system helath we do provide the normal load only buut with longer hours like 8-12 or 24hrs. to check heap and thred behaviour along with server health this is to assess the effeciency under longer run.

scalability testing: to assess the system scaling behaviour its scaling or not for unexexpected load.

voulme testing: it will be tested with huge data on server to check how it is handeling

Benchmark testing: we only define the benchmarks like users, response time, throughput then we apply load according to it.


what are diffrent type of bittlenecks:

Network badwidth: slow or overused network causes delay in client-server communication.
CPU Overload: for heavy tasks and ineffecient processing causes slow processing and response time.
Memory lock/shoratge: unorganized memory causes slow performance.
DISk i/o bottle neck: slow read and write operations rate degrades performance.
cahing strategy: frequently used data is not defined then it puts load on db and quiries evrytime causes slow performance.
Contention: multiple objects are waiting for same resources causes locking causes dead lock.
poor garbage collection: causes low performance in long run.
poor threading mechanisim: scalability will be slow




TTFB: 
Time to First Byte (TTFB): DNS lookup time+connection time+processing time.
Amount of time it takes for a user's web browser to receive the first byte of data from the
server after making.

Environment Differences
Production: 8-node server cluster, high-speed network, dedicated databases.
Test: 2-node server cluster, lower-speed network, shared databases.

beanshellscripting:
apart from controllers we have and threadgroup we have all the elements
from beanshell.

beanshell sampler
beanshell pre processor
beanshell post processor
beanshell timer
beanshell listener

beansgell preprocessor 

we can execute some script
and store it in a variable so that we can use that variable anywhere in the sampler name

adding curremt date to the sampler title so that it will show 

code
we have to inport the java library pakages
java.util.text.*
java.util.date.*


Date date=new Date();
SimpleDateFormatter formatter=new SimpleDateFormatter(DD-MM-YY);
String currentdate = formtatter.formate(date)

Tis current date cariable we can give in the sampler with dolaler{currentdate}


***server side profiling-Your kit profiling***

CPU profiling - System CPU
CPU + kernal
overall CPU

start an app and take snapshot or profiling the it generate results.

Memory profilinh
gc calls average
gc call time
heap memory
non heap memory 
snapshot  and profiling

---------String to file--------------------------
def filePath = "C:/JMeter/output/user_ids.txt"
def file = new File(filePath)
file << vars.get("userId") + System.lineSeparator()

-----------String from file--------------------
def filePath = "C:/JMeter/output/data.txt"
def fileContent = new File(filePath).text.trim()
vars.put("loadedData", fileContent) // now use ${loadedData} in your sampler












