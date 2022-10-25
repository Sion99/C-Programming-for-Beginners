--Lab#6-1

select Dname, Count(*) number_of_Employee
from Department join Employee on dno = dnumber
group by dname
having AVG(salary) >= 20000
order by number_of_Employee desc;

--DNAME           NUMBER_OF_Employee
--------------- ------------------
--Research                         4
--Administration                   3
--Headquarters                     1


select Dnumber,Dname, COUNT(*) Number_Of_Female_Employee
from Department, Employee
where Dno = Dnumber and sex = 'F' and dname in (select Dname
from Department, Employee
where Dno = Dnumber
group by Dname
having AVG(salary) > 20000)
group by Dnumber, Dname
order by Dnumber, Dname;

--   DNUMBER DNAME           NUMBER_OF_FEMALE_Employee
---------- --------------- -------------------------
--        4 Administration                          2
--       5 Research                                1

--Lab#6-2

select fname, lname, salary
from Employee
where not exists (( select pnumber
from Project
where dnum = 1)
minus
(select pno
from Works_on
where ssn = Essn))
order by salary desc;

--FNAME           LNAME               SALARY
--------------- --------------- ----------
--James           Borg                 55000
--Jennifer        Wallace              43000
--Franklin        Wong                 40000

select Dnumber, Dname, Fname, Lname
from Department, Employee
where ssn = mgr_ssn and not exists (select  *
from dependent
where ssn = essn);     

--   DNUMBER DNAME           FNAME           LNAME
---------- --------------- --------------- ---------------
--        1 Headquarters    James           Borg

--Lab#6-3

select fname, lname
from Employee
where dno in (select dno
from Employee
where salary = (select MAX(salary)
from Employee));

--FNAME           LNAME
--------------- ---------------
--James           Borg


select fname, lname
from Employee
where super_ssn in (select ssn
from Employee
where super_ssn = '888665555');

--FNAME           LNAME
--------------- ---------------
--John            Smith
--Joyce           English
--Ramesh          Narayan
--Ahmad           Jabbar
--Alicia          Zeleya


select fname, lname
from Employee
where salary >= 5000 +
(select MIN(salary) from Employee);

--FNAME           LNAME
--------------- ---------------
--James           Borg
--Jennifer        Wallace
--Franklin        Wong
--John            Smith
--Ramesh          Narayan



--Lab#6-4
create view dept_summary (D, C, Total_s, Avg_s) AS
select Dno, count(*), sum(salary), Round(AVG(salary), 1)
from Employee
group by dno;

--뷰가 생성되었습니다.

select *
from dept_summary where d = 4;

--        D          C    TOTAL_S      AVG_S
---------- ---------- ---------- ----------
--       4          3      93000      31000

select d, c
from dept_summary
where total_s between 50000 and 100000;

--         D          C
---------- ----------
--         1          1
--         4          3

select d, avg_s
from dept_summary
where c > (select c from dept_summary where d = 1)
order by avg_s desc;

--         D      AVG_S
------------ ----------
--         5      33250
--         4      31000

update dept_summary
set d = 3
where d = 1;

--1행에 오류:
--ORA-01732: 뷰에 대한 데이터 조작이 부적합합니다

delete from dept_summary
where c >= 1;

--1행에 오류:
--ORA-01732: 뷰에 대한 데이터 조작이 부적합합니다


--lab 6-5

create or replace trigger Salary_Violation
after update of salary on Employee
for each row
begin
if :new.salary>80000 Then
dbms_output.put_line('Old salary: ' || :old.salary);
dbms_output.put_line('[ALERT] New salary: ' || :new.salary);
dbms_output.put_line('Salary Difference: ');
dbms_output.put_line(:new.salary-:old.salary);
end if;
end;
/
-- / 를 적지 않으면 trigger가 실행되지 않음.
ALTER TRIGGER SALARY_VIOLATION ENABLE; 
SET SERVEROUTPUT ON;
UPDATE EMPLOYEE
SET Salary = salary*2
WHERE Ssn = '888665555';


--Old salary: 55000
--[ALERT] New salary: 110000
--Salary Difference: 55000

rollback;
-- Rollback complete.
drop trigger university.salary_violation;
-- Drop trigger if needed;
-- Trigger dropped.