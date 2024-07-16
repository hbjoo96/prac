-- CHAPTER 10. 서브쿼리 (Sub Query) --

-- SQL 작성 순서
-- select > from > where > group by > having > order by

-- *** SQL 실행 순서 ***
-- from > where > group by > having > select > order by

-- 5. select      조회하고자 하는 컬럼 이름....
-- 1. from        조회하고자 하는 테이블 이름
-- 2. where       조회하고자 하는 원하는 행을 선별하기 위한 조건식
-- 3. group by    특정 컬럼을 이용하여 그룹화
-- 4. having      그룹화된 대상에서 원하는 행을 선별하기 위한 조건식
-- 6. order by    특정 컬럼을 기준으로 정렬

-- group by 복습
-- 부서별(group by) 최고 급여를 조회
select department_id, max(salary)
  from employees
group by department_id ;

-- 직업이 ad_pres, it_prog 가 아닌 직업별 평균 연봉에서
-- 평균 연봉이 12000이상인 직업만 출력
select job_id, avg(salary*12)
from employees
where job_id not in ('IT_PROG', 'AD_PRES')
group by job_id
having avg(salary*12) >= 120000 ;

-- join 문법(오라클)
-- select   테이블1.컬럼명, 테이블2.컬럼명
-- from     테이블1, 테이블2 --> 테이블1과 테이블2를 join하겠다.
-- where    테이블1.컬럼명 = 테이블2.컬럼명 --> 조인 조건이 되는 것을 적어준다

-- ansi join 문법
-- select   테이블1.컬럼명, 테이블2.컬럼명    --> DOT(.) 경로를 통해 해당 테이블의 컬럼을 조회
-- from     테이블1 (inner) join 테이블2    --> 테이블1과 테이블2를 join 하겠다.
-- on       (테이블1.컬럼명 = 테이블2.컬럼명) --> 조인 조건절을 기술
-- where    일반 조건식을 따로 선별          --> 일반 조건절을 기술

-- 직원의 직원id, 이름, 부서id, 부서명
select * from employees ;
select * from departments;

select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e join departments d
on (e.department_id = d.department_id) ;

select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id ;

-- 직원ID가 100인 직원만 출력
select e.employee_id, e.first_name, e.last_name, e.department_id, d.department_name
from employees e join departments d
on (e.department_id = d.department_id)
where e.employee_id = '100' ;

select e.employee_id, e.first_name, e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id and e.employee_id = '100' ;

-- 서브쿼리란 ?
-- SQL문을 실행하는데 필요한 데이터를 추가로 조회하기 위해서
-- SQL 내부에서 사용하는 SELECT 문장을 의미한다.
-- 서브쿼리는 메인 쿼리 안에 포함된 종속적인 관계이다.

-- 메인쿼리 : 서브쿼리의 결과 값을 사용하여 기능을 수행하는 전체 영역
-- 서브쿼리 : 메인쿼리의 조건식에 들어가는 값을 의미한다.

-- 직원 중 Jack의 급여보다 낮게 받고 있는 직원의 이름과 급여를 출력
-- 1. 테이블의 정보를 확인
select * from employees ;
-- 2. 조건의 기준이 되는 Jack의 급여의 정보를 확인
select first_name, salary
from employees
where first_name = 'Jack' ; 
-- 3. 2번의 결과 값을 가지고 조건절을 통해서 결과값을 확인
select first_name, salary
from employees
where salary < 8400 ;
-- 서브쿼리 활용하여 출력
select first_name, salary
from employees
where salary<(
    select salary
    from employees
    where first_name = 'Jack'
) ;
-- 직원테이블에서 James의 급여보다 낮게 받고 있는 직원의 이름과 급여 정보를 출력(서브쿼리 활용)
-- 에러가 날것이다 > ? 왜 에러가 나는지 분석을 한번 해보세요! -> James가 하나가 아님

select first_name, salary
from employees
where salary<(
    select salary
    from employees
    where first_name = 'James'
) ;
-- ORA-01427: single-row subquery returns more than one row
-- 단일행 서브쿼리는 하나의 행만 출력을 할 수가 있다.
select * from employees where first_name = 'James';

-- 서브쿼리의 특징
-- 1. 서브쿼리는 연산자와 같은 비교 또는 조회 대상의 오른쪽에 놓이며 ()로 묶어서 사용한다.
-- 2. 서브쿼리의 SELECT절에 명시한 컬럼은
-- 메인쿼리의 비교 대상(WHERE절에 작성한 컬럼)과 같은 자료형과 개수를 지정해야 한다.
-- 3. 서브쿼리에 있는 SELECT 문의 결과 행 수는 함께 사용하는 메인쿼리의 연산자 종류와 호환가능해야 한다.
-- 즉, 단 하나의 데이터로만 연산 가능한 연산자라면 서브 쿼리의 결과 행 수도 하나여야만 한다.
--> 연산자와 함께 상호 작용하는 방식에 따라서 단일행 서브쿼리와 다중행 서브쿼리로 나뉜다.

