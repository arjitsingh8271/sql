set serveroutput on;

declare

	n number:=&Enter_the_number;
	temp number:=0;
	rem number;
	len number;
	m number;

begin
	if n<0 
	then
		n:= n*(-1);
	end if;
	m:=n;
	len:=length(to_char(n));
	while n>0 
	loop
		rem:=mod(n,10);
		temp:=temp+power(rem,len);
		n:=floor(n/10);
	end loop;

	if m=temp
	then
		dbms_output.put_line(m || ' is Armstrong number');
	else
		dbms_output.put_line(m || ' is Not Armstrong number');
	end if;
end;
/
	
