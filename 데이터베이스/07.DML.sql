-- CHAPTER 07. DML (Data manipulation Language) --

-- DML이란?
--> 데이터 조작어로 테이블에 데이터를 조회, 추가, 수정, 삭제 할 때 사용하는 질의어
--> 테이블에서 원하는 데이터를 입력, 수정, 삭제한다.

-- [ DML의 유형 ] - 에싱없데
-- SELECT : 데이터 조회
-- INSERT : 데이터 추가
-- UPDATE : 데이터 수정
-- DELETE : 데이터 삭제

-- INSERT 사용방법
-- 1) INSERT INTO 테이블 이름 (컬럼 LIST...)
--    VALUES (값....)
--> *** INSERT INTO에 입력한 컬럼과 VALUES에 입력한 값은 순서와 자료형에 맞게 써야 된다.(1:1매핑)

-- 2) INSERT INTO 테이블 이름
--    VALUE(값...)
--> INESERT에 컬럼리스트를 생략시 VALUES에 입력한 값은 테이블의 컬럼 수와 순서와 자료형이 같아야 된다!

-- 나의 정보를 넣어보기
SELECT * FROM TEST_JOIN ;

insert into test_join (id, pw, name, join_date, age, tel, email)
values ('SMHRD01', '1111', '홍길동', sysdate, 20, '010-1234-5678', 'hong11@gmail.com') ;
SELECT * FROM TEST_JOIN ;

-- 친구의 정보를 넣기
insert into test_join (id, pw, name, join_date, age, tel, email)
values ('SMHRD02', '0000', '황해도', SYSDATE, 31, NULL, '' ) ;
SELECT * FROM TEST_JOIN ;

-- 친구의 정보를 넣기(2)
insert into test_join (id, pw, name, join_date, age, tel, email)
values('SMHRD03', '1111', '선영표', sysdate, 21, '', '') ;

-- 친구의 정보를 넣기(3)
insert into test_join (id, pw, name, join_date, age, tel, email)
values('smhrd04', '2222', '정봉균', sysdate, 16, '010-2222-2222', 'bong@naver.com');

-- 테이블 생성시 에러 리스트 

-- 1. 컬럼리스트와 입력 값의 개수가 다른 경우
INSERT INTO test_join (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', '박병관' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM', 'N');
 
--  SQL 오류: ORA-00913: too many values 
--> 컬럼 리스트의 갯수와 입력 값 개수는 일치해야 한다!

-- 2. 식별자에 NULL을 입력한 경우
INSERT INTO test_join (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES (NULL, '33333', '박병관' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."ID")
--> 컬럼에 대한 제약조건에 맞게 작성 해야함 (식별자는 NOT NULL + UNIQUE 중복불가)

-- 3. NOT NULL인 컬럼에 NULL을 넣은 경우
INSERT INTO test_join (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', NULL , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."NAME")
--> 컬럼에 대한 제약조건에 맞게 작성 해야함 ( NOT NULL 조건 )

-- 4. 자료형에 맞지 않게 입력 값을 넣은 경우
INSERT INTO test_join (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', '박병관' , SYSDATE, '29살', '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01722: invalid number
--> 컬럼에 대한 자료형에 맞게 작성이 되야 한다. (AGE는 숫자형 자료형)

-- 5. 식별자 컬럼에 중복 값을 넣을 려는 경우
INSERT INTO test_join (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('호두아빠', '33333', '박병관' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');
 
-- unique constraint (HR.SYS_C007110) violated
--> 값이 들어간 상태에서 한번더 실행이 되면 식별자가 값이 중복이 되서 에러가 남

-- update : 테이블의 데이터를 변경하고 싶을때 사용
-- 사용방법
-- update 테이블 이름
-- set 변경할 컬럼 = 데이터
-- where 데이터를 변경할 대상 행을 선별하기 위한 조건식 ;
--> *** where 조건절을 생략할 경우 테이블 내 저장된 모든 컬럼의 데이터가 변경이 된다!!

select * from test_join ;
update test_join
set age = 99
where name = '홍길동' ;
select * from test_join ;

update test_join
set tel='010-2222-3333', email='kkk@naver.com'
where name = '선영표' ;

update test_join
set tel='010-4444-5555', email='hhh@naver.com'
where name = '황해도' ;

update test_join
set id='SMHRD04'
where name = '정봉균' ;
select * from test_join ;
-- DML에 명ㄹ여문에 들어가는 조건문에 컬럼은 pk로 하는것이 원칙이다!!

-- DELETE : 데이터를 삭제할때 사용하는 명령어
-- 사용방법
-- DELETE FROM 테이블 이름
-- WHERE 삭제할 대상 행을 선별하기 위한 조건식 ;
--> *** WHERE 조건절을 생략할 경우 테이블의 모든 데이터가 삭제가 된다!
DELETE FROM test_join
where id='SMHR02' ;
SELECT * FROM TEST_JOIN ;

DELETE FROM TEST_join
where id='SMHRD03' ;
SELECT * from test_join ;

-- 30세 이하인 회원들의 정보를 삭제
delete from test_join
where age<30 ;
select * from test_join ;