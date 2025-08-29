use my_card;

## 8. 카드 - 직업표 (확률 포함) 확률값은 10000 을 100% 로 둔 정수값으로 함.
select * from card_job_table;
select * from card_job_table order by chance;
drop table card_job_table;
CREATE TABLE card_job_table (
  job_name VARCHAR(30) PRIMARY KEY,
  job_kor_name VARCHAR(30) not null unique,
  chance int not null
);
-- todo: 아래 데이터도 넣어야함. 고정.
INSERT INTO card_job_table (job_name, job_kor_name, chance) VALUES
('warrior', '전사', 2000),
('ice_mage', '얼음마법사', 2000),
('elf_archer', '엘프궁수', 2000),
('rogue', '도적', 2000),
('cleric', '사제', 2000),
('fire_mage', '화염마법사', 2000),
('admiral', '제독', 2000),
('crewman', '선원', 2000),
('fisherman', '어부', 2000),
('gunner', '포병', 2000),
('navigator', '항해사', 2000),
('pirate_captain', '해적두목', 2000),
('pirate_crew', '해적선원', 2000),
('shipwright', '조선공', 2000),
('accountant', '회계사', 2000),
('artisan', '공예가', 2000),
('blacksmith', '대장장이', 2000),
('botanist', '식물학자', 2000),
('butler', '집사', 2000),
('coachman', '마부', 2000),
('cook', '요리사', 2000),
('doctor', '의사', 2000),
('herbalist', '약초채집꾼', 2000),
('historian', '역사학자', 2000),
('maid', '메이드', 2000),
('nurse', '간호사', 2000),
('tailor', '봉제사', 2000);

INSERT INTO card_job_table (job_name, job_kor_name, chance) VALUES
('tailor', '봉제사', 2000);








