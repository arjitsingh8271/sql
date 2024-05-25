/*
Consider a plsql code to calculate a total % marks of the student in 
four subject from table result which has the following structure
Result (Roll_no, S1, S2, S3, S4, Total, Percentage)
*/


/*
SQL> create table Result (Roll_no int primary key, S1 int, S2 int, S3 int, S4 int, Total int, Percentage int);
SQL> insert into Result values(1, 56, 45, 66, 78, NULL, NULL);
SQL> insert into Result values(2, 76, 55, 50, 78, NULL, NULL);
SQL> insert into Result values(3, 76, 95, 70, 88, NULL, NULL);
*/

SET SERVEROUTPUT ON;

DECLARE
    v_roll_no result.roll_no%TYPE;
    v_total_marks NUMBER;
    v_percentage NUMBER;
BEGIN
    -- Open cursor to fetch data from the result table
    FOR rec IN (SELECT roll_no, s1, s2, s3, s4 FROM result) LOOP
        v_roll_no := rec.roll_no;
        
        -- Calculate total marks
        v_total_marks := rec.s1 + rec.s2 + rec.s3 + rec.s4;
        
        -- Calculate percentage
        v_percentage := (v_total_marks / 400) * 100;  -- Assuming each subject has a maximum of 100 marks
        
        -- Update the total and percentage in the result table
        UPDATE result
        SET total = v_total_marks,
            percentage = v_percentage
        WHERE roll_no = v_roll_no;
        
        -- Commit the transaction
        COMMIT;
        
        -- Display the calculated total and percentage for the current student
        DBMS_OUTPUT.PUT_LINE('Roll No: ' || v_roll_no || ', Total Marks: ' || v_total_marks || ', Percentage: ' || v_percentage || '%');
    END LOOP;
END;
/



/*
SQL> @ C:\Users\Arjit\Desktop\pl_sql_programm\plsql_cursor_02.sql
Roll No: 1, Total Marks: 245, Percentage: 61.25%
Roll No: 2, Total Marks: 259, Percentage: 64.75%
Roll No: 3, Total Marks: 329, Percentage: 82.25%
*/
