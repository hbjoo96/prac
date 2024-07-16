-- CHAPTER 01. SELECT

-- 주석 색깔 바꾸기 : 도구 > 환경설정 > 코드 편집기 > PL/SQL주석
-- 글자 크기 키우기 : 도구 > 환경설정 > 코드편집기 > 글꼴

-- 주석기호
-- 주석형태(2) : /**/ -> 여러 줄을 한번에 주석처리 가능

/*
1. SQL문장에는 대소문자를 구분하지 않는다.
2. 띄어쓰기나 줄바꿈 또한 명령어 수행에 영향을 주지 않는다.
3. SQL 문장 끝에는 꼭 세미콜론 (;)을 찍어줘야 한다.
4. SQL 실행 단축키 : CTRL + ENTER, F9
*/

desc employees ;

select first_name 
  from employees ;

-- [select 절 기본 사용방법]

-- select 조회할 컬럼명
-- from   조회할 테이블 이름

select first_name, email 
  from employees ;

-- 직원테이블에서 직원ID, 전화번호, 부서아이디, last_name을 출력

desc employees;
select employee_id, phone_number, department_id, last_name 
  from employees ;
-- DESC(DESCRIBE)>묘사하다, 명령문은 SQL에서 사용되는 데이터베이스 테이블의 구조를 확인하는 데에 쓰입니ㅏㄷ.
-- 주로 테이블의 열(컬럼)에 대한 정보를 제공하며,
-- 특히 테이블이나 뷰의 구조를 조회할 때 유용합니다.

-- 직원 테이블에서 직원id, 급여, 매니저아이디 출력
select employee_id, salary, manager_id
  from employees ;
  
-- 부서테이블에서 부서id, 부서명, location_id를 출력
select department_id, department_name, location_id
  from departments ;
  
-- 직원테이블에서 부서id, first_name, email, salary, 전화전호 정보를 출력
select department_id, first_name, email, salary, phone_number
  from employees ;
  
-- *(아스타리스크) : 전체를 의미, 전체 조회

-- 직원테이블의 모든 정보를 출력
select *
  from employees ;
  
-- 부서테이블의 모든 정보를 출력 -- 몇개의 부서가 있는지
select *
  from departments ;
  
-- 직업테이블의 모든 정보를 출력
select *
  from employees ;
  
-- 직원테이블에서 job_id를 출력
select job_id
  from employees ;
  
-- select [all/distinct] 컬럼이름
select distinct job_id
  from employees ;
  
-- 직원테이블에서 부서ID를 중복을 제거하여 출력
select distinct department_id
  from employees ;

-- 직원테이블에서 입사일정보를 중복을 제거하여 출력
select distinct hire_date
  from employees ;
  
-- 직원테이블에서 job_id와 부서id의 중복을 제거하여 출력
select distinct job_id, department_id
  from employees ;
  
-- distinct 뒤에 2개 이상의 컬럼을 적으면
-- 한쪽 컬럼에 중복이 있어도 다른 쪽 컬럼의 값이 다르면 다르게 취급되서 중복제거가 정상적으로 안된다.
-- distinct는 1개의 컬럼만 사용해야 된다.

desc employees ;

-- 컬럼의 자료형이 숫자형, 날짜형이면 숫자 연산이 가능합니다.(+,-,*,/)

-- 직원id, 이름, 급여 정보를 출력
select employee_id, first_name, salary, salary*12
  from employees ;
  
-- 별칭 사용하기
-- alias 라고 하며 한눈에 보기 좋게 설정할 수 있다.
-- as라는 키워드를 사용하여 별칭을 지정한다.

-- 별칭 사용 방벙
-- 1. select 컬럼이름 별칭
-- 2. select 컬럼이름 "별칭"
-- 3. select 컬럼이름 as 별칭
-- 4. select 컬럼이름 as "별칭"

-- 직원테이블에서 직원의 이름과 급여 정보 연봉의 정보를 출력
-- 연봉은 직원연봉이라는 별칭을 사용해서 출력
select first_name, salary*12 as 직원연봉
  from employees ;
  
-- 직원테이블에서 이름, 입사일, 입사일 다음날을 출력, 입사일 이튿날을 출력
-- 다만, 입사일 다음날은 "입사일 다음날"로 별칭을 사용해서 출력
-- 입사일 이튿날은 "입사일 이튿날"로 별칭을 사용해서 출력
select first_name, hire_date, hire_date+1 "입사일 다음날", hire_date+2 "입사일 이튿날"
  from employees ;
  
-- order by 절
-- 특정 컬럼을 기준으로 정렬된 상태로 출력하고자 할 때 사용한다.
-- SQL실행순서에서 가장 마지막에 실행된다.
-- 별도로 정렬 방식을 지정하지 않으면 기본적으로 오름차순이 적용된다.

-- asc(Ascending) : 오름차순 정렬 (1, 2, 3, 4, 5, ....)
-- desc(Descending) : 내림차순 정렬 (10, 9, 8, 7, ...)

-- order by 기본 사용방법

-- select 조회하고자 하는 컬럼 이름
--  from 조회하고자 하는 테이블 이름
-- order by 특정 컬럼을 이용해서 정렬

-- 직원의 모든 정보를 출력
-- 단, 급여 기준으로 오름차순을 적용하여 출력
select *
  from employees
order by salary desc ;

-- 최근에 입사한 날짜를 기준으로 직원의 이름과 입사날짜를 출력
select first_name, hire_date
  from employees
order by hire_date desc ;

-- 직원테이블에서 직원id, 부서id, 이름, 급여 순으로 출력
-- 단, 부서id는 오름차순으로, 급여는 내림차순으로 출력
select employee_id, department_id, first_name, salary
  from employees
order by department_id asc, salary desc ;

-- 같은 부서에서 근무하고 있는 직원들끼리
-- 급여가 높은 순서대로 내림차순 정렬이 된 것
-- 먼저 부서id를 오름차순으로 정렬을 한 후에 급여를 내림차순으로 정렬을 한 것이다.

-- NULL이란?
-- NULL 값이란 데이터의 값이 완전히 비어 있는 상태를 의미한다.
-- 값이 존재하지 않거나 정해지지 않는 것을 의미한다.
-- 숫자0 과 빈 문자열 ''은 NULL 값이 아니다!
-- NULL은 연산하면 결과값은 무조건 NULL 값이 나온다.
-- NULL을 비교하면 결과값은 무조건 FALSE 값이 나온다.

select *
  from employees ;
  
-- 직원테이블에서 직원id, 보너스, 보너스 2배의 정보를 출력
-- 보너스 두배는 up_bonus 라는 별칭을 사용해서 출력
select employee_id, commission_pct, commission_pct*2 "up_bonus"
  from employees ;

-- 문제1에서 up_bonus의 결과 값을 출력을 해보고 결과 값을 확인, 왜 그렇게 결과 값이 나왔는지 설명
