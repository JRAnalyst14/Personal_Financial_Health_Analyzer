CREATE DATABASE PersonalFinanceHealth;
USE PersonalFinanceHealth;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    role ENUM('admin', 'user') NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE Income (
    income_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    source VARCHAR(100),
    amount DECIMAL(10, 2),
    date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Expenses (
    expense_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    category VARCHAR(50),
    amount DECIMAL(10, 2),
    date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Savings (
    saving_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    account_type VARCHAR(50),
    amount DECIMAL(10, 2),
    date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Investments (
    investment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    type VARCHAR(50),
    amount DECIMAL(10, 2),
    return_rate DECIMAL(5, 2),
    date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Debts (
    debt_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    type VARCHAR(50),
    amount DECIMAL(10, 2),
    interest_rate DECIMAL(5, 2),
    due_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE FinancialHealth (
    health_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    score DECIMAL(5, 2),
    date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Users (username, role, password) VALUES
('john_doe', 'user', 'hashed_password_123'),
('jane_smith', 'user', 'hashed_password_456'),
('alice_wang', 'user', 'hashed_password_789'),
('bob_johnson', 'user', 'hashed_password_101'),
('emily_davis', 'user', 'hashed_password_112'),
('michael_brown', 'user', 'hashed_password_131'),
('sarah_miller', 'user', 'hashed_password_415'),
('david_wilson', 'user', 'hashed_password_161'),
('linda_moore', 'user', 'hashed_password_718'),
('admin_user', 'admin', 'hashed_password_919');

INSERT INTO Income (user_id, source, amount, date) VALUES
(1, 'Salary', 3000.00, '2023-10-01'),
(1, 'Freelance', 500.00, '2023-10-15'),
(1, 'Bonus', 1000.00, '2023-10-30'),
(2, 'Salary', 4000.00, '2023-10-01'),
(2, 'Dividends', 200.00, '2023-10-10'),
(2, 'Bonus', 800.00, '2023-10-25'),
(3, 'Salary', 3500.00, '2023-10-01'),
(3, 'Freelance', 600.00, '2023-10-20'),
(3, 'Bonus', 700.00, '2023-10-31'),
(4, 'Salary', 4500.00, '2023-10-01'),
(4, 'Dividends', 300.00, '2023-10-15'),
(4, 'Bonus', 900.00, '2023-10-30'),
(5, 'Salary', 3200.00, '2023-10-01'),
(5, 'Freelance', 400.00, '2023-10-10'),
(5, 'Bonus', 600.00, '2023-10-25'),
(6, 'Salary', 5000.00, '2023-10-01'),
(6, 'Dividends', 250.00, '2023-10-15'),
(6, 'Bonus', 1200.00, '2023-10-31'),
(7, 'Salary', 3800.00, '2023-10-01'),
(7, 'Freelance', 700.00, '2023-10-20'),
(7, 'Bonus', 800.00, '2023-10-30'),
(8, 'Salary', 4200.00, '2023-10-01'),
(8, 'Dividends', 150.00, '2023-10-10'),
(8, 'Bonus', 1000.00, '2023-10-25'),
(9, 'Salary', 3600.00, '2023-10-01'),
(9, 'Freelance', 550.00, '2023-10-15'),
(9, 'Bonus', 750.00, '2023-10-31');

INSERT INTO Expenses (user_id, category, amount, date) VALUES
-- John Doe
(1, 'Rent', 1200.00, '2023-10-01'),
(1, 'Groceries', 300.00, '2023-10-05'),
(1, 'Utilities', 150.00, '2023-10-07'),
(1, 'Entertainment', 200.00, '2023-10-10'),
(1, 'Transportation', 100.00, '2023-10-15'),

-- Jane Smith
(2, 'Rent', 1500.00, '2023-10-01'),
(2, 'Groceries', 400.00, '2023-10-05'),
(2, 'Utilities', 200.00, '2023-10-07'),
(2, 'Entertainment', 250.00, '2023-10-10'),
(2, 'Transportation', 150.00, '2023-10-15'),

-- Alice Wang
(3, 'Rent', 1300.00, '2023-10-01'),
(3, 'Groceries', 350.00, '2023-10-05'),
(3, 'Utilities', 180.00, '2023-10-07'),
(3, 'Entertainment', 220.00, '2023-10-10'),
(3, 'Transportation', 120.00, '2023-10-15'),

-- Bob Johnson
(4, 'Rent', 1400.00, '2023-10-01'),
(4, 'Groceries', 320.00, '2023-10-05'),
(4, 'Utilities', 160.00, '2023-10-07'),
(4, 'Entertainment', 210.00, '2023-10-10'),
(4, 'Transportation', 110.00, '2023-10-15'),

-- Emily Davis
(5, 'Rent', 1100.00, '2023-10-01'),
(5, 'Groceries', 280.00, '2023-10-05'),
(5, 'Utilities', 140.00, '2023-10-07'),
(5, 'Entertainment', 190.00, '2023-10-10'),
(5, 'Transportation', 90.00, '2023-10-15'),

-- Michael Brown
(6, 'Rent', 1600.00, '2023-10-01'),
(6, 'Groceries', 450.00, '2023-10-05'),
(6, 'Utilities', 220.00, '2023-10-07'),
(6, 'Entertainment', 300.00, '2023-10-10'),
(6, 'Transportation', 200.00, '2023-10-15'),

-- Sarah Miller
(7, 'Rent', 1350.00, '2023-10-01'),
(7, 'Groceries', 330.00, '2023-10-05'),
(7, 'Utilities', 170.00, '2023-10-07'),
(7, 'Entertainment', 230.00, '2023-10-10'),
(7, 'Transportation', 130.00, '2023-10-15'),

-- David Wilson
(8, 'Rent', 1450.00, '2023-10-01'),
(8, 'Groceries', 340.00, '2023-10-05'),
(8, 'Utilities', 190.00, '2023-10-07'),
(8, 'Entertainment', 240.00, '2023-10-10'),
(8, 'Transportation', 140.00, '2023-10-15'),

-- Linda Moore
(9, 'Rent', 1250.00, '2023-10-01'),
(9, 'Groceries', 310.00, '2023-10-05'),
(9, 'Utilities', 160.00, '2023-10-07'),
(9, 'Entertainment', 210.00, '2023-10-10'),
(9, 'Transportation', 110.00, '2023-10-15');

INSERT INTO Savings (user_id, account_type, amount, date) VALUES
-- John Doe
(1, 'Emergency Fund', 5000.00, '2023-10-01'),
(1, 'Retirement', 2000.00, '2023-10-01'),

-- Jane Smith
(2, 'Emergency Fund', 7000.00, '2023-10-01'),
(2, 'Retirement', 3000.00, '2023-10-01'),

-- Alice Wang
(3, 'Emergency Fund', 6000.00, '2023-10-01'),
(3, 'Retirement', 2500.00, '2023-10-01'),

-- Bob Johnson
(4, 'Emergency Fund', 5500.00, '2023-10-01'),
(4, 'Retirement', 2200.00, '2023-10-01'),

-- Emily Davis
(5, 'Emergency Fund', 4800.00, '2023-10-01'),
(5, 'Retirement', 1800.00, '2023-10-01'),

-- Michael Brown
(6, 'Emergency Fund', 8000.00, '2023-10-01'),
(6, 'Retirement', 4000.00, '2023-10-01'),

-- Sarah Miller
(7, 'Emergency Fund', 6500.00, '2023-10-01'),
(7, 'Retirement', 2700.00, '2023-10-01'),

-- David Wilson
(8, 'Emergency Fund', 5800.00, '2023-10-01'),
(8, 'Retirement', 2300.00, '2023-10-01'),

-- Linda Moore
(9, 'Emergency Fund', 5200.00, '2023-10-01'),
(9, 'Retirement', 2100.00, '2023-10-01');

INSERT INTO Investments (user_id, type, amount, return_rate, date) VALUES
-- John Doe
(1, 'Stocks', 10000.00, 8.50, '2023-10-01'),
(1, 'Bonds', 5000.00, 3.00, '2023-10-01'),

-- Jane Smith
(2, 'Mutual Funds', 15000.00, 6.00, '2023-10-01'),
(2, 'Real Estate', 20000.00, 5.00, '2023-10-01'),

-- Alice Wang
(3, 'Stocks', 12000.00, 8.00, '2023-10-01'),
(3, 'Bonds', 6000.00, 3.50, '2023-10-01'),

-- Bob Johnson
(4, 'Mutual Funds', 18000.00, 6.50, '2023-10-01'),
(4, 'Real Estate', 25000.00, 5.50, '2023-10-01'),

-- Emily Davis
(5, 'Stocks', 11000.00, 8.20, '2023-10-01'),
(5, 'Bonds', 5500.00, 3.20, '2023-10-01'),

-- Michael Brown
(6, 'Mutual Funds', 20000.00, 7.00, '2023-10-01'),
(6, 'Real Estate', 30000.00, 6.00, '2023-10-01'),

-- Sarah Miller
(7, 'Stocks', 13000.00, 8.30, '2023-10-01'),
(7, 'Bonds', 7000.00, 3.30, '2023-10-01'),

-- David Wilson
(8, 'Mutual Funds', 17000.00, 6.70, '2023-10-01'),
(8, 'Real Estate', 22000.00, 5.70, '2023-10-01'),

-- Linda Moore
(9, 'Stocks', 10500.00, 8.10, '2023-10-01'),
(9, 'Bonds', 5200.00, 3.10, '2023-10-01');

INSERT INTO Debts (user_id, type, amount, interest_rate, due_date) VALUES
-- John Doe
(1, 'Credit Card', 2000.00, 18.00, '2024-01-01'),
(1, 'Student Loan', 10000.00, 5.00, '2025-01-01'),

-- Jane Smith
(2, 'Car Loan', 15000.00, 6.00, '2024-06-01'),
(2, 'Personal Loan', 5000.00, 10.00, '2023-12-01'),

-- Alice Wang
(3, 'Credit Card', 2500.00, 18.50, '2024-02-01'),
(3, 'Student Loan', 12000.00, 5.50, '2025-02-01'),

-- Bob Johnson
(4, 'Car Loan', 18000.00, 6.50, '2024-07-01'),
(4, 'Personal Loan', 6000.00, 10.50, '2023-12-15'),

-- Emily Davis
(5, 'Credit Card', 2200.00, 18.20, '2024-01-15'),
(5, 'Student Loan', 11000.00, 5.20, '2025-01-15'),

-- Michael Brown
(6, 'Car Loan', 20000.00, 7.00, '2024-08-01'),
(6, 'Personal Loan', 7000.00, 11.00, '2023-12-20'),

-- Sarah Miller
(7, 'Credit Card', 2300.00, 18.30, '2024-02-15'),
(7, 'Student Loan', 13000.00, 5.30, '2025-02-15'),

-- David Wilson
(8, 'Car Loan', 17000.00, 6.70, '2024-07-15'),
(8, 'Personal Loan', 5500.00, 10.70, '2023-12-10'),

-- Linda Moore
(9, 'Credit Card', 2100.00, 18.10, '2024-01-10'),
(9, 'Student Loan', 10500.00, 5.10, '2025-01-10');

-- Query 1: Calculate Monthly Net Income for Each User
SELECT u.username, SUM(i.amount) - SUM(e.amount) AS net_income
FROM Users u
LEFT JOIN Income i ON u.user_id = i.user_id
LEFT JOIN Expenses e ON u.user_id = e.user_id
WHERE i.date BETWEEN '2023-10-01' AND '2023-10-31'
GROUP BY u.user_id;

-- Query 2: Identify High-Interest Debts
SELECT u.username, d.type, d.amount, d.interest_rate
FROM Debts d
JOIN Users u ON d.user_id = u.user_id
WHERE d.interest_rate > 10
ORDER BY d.interest_rate DESC;

-- Query 3: Generate Financial Health Score
SELECT u.user_id, 
       (SUM(i.amount) - SUM(e.amount) - SUM(d.amount)) / SUM(i.amount) * 100 AS score,
       NOW()
FROM Users u
LEFT JOIN Income i ON u.user_id = i.user_id
LEFT JOIN Expenses e ON u.user_id = e.user_id
LEFT JOIN Debts d ON u.user_id = d.user_id
GROUP BY u.user_id;

-- Query 4: Suggest Budget Optimization
SELECT u.username, e.category, AVG(e.amount) AS avg_spending
FROM Expenses e
JOIN Users u ON e.user_id = u.user_id
GROUP BY u.user_id, e.category
HAVING avg_spending >= (SELECT AVG(amount) FROM Expenses WHERE category = 'Entertainment');

-- Query 5: Calculate Savings Growth Rate
SELECT u.username, s.account_type, 
       (s.amount / (SELECT SUM(amount) FROM Savings WHERE user_id = s.user_id)) * 100 AS growth_rate
FROM Savings s
JOIN Users u ON s.user_id = u.user_id;

-- Query 6: Debt Burden Analysis (Debt-to-income ratio)
SELECT 
    u.username,
    SUM(d.amount) AS total_debt,
    SUM(i.amount) AS total_income,
    (SUM(d.amount) / SUM(i.amount)) * 100 AS debt_to_income_ratio
FROM Users u
LEFT JOIN Debts d ON u.user_id = d.user_id
LEFT JOIN Income i ON u.user_id = i.user_id
GROUP BY u.user_id
ORDER BY debt_to_income_ratio DESC;

-- Query 7: Investment Performance Analysis
SELECT 
    u.username,
    i.type AS investment_type,
    i.amount AS investment_amount,
    i.return_rate,
    (i.amount * i.return_rate / 100) AS expected_annual_return
FROM Users u
JOIN Investments i ON u.user_id = i.user_id
ORDER BY expected_annual_return DESC;

-- Query 8: Monthly Expense Trends
SELECT 
    u.username,
    e.category,
    MONTH(e.date) AS month,
    SUM(e.amount) AS total_spending
FROM Users u
JOIN Expenses e ON u.user_id = e.user_id
GROUP BY u.user_id, e.category, MONTH(e.date)
ORDER BY u.username, month, total_spending DESC;

-- Transaction 1: Record Income and Update Savings
START TRANSACTION;

INSERT INTO Income (user_id, source, amount, date)
VALUES (1, 'Bonus', 500.00, '2023-10-15');

UPDATE Savings
SET amount = amount + 500.00
WHERE user_id = 1 AND account_type = 'Emergency Fund';

COMMIT;

-- Transaction 2: Pay Off Debt and Update Savings
START TRANSACTION;

UPDATE Savings
SET amount = amount - 1000.00
WHERE user_id = 1 AND account_type = 'Emergency Fund';

UPDATE Debts
SET amount = amount - 1000.00
WHERE debt_id = 1;

COMMIT;

-- Transaction 3: Transfer Funds Between Savings Accounts
START TRANSACTION;

UPDATE Savings
SET amount = amount - 1000.00
WHERE user_id = 1 AND account_type = 'Retirement';

UPDATE Savings
SET amount = amount + 1000.00
WHERE user_id = 1 AND account_type = 'Emergency Fund';

COMMIT;

-- Transaction 4: Record Investment and Update Savings
START TRANSACTION;

UPDATE Savings
SET amount = amount - 5000.00
WHERE user_id = 1 AND account_type = 'Emergency Fund';

INSERT INTO Investments (user_id, type, amount, return_rate, date)
VALUES (1, 'Stocks', 5000.00, 8.50, '2023-10-01');

COMMIT;

-- Create Admin User
create user 'admin'@'localhost' identified by 'admin123';
SHOW GRANTS for 'admin'@'localhost';
GRANT ALL PRIVILEGES ON PersonalFinanceHealth.* TO 'admin'@'localhost' WITH GRANT OPTION;
SHOW GRANTS FOR 'admin'@'localhost';

select user, host from mysql.user;

CREATE USER 'users'@'localhost' identified by 'user123';
GRANT SELECT ON PersonalFinanceHealth.* to 'users'@'localhost';