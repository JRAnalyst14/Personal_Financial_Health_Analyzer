# 📊 Personal Financial Health Analyzer & Optimizer 💰

## Introduction  
A **MySQL-based system** to **analyze and optimize personal finances** by tracking income, expenses, savings, investments, and debts.  
It offers **actionable insights**, generates financial reports, and suggests **budget optimizations** to improve financial well-being.

## 🚀 Key Features  
- **Income & Expense Tracking** 📈: Monitor income sources and categorize expenses.  
- **Savings & Investment Analysis** 💹: Track accounts, portfolios & returns.  
- **Debt Management** 💳: Track debts, interest payments & repayment strategies.  
- **Financial Health Scoring** 🏆: Assess financial stability with an AI-driven scoring model.  
- **Budget Optimization** 📉: Get AI-powered recommendations based on past spending.  
- **Role-Based Access Control** 🔒: Secure access with Admin & User roles.

## 📌 Prerequisites  
To run this project, ensure you have:  
✅ **MySQL 8.0 Command Line Client**  
✅ **MySQL 8.0 Workbench**  
✅ Knowledge of **SQL concepts**:  
   - MySQL Statements, Operators, Clauses, Constraints  
   - Subqueries, Joins, User Permissions (Grant & Revoke)  
   - Transactions & Data Analysis Queries  

## 🏗 Database Schema  
**Database Name**: `PersonalFinanceHealth`  
### **Tables**  
📌 `Users`: Stores user details (Admin/User roles).  
📌 `Income`: Tracks income sources.  
📌 `Expenses`: Stores expense categories.  
📌 `Savings`: Monitors savings growth.  
📌 `Investments`: Tracks investment types and returns.  
📌 `Debts`: Manages debt details & interest rates.  

_All tables are linked via **Primary & Foreign Keys**._

## 🔧 Implementation  
1️⃣ **Create Database & Tables**  
```sql
CREATE DATABASE PersonalFinanceHealth;
USE PersonalFinanceHealth;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT,
    username VARCHAR(225) NOT NULL UNIQUE,
    role ENUM('admin','user') NOT NULL,
    password VARCHAR(50) NOT NULL,
    PRIMARY KEY(user_id)
);

CREATE TABLE Income (
    income_id INT AUTO_INCREMENT,
    user_id INT,
    source VARCHAR(100),
    amount DECIMAL(10,2) NOT NULL,
    date DATE,
    PRIMARY KEY(income_id),
    FOREIGN KEY(user_id) REFERENCES Users(user_id)
);
```
_Additional table creation queries are available in the full SQL file._

2️⃣ **Insert Sample Data** _(100+ rows across all tables)_

3️⃣ **Perform Key Financial Analytics**  
✅ **Net Monthly Income Calculation**  
```sql
SELECT users.username, 
       SUM(income.amount) - SUM(expenses.amount) AS net_monthly_income
FROM users
LEFT JOIN income ON users.user_id = income.user_id
LEFT JOIN expenses ON users.user_id = expenses.user_id
WHERE income.date BETWEEN '2023-10-01' AND '2023-10-31'
GROUP BY users.user_id;
```

✅ **Identify High-Interest Debts**  
```sql
SELECT users.username, debts.type, debts.amount, debts.interest_rate
FROM debts
INNER JOIN users ON debts.user_id = users.user_id
WHERE debts.interest_rate > 10
ORDER BY debts.interest_rate DESC;
```

✅ **Generate Financial Health Score**  
```sql
SELECT users.user_id, 
       (SUM(income.amount) - SUM(expenses.amount) - SUM(debts.amount)) / SUM(income.amount) * 100 AS score
FROM users
LEFT JOIN income ON users.user_id = income.user_id
LEFT JOIN expenses ON users.user_id = expenses.user_id
LEFT JOIN debts ON users.user_id = debts.user_id
GROUP BY users.user_id;
```

✅ **Debt Burden Analysis (Debt-to-Income Ratio)**  
```sql
SELECT u.username,
       SUM(d.amount) AS total_debt,
       SUM(i.amount) AS total_income,
       (SUM(d.amount) / SUM(i.amount)) * 100 AS debt_to_income_ratio
FROM Users u
LEFT JOIN Debts d ON u.user_id = d.user_id
LEFT JOIN Income i ON u.user_id = i.user_id
GROUP BY u.user_id
ORDER BY debt_to_income_ratio DESC;
```

## 🔒 User Roles & Permissions  
```sql
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON PersonalFinanceHealth.* TO 'admin'@'localhost' WITH GRANT OPTION;

CREATE USER 'user'@'localhost' IDENTIFIED BY 'user123';
GRANT SELECT ON PersonalFinanceHealth.* TO 'user'@'localhost';
```

## 🔄 Transactions (Safeguard Financial Data)  
✅ **Record Income & Update Savings**  
```sql
START TRANSACTION;
INSERT INTO income (user_id, source, amount, date) VALUES (1, 'Side Hustle', 9000.00, '2023-10-11');
UPDATE savings SET amount = amount + 9000.00 WHERE user_id = 1 AND account_type = 'Emergency Fund';
COMMIT;
```

✅ **Debt Payoff & Update Savings**  
```sql
START TRANSACTION;
UPDATE savings SET amount = amount - 1000.00 WHERE user_id = 1 AND account_type = 'Emergency Fund';
UPDATE debts SET amount = amount - 1000.00 WHERE debts_id = 1;
COMMIT;
```

## 📌 Future Enhancements  
✅ **API Integration**: Fetch real-time financial data.  
✅ **Data Visualization**: Build interactive dashboards 📊.  
✅ **AI-Powered Insights**: Use ML models to predict financial health & recommend strategies 🤖.  

---

## 🎯 Conclusion  
This **Personal Financial Health Analyzer** helps users maintain financial stability by providing **data-driven insights** into their finances.  
It is an excellent **SQL portfolio project**, demonstrating **database design, analytics, and financial problem-solving**.  

📝 **Complete SQL code & reports are available in this repository! Report file has to be downloaded raw**  
📩 _For inquiries, reach out to jayanthrs.rooman@gmail.com
```
