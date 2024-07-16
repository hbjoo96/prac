-- CHAPTER 05. JOIN --

-- join이란 ?
--> 여러 테이블에서 필요한 데이터를 한번에 가져오는 기술

-- 비등가조인(NON EQUI JOIN)
--> 두 개의 테이블 간에 서로 정확하게 일치하지 않는 경우 활용하는 조인
--> 등가연산자(=)가 아닌 연산자들을 사용한 조인을 의미(>, >=, <, <=, BETWEEN)

-- 등가조인 (EQUI JOIN)
--> 두 개의 테이블 간에 서로 정확하게 일치하는 경우 활용하는 조인
--> 등가 연산자를 사용해서 조인을 의미(=)
--> 가장 많이 사용되는 조인의 형태이다.

--> [ 등가조인의 사용방법 ]
-- select 테이블1.컬럼이름. 테이블2.컬럼이름 --> 내가 원하는 컬럼이름.(경로)를 통해서 다 조회가능!
--   from 테이블1, 테이블2 --> 테이블1과 테이블2를 join하겠다.
--  where 테이블1.컬럼이름 = 테이블2.컬럼이름 ; -- 조인 조건을 기술

-- 수강생정보 테이블과 성적표 테이블에서 학생ID, 학생이름, 과목, 성적 순으로 출력

-- 1. 조인할 대상 테이블의 정보를 확인
-- 2. from절에 조인할 테이블을 ,(컴마) 기준으로 작성
-- 3. 조인 조건이 되는 특정 컬럼을 확인하여, where 조건절에 '조인조건'을 작성
-- 조인 조건이 되는 특정 컬럼 : 조인할 테이블 간에 '같은 결과 값'을 가지는 컬럼이다.
-- 4. select 절에 출력하고자 하는 컬럼을 .(경로)와 함께 작성
select * from 수강생정보 ;
select * from 성적표 ;

select 수강생정보.학생id, 수강생정보.학생이름, 성적표.과목, 성적표.성적
  from 수강생정보, 성적표
 where 수강생정보.학생id = 성적표.학생id ;
 
-- 직원id, first_name, 부서이름 순으로 출력을 해주세요
select * from employees ;

select employees.employee_id, employees.first_name, departments.department_name
  from employees, departments
 where employees.department_id = departments.department_id ;
 
-- from 절에 별칭을 사용
select e.employee_id, e.first_name, d.department_name
  from employees e, departments d
 where e.department_id = d.department_id ;
 
-- 직원id가 100인 직원의 이름, 부서명을 출력
select e.first_name, d.department_name
  from employees e, departments d
 where e.department_id = d.department_id and e.employee_id = '100' ;
 
-- 직원id가 201인 직원id, 이름, 직업id, 직업정보 출력
select e.employee_id, e.first_name, e.job_id, j.job_title
  from employees e, jobs j
 where e.job_id = j.job_id and e.employee_id = '201' ;
 
-- ansi join 문법의 사용방법
-- 3. selelct 내가 조회하고자 하는 컬럼 이름        --> dot(.)을 통한 경로를 통해서 테이블의 컬럼을 조회
-- 1.    from 테이블1 join 테이블2               --> 테이블1과 테이블2를 join하겠다.
--         on (테이블1.컬럼 = 테이블2.컬럼)        --> 조인 조건절을 작성
-- 2.   where 일반조건식을 따로 선별               --> 일반 조건절을 작성

-- 직원id가 101인 직원id와 직원의 이름과 직원의 부서명을 출력
select e.employee_id, e.first_name, d.department_name
  from employees e join departments d
    on (e.department_id = d.department_id)
 where e.employee_id = '101' ;
 
-- 단독적으로 존재하는 컬럼은 .(경로)를 안적어줘도 상관이 없다.
-- 하지만 현업에서는 경로를 써주는 것이 배려다.
-- 조인 조건은 대부분 pk와 fk관계로 이루어진다. 하지만 다 그런것은 아니다!!

-- cross join : 조인 조건절을 적지 않고 테이블의 모든 데이터를 가지고 오는 방법
--> 조인 조건이 없는 경우 생길 수 있는 모든 데이터의 조합을 조회
--> 카티션 곱이라고 부른다.
--> 카티션 곱 : 모든 경우의 수를 나타내는 것

-- [ cross join의 사용방법 ]
--  select 조회할 컬럼이름
--    from 테이블1 cross join 테이블2
-->> on에 조인조건절이 없으면 cross join이다!

-- 직원id와 부서명을 출력 107*27=2889 (카티션 곱)
select e.employee_id, e.department_id, d.department_name
  from employees e cross join departments d ;
  
-- 직원테이블의 총 행의 개수(107) * 부서테이블의 총 행의 개수(27) = 2889개의 행
-- 카티션 곱 -> 모든 경우의 수가 출력이 되는 것을 말함

select * from employees ;

-- 셀프 조인 : 같은 테이블끼리 조인하는 것
--> 별칭을 지워줘야 된다 반드시!

-- 각각의 매니저 이름을 출력
-- 직원id, 직원이름, 매니저id, 매니저이름
select a.employee_id, a.first_name, a.manager_id, b.first_name
  from employees a join employees b
    on (a.manager_id = b.employee_id)
order by a.employee_id asc ;

select * from departments;

-- 각 부서의 매니저 직원들의 부서이름, 매니저아이디와 직원의 이름을 출력
select d.department_name, d.manager_id, e.first_name
  from departments d join employees e
    on (d.manager_id = e.employee_id)
order by d.manager_id asc ;

-- outer join : 외부조인이라고 하며, 두개의 테이블 간의 교집합을 조회하고
-- 한쪽 테이블에만 있는 데이터도 포함시켜서 조회하고 싶을 때 사용하는 조인 문법이다.
--> 한쪽 테이블의 null값도 출력하고 싶을때 사용

-- left outer join : 왼쪽 테이블을 기준으로 null값도 포함하여 출력
--> 오라클 조인 문법 : 조인 조건절에 반대인 오른쪽 컬럼에 (+) 기호를 작성
select d.department_name, d.manager_id, e.first_name
  from departments d left outer join employees e
    on (d.manager_id = e.employee_id) ;
    
-- 오라클 조인 문법으로 풀이
select d.department_name, d.manager_id, e.first_name
  from departments d join employees e
    on (d.manager_id = e.employee_id(+)) ;
    
-- right outer join
select d.department_name, d.manager_id, e.first_name
  from departments d right outer join employees e
    on (d.manager_id = e.employee_id) ;

-- 오라클 조인 문법으로 풀이
select d.department_name, d.manager_id, e.first_name
  from departments d join employees e
    on (d.manager_id(+) = e.employee_id) ;

-- full outer join
select d.department_name, d.manager_id, e.first_name
  from departments d full outer join employees e
    on (d.manager_id = e.employee_id) ;
-- 16(left outer join) + 107(right outer join) = 123개의 행