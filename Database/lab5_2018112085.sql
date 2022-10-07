--Lab#5-1 & Lab #5-2
SQL> grant all privileges to university;
SQL> conn university/comp322

DROP TABLE DEPARTMENT CASCADE CONSTRAINT;
CREATE TABLE DEPARTMENT(
	Dname		Varchar(15)	NOT NULL,
	Dnumber		NUMBER		NOT NULL,
	Mgr_ssn		CHAR(9)		DEFAULT '888665555'	NOT NULL,
	Mgr_start_date	DATE,
	PRIMARY KEY (Dnumber),
	UNIQUE (Dname)
);

DROP TABLE EMPLOYEE CASCADE CONSTRAINT;
CREATE TABLE EMPLOYEE(
	Fname	Varchar(15)	not null,
	Minit	char,
	Lname	Varchar(15),
	Ssn	Char(9)	not null,
	Bdate	date,
	Address	Varchar(30),
	Sex	Char,
	Salary	Number(10,2),
	Super_ssn	Char(9),
	Dno	Number default 1	not null,
	Primary key (Ssn)
);

create table DEPT_LOCATIONS(
  Dnumber    INT     NOT NULL,
  Dlocation  Varchar(15)     NOT null,
  Primary key (Dnumber, Dlocation),
  Foreign Key (Dnumber) references Department(Dnumber));

 create table PROJECT(
  Pname      varchar(15)     not null,
  Pnumber    int     not null,
  Plocation  varchar(15),
  Dnum       int     not null,
  primary key(Pnumber),
  unique(Pname),
  foreign Key(Dnum) references department(Dnumber));

 create table WORKS_ON(
  Essn       char(9) not null,
  Pno        int     not null,
  Hours      decimal(3,1),
  Primary key(Essn, Pno),
  Foreign key(Essn) references employee(ssn),
  foreign key(Pno) references project(Pnumber));

create table DEPENDENT(
  Essn       char(9) not null,
  Dependent_name     varchar(15)     not null
  Sex        char,
  Bdate      date,
  Relationship       varchar(8),
  Primary key(Essn, Dependent_name),
  Foreign key(Essn) references Employee(Ssn));

-- Add a foreign key to DEPARTMENT for the Manages relationship
ALTER TABLE DEPARTMENT ADD FOREIGN KEY (Mgr_ssn) REFERENCES EMPLOYEE (Ssn)
ON DELETE SET NULL;

-- Add a foreign key to DEPARTMENT for the Supervision relationship
ALTER TABLE EMPLOYEE ADD FOREIGN KEY (Super_ssn) REFERENCES EMPLOYEE (Ssn)
ON DELETE SET NULL;

