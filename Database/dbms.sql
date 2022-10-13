create table academy(
    academy_name    varchar(30) not null,
    unique_academy_ID number  not null,
    primary key (unique_academy_ID),
    unique(academy_name)
);

create table volume(
    volume_num  number  not null,
    volume_title    varchar(50) not null,
    volume_date number  not null,
    aca_ID    number  not null,
    
    primary key (volume_num),
    foreign key (aca_ID) references academy (unique_academy_ID)
);

create table journal(
    keyword varchar(50),
    unique_journal_ID   number  not null,
    views   number,
    title  varchar(500),
    open_to varchar(50),
    publication_date    date    not null,
    cited_by    varchar(1000),
    citing  varchar(1000),
    vol_num   number  not null,
    primary key(unique_journal_ID),
    foreign key (vol_num) references volume (volume_num)
);

create table author(
    unique_author_id    number  not null,
    name varchar(50) not null,
    degree    varchar(50),
    primary key (unique_author_id)
);

create table writes(
    auth_id number  not null,
    j_id    number  not null,
    foreign key (auth_id) references author (unique_author_id),
    foreign key (j_id) references journal (unique_journal_Id)
);

create table subscriber(
    subscriber_id   number  not null,
    validation_due  date    not null,
    starting_date   date    not null,
    subscriber_type varchar(30) not null,
    Fname   varchar(50) not null,
    Lname   varchar(50) not null,
    primary key (subscriber_id)
);

create table manages(
    aca_ID  number  not null,
    sub_id  number  not null,
    foreign key (aca_ID) references academy (unique_academy_ID),
    foreign key (sub_id) references subscriber (subscriber_id)
);

create table rating(
    rating_id   number  not null,
    star    number,
    written_by  varchar(50) not null,
    written_date    date    not null,
    average_rate    number,
    sub_id  number  not null,
    j_id    number  not null,
    foreign key (sub_id) references subscriber (subscriber_id),
    foreign key (j_id) references journal (unique_journal_ID)
);

create table academyworker(
    unique_worker_id    number  not null,
    Fname   varchar(50) not null,
    Lname   varchar(50) not null,
    department  varchar(50) not null,
    aca_ID  number  not null,
    primary key (unique_worker_id),
    foreign key (aca_ID) references academy (unique_academy_ID)
);

create table professor(
    unique_professor_ID number not null,
    Fname   varchar(50) not null,
    Lname   varchar(50) not null,
    degree  varchar(100) not null,
    primary key (unique_professor_ID)
);

create table proposal(
    w_id    number  not null,
    p_id    number  not null,
    foreign key (w_id) references academyworker (unique_worker_id),
    foreign key (p_id) references professor (unique_professor_ID)
);

create table judge(
    unique_judge_id number  not null,
    Fname   varchar(50) not null,
    Lname   varchar(50) not null,
    degree  varchar(100) not null,
    primary key (unique_judge_id)
);

create table accept(
    p_id    number  not null,
    judge_id number not null,
    foreign key (p_id) references professor (unique_professor_ID),
    foreign key (judge_id) references judge (unique_judge_id)
);

create review(
    unique_review_id    number  not null,
    review_date     date    not null,
    review_text        varchar(1000)    not null,
    j_id    number  not null,
    primary key(unique_review_id),
    foreign key (j_id) references journal (unique_journal_ID)
);
