insert into employee values ('Gildong', '', 'Hong', '333666999', TO_DATE('1999-03-21', 'yyyy-mm-dd'), 'KNU CSE', 'M', 40000, NULL, 1);
commit;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--Transaction set.
select *
from employee
where ssn = '333666999';

UPDATE EMPLOYEE 
SET Salary = 70000
Where SSN = '333666999';

commit;
Select *
From Employee
Where ssn = '333666999';

Select *
FROM EMPLOYEE
WHERE SSN = '333666999';

Select * from employee
where ssn = '333666999';

commit;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

Select *
FROM EMPLOYEE
Where Salary Between 60000 and 80000;

INSERT INTO EMPLOYEE VALUES ('Younghee', '', 'Kim', '000111222', TO_DATE('1997-05-11', 'yyyy-mm-dd'), 'KNU CSE', 'F', 75000, NULL, 1);

commit;

SELECT *
FROM EMPLOYEE
Where Salary Between 60000 and 80000;

commit;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SELECT SUM(Salary) FROM EMployee;
select SUM(Salary) FROM EMPLOYEE;
INSERT INTO EMPLOYEE VALUES('Cheolsoo', '', 'Suh', '444777999', TO_DATE('1996-03-31', 'yyyy-mm-dd'), 'KNU CSE', 'M', 60000, NULL, 1);
SELECT SUM(Salary) FROM EMPLOYEE;
