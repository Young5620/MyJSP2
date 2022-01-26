CREATE DATABASE testDB;

USE testDB;

CREATE TABLE t_table(
	stu_num INT,
	name VARCHAR(50),
	address varchar(50),
	email VARCHAR(20)
	);
	
ALTER TABLE t_table ADD phone VARCHAR(20);

#실습- t_table에 korean(int), english(int), math(int)컬럼을 추가
ALTER TABLE t_table ADD korean INT;
ALTER TABLE t_table ADD english INT;
ALTER TABLE t_table ADD math INT;
#ALTER TABLE t_table ADD korean int, ADD english int, ADD math int;

#콜롬 데이터 타입 수정
ALTER TABLE t_table MODIFY COLUMN korean VARCHAR(5);

#콜롬 삭제
ALTER TABLE t_table DROP COLUMN korean;
ALTER TABLE t_table DROP COLUMN english;
ALTER TABLE t_table DROP COLUMN math;

#실습 - t_table에 korean varchar(5), math varchar(10) 추가하고 varchar->int로 변경
ALTER TABLE t_table ADD Korean VARCHAR(5), ADD Math VARCHAR(10);
ALTER TABLE t_table MODIFY COLUMN Korean INT;
ALTER TABLE t_table MODIFY COLUMN Math INT;
DESC t_table;

DROP DATABASE testDB;
DROP DATABASE test;

#연습문제
#1. 데이터베이스 testDB를 생성하라
CREATE DATABASE testDB;
/*2. 데이터베이스 testDB에 testtable을 생성하라
 생성할 테이블의 형태는num INT, name VARCHAR(10), phone VARCHAR(10),
	address VARCHAR(20), email VARCHAR(20)
*/
CREATE TABLE testTable(
	num INT,
	name VARCHAR(10),
	phone VARCHAR(10),
	address VARCHAR(20),
	email VARCHAR(20)
	);
#3. 생성한 테이블에 student_num(int), korean(int), math(int), english(int)를 추가
ALTER TABLE testTable ADD student_num INT, ADD korean INT, ADD math INT, ADD english INT;
#4. 추가한 student_num의 데이터 타입을 varchar형태로 변경해라
ALTER TABLE testTable MODIFY COLUMN student_num VARCHAR(5);	
#5. address 컬럼을 삭제해라
ALTER TABLE testTable DROP COLUMN address;
#6. testtable 테이블을 삭제해라
DROP TABLE testTable;
#7. testDB를 삭제해라
DROP DATABASE testDB;
#접속한 데이터베이스 확인
SELECT DATABASE();	

####제약조건####
 
#NOT NULL
CREATE TABLE Persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255) NOT NULL,
	Age int
	);
DESC persons;

INSERT INTO persons (ID,LastName,FirstName,Age) VALUES (10,'test','testuser',26);
INSERT INTO persons (ID,LastName,FirstName) VALUES (11,'test11','testuser11');
INSERT INTO persons (ID,LastName,FirstName) VALUES (12,'test12','');
SELECT * FROM persons;
DROP TABLE persons;

#UNIQUE
CREATE TABLE Persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	UNIQUE (ID)
	);
DESC persons;
INSERT INTO persons (ID,LastName,FirstName,Age) VALUES (10,'test','testuser',26);
INSERT INTO persons (ID,LastName,FirstName) VALUES (11,'test','testuser');

#PRIMARY KEY
CREATE TABLE Persons(
	ID INT,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	PRIMARY KEY (ID)
	);	
DROP TABLE persons;

#CHECK(나이가 18살 이상인지 확인)
CREATE TABLE Persons(
	ID INT NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	CHECK (Age>=18)
	);
DESC persons;
INSERT INTO persons (ID,LastName,FirstName,Age) VALUES (10,'test','testuser',26);
INSERT INTO persons (ID,LastName,FirstName,Age) VALUES (11,'test11','testuser11',2);

#제약조건별로  검색
SHOW DATABASES;
SELECT * FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_NAME='persons';

#DEFAULT
DROP TABLE PERSONS;
CREATE TABLE Orders(
	ID INT NOT NULL,
	OrderNumber INT NOT NULL,
	OrderDate TIMESTAMP DEFAULT NOW()
	);
DESC ORDERS;
INSERT INTO orders (ID,OrderNumber) VALUES (1,1); 
INSERT INTO orders (ID,OrderNumber) VALUES (2,2); 
SELECT * FROM orders;

#Auto_Increment
CREATE TABLE Persons(
	ID INT NOT NULL AUTO_INCREMENT,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	PRIMARY KEY (ID)
	);
