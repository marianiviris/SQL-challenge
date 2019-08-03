create table departments (
dept_no varchar(100) not null primary key,
dept_name varchar(100) not null);
SELECT * FROM departments

drop table if exists dept_emp;
create table dept_emp (
emp_no Int not null,
dept_no varchar(100) not null references departments (dept_no),
from_date date,
to_date date);
SELECT * FROM dept_emp

create table employees (
emp_no Int not null primary key,
birth_date date,
first_name varchar(50) not null,
last_name varchar(50) not null,
gender varchar(10),
hire_date date);
SELECT * FROM employees

drop table if exists manager;
create table manager (
dept_no varchar(100) not null references departments (dept_no),
emp_no Int not null references employees (emp_no),
from_date date,
to_date date);
SELECT * FROM manager

create table salaries (
emp_no Int not null references employees (emp_no),
salary Int,
from_date date,
to_date date);
SELECT * FROM salaries

create table titles (
emp_no Int not null references employees (emp_no),
title varchar(50),
from_date date,
to_date date);
SELECT * FROM titles











