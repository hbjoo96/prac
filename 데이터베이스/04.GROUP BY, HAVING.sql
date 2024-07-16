-- CHAPTER 04. GROUP BY / HAVING --

-- 내장함수의 종류

-- 단일행 함수 : 입력된 하나의 행당 결과가 하나씩 나오는 함수
-- 다중행 함수 : 여러 행을 입력받아서 하나의 결과 값으로 출력이 되는 함수
--> 다중행 함수를 집계함수라고 부른다.

-- 다중행함수 (집계함수)의 특징
-- 1. 집계함수는 null값을 제외하는 특성을 가지고 있다.
-- 2. 집계함수는 그룹화(group by)가 되어 있는 상태에서만 사용이 가능하다.

-- [ 집계 함수의 종류 ]
-- count() : 지정한 데이터의 개수를 반환
-- sum() : 지정한 데이터의 합을 반환
-- max() : 지정한 데이터 중 최대값 반환
-- min() : 지정한 데이터 중 최소값 반환
-- avg() : 지정한 데이터의 평균값 반환

-- 직원테이블의 직원id의 행의 개수를 조회 (총 직원 수)
select count(employee_id) as "직원의 수"
  from employees
group by() ;
-- 직원테이블을 하나의 그룹으로 묶은 걸로 인식함 -> group by가 된 상태

-- 부서테이블의 부서id의 행의 개수를 조회 >> 27
select count(department_id)
  from departments ;

-- 직원테이블의 부서id의 행의 개수를 조회 >> 106
select count(department_id)
  from employees ;
  
-- count함수는 *(아스타리스크)를 쓸 수 있음
-- 다른 함수는 사용할 수 없음
select count(*)
  from employees ;

-- 직원 급여의 총 합계를 출력 >> 691416
select sum(salary)
  from employees ;

-- 직원들의 최대 급여와 최소 급여를 출력 >> max : 24000, min : 2100
select max(salary), min(salary)
  from employees ;
  
-- 부서 id가 100인 직원의 평균 급여를 출력 >> 8601.3
select round(avg(salary), 1)
  from employees
 where department_id = 100 ;
-- where '100' in department_id ;

select *
  from 수강생정보 ;

select *
  from 성적표 ; 

-- group by : 특정 컬럼을 기준으로 그룹화 (묶음)

-- SQL 작성순서
-- select > from > where > group by > having > order by

-- *** SQL 실행순서 ***
-- from > where > group by > having > select > order by

-- [ group by 사용방법 ]
-- 4. select    원하는 컬럼 이름
-- 1. from      테이블 이름
-- 2. where     원하는 행을 선별하기 위한 조건식
-- 3. group by  특정 컬럼을 기준으로 그룹화

-- 수강생정보 테이블에서 소속반 별(group by) 학생의 인원수를 조회
select *
  from 수강생정보 ;
  
select 소속반, count(학생이름), 학생이름
  from 수강생정보
group by 소속반, 학생이름 ;

-- group by를 사용 시 유의사항
-- 1. group by에 특정 컬럼을 사용하는 순간 행의 개수가 감소하기 때문에 group by보다 늦게 실행되는 절은
-- having, select, order by에는 출력할 수 있는 행이 제한이 걸린다.
-- 왜냐? SQL 실행순서에 의해서

-- 2. 다만, 집계함수로 처리하는 컬럼은 사용이 가능하다.

-- 성적표 테이블에서 과목별(group by) 최고 성적과 최저성적을 출력
select max(성적), min(성적)
  from 성적표
group by 과목 ;

-- 성적표 테이블에서 학생별(group by) 평균 점수를 출력
-- 평균 점수를 2번째 자리까지 반올림
select 학생id, round(avg(성적), 2)
  from 성적표
group by 학생id ;

-- 성적표 테이블에서 학생별로 JAVA와 DATABASE과목의 성적의 합을 출력
select sum(성적)
  from 성적표
-- where 과목 in ('JAVA', 'DATABASE')
 where 과목 != 'PYTHON'
group by 학생id ;

-- having 절 : group by 절이 존재할 때만 사용이 가능하다.
--> 집계가 완료된 대상을 조건을 통해 필터링 하는 문법이다.
--> 조건이 참인 결과만 출력이 된다는 점에서는 where절과 비슷하지만, 
--> having절은 그룹화(group by)된 대상에서 출력이 된다는 점에서 다르다.

-- 성적표 테이블에서 학생별 평균 성적을 구하고, 평균 성적이 75이하인 학생들만 출력
select 학생id, round(avg(성적), 1)
  from 성적표
group by 학생id
having avg(성적) <= 75 ;

-- 문제1) 수강생정보 테이블에서 소속반 별 인원수가 3명 이상인 반만 출력
select 소속반, count(소속반)
  from 수강생정보
group by 소속반 
having count(소속반) >= 3 ;

-- 문제2) 성적표 테이블에서 학생별 평균 성적을 구하되, 평균 성적이 null이 아닌 값만 출력 단, 소수점 1의 자리까지만 출력
select 학생id, round(avg(성적), 1)
  from 성적표
 where 성적 is not null
group by 학생id;

-- 문제3) 부서별 최고 연봉이 100000 이상인 부서만 출력
select department_id, max(salary*12)
  from employees
group by department_id
having max(salary*12) >= 100000 ;

-- 문제4) 직업별 최고 급여 출력
select job_id, max(salary)
  from employees
group by job_id ;

-- 최종 문제) IR_PROG와 AD_PRES가 아닌 직업별 최고 연봉이 150000 이상인 연봉만 출력
select job_id, max(salary*12)
  from employees 
 where job_id != 'AD_PRES' and job_id != 'IT_PROG'
-- where job_id not in ('IT_PROG', 'AD_PRES')
group by job_id
having max(salary*12) >= 150000 ;