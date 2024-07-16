-- CHAPTER 03. 오라클함수 --

-- 함수란 (FUNCTION
--> 입력 값을 넣어서 특정한 기능을 통해 결과 값을 출력

-- 사용자 정의함수 : 사용자가 필요에 의해 직접 정의한 함수
-- 내장함수 : 오라클에서 미리 만들어 놓은 함수, 필요할 때 마다 호출하여 사용
--> 문자형, 숫자형, 날짜형, 형변환형, null처리함수, 조건함수

-- >>함수이름()<<함수의 형태 -> 함수를 실행할때 사용하는 입력 값 : 인자 값, 매개변수

-- [ 문자형 함수 ]
-- upper() : 괄호 안 문자 데이터를 모두 대문자로 변환하여 출력
-- lower() : 괄호 안 문자 데이터를 모두 소문자로 변환하여 출력
select upper('abcde123@@')
  from dual;
  
-- dual테이블이란?
--> 오라클 최고 관리자(sys) 소유의 테이블
--> 임시 연산이나 함수의 결과값 확인 용도로 사용하는 테스트용 테이블이다!!

-- 직원테이블에서 직원의 first_name, email 정보를 출력
-- first_name은 모두 대문자로 출력, email 정보는 소문자로 출력
select upper(first_name), lower(email)
  from employees ;
  
-- length() : 괄호 안 문자 데이터의 길이를 구하는 함수
select length('HELLO WORLD')
  from dual ;
  
-- 직원테이블에서 직원의 first_name과 first_name의 길이를 출력
select first_name, length(first_name)
  from employees ;

-- 직원의 frist_name의 길이가 5인 이상의 직원들의 직원id, 이름을 출력
select employee_id, first_name
  from employees
 where length(first_name) >= 5 ;
 
-- substr() : 문자열을 추출하는 함수이다.
-- 1) substr(입력값, 시작위치, 추출길이)
--> 문자열 데이터의 시작위치부터 추출길이만큼 출력
-- 2) substr(입력값, 시작위치)
--> 추출길이 생략 시 문자열 데이터의 시작위치부터 끝까지 출력
select substr('인공지능사관학교JS_B', 5, 4), substr('인공지능사관학교JS_B', 1, 4), substr('여러분최고에요', 4, 2), substr('인공지능사관학교JS_B', 9)
      ,substr('인공지능사관학교JS_B', 3)
  from dual ;
  
-- 입사날짜를 연도, 월, 일 별로 출력 (substr)
-- 각 컬럼에는 연도, 월, 일 별로 별칭을 사용
select substr(hire_date, 1, 2) as 연도, substr(hire_date, 4, 2) as 월, substr(hire_date, 7) as 일
  from employees ;
  
-- replace() : 특정 문자를 다른 문자로 바꾸어 주는 함수
-- 1) replace(문자열데이터, 바꾸고 싶은 문자, 바꿔야 할 문자)
-- 2) replace(문자열데이터, 바꾸고 싶은 문자)
--> 바꿔야 할 문자를 생략시 바꾸고 싶은 문자는 문자열 데이터에서 삭제가 된다.
select replace('인공지능#사관학교', '#', '-'), replace('인공지능#사관학교', '#')
  from dual ;
  
-- 직원테이블에서 입사날짜를 출력하되
-- /(슬러시) 문자열을 -(하이픈)으로 바꿔서 출력하고
-- /(슬러시) 문자열을 삭제하여 출력해주세요
select hire_date, replace(hire_date, '/', '-'), replace(hire_date, '/')
  from employees ;
  
-- concat() : 두 문자열 데이터를 합치는 함수!
-- 인자값으로 2개만 들어갈 수 있다. 2개의 문자열만 합치는 함수이다.
-- '||' : 합성연산자 -> 합성연산자를 이용하면 문자열을 무한대로 연결이 가능하다
select concat('JS_b반', '최고') || '입니다' || '!!'
  from dual ;
  
-- trim() : 입력 받은 문자형 데이터의 양 끝의 공백을 제거해주는 함수 / 안쪽의 공백은 제거하지 않음
select trim('            즐거운   수요일            ')
  from dual ;

-- replace()를 활용하여 공백을 모두 제거할 수 있음
select replace(trim('            즐거운   수요일            '), ' ')
  from dual ;
  
-- [ 숫자형 함수 ]
-- round() : 특정 위치에서 반올림 하는 함수
-- 1) round(반올림 할 숫자, 반올림 위치)
--> 반올림 위치 생략시 소수점 첫째 자리에서 강제로 반올림 수행
select round(1234.56789, 2), round(1234.5678)
  from dual ;
  
-- trunc() : 특정 위치에서 버리는 함수
-- trunc(버림할 숫자, 버림 위치)
--> 반올림 위치 생략시 소수점 첫째 자리에서 강제로 반올림 수행
select trunc(1234.56789, 2), trunc(1234.56789)
  from dual ;
  
