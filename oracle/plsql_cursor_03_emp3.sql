/*
Emp3 (Name, Salary, Dep_no)
to increase the salary of the emp according to the following loop

Salary of Dep 10 increase by 1000
Salary of Dep 20 increase by 5000
Salary of Dep 30 increase by 800
*/


/*
SQL> create table emp3(Name varchar(10), Salary int, Dep_no int primary key);
SQL> insert into Emp3 values('Rahul', 2000, 10);
SQL> insert into Emp3 values('Amit', 3200, 20);
SQL> insert into Emp3 values('Sourav', 1200, 30);
SQL> select * from emp3;
NAME           SALARY     DEP_NO
---------- ---------- ----------
Rahul            2000         10
Amit             3200         20
Sourav           1200         30
*/


SET SERVEROUTPUT ON;

DECLARE
    v_dep_no emp3.dep_no%TYPE;
BEGIN
    -- Loop through the Emp3 table
    FOR emp3_rec IN (SELECT Name, Salary, Dep_no FROM Emp3) LOOP
        v_dep_no := emp3_rec.Dep_no;
        
        -- Increase salary based on department number
        IF v_dep_no = 10 THEN
            -- Increase salary by 1000 for department 10
            UPDATE Emp3 SET Salary = Salary + 1000 WHERE Name = emp3_rec.Name;
        ELSIF v_dep_no = 20 THEN
            -- Increase salary by 1000 for department 20
            UPDATE Emp3 SET Salary = Salary + 1000 WHERE Name = emp3_rec.Name;
        ELSIF v_dep_no = 30 THEN
            -- Increase salary by 800 for department 30
            UPDATE Emp3 SET Salary = Salary + 800 WHERE Name = emp3_rec.Name;
        END IF;
        
        -- Commit the transaction after each update
        COMMIT;
    END LOOP;
END;
/




/*
SQL> @ C:\Users\Arjit\Desktop\pl_sql_programm\plsql_cursor_03_emp3.sql

PL/SQL procedure successfully completed.

SQL> select * from emp3;

NAME           SALARY     DEP_NO
---------- ---------- ----------
Rahul            3000         10
Amit             8200         20
Sourav           2000         30
*/
