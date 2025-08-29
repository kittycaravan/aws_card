use my_card;

## 7. 카드 - 등급표 (확률 포함) 확률값은 10000 을 100% 로 둔 정수값으로 함.
select * from card_grade_table;
select * from card_grade_table order by chance;
drop table card_grade_table;
CREATE TABLE card_grade_table (
  grade VARCHAR(10) PRIMARY KEY,
  chance int not null
);
-- todo: 아래 데이터도 넣어야함. 고정.
INSERT INTO card_grade_table (grade, chance) VALUES
('ssr', 30),
('sr', 100),
('r', 1700),
('h', 2000),
('n', 5000);

## 7. 카드 - 등급표로 등급값 구하는 sql
-- select grade,cumulative from  << 확률 누적 구간 값도 셀렉트
select grade from
	(
		select grade,chance, @s := @s+chance as cumulative
			from card_grade_table, (select @s := 0) as vars
            order by chance
	) as temp
where rand() < cumulative
order by cumulative
limit 1;

-- 확률 누적값 확인용. 확률 변경 시 이걸로 총합 1.0 인지 확인할 것.
select grade,chance, @s := @s+chance as cumulative
	from card_grade_table, (select @s := 0) as vars
	order by chance;