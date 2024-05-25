set serveroutput on;


-- Create a function to add two numbers

create or replace function fun_add
	(a IN int, b IN int) 
return int 
is 
	c int;
begin
	c := a + b;
	return c;
end;
/


-- Main PL/SQL block to call the function

declare
	a int := &a_value;
	b int := &b_value;
	c int;

begin
	c := fun_add(a,b);
	dbms_output.put_line('Sum is: ' || c);
end;
/