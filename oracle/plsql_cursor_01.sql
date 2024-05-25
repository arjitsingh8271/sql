/*
SQL> CREATE TABLE employees (employee_id NUMBER, first_name VARCHAR2(50), last_name VARCHAR2(50),salary NUMBER);
SQL> INSERT INTO employees VALUES (1, 'John', 'Doe', 5000);
SQL> INSERT INTO employees VALUES (2, 'Jane', 'Smith', 6000);
SQL> INSERT INTO employees VALUES (3, 'Alice', 'Johnson', 7000);
SQL> INSERT INTO employees VALUES (4, 'Bob', 'Brown', 5500);
SQL> INSERT INTO employees VALUES (5, 'Carol', 'Davis', 6500);
*/


SET SERVEROUTPUT ON;

DECLARE
    -- Declare variables to store employee details
    emp_first_name employees.first_name%TYPE;
    emp_last_name employees.last_name%TYPE;
    emp_salary employees.salary%TYPE;
    
    -- Declare a cursor to fetch employee data
    CURSOR emp_cursor IS
        SELECT first_name, last_name, salary FROM employees;
BEGIN
    -- Open the cursor
    OPEN emp_cursor;
    
    -- Loop through the cursor to fetch each row
    LOOP
        -- Fetch data into variables
        FETCH emp_cursor INTO emp_first_name, emp_last_name, emp_salary;
        
        -- Exit loop if no more rows to fetch
        EXIT WHEN emp_cursor%NOTFOUND;
        
        -- Display employee details
        DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp_first_name || ' ' || emp_last_name || ', Salary: ' || emp_salary);
    END LOOP;
    
    -- Close the cursor
    CLOSE emp_cursor;
END;
/


/*
SQL> @ C:\Users\Arjit\Desktop\pl_sql_programm\plsql_cursor_01.sql
Employee Name: John Doe, Salary: 5000
Employee Name: Jane Smith, Salary: 6000
Employee Name: Alice Johnson, Salary: 7000
Employee Name: Bob Brown, Salary: 5500
Employee Name: Carol Davis, Salary: 6500
*/