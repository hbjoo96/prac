-- CHAPTER 10. �������� (Sub Query) --

-- SQL �ۼ� ����
-- select > from > where > group by > having > order by

-- *** SQL ���� ���� ***
-- from > where > group by > having > select > order by

-- 5. select      ��ȸ�ϰ��� �ϴ� �÷� �̸�....
-- 1. from        ��ȸ�ϰ��� �ϴ� ���̺� �̸�
-- 2. where       ��ȸ�ϰ��� �ϴ� ���ϴ� ���� �����ϱ� ���� ���ǽ�
-- 3. group by    Ư�� �÷��� �̿��Ͽ� �׷�ȭ
-- 4. having      �׷�ȭ�� ��󿡼� ���ϴ� ���� �����ϱ� ���� ���ǽ�
-- 6. order by    Ư�� �÷��� �������� ����

-- group by ����
-- �μ���(group by) �ְ� �޿��� ��ȸ
select department_id, max(salary)
  from employees
group by department_id ;

-- ������ ad_pres, it_prog �� �ƴ� ������ ��� ��������
-- ��� ������ 12000�̻��� ������ ���
select job_id, avg(salary*12)
from employees
where job_id not in ('IT_PROG', 'AD_PRES')
group by job_id
having avg(salary*12) >= 120000 ;

-- join ����(����Ŭ)
-- select   ���̺�1.�÷���, ���̺�2.�÷���
-- from     ���̺�1, ���̺�2 --> ���̺�1�� ���̺�2�� join�ϰڴ�.
-- where    ���̺�1.�÷��� = ���̺�2.�÷��� --> ���� ������ �Ǵ� ���� �����ش�

-- ansi join ����
-- select   ���̺�1.�÷���, ���̺�2.�÷���    --> DOT(.) ��θ� ���� �ش� ���̺��� �÷��� ��ȸ
-- from     ���̺�1 (inner) join ���̺�2    --> ���̺�1�� ���̺�2�� join �ϰڴ�.
-- on       (���̺�1.�÷��� = ���̺�2.�÷���) --> ���� �������� ���
-- where    �Ϲ� ���ǽ��� ���� ����          --> �Ϲ� �������� ���

-- ������ ����id, �̸�, �μ�id, �μ���
select * from employees ;
select * from departments;

select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e join departments d
on (e.department_id = d.department_id) ;

select e.employee_id, e.first_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id ;

-- ����ID�� 100�� ������ ���
select e.employee_id, e.first_name, e.last_name, e.department_id, d.department_name
from employees e join departments d
on (e.department_id = d.department_id)
where e.employee_id = '100' ;

select e.employee_id, e.first_name, e.last_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id and e.employee_id = '100' ;

-- ���������� ?
-- SQL���� �����ϴµ� �ʿ��� �����͸� �߰��� ��ȸ�ϱ� ���ؼ�
-- SQL ���ο��� ����ϴ� SELECT ������ �ǹ��Ѵ�.
-- ���������� ���� ���� �ȿ� ���Ե� �������� �����̴�.

-- �������� : ���������� ��� ���� ����Ͽ� ����� �����ϴ� ��ü ����
-- �������� : ���������� ���ǽĿ� ���� ���� �ǹ��Ѵ�.

-- ���� �� Jack�� �޿����� ���� �ް� �ִ� ������ �̸��� �޿��� ���
-- 1. ���̺��� ������ Ȯ��
select * from employees ;
-- 2. ������ ������ �Ǵ� Jack�� �޿��� ������ Ȯ��
select first_name, salary
from employees
where first_name = 'Jack' ; 
-- 3. 2���� ��� ���� ������ �������� ���ؼ� ������� Ȯ��
select first_name, salary
from employees
where salary < 8400 ;
-- �������� Ȱ���Ͽ� ���
select first_name, salary
from employees
where salary<(
    select salary
    from employees
    where first_name = 'Jack'
) ;
-- �������̺��� James�� �޿����� ���� �ް� �ִ� ������ �̸��� �޿� ������ ���(�������� Ȱ��)
-- ������ �����̴� > ? �� ������ ������ �м��� �ѹ� �غ�����! -> James�� �ϳ��� �ƴ�

select first_name, salary
from employees
where salary<(
    select salary
    from employees
    where first_name = 'James'
) ;
-- ORA-01427: single-row subquery returns more than one row
-- ������ ���������� �ϳ��� �ุ ����� �� ���� �ִ�.
select * from employees where first_name = 'James';

-- ���������� Ư¡
-- 1. ���������� �����ڿ� ���� �� �Ǵ� ��ȸ ����� �����ʿ� ���̸� ()�� ��� ����Ѵ�.
-- 2. ���������� SELECT���� ����� �÷���
-- ���������� �� ���(WHERE���� �ۼ��� �÷�)�� ���� �ڷ����� ������ �����ؾ� �Ѵ�.
-- 3. ���������� �ִ� SELECT ���� ��� �� ���� �Բ� ����ϴ� ���������� ������ ������ ȣȯ�����ؾ� �Ѵ�.
-- ��, �� �ϳ��� �����ͷθ� ���� ������ �����ڶ�� ���� ������ ��� �� ���� �ϳ����߸� �Ѵ�.
--> �����ڿ� �Բ� ��ȣ �ۿ��ϴ� ��Ŀ� ���� ������ ���������� ������ ���������� ������.

