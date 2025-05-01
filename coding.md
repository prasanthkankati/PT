✅ 1. How do you add a custom header using Groovy in JMeter?
Answer:

groovy
Copy
Edit
import org.apache.jmeter.protocol.http.control.Header
import org.apache.jmeter.protocol.http.control.HeaderManager

HeaderManager headerManager = new HeaderManager()
headerManager.add(new Header("Authorization", "Bearer xyz-token-123"))
sampler.setHeaderManager(headerManager)
Explanation:
This script adds a custom HTTP header (like Authorization) to a sampler. This is useful when APIs need auth tokens or custom headers. HeaderManager stores the headers and attaches it to the request.

What is a Header?

In the world of web and APIs, a header is a key-value pair sent along with the request or response that carries meta-information — like:

Who’s sending the request (User-Agent)

What format the data is in (Content-Type: application/json)

Auth tokens (Authorization: Bearer <token>)

Caching rules, language preferences, etc.

Think of it like the envelope info on a letter — it's not the content, but helps the server know how to handle the content.


✅ 2. How do you generate a random string in Groovy for a unique request ID?


def randomID = UUID.randomUUID().toString()
vars.put("uniqueID", randomID)

✅ 3. How do you log sampler request and response data using Groovy?
Answer:

groovy
Copy
Edit
log.info("Request: " + prev.getSamplerData())
log.info("Response: " + prev.getResponseDataAsString())
Explanation:
prev is the SampleResult object. This script logs the full HTTP request sent and the response received. Useful for debugging.

✅ 4. How do you parse JSON response and extract a field using Groovy?
Answer:

groovy
Copy
Edit
import groovy.json.JsonSlurper

def response = prev.getResponseDataAsString()
def json = new JsonSlurper().parseText(response)
vars.put("userId", json.data.user.id.toString())
Explanation:
This reads a JSON API response and extracts the nested field data.user.id, storing it in a JMeter variable.

✅ 5. How do you loop through an array in a JSON response and print values using Groovy?
Answer:

groovy
Copy
Edit
import groovy.json.JsonSlurper

def jsonResponse = new JsonSlurper().parseText(prev.getResponseDataAsString())
jsonResponse.users.each { user ->
    log.info("User: ${user.name}, ID: ${user.id}")
}
Explanation:
If your API returns a list of users, this iterates over them and prints each name and ID. .each {} is Groovy's way to loop elegantly.

✅ 6. How do you create a custom sampler using Java code in JSR223?
Answer:

java
Copy
Edit
String endpoint = "https://api.example.com/data";
HttpURLConnection conn = (HttpURLConnection) new URL(endpoint).openConnection();
conn.setRequestMethod("GET");

int responseCode = conn.getResponseCode();
String response = conn.getInputStream().getText();
vars.put("apiResponse", response);
Explanation:
This Java-style code inside a JSR223 Sampler hits an endpoint and stores the response in a JMeter variable. Good when not using HTTP Sampler.

✅ 7. How do you perform assertions in Groovy for response validation?
Answer:

groovy
Copy
Edit
def response = prev.getResponseDataAsString()
if (!response.contains("success")) {
    AssertionResult.setFailure(true)
    AssertionResult.setFailureMessage("Expected keyword not found")
}
Explanation:
You manually throw an assertion failure if success is missing. Great for fine-grained control beyond built-in Response Assertion.

✅ 8. How do you write a reusable Groovy function in a JSR223 Sampler?
Answer:

groovy
Copy
Edit
def square(num) {
    return num * num
}
def result = square(5)
log.info("Square: ${result}")
Explanation:
Groovy supports defining functions inline. Helpful when logic gets complex and you'd like to organize it cleanly.


✅ 9. How to read a CSV file using Groovy and use it inside the test?
Answer:

groovy
Copy
Edit
def file = new File("/path/to/data.csv")
file.eachLine { line ->
    def values = line.split(",")
    log.info("Name: ${values[0]}, Age: ${values[1]}")
}
Explanation:
This reads each line of a CSV file manually. You can use this in pre-processing when you don't want to use JMeter’s built-in CSV Data Set Config.

✅ 10. How do you send a POST request with JSON payload using Groovy?
Answer:

groovy
Copy
Edit
def url = new URL("https://api.example.com/users")
def conn = url.openConnection()
conn.setRequestMethod("POST")
conn.setRequestProperty("Content-Type", "application/json")
conn.doOutput = true

def payload = '{"name":"John","email":"john@example.com"}'
conn.outputStream.write(payload.bytes)

def response = conn.inputStream.text
vars.put("apiResponse", response)
Explanation:
This is a raw POST request with a JSON body. Useful when HTTP Sampler doesn't give the flexibility needed for dynamic headers or payloads.

✅ 11. How do you handle a timeout for an HTTP request in Groovy?
Answer:

groovy
Copy
Edit
def url = new URL("https://api.example.com/slow-response")
HttpURLConnection conn = (HttpURLConnection) url.openConnection()
conn.setConnectTimeout(5000) // 5 seconds
conn.setReadTimeout(5000)

try {
    def response = conn.inputStream.text
    vars.put("slowResponse", response)
} catch (Exception e) {
    log.error("Request timeout or failure: " + e.message)
    vars.put("slowResponse", "TIMEOUT")
}
Explanation:
You set connect and read timeouts. If exceeded, the script catches the exception and logs it, avoiding test failure crashes.

✅ 12. How do you extract a value from an XML response using Groovy?
Answer:

groovy
Copy
Edit
def response = prev.getResponseDataAsString()
def xml = new XmlSlurper().parseText(response)
def orderId = xml.order.id.text()
vars.put("orderId", orderId)
Explanation:
XmlSlurper helps parse XML. You extract a node value using .text() and store it in a JMeter variable for future use.





