﻿
create table log_login(
userid varchar2(10) not null,
logintime varchar2(20) not null,
browser varchar2(20) not null,
device varchar2(20) not null,
ip varchar2(30)
)
partition by range (logintime)
(
  partition log_logintime_part1 values less than ('20190101'),
  partition log_logintime_part2 values less than ('20200101'),
  partition log_logintime_part3 values less than ('20210101'),
  partition log_logintime_part4 values less than ('20220101')
);

create index idx_log_login_1
on log_login(logintime);

create index idx_log_login_2
on log_login(userid);

create table log_error (
erroruri varchar2(30) not null,
errortime varchar2(20) not null,
errormsg varchar2(300) not null
)
partition by range (errortime)
(
  partition log_error_part1 values less than ('20190101'),
  partition log_error_part2 values less than ('20200101'),
  partition log_error_part3 values less than ('20210101')
);

create index idx_log_error_1
on log_error(errortime);

create table log_click_board (
logtime varchar2(20) not null,
sessionid varchar2(10) not null,
boardtype varchar2(5) not null,
boardnumber varchar2(5) not null
);

create index idx_log_click_board_1
on log_click_board(logtime);

create table log_click_goods (
logtime varchar2(20) not null,
sessionid varchar2(10) not null,
seqtype varchar2(5) not null,
seqnumber varchar2(5) not NULL,
likehate varchar2(5) not NULL
);

create index idx_log_click_goods_1
on log_click_goods(logtime);


create table log_chatting (
    username varchar2(10) not null,
	logdate varchar2(20) not null,
    message varchar2(400) not null,
    chatroom varchar2(20) 
)
partition by range (logdate)
(
  partition log_chatting_part1 values less than ('20210101000000'),
  partition log_chatting_part2 values less than ('20210701000000'),
  partition log_chatting_part3 values less than ('20220101000000'),
  partition log_chatting_part4 values less than ('20220701000000'),
  partition log_chatting_max values less than (maxvalue)
);


create index idx_log_chatting_1
on log_chatting(logdate);

create table log_chat_file(
userid varchar2(10) not null,
logdate varchar2(20) not null,
s3filename varchar2(100) not null,
ip varchar2(30)
)
partition by range (logdate)
(
  partition log_chat_file_part1 values less than ('20210101'),
  partition log_chat_file_part2 values less than ('20220101')
);

create index log_chat_file_1
on log_chat_file(logdate);

create index log_chat_file_2
on log_chat_file(userid);

create table daily (
regdate varchar(10) not null,
uniqueuser NUMBER,
chattraffic NUMBER
);

alter table daily
add constraint pk_daily primary key(regdate);
