CREATE DATABASE my_card default CHARACTER SET UTF8MB4;

use my_card;

show tables;

## 1. 내 보유 카드들
drop table card_my;
create table card_my(
	no int primary key auto_increment,
    job char(20) not null default 'warrior',
    grade char(20) not null default 'N',
    id char(20) not null default 'cat',
    deployment int not null default 0,
    lv int not null default 1,
    exp bigint unsigned not null default 0,
    type int not null default 1,	-- 같은 종류와 같은 등급 내에서 여러 다양한 다른 모양의 카드를 추가하기 위한 칼럼. 1,2, ... 식
    job_kor_name char(20) not null default '전사'
);
ALTER TABLE card_my ADD lv int not null default 1;
ALTER TABLE card_my ADD exp bigint unsigned not null default 0;
ALTER TABLE card_my ADD type int not null default 1;
ALTER TABLE card_my ADD job_kor_name char(20) not null default '전사';
select * from card_my;
select * from card_my where id='hellkitty';
select * from card_my where id='cat';
insert into card_my value();
update card_my set deployment = 1 where id = 'cat' and no = 1;
update card_my set deployment = 2 where id = 'cat' and no = 4;
update card_my set deployment = 3 where id = 'cat' and no = 2;
truncate card_my;


## 2. 내 재산
drop table my_wealth;
create table my_wealth(
    gold int UNSIGNED not null default 0,
    dice int UNSIGNED not null default 0,
    id char(20) not null default 'cat'
);

select * from my_wealth;
insert into my_wealth value();
insert into my_wealth (id) value('dog');
update my_wealth set gold = -1 where id = 'cat';
update my_wealth set gold = 1 where id = 'cat';
update my_wealth set dice = -1 where id = 'cat';
update my_wealth set dice = 1 where id = 'cat';
update my_wealth set dice = 1234 where id = 'cat';
truncate my_wealth;


## 3. 전체 프로젝트 리스트
truncate pj;
drop table pj;
select * from pj;
SELECT * from pj where no = 10;
create table pj(
	no	int primary key auto_increment		#번호
	,name char(40) not null default '무제'	#이름
	,content char(255) not null default '설명없음'		#설명
	,level	int not null default 1			#난이도
	,gold	bigint not null default 0	#보상(골드)    
	,exp	bigint not null default 0	#보상(경험치)    
    ,client char(40) not null default '제국'
    ,vendor char(40)
);
-- ALTER TABLE kitty ADD XXX int;-- 
ALTER TABLE pj ADD client char(40) not null default '제국';
ALTER TABLE pj ADD vendor char(40);
update pj set vendor = '고양이길드' where no=4;
insert into pj values();
insert into pj (name) values('약초캐기');
insert into pj (name) values('토끼사냥');
insert into pj (name) values('담배심부름');
select * from pj;
SELECT * from pj where vendor = '고양이길드';

## 4. 회원정보 테이블
drop table card_member;
CREATE TABLE card_member (
    id CHAR(30) PRIMARY KEY COMMENT '회원 아이디',
    pw CHAR(30) NOT NULL COMMENT '회원 비밀번호',
    guild_name CHAR(20) DEFAULT '고양이길드' COMMENT '가입 시 자동 배정되는 길드명',
    approved TINYINT NOT NULL DEFAULT 0 COMMENT '관리자 승인 여부 (0=미승인, 1=승인)'
) COMMENT='카드게임 회원 테이블';

ALTER TABLE card_member ADD guild_name char(20) default '고양이길드';    
insert into card_member values('cat','1234');
select * from card_member;
select * from card_member where approved = 1;

## 5. 레벨별 경험치표 테이블(card_exp_data.csv 파일로 데이터 넣었음. 2레벨 6000으로 수동으로 넣으시오)
create table card_exp (
	lv int primary key,
    required_exp bigint not null
);
select * from card_exp;

## 6. 프로젝트 - 난이도 테이블
CREATE TABLE card_pj_difficulty (
  difficulty_id INT PRIMARY KEY AUTO_INCREMENT,
  color VARCHAR(20) NOT NULL,
  min_lv INT NOT NULL,
  max_lv INT NOT NULL,
  name_ko VARCHAR(50) NOT NULL,
  success_rate INT NOT NULL CHECK (success_rate BETWEEN 0 AND 100)
);
-- data
INSERT INTO card_pj_difficulty (color, min_lv, max_lv, name_ko, success_rate) VALUES ('Green', 1, 10, '쉬움', 80),('Yellow', 11, 20, '보통', 70),('Orange', 21, 30, '어려움', 60),('Red', 31, 40, '매우 어려움', 50);

-- ex.
SELECT * FROM card_pj_difficulty WHERE 7 BETWEEN min_lv AND max_lv;
SELECT no,name,content,level,gold,client,vendor
	,(select success_rate from card_pj_difficulty where pj.level between min_lv and max_lv) as success_rate
from pj;


