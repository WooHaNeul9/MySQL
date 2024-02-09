USE practice_sql;

# DML (데이터 조작어)
-- 테이블에 데이터를 삽입, 조회, 수정, 삭제 할 때 사용

#----------------------------------------------------------------------#

# INSERT : 테이블에 데이터를 삽입하는 명령어

-- 1. 모든 열에 대하여 데이터 삽입
-- INSERT INTO 테이블명 VALUES (데이터1, 데이터2, ....);
INSERT INTO example_table
VALUES ('문자열 데이터', '텍스트 데이터', 99, 3.14, 3.14, true, '2024-02-05', now());

-- 2. 특정 열에 대하여 데이터 삽입
-- INSERT INTO 테이블명 (컬럼명1, 컬럼명2, .....) VALUES (데이터1, 데이터2, ....);
INSERT INTO example_table (int_column, boolean_column)
VALUES (50, false);

#----------------------------------------------------------------------#

# SELECT : 테이블에서 데이터를 조회할 때 사용하는 명령어
-- 정규화 작업을 하지 않았을 시 조회 성능이 더 뛰어남

-- 1. 모든 데이터 조회
-- SELECT * FROM 테이블명;
SELECT * FROM example_table;

-- 2. 테이블의 특정 컬럼 데이터 조회
-- SELECT 컬럼명1, 컬럼명2, ... FROM 테이블명;
SELECT int_column, text_column FROM example_table;

-- 3. 테이블에서 특정 조건에 따른 데이터 조회
-- SELECT 조회할컬럼명1, 조회할컬렴명2, ... FROM 테이블명 WHERE 조건;
SELECT * FROM example_table WHERE int_column = 50; -- int_column이 50인 데이터 조회

#----------------------------------------------------------------------#

# UPDATE : 테이블에서 데이터를 수정할 때 사용하는 명령어

-- UPDATE 테이블명 SET 컬럼1 = 데이터1, ....;
-- UPDATE 테이블명 SET 컬럼1 = 데이터1, ... WHERE 조건;

UPDATE example_table SET boolean_column = false; -- example_table의 boolean_column의 데이터 값을 전부 false로 바꿔라
UPDATE example_table SET date_column = now() WHERE int_column = 50; -- example_table의 int_column이 50인 컬럼들에 해당하는 date_column의 데이터 값을 now()로 바꿔라

#----------------------------------------------------------------------#

# DELETE : 테이블에서 데이터를 삭제할 때 사용하는 명령어

-- DELETE FROM 테이블명;
-- DELETE FROM 테이블명 WHETE 조건;

DELETE FROM example_table WHERE int_column = 50;
DELETE FROM example_table;

-- 구조만 남기고 전부 다 지움
TRUNCATE TABLE example_table;

CREATE TABLE auto_table (
	idx INT PRIMARY KEY AUTO_INCREMENT, -- AUTO_INCREMENT : idx 번호 증가해주는 명령어
    num INT
);

INSERT INTO auto_table (num) VALUES (0);
SELECT * FROM auto_table;
DELETE FROM auto_table;
TRUNCATE TABLE auto_table;

-- DROP TABLE (DDL) : 테이블의 구조 전체를 제거
-- TRUNCATE TABLE (DDL) : 테이블의 구조만 남기고 모든 데이터 초기화
-- DELETE FROM (DML) : 테이블에서 데이터만 삭제