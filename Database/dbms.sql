create table institute(
    institute_name    varchar2(30) not null,
    primary key (institute_name)
);

create table academy(
    academy_name    varchar2(1000) not null,
    academy_date date  not null,
    ins_name    varchar(30)  not null,
    
    primary key (academy_name),
    foreign key (ins_name) references institute (institute_name)
);

create table journal(
    unique_journal_ID   number  not null,
    views   number,
    title  varchar2(500),
    open_to varchar2(50),
    publication_date    date    not null,
    cited_by    number,
    citing  varchar2(1000),
    vol_num   number  not null,
    aca_name varchar2(50)   not null,
    primary key(unique_journal_ID),
    foreign key (aca_name) references academy (academy_name)
);

create table citing(
    j_id number not null,
    citing_journal_num  number not null,
    citing_journal_title   varchar2(100)    not null,
    primary key (citing_journal_num),
    foreign key (j_id) references journal (unique_journal_ID)
);

create table keyword(
    j_id number not null,
    keyword_num number not null,
    keyword_text    varchar2(50)    not null,
    primary key (keyword_num),
    foreign key (j_id) references journal (unique_journal_id)
);



create table subscriber(
    subscriber_id   number  not null,
    validation_due  date    not null,
    starting_date   date    not null,
    subscriber_type varchar2(30) not null,
    name   varchar2(100) not null,
    primary key (subscriber_id)
);

create table manages(
    ins_name  varchar2(30)  not null,
    sub_id  number  not null,
    foreign key (ins_name) references institute (institute_name),
    foreign key (sub_id) references subscriber (subscriber_id)
);

create table rating(
    star    number,
    written_date    date    not null,
    sub_id  number  not null,
    j_id    number  not null,
    foreign key (sub_id) references subscriber (subscriber_id),
    foreign key (j_id) references journal (unique_journal_ID)
);

create table academyworker(
    unique_worker_id    number  not null,
    F_name   varchar2(50) not null,
    L_name   varchar2(50) not null,
    department  varchar2(50) not null,
    aca_name  varchar2(1000)  not null,
    primary key (unique_worker_id),
    foreign key (aca_name) references academy (academy_name)
);

create table professor(
    unique_professor_ID number not null,
    Fname   varchar2(50) not null,
    Lname   varchar2(50) not null,
    degree  varchar2(100) not null,
    judging_academy varchar2(100),
    primary key (unique_professor_ID),
    foreign key (judging_academy) references academy (academy_name)
);

create table writes(
    p_id number  not null,
    j_id    number  not null,
    foreign key (p_id) references professor (unique_professor_id),
    foreign key (j_id) references journal (unique_journal_Id)
);

create table proposal(
    w_id    number  not null,
    p_id    number  not null,
    foreign key (w_id) references academyworker (unique_worker_id),
    foreign key (p_id) references professor (unique_professor_ID)
);

create table judge(
    unique_judge_id number  not null,
    Fname   varchar2(50) not null,
    Lname   varchar2(50) not null,
    degree  varchar2(100) not null,
    primary key (unique_judge_id)
);

create table accept(
    p_id    number  not null,
    judge_id number not null,
    foreign key (p_id) references professor (unique_professor_ID),
    foreign key (judge_id) references judge (unique_judge_id)
);

create table review(
    unique_review_id    number  not null,
    review_date     date    not null,
    review_text        varchar2(1000)    not null,
    j_id    number  not null,
    primary key(unique_review_id),
    foreign key (j_id) references journal (unique_journal_ID)
);