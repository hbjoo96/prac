-- CHAPTER 02. WHERE

select *
  from employees ;
-- select 조회할 컬럼 이름
--   from 테이즐 이름
--  where 원하는 행을 선별하기 위한 조건식 ;

-- 직원테이블에서 직원id가 105인 직원의 first_name과 last_name을 출력
select employee_id, first_name, last_name
  from employees
 where employee_id = 105 ;
 
-- 부서테이블에서 매니저 아이디가 100인 부서이름과 부서아이디를 출력
select manager_id, department_name, department_id
  from departments
 where manager_id = 100 ;
 
-- 급여를 9000을 받는 직원의 이름, 직원id, 부서id, 급여정보를 출력
select first_name, employee_id, department_id, salary
  from employees
 where salary = 9000 ;
 
-- 직원테이블에서 직원id가 100인 직원의 JOB_ID와 급여정보를 출력
select job_id, salary, employee_id
  from employees
 where employee_id = 100 ;
 
-- 자료형이 숫자형이나 날짜형이면 산술 연산이 가능하다.
-- 실행 단축키 : CTRL + ENTER, F9
desc employees ;

-- 자료형과 리터럴
-- NUMBER : 숫자형 -> 123.., 123.56789
-- VARCHAR2 : 문자형 -> 'ABCDE'
-- DATE : 날짜형 -> '24/06/25'

-- 산술연산자 (+, -, *, /)
select salary * 12 as 연봉
  from employees ;
  
select hire_date, hire_date + 2
  from employees ;

-- 비교연산자 (크냐, 작냐, 크커나 같냐, 작거나 같냐)
-- A > B : 크다, 초과
-- A >= B : 크거나 같다, 이상
-- A < B : 작다, 미만
-- A <= B : 작거나 같다, 이하

-- 직원테이블에서 급여(salary)가 5000 이하인 직원의 first_name, salary 정보를 출력
select first_name, salary
  from employees
 where salary <= 5000 ;
 
-- 직원테이블에서 연봉이 100000 이상인 직원의 이름과 급여와 연봉의 정보를 출력
select first_name, salary as 급여, salary*12 as 연봉
  from employees
 where salary*12 > 100000 ;
 
-- 등가 비교 연산자 (같냐 아니면 같지 않냐)
-- 같다 : =
-- 같지 않다 : !=, <>, ^=
-- 같지 않다(부정비교연산자) : NOT A = B

-- 자료형과 리터럴
-- NUMBER : 숫자형 -> 123.., 123.56789
-- VARCHAR2 : 문자형 -> 'ABCDE'
-- DATE : 날짜형 -> '24/06/25'
 
-- 직원테이블에서 직업아이디가 IT_PROG 가 아닌 직원의 정보를 출력
-- first_name, job_id
select first_name, job_id
  from employees
 where job_id != 'IT_PROG' ;
 

-- 직원 테이블에서 email 정보가 sking인 직원의 모든 정보를 출력
select *
  from employees
 where email = 'SKING' ;
 
-- 직원테이블에서 06/03/07에 입사한 직원의 아이디와 이름의 정보를 출력
select employee_id, first_name, hire_date
  from employees
 where hire_date = '06/03/07' ;
 
-- job_id가 'ST_MAN'인 직원의 수는 몇명인가?
-- 정답 >> 5
select *
  from employees
 where job_id = 'ST_MAN' ;
 
-- 논리 연산자 (TRUE OR FALSE)
--> 2개 이상의 조건을 이어주는 연산자
-- AND : 조건을 모두 만족하는 경우 TRUE 값 반환
-- OR : 하나의 조건이라도 만족하는 경우 TRUE 값 반환

-- AND 조건
-- TRUE AND TRUE -> TRUE
-- TRUE AND FALSE -> FALSE
-- FALSE AND TRUE -> FALSE
-- FALSE AND FALSE -> FALSE

-- OR 조건
-- TRUE OR TRUE -> TRUE
-- TRUE OR FALSE -> TRUE
-- FALSE OR TRUE -> TRUE
-- FALSE OR FALSE -> FALSE


-- 논리연산자의 사용방법
--순서
-- 3. select 조회하고 싶은 컬럼 이름1, 조회하고 싶은 컬럼 이름2, ...
-- 1.   from 테이블 이름
-- 2.  where 조건1 and/or 조건2 and/or 조건3 and/or ...

-- 부서id가 90이고 급여가 5000이상인 직원의 직원id와 이름(first_name)을 출력
-- 정답 >> 3
select department_id, salary, employee_id, first_name
  from employees
 where department_id = 90 and salary > 5000 ;
 
-- 부서id가 100이거나 입사일 이 06년 02월 02일 이후에 입사한 직원은 총 몇명인가?
-- 정답 >> 55
select department_id, hire_date
  from employees
 where department_id = 100 or hire_date >= '06/02/02' ;
 
-- 직업이 'SA_REP'이면서 급여가 10000 이상을 받는 직원은 총 몇명일까요?
-- 정답 >> 6
select job_id, salary, first_name
  from employees
 where job_id = 'SA_REP' and salary >= 10000 ;
 
