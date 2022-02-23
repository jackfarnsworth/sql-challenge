CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY NOT NULL,
    title VARCHAR(18) NOT NULL
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_title)
	REFERENCES titles(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(18)
);

CREATE TABLE dept_emp_junction (
    emp_no INT NOT NULL,
	FOREIGN KEY(emp_no)
	REFERENCES employees(emp_no),
    dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY(dept_no)
	REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager_junction (
    dept_no VARCHAR(4) NOT NULL,
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
