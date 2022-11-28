set transaction name 'comp322_2018112085_sion_shin';

create table BOOK (
  bookid number primary key not null,
  bookname varchar(100),
  publisher varchar(20),
  price number
 );

savepoint create_table;

insert into BOOK values (1, 'Database', 'Pearson', 30000);

select bookname "bookname1" 
from Book
where bookid = 1;

savepoint insert_1;

update BOOK
set bookname = 'Intro. to Database'
where bookid = 1;

select bookname "bookname2" 
from BOOK
where bookid = 1;

savepoint update_1;

update BOOK set bookname = 'Database Lab.'
where bookid = 1;

select bookname "bookname3" 
from BOOK
where bookid = 1;

rollback to update_1;

select bookname "bookname4" 
from BOOK
where bookid = 1;

rollback to insert_1;

select bookname "bookname5"  
from BOOK
where bookid = 1;

commit;

update BOOK set bookname = 'Database Lab2' where bookid = 1;

select bookname "bookname6" -- 'Database Lab2'
from BOOK
where bookid = 1;

rollback;

select bookname "bookname7" 
from BOOK
where bookid = 1;

delete from BOOK
where bookid = 1;

select bookname "bookname8"
from BOOK
where bookid = 1;

rollback;

select bookname "bookname9"
from BOOK
where bookid = 1;

commit;