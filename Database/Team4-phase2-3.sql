
-- 1. salary가 60000이상인 academyworker의 이름

select f_name, l_name, salary
from academyworker
where salary > 60000;

-- 2. department 이름이 contract인 academyworker 들

select f_name, l_name, department 
from academyworker
where department = 'Contract';

-- 3. written date가  2021-08-31인 rating을 준 subscriber 이름

select distinct name 
from subscriber, rating 
where subscriber_id in (select sub_id
from rating 
where written_date = '2021-08-31');

-- 4. star가 3인 rating을 준 subscriber 이름

select distinct  name 
from subscriber, rating
where subscriber_id in (select sub_id 
from rating
where star = 3);

-- 5.  IEEE institute에 속한 academy들의 최소 salary

select a.academy_name,  MIN(aw.salary) mininum
from academyworker aw inner join academy a
on aw.aca_name = a.academy_name
where ins_name = 'IEEE'
group by a.academy_name;

-- 6.  academy 'IEEE Computational Intelligence Magazine' 에서 일하는 worker 중 평균 salary 값 이상을 받는 사람들

select aw.f_name, aw.l_name, aw.salary
from academyworker aw,
(select salary s
from academyworker aw
where aw.aca_name = 'IEEE Computational Intelligence Magazine') b 
where aw.aca_name = 'IEEE Computational Intelligence Magazine'
group by  aw.f_name, aw.l_name, aw.salary
having aw.salary > avg(b.s);


-- 7. review가 작성되어 있는 public(모두에게 공개된) journal만 출력

select title from journal j
where open_to = 'public' and
exists (select unique_review_id
from review r where r.j_id = j.unique_journal_ID);

-- 8. review가 작성되어 있는 subscriber only(구독자 전용) journal만 출력

select title from journal j
where open_to = 'subscriber only' and
exists (select unique_review_id
from review r where r.j_id = j.unique_journal_ID); 

-- 9. 33459 ID를 가진 journal과 같은 키워드를 한 개 이상 가지고 있는 모든 journal 출력
select title from journal j
where j.unique_journal_ID in (
select distinct j_id from keyword k
where k.keyword_text in (select keyword_text from keyword
where j_id=33459));

-- 10. navigation 과 lungs 키워드를 동시에 갖는 journal title 모두 출력
select title from journal j
where j.unique_journal_ID in (
select distinct j_id from keyword k
where k.keyword_text = 'Navigation')
INTERSECT
select title from journal j
where j.unique_journal_ID in (
select distinct j_id from keyword k
where k.keyword_text = 'Lungs');

-- 11. 제일 오래전부터 구독한 사람/기관 10개
select * from (
select name, starting_date
from subscriber
order by starting_date )
where rownum <= 10 ;

-- 12. ACM 가 이름에 들어있는 academy의 worker 수 출력
select count(*) acm_worker from academyworker ac, academy a
where a.academy_name like '%ACM%'
and a.academy_name = ac.aca_name;

-- 13. propose를 했지만 한 번도 거절을 당하지 않은 worker들.

select distinct F_name, L_name, aca_name from academyworker join proposal on unique_worker_id = w_id
where unique_worker_id not in
(select distinct unique_worker_id from academyworker join proposal on unique_worker_id = w_id
where unique_worker_id in
(select w_id from proposal
where accepted = 'NO'));


-- 14. 조회수가 2500 이상인 논문의 제목과 출판날짜, 조회수
select title, publication_date, views from journal
where views >= 2500;

-- 15. 구독 시작 날짜가 2015년 03월 01일 이후인 기관의 이름
select name from subscriber
where subscriber_type = 'institution'
and starting_date > TO_DATE('20150301', 'yyyy-mm-dd');

-- 16. 제목이 'Verifiable Auditing for Outsourced Database in Cloud Computing'인 논문 저자의 이름
select f_name, l_name from author
where unique_author_ID in (select w.a_id from journal j, writes w
where j.title = 'Verifiable Auditing for Outsourced Database in Cloud Computing'
and j.unique_journal_ID = w.j_id);

-- 17. 구독 시작일이 가장 예전인 사람 10명 출력
 select * from (
    select name, starting_date
    from subscriber
    order by starting_date
)
where rownum <= 10;

-- 18. acm가 이름에 들어있는 academy의 worker 총 급여
select sum(salary) from academyworker ac, academy a
where a.academy_name like '%ACM%'
and a.academy_name = ac.aca_name;

-- 19. cited by 수가 가장 높은 5개 저널의 아카데미 이름, 제목, 인용 횟수
select * from (
    select aca_name, title, cited_by from journal
    order by cited_by desc
)
where rownum <= 5;

-- 20. 아카데미당 속해있는 worker 수
select aca_name, count(*) cnt
from academyworker, academy
where academy_name = aca_name
group by aca_name;

-- 21. 아카데미가 worker 들에게 지급하고 있는 돈 총합
select aca_name, sum(salary) sum
from academyworker, academy
where academy_name = aca_name
group by aca_name
order by sum desc;