-- mod() : 숫자를 나눈 나머지 값을 구하는 함수
--> 홀수, 짝수를 구분할때 유용하게 사용한다.
-- mod(나뉠 숫자, 나눌 숫자)
select mod(10, 2), mod(10, 3), mod(15, 6)
  from dual ;
  
--[ 날짜형 함수 ]
-- sysdate : 현재 날짜와 시간을 출력해주는 함수
--> 입력시 바로 출력이 되며, 현재 시간을 초 단위까지 출력이 가능하다.
--> 날짜형 데이터는 연산이 가능
--> 날짜형 데이터끼리는 연산이 불가능하다!
select sysdate
  from dual ;
  
-- 날짜 형식 세팅
-- 도구 > 환경설정 > 데이터베이스 > NLS > 날짜형식 > YYYY/MM/DD HH24:MI:SS
select sysdate as 현재날짜, sysdate +1 as 다음날
--   , sysdate + sysdate --> 날짜 데이터끼리는 연산이 불가능
  from dual ;
  
-- 날짜데이터를 활용 (실무)
select sysdate as 현재, sysdate +1 as 하루더함, sysdate+1/24 as 한시간더함, sysdate+1/24/60 as 일분더함, sysdate+1/24/60/60 as 일초더함
  from dual ;
  
-- add_months() : 몇개월 이후 날짜를 구하는 함수
-- add_months(날짜데이터, 더하거나 뺄 개월수)
select sysdate as 현재, add_months(sysdate, -1) as "1개월 전", add_months(sysdate, +6) as "6개월 후"
  from dual ;
  
-- [ 형 변환 함수 ]
-- 형 변환 형태의 종류
-- 암시적 형변환 : 데이터베이스가 자동으로 형변환을 해주는 것
select salary*'12' -- salary에 문자열 '12'를 곱했는데 결과가 정상적으로 출력됨 -> 암시적 형변환 / 단, 특수문자나 글자가 들어가면 안됨
  from employees ;
  
-- 명시적 형변환 : 데이터 변환형 함수를 사용해서 사용자가 직접 자료형을 지정해주는 것

-- to_char() : 날짜, 숫자 데이터를 문자 데이터로 변환해주는 함수
-- to_char(변환 할 데이터, 출력 형태)
select salary, to_char(sysdate, '$999,999')
  from employees ;
  
select to_char(sysdate, 'yy/mm/dd/day')
  from dual ;
  
-- to_number() : 문자 데이터를 숫자 데이터로 변환하는 함수
-- to_number(문자열 데이터, 인식될 숫자형태)
select to_number('1,000', '9,999') + 500
  from dual ;
  
-- to_date() : 문자 데이터를 날짜 데이터로 변환하는 함수
-- to_date(문자열 데이터, 인식될 날짜 형태)
select to_date('2024/06/26', 'yyyy-mm-dd')
--select to_date('24/06/26', 'yy-mm-dd')
  from dual ;
  
-- [ NULL 처리 함수 ]
-- nvl / nvl2 : null값을 대체 할 수 있는 함수
-- 1) nvl(null인지 여부를 검사할 데이터, null일 경우 반환할 데이터)
select first_name, department_id, nvl(department_id, 0)
  from employees;
  
-- 2) nvl2(null인지 여부를 검사할 데이터 <1>, <1>값이 null이 아닐 경우 반환할 데이터 <2>, <1>이 null일 경우 반환할 데이터 <3> )
select first_name, department_id, nvl(department_id, 0), nvl2(department_id, 1, 0)
  from employees;
  
-- 보너스가 없는 직원들을 숫자 0으로 대체해서 출력
select first_name, commission_pct, nvl(commission_pct, 0)
  from employees;
  
-- 직원id, first_name, manager_id를 출력. 단, 매니저가 있는 직원은 '직원'으로 출력, 매니저가 없는 직원은 '대표'로 출력
select employee_id, first_name, nvl2(manager_id, '직원', '대표')
  from employees;
  
-- [ 조건 함수 ]
-- decode() : 상황에 따라 다른 데이터를 반환하는 함수
--> 검사대상을 비교해서 지정한 값을 반환
-- decode(검사대상이 될 컬럼 또는 데이터(기준) <1>, <1>의 비교값 <2>, 일치 시 반환할 값 <3>, 일치하지 않을 시 반환할 값 <4>)

-- 직원id, first_name, manager_id를 출력. 단, 매니저가 있는 직원은 '직원'으로 출력, 매니저가 없는 직원은 '대표'로 출력
select employee_id, first_name, manager_id, decode(manager_id, null, '대표', '직원')
  from employees;
  
-- 매니저 아이디가 null이면 대표, 직원id가 101이면 전무이사, 직원id가 102면 상무이사, 직원id가 103이면 팀장
select employee_id, first_name, manager_id, decode(employee_id, 100, '대표', 101, '전무이사', 102, '상무이사', 103, '팀장', '직원')
  from employees;