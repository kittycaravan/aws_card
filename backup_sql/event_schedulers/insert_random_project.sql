use my_card;

SHOW EVENTS;
SHOW EVENTS FROM my_card;
DROP EVENT insert_random_project;


#### [*] ALTER EVENT: 기존 이벤트 수정
ALTER EVENT insert_random_project
ON SCHEDULE EVERY 1 MINUTE;
-- ON SCHEDULE: 주기를 1분으로 변경
-- 가능한 단위: SECOND, MINUTE, HOUR, DAY 등
-- 예: EVERY 10 SECOND, EVERY 2 HOUR



#### [1] 먼저 이벤트 스케줄러 기능을 켜야 함 (전역 변수)						
SET GLOBAL event_scheduler = ON;						
						
#### [2] 이벤트 생성: 5분마다 랜덤한 pj_base 데이터를 pj로 복사						

-- DELIMITER $$ : MySQL 명령어 종료 기호를 $$로 변경
-- BEGIN ... END 블록 안에서 세미콜론(;)을 쓰기 위해 필요
DELIMITER $$

-- CREATE EVENT: 이벤트 생성 (매 5분마다 랜덤 프로젝트 복사)
CREATE EVENT insert_random_project
-- 이벤트 이름 (중복 방지 위해 IF NOT EXISTS를 쓸 수도 있음)
-- 예: CREATE EVENT IF NOT EXISTS insert_random_project

ON SCHEDULE EVERY 5 MINUTE
-- ON SCHEDULE: 이벤트 실행 주기 설정
-- EVERY 5 MINUTE: 5분마다 실행됨
-- STARTS, ENDS 옵션도 사용 가능
-- 예: STARTS CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
--     ENDS CURRENT_TIMESTAMP + INTERVAL 1 HOUR

DO
-- DO: 실제 실행할 SQL 구문

BEGIN
  -- BEGIN ... END: 여러 SQL을 하나의 블록으로 묶기

  INSERT INTO pj (name, content, level, gold, exp, client, vendor)
  -- pj 테이블에 데이터 삽입 (필드 지정)

  SELECT name, content, level, gold, exp, client, vendor
  -- pj_base에서 무작위로 하나 선택해서 복사

  FROM pj_base
  ORDER BY RAND()
  -- RAND(): 무작위 정렬로 랜덤 데이터 선택

  LIMIT 1;
  -- LIMIT 1: 하나만 삽입
END $$

-- DELIMITER ; : 다시 기본 구분자 세미콜론으로 복구
DELIMITER ;
