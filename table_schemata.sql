﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" varchar(15)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" int(15)   NOT NULL,
    "dep_no" varchar(15)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(15)   NOT NULL,
    "emp_no" int(15)   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int(15)   NOT NULL,
    "emp_title" varchar(20)   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "sex" varchar(1)   NOT NULL,
    "hire_date" date   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" int(15)   NOT NULL,
    "salary" int(15)   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" varchar(10)   NOT NULL,
    "title" varchar(50)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_emp" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dep_no" FOREIGN KEY("dep_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_emp" ("emp_no");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title" FOREIGN KEY("emp_title")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "dept_emp" ("emp_no");