-- ������ ������
-- =(����), >, >=, <, <=(�ʰ�, �̻�, �̸�, ����), !=, <>, ^=(���� �ʴ�) 

-- ������ ���������� ?
--> ���� ����� �� �ϳ��� ������ ������ ����������.

-- Nancy���� ���� �Ի��� ������ �̸��� �Ի��� ������ ��ȸ.
-- 1. ������ ������ �Ǵ� Nancy�� �Ի��� ������ ��� (��������)
select hire_date from employees where first_name = 'Nancy' ;
-- 2. ������ �����ڸ� Ȱ���Ͽ� ���������� ������ ������� ���
select first_name, hire_date
from employees
where hire_date < (
    select hire_date
    from employees
    where first_name = 'Nancy'
    ) ;
    
-- �������� ��� �޿� ���� ���� �޿��� �޴� ������ �̸��� �޿� ������ ��ȸ
-- 1. ������ ������ �Ǵ� ������ ��� �޿��� ������ Ȯ��(��������)
select round(avg(salary), 1) from employees;
-- 2. ������ �����ڸ� Ȱ���Ͽ� ������ ���������� ����ؼ� ����� ���
select first_name, last_name, salary
from employees
where salary>(
    select avg(salary)
    from employees
    ) ;

-- ������ ���������� ?
--> ���� ��� ���� ���� ���� ������ ���������� ���Ѵ�.
--> ������ �����ڴ� ����� �� ���� ������ �����ڸ� ����ؾ� �Ѵ�.

-- [ ������ �������� ���� ]
-- IN : ���������� �����Ͱ� ���������� ��� �� �ϳ��� ��ġ�ϴ� �����Ͱ� ������ TRUE�� ��ȯ
-- IN(��������)
-- ANY : ���������� ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� TRUE���� ��ȯ
--> �񱳿����� ANY (��������)
--> ALL :���������� ���ǽ��� ���������� ��� ��ΰ� �����ϸ� TRUE���� ��ȯ
-- �� ������ ALL(��������)
-- EXISTS : �������� ��� ���� �����ϴ��� ���θ� Ȯ���Ѵ�.
-- EXISTS(��������)

-- �� �μ��� �ְ�޿��� ������ �޿��� �ް� �ִ� ������ ������ ���
-- (�μ�ID, �̸�, �޿�)

-- ������ ������ �Ǵ� �� �μ��� �ְ� �޿��� ������ ���
select department_id, max(salary)
from employees
group by department_id ;

-- in ������ Ȱ��
select department_id, first_name, last_name, salary
from employees
where salary in (
    select max(salary)
    from employees
    group by department_id
) ;

-- any ������ Ȱ��
-- any �� ���ǿ� �����ϴ� ����� �ϳ��� ���̸� ���� ��ȯ�ϴ� Ư¡
select department_id, first_name, last_name, salary
from employees
where salary = any (
    select max(salary)
    from employees
    group by department_id
) ;
-- any �����ڿ� =(����)��� ��񱳿����ڸ� ���� �Ǹ� in �����ڿ� ���� ������� ���

-- 249������ ����
-- exist : ���� ���θ� Ȯ���ϴ� ������
-- �μ��� �ش��ϴ� ������ ���
select first_name, department_id
from employees 
where exists (
    select department_id
    from employees
    where department_id = 5000
);
-- exist�� ���� ���θ� Ȯ���ϴ� �����ڴ�!
-- ��Į�� ���������� ?
-- select ������ ����ϴ� ��������
-- �ϳ��� �÷��� ���� �ϳ��� �ุ ��ȯ�ϴ� Ư¡�� ������ �ִ�.
-- join ���� join ó�� ����ϰ��� �Ҷ� ���
-- �̸�, �޿�, �μ����̵�, �μ��̸��� ���
select e.first_name, e.salary, e.department_id, d.department_name
from employees e join departments d
on (e.department_id = d.department_id) ;

-- ��Į�� �������� Ȱ��
select first_name, last_name, salary, department_id,(
    select department_name
    from departments
    where department_id = e.department_id
)as �μ��̸�
from employees e;

-- �ζ��� �� (Inline View)
--> FROM������ ���� ���̺�ó�� ����ϴ� ���������̴�.
--> �ζ��� �並 ����ϸ� ���� ������ ����� ��ġ ���̺�ó�� ����� �� �ִ�.
--> �����ͺ��̽� SELECT ���� ��ü�ν� ������ ���̺�ó�� ����ϴ� VIEW�� �޸�
--> �ζ��� ��� ���� ������ ��� ó���ȴ�.
--> �ζ��κ�� ��Ī�� ���ָ� ���� �÷��� ������ ���� ���� �׷��� �ݵ�� ��Ī�� ����ؾ� �ȴ�.

-- �̸�, �μ�ID, �μ���(GROUP BY) �ְ�޿�
SELECT DEPARTMENT_ID, MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID ;

-- �ζ��κ並 Ȱ��
SELECT A.FIRST_NAME, A.LAST_NAME, A.DEPARTMENT_ID, B.MAX_SALARY
FROM EMPLOYEES A, (
    SELECT DEPARTMENT_ID, MAX(SALARY) AS MAX_SALARY
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID 
    ) B
WHERE A.DEPARTMENT_ID = B.DEPARTMENT_ID AND A.SALARY = B.MAX_SALARY ;