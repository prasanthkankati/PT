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

how data dog collects data:
You don’t even need the agent sometimes. Datadog can pull metrics from cloud services:

AWS CloudWatch, Azure Monitor, GCP Stackdriver

MongoDB Atlas, PostgreSQL, Redis

Nginx, MySQL, Kubernetes, Docker

📌 Just configure the API keys and select services to monitor.

but usually.. it collects the data like this

| Source Type           | Tool Used         | Data Collected              |
|-----------------------|-------------------|-----------------------------|
| Server Metrics        | Datadog Agent     | CPU, RAM, disk, network     |
| Application Metrics   | APM SDK           | API latency, DB time        |
| Logs                  | Agent / Log shipper| Errors, warnings, traces    |
| Cloud Services        | API Integration   | AWS/Azure/GCP metrics        |
| User Journeys         | Synthetic Tests   | Availability, response time |


![Screenshot 2025-04-30 2 51 24 PM](https://github.com/user-attachments/assets/34defcfa-a94c-4472-a6ed-304fb45dc588)
![Screenshot 2025-04-30 2 57 30 PM](https://github.com/user-attachments/assets/3edafd4c-4583-4dac-afe6-bfc250a34610)
![Screenshot 2025-04-30 2 59 31 PM](https://github.com/user-attachments/assets/2f90826b-f85c-4aec-84ae-fc41d529ce64)
![Screenshot 2025-04-30 3 02 48 PM](https://github.com/user-attachments/assets/cd0e3fc0-275b-4d4f-8885-78027e973d19)
![Screenshot 2025-04-30 3 13 14 PM](https://github.com/user-attachments/assets/38ecc150-7072-4690-b9ea-22cbe791f8bf)
![Screenshot 2025-04-30 3 15 00 PM](https://github.com/user-attachments/assets/66567a5c-c4c9-4651-8249-bb943832f0bd)
![Screenshot 2025-04-30 3 19 00 PM](https://github.com/user-attachments/assets/64c8381a-7d23-4488-8a5b-1630ce47c019)
![Screenshot 2025-04-30 3 19 25 PM](https://github.com/user-attachments/assets/f1b9246a-5623-4f18-a02e-e83d48e46635)
![Screenshot 2025-04-30 3 20 30 PM](https://github.com/user-attachments/assets/165a1795-c713-499d-a521-aceb7bf274a4)
![Screenshot 2025-04-30 3 21 31 PM](https://github.com/user-attachments/assets/1533eb87-49d6-414a-a891-a4bb3a5d5a1d)
![Screenshot 2025-04-30 3 23 53 PM](https://github.com/user-attachments/assets/f2742dac-64c7-43d6-a31a-2e74e599d442)
![Screenshot 2025-04-30 3 45 19 PM](https://github.com/user-attachments/assets/3ee4f21f-0704-42df-b7f2-beccbbe5c2c8)
![Screenshot 2025-04-30 3 59 25 PM](https://github.com/user-attachments/assets/46692989-38c2-4432-b283-9b87b26e4d0e)
![Screenshot 2025-04-30 4 02 59 PM](https://github.com/user-attachments/assets/17d0ed5c-8cff-43ca-80c9-e925e64c9fc0)
![Screenshot 2025-04-30 4 13 23 PM](https://github.com/user-attachments/assets/8662af9a-c2a0-4224-8e6f-023ba8319f98)
![Screenshot 2025-04-30 4 24 12 PM](https://github.com/user-attachments/assets/5ba7cea9-ded7-4acb-b6e3-fb6433af0ad2)
![Screenshot 2025-04-30 4 28 13 PM](https://github.com/user-attachments/assets/23c1257b-a0c3-4c34-958a-a7144b5996dc)