DESC persons;	
INSERT INTO persons (LastName,FirstName,Age) VALUES ('test','testuser',26);
INSERT INTO persons (LastName,FirstName,Age) VALUES ('test','testuser',26);
INSERT INTO persons (LastName,FirstName,Age) VALUES ('test','testuser',26);
SELECT * FROM persons;
##특정값부터 시작하고 싶은 경우
ALTER TABLE persons AUTO_INCREMENT=100;
INSERT INTO persons (LastName,FirstName,Age) VALUES ('test','testuser',26);
SELECT * FROM persons;

#연습문제
/* 다음 조건에 맞게 Persons와 Orders테이블 생성한 후에 데이터를 추가함. 
Persons : 
     ID(int-not null, 자동 증가 처리, primary key)
     LastName(varchar(255)-not null)
     FirstName(varchar(255))
     Age(int)
     City(varchar(255), 기본값 :'Seoul')

  Orders : 
     ID(int-not null, 자동 증가 처리, primary key)
     OrderNumber(int-not null)
     PersonID(int)
     OrderDate(timestamp, 자동으로 날짜 입력)
     **마지막에 추가 제약 조건... 
     FOREIGN KEY (PersonID) REFERENCES Persons(ID)

   (insert)
    이후에 Persons테이블에 user1 ~ user10까지 생성
   Orders 테이블 OerderNumber 10개를 임의로 생성
*/
CREATE TABLE Persons(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	LastName VARCHAR(255) NOT NULL,
	FirstName VARCHAR(255),
	Age INT,
	City VARCHAR(255) DEFAULT('Seoul')
	);

CREATE TABLE Orders(
	ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	OrderNumber INT NOT NULL,
	PersonID INT,
	Orderate TIMESTAMP DEFAULT NOW(),
	FOREIGN KEY (`PersonID`) REFERENCES Persons (`ID`)
	);

INSERT INTO persons (LastName,Firstname,age) VALUES ('user1','user1',20);
INSERT INTO persons (LastName,Firstname,age) VALUES ('user2','user2',21);
INSERT INTO persons (LastName,Firstname,age,city) VALUES ('user3','user3',21,'Suwon');
INSERT INTO persons (LastName,Firstname,age,city) VALUES ('user4','user4',21,'Bundang');
INSERT INTO persons (LastName,Firstname,age,city) VALUES ('user5','user5',21,'Guri');
INSERT INTO persons (LastName,Firstname,age,city) VALUES ('user6','user6',22,'');
INSERT INTO persons (LastName,Firstname,age) VALUES ('user7','user7',23);
INSERT INTO persons (LastName,Firstname,age) VALUES ('user8','user8',30);
INSERT INTO persons (LastName,Firstname,age) VALUES ('user9','user9',27);
INSERT INTO persons (LastName,Firstname,age) VALUES ('user10','user10',43);
SELECT * FROM persons;

INSERT INTO Orders (OrderNumber,PersonID) VALUES (1,1);
INSERT INTO Orders (OrderNumber,PersonID) VALUES (2,2);
INSERT INTO Orders (OrderNumber,PersonID) VALUES (3,3);
INSERT INTO Orders (OrderNumber,PersonID) VALUES (4,4);
INSERT INTO Orders (OrderNumber,PersonID) VALUES (5,6);
INSERT INTO Orders (OrderNumber,PersonID) VALUES (6,5);
INSERT INTO Orders (OrderNumber,PersonID) VALUES (7,10);
INSERT INTO Orders (OrderNumber,PersonID) VALUES (8,9);
INSERT INTO Orders (OrderNumber,PersonID) VALUES (9,7);
INSERT INTO Orders (OrderNumber,PersonID) VALUES (10,8);
SELECT * FROM orders;

UPDATE orders SET PersonID=10 WHERE id=3;

UPDATE orders SET PersonID=4 WHERE id=1 OR id=3 OR id=5;
SELECT * FROM orders;
UPDATE orders SET PersonID=5 WHERE id=2;
SELECT * FROM orders;
UPDATE orders SET PersonID=1 WHERE id=4;
SELECT * FROM orders;
UPDATE orders SET PersonID=7 WHERE id=8 OR id=9;
SELECT * FROM orders;
UPDATE orders SET PersonID=6 WHERE id=6;
SELECT * FROM orders;
UPDATE orders SET PersonID=1 WHERE id=7;
SELECT * FROM orders;	
UPDATE orders SET PersonID=10 WHERE id=10;
SELECT * FROM orders;

SELECT * FROM persons WHERE age>=30;

