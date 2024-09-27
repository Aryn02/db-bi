--Assignment1
--Ex1
-- Create the sales table (if not already created) for PostgreSQL
CREATE TABLE sales
(
    product_id INT,
    date       DATE,
    revenue    NUMERIC(10, 2)
);

-- Insert 20 sample records into the sales table
INSERT INTO sales (product_id, date, revenue)
VALUES (1, '2024-09-01', 500.00),
       (2, '2024-09-02', 350.00),
       (3, '2024-09-01', 400.00),
       (4, '2024-09-03', 600.00),
       (5, '2024-09-04', 200.00),
       (1, '2024-09-02', 700.00),
       (2, '2024-09-03', 450.00),
       (3, '2024-09-02', 500.00),
       (4, '2024-09-05', 550.00),
       (5, '2024-09-06', 300.00),
       (1, '2024-09-03', 800.00),
       (2, '2024-09-04', 250.00),
       (3, '2024-09-03', 600.00),
       (4, '2024-09-06', 650.00),
       (5, '2024-09-07', 350.00),
       (1, '2024-09-04', 900.00),
       (2, '2024-09-05', 400.00),
       (3, '2024-09-04', 750.00),
       (4, '2024-09-07', 700.00),
       (5, '2024-09-08', 450.00);

select *
from sales;

SELECT product_id,
       SUM(revenue) AS total_revenue,
       MAX(date)    AS most_recent_sale_date
FROM sales
GROUP BY product_id
ORDER BY total_revenue DESC, most_recent_sale_date DESC
LIMIT 5;

INSERT INTO sales (product_id, date, revenue)
VALUES (4, '2024-09-07', 400.00);

--Ex2
CREATE table employee_salary
(
    employee_id   INT,
    department_id INT,
    salary        NUMERIC
);

INSERT INTO employee_salary (employee_id, department_id, salary)
VALUES (1, 101, 5000.00),
       (2, 102, 4500.00),
       (3, 101, 4800.00),
       (4, 103, 5300.00),
       (5, 102, 5200.00),
       (6, 101, 5100.00),
       (7, 103, 4700.00),
       (8, 104, 6000.00),
       (9, 102, 4900.00),
       (10, 104, 5800.00),
       (11, 101, 5500.00),
       (12, 103, 4600.00),
       (13, 104, 6200.00),
       (14, 105, 4900.00),
       (15, 102, 5400.00),
       (16, 105, 5800.00),
       (17, 101, 6000.00),
       (18, 103, 5100.00),
       (19, 105, 4700.00),
       (20, 104, 6100.00);

SELECT department_id, avg(employee_salary.salary) AS average_salary
from employee_salary
GROUP BY department_id
order by average_salary DESC;

--Ex3
CREATE TABLE monthly_sales
(
    year        INT,
    month       INT,
    total_sales NUMERIC(10, 2),
    region      VARCHAR(50)
);

INSERT INTO monthly_sales (year, month, total_sales, region)
VALUES (2023, 1, 15000.00, 'North'),
       (2023, 1, 12000.00, 'South'),
       (2023, 1, 11000.00, 'East'),
       (2023, 1, 13000.00, 'West'),
       (2023, 2, 16000.00, 'North'),
       (2023, 2, 14000.00, 'South'),
       (2023, 2, 15000.00, 'East'),
       (2023, 2, 12500.00, 'West'),
       (2023, 3, 17000.00, 'North'),
       (2023, 3, 13500.00, 'South'),
       (2023, 3, 16000.00, 'East'),
       (2023, 3, 14500.00, 'West'),
       (2024, 1, 18000.00, 'North'),
       (2024, 1, 15500.00, 'South'),
       (2024, 1, 14000.00, 'East'),
       (2024, 1, 16000.00, 'West'),
       (2024, 2, 19000.00, 'North'),
       (2024, 2, 16500.00, 'South'),
       (2024, 2, 17000.00, 'East'),
       (2024, 2, 15000.00, 'West');

SELECT region, year, month, SUM(monthly_sales.total_sales) AS total_sales_by_region
from monthly_sales
GROUP BY region, year, month
ORDER BY year asc;

SELECT year,monthly_sales.region,month, sum(monthly_sales.total_sales) as total_sales from monthly_sales
group by year,region, month
order by year asc, month asc ;

--ex4
-- Create the departments table
CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(50)
);

-- Create the employees table with department_id
CREATE TABLE employees (
    employee_id INT,
    salary NUMERIC,
    department_id INT
);

-- Insert sample records into the departments table
INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing');

-- Insert sample records into the employees table
INSERT INTO employees (employee_id, salary, department_id) VALUES
(1, 60000.00, 1),
(2, 70000.00, 1),
(3, 80000.00, 2),
(4, 75000.00, 2),
(5, 90000.00, 3),
(6, 85000.00, 3),
(7, 50000.00, 4),
(8, 55000.00, 4),
(9, 95000.00, 3),
(10, 72000.00, 2);

SELECT department_name, avg(employees.salary) as average_salary from employees
join departments d on employees.department_id = d.department_id
group by department_name order by average_salary desc ;





