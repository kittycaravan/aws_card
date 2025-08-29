use my_card;

## 9. pj - 가능한 pj 들의 목록
## 여기 목록에서 mysql 이벤트 스케쥴러를 통해 일정 시간 마다 pj 테이블로 랜덤하게
## 하나의 pj 를 추가함
select * from pj_base;
CREATE TABLE pj_base (
	no INT PRIMARY KEY AUTO_INCREMENT,
	name CHAR(40) NOT NULL DEFAULT '무제',
	content CHAR(255) NOT NULL DEFAULT '설명없음',
	level INT NOT NULL DEFAULT 1,
	gold BIGINT NOT NULL DEFAULT 0,
	exp BIGINT NOT NULL DEFAULT 0,
	client CHAR(40) NOT NULL DEFAULT '제국',
	vendor CHAR(40)
);

INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('채집 프로젝트 1', '채집 관련 임무로, 레벨 1에 적합합니다.', 1, 84, 54, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('채집 프로젝트 2', '채집 관련 임무로, 레벨 7에 적합합니다.', 7, 749, 406, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('채집 프로젝트 3', '채집 관련 임무로, 레벨 8에 적합합니다.', 8, 688, 368, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('채집 프로젝트 4', '채집 관련 임무로, 레벨 9에 적합합니다.', 9, 945, 477, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('채집 프로젝트 5', '채집 관련 임무로, 레벨 4에 적합합니다.', 4, 336, 168, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('채집 프로젝트 6', '채집 관련 임무로, 레벨 8에 적합합니다.', 8, 672, 368, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('채광 프로젝트 7', '채광 관련 임무로, 레벨 7에 적합합니다.', 7, 819, 420, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('채광 프로젝트 8', '채광 관련 임무로, 레벨 5에 적합합니다.', 5, 430, 300, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('채광 프로젝트 9', '채광 관련 임무로, 레벨 1에 적합합니다.', 1, 85, 50, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('채광 프로젝트 10', '채광 관련 임무로, 레벨 6에 적합합니다.', 6, 696, 336, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('채광 프로젝트 11', '채광 관련 임무로, 레벨 10에 적합합니다.', 10, 990, 590, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('채광 프로젝트 12', '채광 관련 임무로, 레벨 7에 적합합니다.', 7, 644, 294, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('항해교역 프로젝트 13', '항해교역 관련 임무로, 레벨 5에 적합합니다.', 5, 515, 210, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('항해교역 프로젝트 14', '항해교역 관련 임무로, 레벨 5에 적합합니다.', 5, 595, 270, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('항해교역 프로젝트 15', '항해교역 관련 임무로, 레벨 6에 적합합니다.', 6, 720, 342, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('항해교역 프로젝트 16', '항해교역 관련 임무로, 레벨 4에 적합합니다.', 4, 404, 184, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('항해교역 프로젝트 17', '항해교역 관련 임무로, 레벨 7에 적합합니다.', 7, 623, 392, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('항해교역 프로젝트 18', '항해교역 관련 임무로, 레벨 9에 적합합니다.', 9, 972, 396, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('지역 조사 프로젝트 19', '지역 조사 관련 임무로, 레벨 2에 적합합니다.', 2, 202, 104, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('지역 조사 프로젝트 20', '지역 조사 관련 임무로, 레벨 3에 적합합니다.', 3, 294, 171, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('지역 조사 프로젝트 21', '지역 조사 관련 임무로, 레벨 3에 적합합니다.', 3, 288, 147, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('지역 조사 프로젝트 22', '지역 조사 관련 임무로, 레벨 6에 적합합니다.', 6, 690, 336, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('지역 조사 프로젝트 23', '지역 조사 관련 임무로, 레벨 7에 적합합니다.', 7, 728, 287, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('지역 조사 프로젝트 24', '지역 조사 관련 임무로, 레벨 1에 적합합니다.', 1, 82, 60, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('몬스터 토벌 프로젝트 25', '몬스터 토벌 관련 임무로, 레벨 4에 적합합니다.', 4, 388, 208, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('몬스터 토벌 프로젝트 26', '몬스터 토벌 관련 임무로, 레벨 6에 적합합니다.', 6, 486, 258, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('몬스터 토벌 프로젝트 27', '몬스터 토벌 관련 임무로, 레벨 1에 적합합니다.', 1, 107, 50, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('몬스터 토벌 프로젝트 28', '몬스터 토벌 관련 임무로, 레벨 4에 적합합니다.', 4, 452, 176, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('몬스터 토벌 프로젝트 29', '몬스터 토벌 관련 임무로, 레벨 8에 적합합니다.', 8, 960, 400, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('몬스터 토벌 프로젝트 30', '몬스터 토벌 관련 임무로, 레벨 2에 적합합니다.', 2, 204, 114, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('호위 임무 프로젝트 31', '호위 임무 관련 임무로, 레벨 6에 적합합니다.', 6, 684, 300, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('호위 임무 프로젝트 32', '호위 임무 관련 임무로, 레벨 10에 적합합니다.', 10, 1080, 590, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('호위 임무 프로젝트 33', '호위 임무 관련 임무로, 레벨 1에 적합합니다.', 1, 114, 56, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('호위 임무 프로젝트 34', '호위 임무 관련 임무로, 레벨 10에 적합합니다.', 10, 890, 580, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('호위 임무 프로젝트 35', '호위 임무 관련 임무로, 레벨 7에 적합합니다.', 7, 560, 371, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('호위 임무 프로젝트 36', '호위 임무 관련 임무로, 레벨 10에 적합합니다.', 10, 940, 450, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('암살/첩보 프로젝트 37', '암살/첩보 관련 임무로, 레벨 7에 적합합니다.', 7, 588, 336, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('암살/첩보 프로젝트 38', '암살/첩보 관련 임무로, 레벨 6에 적합합니다.', 6, 636, 354, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('암살/첩보 프로젝트 39', '암살/첩보 관련 임무로, 레벨 5에 적합합니다.', 5, 565, 225, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('암살/첩보 프로젝트 40', '암살/첩보 관련 임무로, 레벨 3에 적합합니다.', 3, 255, 165, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('암살/첩보 프로젝트 41', '암살/첩보 관련 임무로, 레벨 1에 적합합니다.', 1, 90, 60, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('암살/첩보 프로젝트 42', '암살/첩보 관련 임무로, 레벨 9에 적합합니다.', 9, 909, 540, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('구출 작전 프로젝트 43', '구출 작전 관련 임무로, 레벨 1에 적합합니다.', 1, 110, 46, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('구출 작전 프로젝트 44', '구출 작전 관련 임무로, 레벨 4에 적합합니다.', 4, 384, 232, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('구출 작전 프로젝트 45', '구출 작전 관련 임무로, 레벨 2에 적합합니다.', 2, 194, 104, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('구출 작전 프로젝트 46', '구출 작전 관련 임무로, 레벨 2에 적합합니다.', 2, 160, 102, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('구출 작전 프로젝트 47', '구출 작전 관련 임무로, 레벨 5에 적합합니다.', 5, 450, 260, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('구출 작전 프로젝트 48', '구출 작전 관련 임무로, 레벨 2에 적합합니다.', 2, 202, 84, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('건설 지원 프로젝트 49', '건설 지원 관련 임무로, 레벨 6에 적합합니다.', 6, 480, 276, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('건설 지원 프로젝트 50', '건설 지원 관련 임무로, 레벨 10에 적합합니다.', 10, 940, 410, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('건설 지원 프로젝트 51', '건설 지원 관련 임무로, 레벨 10에 적합합니다.', 10, 1140, 580, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('건설 지원 프로젝트 52', '건설 지원 관련 임무로, 레벨 9에 적합합니다.', 9, 1017, 504, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('건설 지원 프로젝트 53', '건설 지원 관련 임무로, 레벨 8에 적합합니다.', 8, 880, 392, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('건설 지원 프로젝트 54', '건설 지원 관련 임무로, 레벨 1에 적합합니다.', 1, 95, 40, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('정비/수리 프로젝트 55', '정비/수리 관련 임무로, 레벨 4에 적합합니다.', 4, 440, 220, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('정비/수리 프로젝트 56', '정비/수리 관련 임무로, 레벨 5에 적합합니다.', 5, 440, 270, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('정비/수리 프로젝트 57', '정비/수리 관련 임무로, 레벨 3에 적합합니다.', 3, 315, 174, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('정비/수리 프로젝트 58', '정비/수리 관련 임무로, 레벨 9에 적합합니다.', 9, 1035, 423, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('정비/수리 프로젝트 59', '정비/수리 관련 임무로, 레벨 3에 적합합니다.', 3, 342, 123, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('정비/수리 프로젝트 60', '정비/수리 관련 임무로, 레벨 1에 적합합니다.', 1, 108, 48, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('배달 임무 프로젝트 61', '배달 임무 관련 임무로, 레벨 9에 적합합니다.', 9, 837, 360, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('배달 임무 프로젝트 62', '배달 임무 관련 임무로, 레벨 6에 적합합니다.', 6, 702, 246, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('배달 임무 프로젝트 63', '배달 임무 관련 임무로, 레벨 5에 적합합니다.', 5, 420, 245, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('배달 임무 프로젝트 64', '배달 임무 관련 임무로, 레벨 1에 적합합니다.', 1, 117, 42, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('배달 임무 프로젝트 65', '배달 임무 관련 임무로, 레벨 5에 적합합니다.', 5, 475, 205, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('배달 임무 프로젝트 66', '배달 임무 관련 임무로, 레벨 7에 적합합니다.', 7, 742, 420, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('연금/제작 프로젝트 67', '연금/제작 관련 임무로, 레벨 8에 적합합니다.', 8, 872, 480, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('연금/제작 프로젝트 68', '연금/제작 관련 임무로, 레벨 6에 적합합니다.', 6, 684, 312, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('연금/제작 프로젝트 69', '연금/제작 관련 임무로, 레벨 10에 적합합니다.', 10, 950, 530, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('연금/제작 프로젝트 70', '연금/제작 관련 임무로, 레벨 8에 적합합니다.', 8, 712, 480, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('연금/제작 프로젝트 71', '연금/제작 관련 임무로, 레벨 6에 적합합니다.', 6, 564, 342, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('연금/제작 프로젝트 72', '연금/제작 관련 임무로, 레벨 9에 적합합니다.', 9, 954, 360, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('연구/실험 프로젝트 73', '연구/실험 관련 임무로, 레벨 5에 적합합니다.', 5, 410, 205, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('연구/실험 프로젝트 74', '연구/실험 관련 임무로, 레벨 4에 적합합니다.', 4, 476, 200, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('연구/실험 프로젝트 75', '연구/실험 관련 임무로, 레벨 5에 적합합니다.', 5, 595, 225, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('연구/실험 프로젝트 76', '연구/실험 관련 임무로, 레벨 3에 적합합니다.', 3, 258, 132, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('연구/실험 프로젝트 77', '연구/실험 관련 임무로, 레벨 4에 적합합니다.', 4, 412, 196, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('연구/실험 프로젝트 78', '연구/실험 관련 임무로, 레벨 8에 적합합니다.', 8, 728, 328, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('행사 지원 프로젝트 79', '행사 지원 관련 임무로, 레벨 8에 적합합니다.', 8, 808, 480, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('행사 지원 프로젝트 80', '행사 지원 관련 임무로, 레벨 10에 적합합니다.', 10, 940, 560, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('행사 지원 프로젝트 81', '행사 지원 관련 임무로, 레벨 6에 적합합니다.', 6, 606, 294, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('행사 지원 프로젝트 82', '행사 지원 관련 임무로, 레벨 10에 적합합니다.', 10, 1150, 460, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('행사 지원 프로젝트 83', '행사 지원 관련 임무로, 레벨 9에 적합합니다.', 9, 999, 423, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('행사 지원 프로젝트 84', '행사 지원 관련 임무로, 레벨 2에 적합합니다.', 2, 240, 104, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('정찰/잠입 프로젝트 85', '정찰/잠입 관련 임무로, 레벨 7에 적합합니다.', 7, 728, 329, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('정찰/잠입 프로젝트 86', '정찰/잠입 관련 임무로, 레벨 4에 적합합니다.', 4, 452, 220, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('정찰/잠입 프로젝트 87', '정찰/잠입 관련 임무로, 레벨 2에 적합합니다.', 2, 206, 106, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('정찰/잠입 프로젝트 88', '정찰/잠입 관련 임무로, 레벨 10에 적합합니다.', 10, 1030, 440, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('정찰/잠입 프로젝트 89', '정찰/잠입 관련 임무로, 레벨 5에 적합합니다.', 5, 495, 225, '제국', null);
INSERT INTO pj_base (name, content, level, gold, exp, client, vendor) VALUES ('정찰/잠입 프로젝트 90', '정찰/잠입 관련 임무로, 레벨 3에 적합합니다.', 3, 249, 177, '제국', null);