-- 연산자의 우선순위
-- and > or
 
-- 부서id가 100이거나 90인 직원중에서
-- 직원id가 101인 직원의 직원id, first_name, 연봉을 출력 * 단, 연봉은 AnnSal이라는 별칭 사용
-- 정답은 1명!
select employee_id, first_name, salary*12 as AnnSal
  from employees
 where (department_id = 100 or department_id = 90) and employee_id = 101 ;
-- 우선순위에 따라서 결과값이 완전히 달라질 수 있다.
-- () 소괄호를 이용하여 우선순위를 바꿔줄 수 있다.


-- NULL은 연산도 안되고 비교도 안됨, FALSE 출력됨.
-- NULL 관련 연산자
-- DEPARTMENT_ID가 NULL인 직원이 있음
select department_id, first_name
  from employees
 where department_id is null;

-- 부서가 없는 직원은 총 몇명? 그 이름 출력
-- 정답 >> 1명, kimberely
-- NULL 관련 연산자
-- is null : 데이터 값이 null인 값을 조회
-- is not null : 데이터 값이 null이 아닌 값을 조회

-- 보너스를 받고 일하는 직원의 수는 총 몇명인가?
-- 정답 >> 35명
select *
  from employees
 where commission_pct is not null ;

-- SQL 연산자
--> SQL에서 사용할 수 있는 연산자다
-- IN, BETWEEN A AND B, LIKE

-- IN 연산자 : 특정 컬럼에 포함된 데이터를 여러 개 조회할 때 사용
-- = + or 결과 값과 같은 값을 출력
-- IN연산자는 NULL값을 제외하는 특징을 가지고 있습니다.

-- 직원테이블에서 부서ID가 30이거나 50이거나 90인 모든 직원의 정보를 출력
select *
  from employees
 where department_id = 30 or department_id = 50 or department_id = 90 or department_id is null;
 
-- IN연산자 활용
-- null값을 넣어도 안나옴, 출력하려면 or을 활용!
select *
from employees
where department_id in (30, 50, 90, null) ;

-- 직원테이블에서 직업아이디가 AV_VP 이거나 ST_MAN인 직원의 이름과 직업아이디를 출력 (IN연산자 활용)
select first_name, employee_id, job_id
  from employees
 where job_id in ('AV_VP', 'ST_MAN');
 
 
-- NOT IN : IN 뒤에 조건에 해당하지 않는 데이터를 출력
-- NOT IN에 NULL값을 넣게 되면 아예 데이터가 출력이 안된다!
-- != + AND 결과 값과 같은 값 출력

-- 직원 테이블에서 매니저 아이디가 100, 120, 121이 아닌 직원의 이름과 매니저 아이디를 출력
select first_name, manager_id
  from employees 
 where manager_id != 100 and manager_id != 120 and manager_id != 121 ;

-- NOT IN 활용
select first_name, manager_id
  from employees
 where manager_id not in (100, 120, 121) ;

-- BEETWEEN A AND B
--> 일정 범위 내의 데이터를 조회할 때 사용
--> BETWEEN 최소값 AND 최대값
--> 특정 열 값의 최소, 최고 범위를 지정하여 해당 범위 내의 데이터만 조회하는 것

-- 직원테이블에서 급여가 10000이상 20000이하의 급여를 받는 직원의 이름과 급여 정보 출력
select first_name, salary
  from employees
 where salary >= 10000 and salary <= 20000 ;

-- BETWEEN 연산자 활용
select first_name, salary
  from employees
 where salary between 10000 and 20000 ;
 
-- 급여가 10000 이상 20000 이하인 범위내의 데이터를 출력

-- 직원테이블에서 05년에 입사한 직원의 이름과 입사날짜를 출력(BETWEEN 최소값 AND 최대값)
select first_name, hire_date
  from employees
 where hire_date between '05/01/01' and '05/12/31' ;
 
-- LIKE 연산자
-- 일부 문자열이 포함된 데이터를 조회할때 사용하는 것
-- % , _ 라는 와일드 카드를 이용해서 매칭 연산을 진행하는 것

-- % : 길이와 상관없이 모든 문자 데이터를 의미
-- _ : 어떤 값이든 상관 없이 한개의 문자 데이터를 의미

-- 핸드폰번호가 650으로 시작하는 직원의 핸드폰 번호 찾기
select phone_number
  from employees
 where phone_number like '650%' ;
 
-- 직원테이블에서 이름이(first_name) 대문자 'S'로 시작하고 'n'으로 끝나는 직원의 이름 찾기
select first_name
  from employees
 where first_name like 'S%n';
-- where first_name like 'S%' and first_name like '%n';

-- 직원테이블에서 이름이 'it'으로 끝나고 총 4글자인 직원의 이름 찾기
select first_name
  from employees
 where first_name like '__it';

-- 직원테이블에서 이름의 두번째 글자가 'e'인 직원의 이름 찾기
select first_name
  from employees
 where first_name like '_e%';

-- 직원테이블에서 01월에 입사한 직원의 입사날짜 찾기
select hire_date
  from employees
 where hire_date like '__/01%';



 