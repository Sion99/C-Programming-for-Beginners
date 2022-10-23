-- 조회수가 100 이상인 논문의 제목과 출판날짜
select title, publication_date from journal
where views >= 100;

-- 구독 시작 날짜가 2015년 03월 01일 이후인 기관의 이름
select name from subscriber
where subscriber_type = 'institute'
and starting_date > TO_DATE('20150301', 'yyyy-mm-dd');

-- 제목이 ' '인 논문 저자의 이름
select f_name, l_name from author
where unique_author_ID in (select w.a_id from journal j, writes w
where j.title = ''
and j.unique_journal_ID = w.j_id)


-- 구독 시작일이 가장 예전인 사람 10명 출력
 select * from (
    select name, starting_date
    from subscriber
    order by starting_date
)
where rownum <= 10;

-- acm가 이름에 들어있는 academy의 worker 총 급여
select sum(salary) from academyworker ac, academy a
where a.academy_name like '%acm%'
and a.academy_name = ac.aca_name

-- IEEE 가 이름에 들어있는 academy의 worker 수 출력
select count(*) from academyworker ac, academy a
where a.academy_name like '%IEEE%'
and a.academy_name = ac.aca_name

-- 조회수가 100 이상의 저널의 citing 하는 다른 저널 이름
select ab.title from journal ab
where ab.unique_journal_ID = (
select c.citing_journal_id from journal j, citing c
where j.views >= 100
and c.j_id = j.unique_journal_ID
)

select 
(select ab.title from journal ab
where ab.views >= 100), c.citing_journal_id
from citing c
where c.citing_journal_id = ab.unique_journal_ID

select distinct j.title from journal j, citing c
where c.citing_journal_id = j.unique_journal_ID

-- cited by 수가 가장 높은 5개 저널의 아카데미 이름, 제목, 인용 횟수
select * from (
    select aca_name, title, cited_by from journal
    order by cited_by
)
where rownum <= 5


-- proposal이 거부된 워커의 이름을 찾을건데
select fname from academyworker join proposal on unique_worker_id = w_id
where unique_worker_id in 
(
select w_id from proposal
where accepted = 'NO'
)


select a.name, sum(aw.salary)
from academy a, academyworker aw
group by a.name

-- 

1. salary가 40000이상인 academyworker의 이름
select fname, lname
from academyworker
where salary > 40000;

2. department 이름이 contract
select fname, lname 
from academyworker
where department = 'contract';

3. written date가  2022-02-15인 rating을 준 subscriber 이름
select fname, lname 
from subscriber, rating 
where subscriber_id in (select sub_id
from rating 
where written date = '2022-02-15');

4. star가 3인 rating을 준 subscriber 이름
select fname, lname
from subscriber, rating
where subscriber_id in (select sub_id 
from rating
where star = 3);

5.  academy '' '' 에 근무하는 최소 salary 값 
select fname, lname,  MIN(salary) mininum
from academyworker, academy
where academy_name = aca_name and aca_name in (select aca_name
from academyworker, academy
where aca_name = ' ' 
group by aca_name
having MIN(salary) > 20000)
group by fname, lname;

6. author id가 ' ' 이고 리뷰 작성 날짜가 ' ' 인  author 이름 
select fname, lname, 
from author
where [author id =         ]
and exists ( select 
from review
where review_date = '    ' and a_id = unique_author_id);

7. 