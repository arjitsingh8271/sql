set serveroutput on;

create or replace function concatenate_string
	(str1 IN varchar, str2 IN varchar)
return varchar
is
	result varchar(50);
begin
	result := str1 ||' '|| str2;
	return result;
end;
/

declare
	str1 varchar(20) := '&input';
	str2 varchar(20) := '&input';
	str3 varchar(50);
begin
	str3 := concatenate_string(str1, str2);
	dbms_output.put_line('Concatenated String is: ' || str3);
end;
/