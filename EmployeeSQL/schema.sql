DROP TABLE dept_emp_junction;
DROP TABLE dept_manager_junction;
DROP TABLE salaries;
DROP TABLE departments;
DROP TABLE employees;
DROP TABLE titles;

CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY NOT NULL,
    title VARCHAR NOT NULL
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title VARCHAR NOT NULL,
	FOREIGN KEY (emp_title)
	REFERENCES titles(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY NOT NULL,
    dept_name VARCHAR
);

CREATE TABLE dept_emp_junction (
    emp_no INT NOT NULL,
	FOREIGN KEY(emp_no)
	REFERENCES employees(emp_no),
    dept_no VARCHAR NOT NULL,
	FOREIGN KEY(dept_no)
	REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager_junction (
    dept_no VARCHAR NOT NULL,
	FOREIGN KEY(dept_no)
	REFERENCES departments(dept_no),
    emp_no INT NOT NULL,
	FOREIGN KEY(emp_no)
	REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
    emp_no INT NOT NULL,
	FOREIGN KEY(emp_no)
	REFERENCES employees(emp_no),
    salary INT NOT NULL
);