-- 단일행 연산자
-- =(같다), >, >=, <, <=(초과, 이상, 미만, 이하), !=, <>, ^=(같지 않다) 

-- 단일행 서브쿼리란 ?
--> 실행 결과가 단 하나의 행으로 나오는 서브쿼리다.

-- Nancy보다 빨리 입사한 직원의 이름과 입사일 정보를 조회.
-- 1. 조건의 기준이 되는 Nancy의 입사일 정보를 출력 (서브쿼리)
select hire_date from employees where first_name = 'Nancy' ;
-- 2. 단일행 연산자를 활용하여 서브쿼리를 가지고 결과값을 출력
select first_name, hire_date
from employees
where hire_date < (
    select hire_date
    from employees
    where first_name = 'Nancy'
    ) ;
    
-- 직원들의 평균 급여 보다 높은 급여를 받는 직원의 이름과 급여 정보를 조회
-- 1. 조건의 기준이 되는 직원의 평균 급여의 정보를 확인(서브쿼리)
select round(avg(salary), 1) from employees;
-- 2. 단일행 연산자를 활용하여 단일행 서브쿼리를 사용해서 결과를 출력
select first_name, last_name, salary
from employees
where salary>(
    select avg(salary)
    from employees
    ) ;

-- 다중행 서브쿼리란 ?
--> 실행 결과 행이 여러 개로 나오는 서브쿼리를 말한다.
--> 단일행 연산자는 사용할 수 없고 다중행 연산자를 사용해야 한다.

-- [ 다중행 연산자의 종류 ]
-- IN : 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치하는 데이터가 있으면 TRUE값 반환
-- IN(서브쿼리)
-- ANY : 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 TRUE값을 반환
--> 비교연산자 ANY (서브쿼리)
--> ALL :메인쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 TRUE값을 반환
-- 비교 연산자 ALL(서브쿼리)
-- EXISTS : 서브쿼리 결과 값이 존재하는지 여부를 확인한다.
-- EXISTS(서브쿼리)

-- 각 부서별 최고급여와 동일한 급여를 받고 있는 직원의 정보를 출력
-- (부서ID, 이름, 급여)

-- 조건의 기준이 되는 각 부서별 최고 급여의 정보를 출력
select department_id, max(salary)
from employees
group by department_id ;

-- in 연산자 활용
select department_id, first_name, last_name, salary
from employees
where salary in (
    select max(salary)
    from employees
    group by department_id
) ;

-- any 연산자 활용
-- any 는 조건에 만족하는 결과가 하나라도 참이면 참을 반환하는 특징
select department_id, first_name, last_name, salary
from employees
where salary = any (
    select max(salary)
    from employees
    group by department_id
) ;
-- any 연산자에 =(같다)라는 등가비교연산자를 쓰게 되면 in 연산자와 같은 결과값을 출력

-- 249페이지 교재
-- exist : 존재 여부만 확인하는 연산자
-- 부서만 해당하는 정보만 출력
select first_name, department_id
from employees 
where exists (
    select department_id
    from employees
    where department_id = 5000
);
-- exist는 존재 여부만 확인하는 연산자다!
-- 스칼라 서브쿼리란 ?
-- select 절에서 사용하는 서브쿼리
-- 하나의 컬럼에 대한 하나의 행만 반환하는 특징을 가지고 있다.
-- join 없이 join 처럼 기능하고자 할때 사용
-- 이름, 급여, 부서아이디, 부서이름을 출력
select e.first_name, e.salary, e.department_id, d.department_name
from employees e join departments d
on (e.department_id = d.department_id) ;

-- 스칼라 서브쿼리 활용
select first_name, last_name, salary, department_id,(
    select department_name
    from departments
    where department_id = e.department_id
)as 부서이름
from employees e;

-- 인라인 뷰 (Inline View)
--> FROM절에서 가상 테이블처럼 사용하는 서브쿼리이다.
--> 인라인 뷰를 사용하면 서브 쿼리의 결과를 마치 테이블처럼 사용할 수 있다.
--> 데이터베이스 SELECT 문을 객체로써 저장해 테이블처럼 사용하는 VIEW와 달리
--> 인라인 뷰는 쿼리 내에서 즉시 처리된다.
--> 인라인뷰는 별칭을 안주면 내부 컬럼을 지정할 수가 없다 그래서 반드시 별칭을 사용해야 된다.

-- 이름, 부서ID, 부서별(GROUP BY) 최고급여
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ;

-- 인라인뷰를 활용
SELECT A.FIRST_NAME, A.LAST_NAME, A.DEPARTMENT_ID, B.MAX_SALARY
FROM EMPLOYEES A, (
    SELECT DEPARTMENT_ID, MAX(SALARY) AS MAX_SALARY
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID 
    ) B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID AND A.SALARY = B.MAX_SALARY ;