#select 실습문제
#나이가 27살인 사람의 도시를 출력
SELECT city FROM persons WHERE age=27;
#id가 5미만인 사람들을 출력
SELECT * FROM persons WHERE id<5;
#나이가 30대인 사람의 이름을 출력
SELECT firstName FROM persons WHERE age BETWEEN 30 AND 40;
#중복된 나이를 뺀 나이를 출력
SELECT DISTINCT age FROM persons;

#논리연산자 연습문제
UPDATE persons SET city='Suwon' WHERE id=5 OR id=7;
UPDATE persons SET city='Busan' WHERE id=1 OR id=8;
UPDATE persons SET city='Gwangju' WHERE id=10;
SELECT * FROM persons;
#부산과 수원에 사는 사람들 중에 나이가 30 이상인 사람의 이름
SELECT LastName,FirstName FROM persons 
WHERE (city='Busan' OR city='Suwon') AND (age>=30);
#나이가 20이상인 사람들 중에 도시가 광주인 사람과 대구인 사람의 나이는
SELECT DISTINCT age FROM persons
WHERE (city='Gwangju' OR city='Daegu') AND (age>=20);
#도시가 서울이 아닌 사람들 중에 부산사람들을 뺸 나머지는
SELECT LastName,FirstName,age FROM persons 
WHERE not city='Busan' AND not city='Seoul';


##Order by
SELECT ID, City FROM persons ORDER BY city ASC;
SELECT ID, City FROM persons ORDER BY city DESC;

#예제
SELECT * FROM orders ORDER BY PersonID ASC;
SELECT * FROM orders ORDER BY PersonID DESC;

## null
INSERT INTO persons (LastName,Age,City) VALUES ('test_null',35,'Seoul');
SELECT * FROM persons WHERE FirstName IS NULL;
SELECT * FROM persons WHERE FirstName IS not NULL;

#Transaction 실습
BEGIN;
INSERT INTO persons(LastName, FirstName,age,City)
	VALUES('testuser1','testuser1',32,'Seoul');
INSERT INTO persons(LastName, FirstName,age,City)
	VALUES('testuser2','testuser2',33,'Busan');
INSERT INTO persons(LastName, FirstName,age,City)
	VALUES('testuser3','testuser3',33,'Daegu');
INSERT INTO persons(LastName, FirstName,age,City)
	VALUES('testuser4','testuser4',34,'Incheon');
INSERT INTO persons(LastName, FirstName,age,City)
	VALUES('testuser5','testuser5',35,'Gwangju');
COMMIT;

BEGIN;
UPDATE persons SET age=28 WHERE Lastname='testuser1' OR Lastname='testuser3';
UPDATE persons SET City='Jeju' WHERE Lastname='testuser4';
SELECT * FROM persons;
ROLLBACK;

##트랜젝션 후 삭제
START TRANSACTION;
DELETE FROM persons WHERE id=11;
SELECT * FROM persons WHERE id=11;
ROLLBACK;
SELECT * FROM persons WHERE id=11;


###집단함수
## MAX예제
SELECT LastName, FirstName FROM persons 
WHERE age=(select MAX(age) FROM persons);
## MIN예제
SELECT City FROM persons 
WHERE age=(select MIN(age) FROM persons);
## COUNT예제
SELECT count(age) FROM persons;
SELECT count(FirstName) FROM persons;
#참고: count는 null값을 카운트 하지 않는다.
## 테이블 내에 전체 레코드의 개수 : 
SELECT COUNT(*) FROM persons;
## AVG예제
SELECT AVG(age) FROM persons;
## SUM예제
SELECT SUM(age) FROM persons WHERE City='Seoul';


### Like 예제
INSERT INTO persons (LastName,FirstName,age,city) VALUES('Hong','Gildong',100,'island');
SELECT LastName,FirstName FROM persons WHERE city LIKE 'I%';


##연습문제
#도시 이름 중 n으로 끝나는 사람의 나이를 출력
SELECT age,city FROM persons WHERE city LIKE '%n';
#LastName이 test로 시작하는 사람의 이름 출력
SELECT FirstName FROM persons WHERE LastName LIKE 'test%';
#나이가 34이하이면서 city가 'D'로 시작하는 사람들의 이름을 출력
SELECT FirstName FROM persons WHERE age<=34 and city LIKE 'D%';
#도시의 이름이 'G'와 'S'로 시작하는 사람들의 이름 출력( 단, null은 제외)
SELECT LastName,FirstName FROM persons 
WHERE (city LIKE 'G%' or city LIKE 'S%') AND FirstName IS NOT NULL;
#lastName의 test문자 다음 한글자만 있는 사람들을 출력
SELECT Lastname, FirstName FROM persons WHERE Lastname LIKE 'test_';
SELECT Lastname, FirstName FROM persons WHERE Lastname LIKE 'user_';


