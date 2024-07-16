-- CHAPTER 06. DDL (Data Definition Language) --

-- ddl이란?
-- 데이터 정의어로 테이블 같은 저장소 객체를 만들거나 수정합니다.

-- [ DDL의 명령어 종류 ]
-- CREATE   : 테이블 같은 객체를 생성하는 명령어
-- ALTER    : 테이블 같은 객체는 변경하는 명령어
-- RENAME   : 테이블의 이름을 변경하는 명령어
-- TRUNCATE : 테이블의 데이터를 삭제하는 명령어
-- DROP     : 테이블 같은 객체를 삭제하는 명령어

-- [ 테이블 생성시 자주 사용하는 자료형 ]
-- varchar2(n) : 가변형 문자형, n크기만큼 입력받음
-- number(p,s) : 숫자형 값을 p자리만큼 입력받고 s자리 만큼 소수를 입력받음
--> 오라클 데이터베이스에서는 실수와 정수 모두 표현이 가능하다!!
--> 소괄호를 생략하게 되면 최대 값인 38 크기가 들어간다.
-- date : 현재 날짜 값을 입력받는 날짜형 자료형이다.

-- 테이블 생성하기
-- 수강생정보 테이블을 확인해서 TEST_수강생정보라는 테이블을 만들어보자
-- 수강생정보 테이블을 마우스로 드래그한 다음에 shift+f4를 누르면 테이블의 정보가 확인가능
create table test_수강생정보 (
    학생id varchar2(9),
    학생이름 varchar2(50),
    소속반 varchar2(5)
) ;

select * from test_수강생정보 ;

-- 성적표 테이블을 확인해서 test_성적표 테이블을 만들어보자!
create table test_성적표 (
    학생id varchar2(9),
    과목 varchar2(30), 
    성적 number
) ;

select * from test_성적표 ;

-- 테이블 생성 실습1
create table 테이블명_login (
    id varchar2(20),
    pw varchar2(20),
    email varchar2(20),
    name  varchar2(20)
) ;

select * from 테이블명_login ;

-- 제약조건이란 ?
--> 테이블에 입력 가능한 데이터를 조건으로 제약하는 것
--> 데이터베이스에 저장되는 데이터는 항상 정확하고 일관석이 보장이 되어야 한다.
--> 그러기 위해서 제약 조건을 지정을 해줘야한다.
--> 제약 조건 지정 방식에 따라서 데이터의 수정이나 삭제 여부에 영향을 받는다.

-- [ 제약 조건의 종류 ]
-- PRIMARY KEY(PK) : 기본키, NOT NULL + UNIQUE --> NULL값 불가 + 중복 불가
-- UNIQUE KEY(UK) : 고유키, NULL값 입력 가능 단 중복은 불가
-- NOT NULL : NULL값 불가능, 꼭 입력되어야 하는 데이터이다 할때 사용하는 제약 조건
-- CHECK : TRUE OR FALSE로 평가할 수 있는 논리식 지정, 지정한 데이터만 입력 가능
-- FOREIGN KEY(FK) : 외래키, 테이블을 연결하는 키

-- 데이터 무결성이란 ?
--> 데이터에 결함이 없는 상태
--> 데이터가 정확하고 유효하게 유지된 상태

-- 무결성 제약조건 종류
-- 개체 무결성(PK) : 기본키 제약이라고 하며, 하나의 테이블에 중복된 행이 존재하지 않도록 규정
-- 참조 무결성(FK) : 행을 입력, 수정, 삭제할 때 연관되는 다른 테이블과의 데이터가 정확하게 유지되도록 규정
--> 참조 관계에 있는 두 테이블의 데이터가 항상 일관된 값을 가져야 하는 것

-- [ 이미 생성된 테이블에서 제약조건을 지정하기 ]
select * from 테이블명_login ;
-- 사용방법
-- alter table 테이블 이름 add constraint 제약조건 이름 제약조건(컬럼)

-- 테이블에 pk 제약조건 지정하기
alter table 테이블명_login add constraint 테이블명_id_pk primary key(id) ;

-- 테이블에 uk 제약조건 지정하기
alter table 테이블명_login add constraint 테이블명_email_uk unique(email) ;

-- 테이블에 check 제약조건 지정하기
alter table 테이블명_login add constraint 테이블명_pw_check check(length(pw) >3 ) ;

