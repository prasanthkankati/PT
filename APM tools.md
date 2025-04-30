Datadog tutorial:

Four golden signals to monotor:

1. Latency - time required to fulfill the request.
2. Traffic - no of hits per second
3. Errors - Failure rate
4. Saturartion - % of resource consumption.
   
![Data dog dashboard](https://github.com/user-attachments/assets/1fc5fe0d-771c-46e6-9ba6-1bdfed1c458c)

**Datadog** you can use it to **pinpoint bottlenecks, track system health, and validate your load test results live**.

---

## 🔭 What You Can Monitor in Datadog (Performance Testing Perspective)

### 🔹 1. **Infrastructure Metrics**
> 📍 *Monitor the server health where your app or DB is running*

- **CPU Usage**
- **Memory Usage**
- **Disk I/O**
- **Network In/Out**
- **Load Average**
- DB connections (SQL Server, Mongo, etc.)

🛠 How? Use the **Datadog Agent** on your EC2, VM, or container.

---

### 🔹 2. **Application Performance Monitoring (APM)**
> 📍 *Trace requests end-to-end — API to DB and back*

- API request latency
- Route-level performance (`/getBill`, `/payBill`)
- Error rates per endpoint
- DB query execution time
- Bottlenecks across microservices (if you're testing a microservices app)

🛠 Use **Datadog APM SDK** (supports Java, .NET, Node.js, etc.)

---

### 🔹 3. **Logs (Log Management)**
> 📍 *Search through logs during your JMeter test in real-time*

- API response errors (500s, timeouts)
- App crashes or stack traces
- Custom business logs (like "Bill Not Found" or "Payment Failed")
- Correlate logs with metrics and traces

🛠 Ingest logs via Agent or log forwarders (Docker, Fluentd)

---

### 🔹 4. **Dashboards**
> 📍 *Build custom visual dashboards during/after load tests*

- Real-time graphs for latency, throughput, error rate
- Heatmaps for response time distribution
- Alerts + annotations when a JMeter test starts/stops
- Combine infra, APM, and logs in one view

---

### 🔹 5. **Alerting**
> 📍 *Set up smart alerts for any metric threshold*

- Alert when:
  - CPU > 80%
  - Error rate > 2%
  - Request latency > 2s
- Notify via Slack, Teams, Email, PagerDuty, etc.

---

### 🔹 6. **Synthetic Monitoring (Optional)**
> 📍 *Simulate user journeys from global locations*
- Can be used alongside JMeter to simulate availability checks

---

## 🧪 Example Use Case for You:

Say you're running a **JMeter load test** on your electrical billing app:
- Use **APM** to see which API (`/payBill`, `/viewStatement`) is slowing down
- Use **Infra metrics** to see if DB CPU is spiking
- Use **Logs** to confirm if errors are coming from payment service
- Set a **dashboard + alert** to trigger if latency > 2s during test

---

Want a **step-by-step Datadog setup plan** or a **test project to monitor with it**?