### IN
## IN예제
#persons테이블에서 서울,부산,광주인 사용자를 출력
SELECT * FROM persons WHERE City IN ('Seoul','Busan','Gwangju');
#persons테이블에서 서울,부산,광주가 아닌  사용자를 출력
SELECT * FROM persons WHERE City NOT IN ('Seoul','Busan','Gwangju');
SELECT * FROM persons WHERE ID IN(SELECT DISTINCT personID FROM orders);


## 연습문제
#서울 광주에 살고 있는 사람중에 order내역을 출력
SELECT * FROM orders WHERE PersonID IN(SELECT ID FROM persons WHERE city IN('Seoul','Gwangju'));
#서울과 섬을 제외한 지역에 살고있는 사람의 주문
SELECT * FROM orders WHERE PersonID NOT IN(SELECT ID FROM persons WHERE city NOT IN('Seoul','island'));
#주문한 사람들이 살고 있는 도시
SELECT city FROM persons WHERE ID IN(SELECT personID FROM orders);
#서울 광주 부산에서 주문한 사람들 중 나이가 30이상인 사람이 주문한 내역
SELECT * FROM orders WHERE PersonID IN
(SELECT ID FROM persons WHERE city IN('Seoul','Gwangju','Busan')
AND age>=30);


### BETWEEN
##예제
#나이가 20과 40 사이인 사람의 firstName
SELECT FirstName FROM persons WHERE age BETWEEN 20 AND 40;
#나이가 30과 100 사이인 사람의 도시는?
SELECT city FROM persons WHERE age BETWEEN 30 AND 100;


### AS(ALIAS)
SELECT personID AS ID, Orderate AS DATE FROM orders;
#테이블을 치환 재검색
SELECT MAX(age) 
FROM (SELECT age FROM persons WHERE city='Seoul') AS agetable;

## 실습
#persons테이블에 있는 user7이 주문한 주문번호와 주문날짜,주문고객이름 출력
SELECT orders.ID, orders.Orderdate, persons.FirstName
FROM persons, orders
WHERE persons.FirstName='user7'
AND persons.ID = orders.PersonID
;
#별칭쓰기
SELECT O.ID AS OrderID, O.Orderdate, P.FirstName AS firstname
FROM persons AS P, orders AS O
WHERE P.FirstName='user7'
AND P.ID = O.PersonID
;


### Union
#예제
SELECT ID FROM persons UNION SELECT PersonID FROM orders; #중복포함
SELECT ID FROM persons UNION ALL SELECT PersonID FROM orders; # 중복 미포함

#실습
# persons테이블의 20대 사용자의 id와 나이, orders 테이블의 personID와 주문번호 출력
SELECT ID, Age FROM persons WHERE age BETWEEN 20 AND 30
UNION
SELECT PersonID, OrderNumber FROM orders;


### GROUP BY
#예제
# persons테이블에 있는 도시별로 사는 사람들의 숫자를 구하라
SELECT city, COUNT(City) 
FROM persons GROUP BY city;
#예제
#persons테이블에 있는 도시별 사는 사람들의 숫자를 구하는 예제를 
#도시별 사람숫자를 기준으로 정렬(기본차순은 오름차순)
SELECT city, COUNT(City) 
FROM persons GROUP BY city
ORDER BY COUNT(city) DESC;

##실습
#persons테이블에 나이가 20이상인 사람들을 나이로 그룹화하고 
#그룹별로 인원수 조회 내림차순정렬
SELECT age, COUNT(age)
FROM persons
WHERE age>=20
GROUP BY age
ORDER BY age DESC;


## Having
#예제
#persons테이블의 내용을 도시를 기준으로 그룹화하고, 
#인원을 구하되 3인이상의 결과를 출력
SELECT COUNT(City), city 
FROM persons 
GROUP BY city 
HAVING COUNT(city)>=3;

##실습
#나이가 20이상인 사람들이 사는 지역도시 별 인원을 구하고, 숫자가 2이상 5미만인 경우를 출력
SELECT COUNT(city), city 
FROM persons
WHERE age>=20
GROUP BY city
HAVING COUNT(city)>=2 AND COUNT(city)<5;



### JOIN
#INNER JOIN 예제
SELECT firstName, age, city, OrderNumber, OrderDate
FROM persons
INNER JOIN orders
ON persons.ID = orders.PersonID;

#OUTER JOIN 예제
SELECT firstName, age, city, OrderNumber, OrderDate
FROM persons 
LEFT OUTER JOIN orders on persons.ID = orders.PersonID;

SELECT firstName, age, city, OrderNumber, OrderDate
FROM persons 
RIGHT OUTER JOIN orders on persons.ID = orders.PersonID;





