-- 테이블에 fk 제약조건을 지정하기
-- fk 제약조건 설정하는 방법
-- alter tabel 테이블 이름 add constrint 제약조건이름 제약조건(컬럼)
-- references 참조테이블(참조컬럼명) ;

-- test_수강생정보 테이블에 학생id컬럼을 pk로 제약조건을 걸어주세요!!
alter table test_수강생정보 add constraint test_id_pk primary key(학생id) ;
select * from test_수강생정보 ;

-- test_성적표 테이블의 학생id 컬럼을 fk로 제약조건을 걸어주기
alter table test_성적표 add constraint 학생id_fk foreign key(학생id)
references test_수강생정보(학생id);

-- 제약조건 변경하기
-- alter table 테이블 이름 modify 컬럼 이름 바꿀 제약조건 ;
select * from 테이블명_login ;
alter table 테이블명_login modify name not null ;

-- 제약조건 삭제하기
-- alter table 테이블이름 drop constraint 제약조건 이름 ;
alter table 테이블명_login drop constraint 테이블명_PW_CHECK ;

-- 테이블의 컬럼 추가
--alter table 테이블명이름 add 컬럼명 자료형 (크기) ;
alter table 테이블명_login add tel varchar2(10);
select * from 테이블명_login ;

-- 컬럼의 자료형을 변경하기
-- alter table 테이블 이름 modify 컬럼명 바꿀 자료형(길이) ;
alter table 테이블명_login modify tel varchar2(20) ;

-- 특정 컬럼을 삭제하기
-- alter table 테이블이름 drop column 컬럼명 ;
alter table 테이블명_login drop column tel ;

-- 테이블의 이름을 변경하기
-- rename 테이블이름 to 바꿀 테이블이름 ;
rename 테이블명_login to kk_login ;
select * from kk_login ;

-- 테이블 삭제
-- 사용방법
-- drop table 테이블 이름 ;
drop table test_수강생정보 ;
-- ORA-02449: unique/primary keys in table referenced by foreign keys
-- test_성적표 테이블의 학생id라는 컬럼이 fk로 참조되고 있기 때문에 삭제가 불가능하다.

-- 제약조건까지 삭제를 하는 방법
-- drop table 테이블이름 cascade constraint ;
drop table test_수강생정보 cascade constraint;

-- truncate : 테이블의 데이터를 영구 삭제 -> 롤백해도 돌아오지 않음
-- truncate table 테이블 이름 ;

-- 테이블을 복사하는 쿼리문
create table drop_성적표 as select * from 성적표 ;
select * from drop_성적표 ;
--> 테이블의 제약조건까지는 복사가 되지 않는다.
--> 성적표 테이블과 동일한 데이터를 가지는 테이블을 복사하는 쿼리문이다!
truncate table drop_성적표 ;
rollback;

-- 테이블 생성 방법 1)
create table tb_test1(
    pk테스트 number primary key,
    uk테스트 number unique, 
    nl테스트 number not null, 
    ck테스트 number check (length(ck테스트)>5)
);
-- 테이블 생성 방법 2)
create table tb_test2(
    pk테스트 number, 
    uk테스트 number, 
    nl테스트 number not null, 
    ck테스트 number, 
    fk테스트 number, 
    -- 제약조건을 추가
    -- constraint 제약조건명 제약조건(컬럼)
    constraint pk테스트_pk primary key (pk테스트),
    constraint uk테스트_uk unique (uk테스트), 
    constraint ck테스트_ck check (ck테스트> 0), 
    constraint fk테스트_fk foreign key (fk테스트)
    references tb_test1 (pk테스트)
);

-- 테이블 생성 실습2
create table test_join (
    id varchar2(20) primary key,
    pw varchar2(20) not null,
    name varchar2(10) not null,
    join_date date,
    age number(3),
    tel varchar2(20),
    email varchar2(50) unique
);
select * from test_join ;

-- VIEW(뷰)란 ?
--> 하나 이상의 테이블에서 여러 정보를 토대로 만들어지는 가상의 테이블이다.
-- 뷰 생성 방법
-- CREATE VIEW 뷰 이름
-- AS 저장할 SELECT 문장

CREATE VIEW EMP_100
AS SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, SALARY
     FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 100 ;

SELECT * FROM EMP_100 ;