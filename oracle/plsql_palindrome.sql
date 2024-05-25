SET SERVEROUTPUT ON;

DECLARE
    num NUMBER := &input_number;
    temp NUMBER := num;
    reverse_num NUMBER := 0;
BEGIN

    -- Reverse the number
    WHILE temp > 0 
    LOOP
        reverse_num := (reverse_num * 10) + temp mod 10;
        temp := trunc(temp/10);
    END LOOP;

    -- Check if the original number is equal to its reverse
    IF num = reverse_num THEN
        DBMS_OUTPUT.PUT_LINE('The number ' || num || ' is a palindrome.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The number ' || num || ' is not a palindrome.');
    END IF;
END;
/