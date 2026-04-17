

## 🚀 How to Run the Project

### 📌 Prerequisites
- JDK 8+
- Apache Tomcat 9
- MySQL (or XAMPP)
- Eclipse IDE
- MySQL Connector (JDBC)

---

### ⚙️ Setup Steps

1. Clone the repository:

git clone https://github.com/your-username/UserCRUDProject.git

2. Import project into Eclipse

3. Add MySQL Connector `.jar` to project (Build Path)

4. Create database:

CREATE DATABASE userdb;

CREATE TABLE users (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
email VARCHAR(100),
password VARCHAR(100)
);

5. Update DB credentials in servlet:
```java
jdbc:mysql://localhost:3306/userdb

	6.	Run on Tomcat server
	7.	Open:

http://localhost:8080/UserCRUDProject/register.jsp


⸻

⚠️ Important
	•	Start MySQL before running
	•	Start Tomcat server
