# DATABASE생성
CREATE DATABASE test; 
SHOW DATABASES; #DATABASE보는 명령어
USE test;

#테이블생성
CREATE TABLE members (
	id VARCHAR(20), 
	pw VARCHAR(20),
	name VARCHAR(20),
	email VARCHAR(20)
	);
	
DESC members; #생성된 테이블 정보를 출력
/*여러줄 주석*/
# 한줄 주석
INSERT INTO members (id, pw, name, email) VALUES('test1', '1234', 'test유저', 'test@naver.com');
INSERT INTO members  VALUES('test2', '1234', 'test2유저', 'test2@naver.com');
INSERT INTO members  VALUES('test3', '1234', 'test3유저', 'test3@naver.com');
INSERT INTO members  VALUES('test4', '1234', 'test4유저', 'test4@naver.com');
#일부 필드값을 입력하여 추가하는 경우
INSERT INTO members (id, pw, name) VALUES('test2', '1234', 'test유저');

## 테이블에 있는 값을 읽기: SELECT
SELECT * FROM members;

#조건을 사용하여 읽어 들이기
SELECT id,pw,NAME FROM members WHERE id='test4';

## 테이블에 있는 레코드의 값을 수정
# UPDATE [테이블명] SET [수정할 내용] [WHERE조건]
# 수정할 내용 : column=value
UPDATE members SET id='test5' WHERE email IS NULL;
UPDATE members SET email='test5@naver.com' WHERE email IS NULL; 
#SELECT * FROM members;

## 테이블에 있는 RECORD삭제하기
# DELETE FROM 테이블 [WHERE 조건]
DELETE FROM members WHERE id='test3';

#테이블에 있는 record삭제..빈테이블로 만드세요
DROP TABLE members;
DESC members;
