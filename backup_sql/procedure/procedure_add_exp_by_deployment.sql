use my_card;

-- 프로시저 --
/*  1. 넘어온 경험치만큼 프로젝트에 참여한 각 카드에 추가한 후
	경험치 테이블과 비교하여 현재 경험치(추가된 후) 의 레벨 구간을 
	조건문으로 찾아서 업데이트 처리하는 프로시저. */
DELIMITER $$
CREATE PROCEDURE add_exp_by_deployment(IN p_deployment INT, IN p_exp_gain BIGINT)
BEGIN
  UPDATE card_my
  SET
    exp = exp + p_exp_gain,
    lv = (
      SELECT MAX(lv)
      FROM card_exp
      WHERE required_exp <= exp
    )
  WHERE deployment = p_deployment;
END$$
DELIMITER ;

CALL add_exp_by_deployment(7,500);
CALL add_exp_by_deployment(7,5000);
SHOW PROCEDURE STATUS WHERE Db = 'my_card';
DROP PROCEDURE IF EXISTS add_exp_by_deployment;
DROP PROCEDURE add_exp_by_deployment;

select * from card_my;
select * from card_my where no = 7;
select * from card_my where id='hellkitty';
select * from card_exp where lv < 5;
SELECT MAX(lv) FROM card_exp WHERE required_exp <= 10000;
CALL add_exp_by_deployment(7,55);
CALL add_exp_by_deployment(7,55);
CALL add_exp_by_deployment(7,100000);