--Lab#5-2
INSERT INTO DEPARTMENT VALUES ('Headquarters', 1, '888665555', TO_DATE('1981-06-19', 'yyyy-mm-dd'));
INSERT INTO EMPLOYEE VALUES ('James', 'E', 'Borg', '888665555', TO_DATE('1937-11-10', 'yyyy-mm-dd'), '450 Stone, Houston, TX', 'M', 55000, NULL, 1);
INSERT INTO DEPARTMENT VALUES ('Administration', 4, '987654321', TO__DATE('1995-01-01, 'yyyy-mm-dd'));
INSERT INTO EMPLOYEE VALUES ('Jennifer', 'S', 'Wallace', '987654321', TO_DATE('1941-06-28', 'yyyy-mm-dd'), '291 Berry, Bellaire, TX', 'F', 43000, '888665555', 4);
INSERT INTO DEPARTMENT VALUES ('Research', 5, '333445555', TO_DATE('1988-05-22', 'yyyy-mm-dd'));
INSERT INTO EMPLOYEE VALUES ('Franklin', 'T', 'Wong', '333445555', TO_DATE('1968-01-19', 'yyyy-mm-dd'), '638 Voss, Houston, TX', 'M', 40000, '888665555', 5);
Insert into employee values ('John', 'B', 'Smith', '123456789', TO_DATE('1965-01-09', 'yyyy-mm-dd'), '731 Fondren, Houston, TX', 'M', 30000, '333445555', 5);
insert into employee values ('Alicia', 'J', 'Zeleya', '999887777', TO_DATE('1968-01-19', 'yyyy-mm-dd'), '3321 Castle, Spring, TX', 'F', 25000, '987654321', 4);
insert into employee values ('Ramesh', 'K', 'Narayan', '666884444', TO_DATE('1962-09-15', 'yyyy-mm-dd'), '975 Fire Oak, Humble, TX', 'M', 38000, '333445555', 5);
insert into employee values ('Joyce', 'A', 'English', '453453453', TO_DATE('1972-07-31', 'yyyy-mm-dd'), '5631 Rice, Houston, TX', 'F', 25000, '333445555', 5);
insert into employee values ('Ahmad', 'V', 'Jabbar', '987987987', TO_DATE('1969-03-29', 'yyyy-mm-dd'), '980 Dallas, Houston, TX', 'M', 25000, '987654321', 4);

insert into dept_locations values (1, 'Houston');
insert into dept_locations values (4, 'Stafford');
insert into dept_locations values (5, 'Bellaire');
insert into dept_locations values (5, 'Sugarland');
insert into dept_locations values (5, 'Houston');

insert into DEPENDENT values ('333445555', 'Alice', 'F', TO_DATE('1986-04-05', 'yyyy-mm-dd'), 'Daughter');
insert into DEPENDENT values ('333445555', 'Theodore', 'M', TO_DATE('1983-10-25', 'yyyy-mm-dd'), 'Son');
insert into DEPENDENT values ('333445555', 'Joy', 'F', TO_DATE('1958-05-03', 'yyyy-mm-dd'), 'Spouse');
insert into DEPENDENT values ('987654321', 'Abner', 'M', TO_DATE('1942-02-28', 'yyyy-mm-dd'), 'Spouse');
insert into DEPENDENT values ('123456789', 'Michael', 'M', TO_DATE('1988-01-04', 'yyyy-mm-dd'), 'Son');
insert into DEPENDENT values ('123456789', 'Alice', 'F', TO_DATE('1988-12-30', 'yyyy-mm-dd'), 'Daughter');
insert into DEPENDENT values ('123456789', 'Elizabeth', 'F', TO_DATE('1967-05-05', 'yyyy-mm-dd'), 'Spouse');

insert into PROJECT values ('ProductX', 1, 'Bellaire', 5);
insert into PROJECT values ('ProductY', 2, 'Sugarland', 5);
insert into PROJECT values ('ProductZ', 3, 'Houston', 5);
insert into PROJECT values ('Computerization', 10, 'Stafford', 4);
insert into PROJECT values ('Reorganization', 20, 'Houston', 1);
insert into PROJECT values ('Newbenefits', 30, 'Stafford', 4);

insert into WORKS_ON values ('123456789', 1, 32.5);
insert into WORKS_ON values ('123456789', 2, 7.5);
insert into WORKS_ON values ('666884444', 3, 40.0);
insert into works_on values ('453453453', 1, 20.0);
insert into works_on values ('453453453', 2, 20.0);
insert into works_on values ('333445555', 2, 10.0);
insert into works_on values ('333445555', 3, 10.0);
insert into works_on values ('333445555', 10, 10.0);
insert into works_on values ('333445555', 20, 10.0);
insert into works_on values ('999887777', 30, 30.0);
insert into works_on values ('999887777', 10, 10.0);
insert into works_on values ('987987987', 10, 35.0);
insert into works_on values ('987987987', 30, 5.0);
insert into works_on values ('987654321', 30, 20.0);
insert into works_on values ('987654321', 20, 15.0);
insert into works_on values ('888665555', 20, NULL);


