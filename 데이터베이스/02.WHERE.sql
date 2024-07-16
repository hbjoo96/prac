-- CHAPTER 02. WHERE

select *
  from employees ;
-- select ��ȸ�� �÷� �̸�
--   from ������ �̸�
--  where ���ϴ� ���� �����ϱ� ���� ���ǽ� ;

-- �������̺��� ����id�� 105�� ������ first_name�� last_name�� ���
select employee_id, first_name, last_name
  from employees
 where employee_id = 105 ;
 
-- �μ����̺��� �Ŵ��� ���̵� 100�� �μ��̸��� �μ����̵� ���
select manager_id, department_name, department_id
  from departments
 where manager_id = 100 ;
 
-- �޿��� 9000�� �޴� ������ �̸�, ����id, �μ�id, �޿������� ���
select first_name, employee_id, department_id, salary
  from employees
 where salary = 9000 ;
 
-- �������̺��� ����id�� 100�� ������ JOB_ID�� �޿������� ���
select job_id, salary, employee_id
  from employees
 where employee_id = 100 ;
 
-- �ڷ����� �������̳� ��¥���̸� ��� ������ �����ϴ�.
-- ���� ����Ű : CTRL + ENTER, F9
desc employees ;

-- �ڷ����� ���ͷ�
-- NUMBER : ������ -> 123.., 123.56789
-- VARCHAR2 : ������ -> 'ABCDE'
-- DATE : ��¥�� -> '24/06/25'

-- ��������� (+, -, *, /)
select salary * 12 as ����
  from employees ;
  
select hire_date, hire_date + 2
  from employees ;

-- �񱳿����� (ũ��, �۳�, ũĿ�� ����, �۰ų� ����)
-- A > B : ũ��, �ʰ�
-- A >= B : ũ�ų� ����, �̻�
-- A < B : �۴�, �̸�
-- A <= B : �۰ų� ����, ����

-- �������̺��� �޿�(salary)�� 5000 ������ ������ first_name, salary ������ ���
select first_name, salary
  from employees
 where salary <= 5000 ;
 
-- �������̺��� ������ 100000 �̻��� ������ �̸��� �޿��� ������ ������ ���
select first_name, salary as �޿�, salary*12 as ����
  from employees
 where salary*12 > 100000 ;
 
-- � �� ������ (���� �ƴϸ� ���� �ʳ�)
-- ���� : =
-- ���� �ʴ� : !=, <>, ^=
-- ���� �ʴ�(�����񱳿�����) : NOT A = B

-- �ڷ����� ���ͷ�
-- NUMBER : ������ -> 123.., 123.56789
-- VARCHAR2 : ������ -> 'ABCDE'
-- DATE : ��¥�� -> '24/06/25'
 
-- �������̺��� �������̵� IT_PROG �� �ƴ� ������ ������ ���
-- first_name, job_id
select first_name, job_id
  from employees
 where job_id != 'IT_PROG' ;
 

-- ���� ���̺��� email ������ sking�� ������ ��� ������ ���
select *
  from employees
 where email = 'SKING' ;
 
-- �������̺��� 06/03/07�� �Ի��� ������ ���̵�� �̸��� ������ ���
select employee_id, first_name, hire_date
  from employees
 where hire_date = '06/03/07' ;
 
-- job_id�� 'ST_MAN'�� ������ ���� ����ΰ�?
-- ���� >> 5
select *
  from employees
 where job_id = 'ST_MAN' ;
 
-- �� ������ (TRUE OR FALSE)
--> 2�� �̻��� ������ �̾��ִ� ������
-- AND : ������ ��� �����ϴ� ��� TRUE �� ��ȯ
-- OR : �ϳ��� �����̶� �����ϴ� ��� TRUE �� ��ȯ

-- AND ����
-- TRUE AND TRUE -> TRUE
-- TRUE AND FALSE -> FALSE
-- FALSE AND TRUE -> FALSE
-- FALSE AND FALSE -> FALSE

-- OR ����
-- TRUE OR TRUE -> TRUE
-- TRUE OR FALSE -> TRUE
-- FALSE OR TRUE -> TRUE
-- FALSE OR FALSE -> FALSE


-- ���������� �����
--����
-- 3. select ��ȸ�ϰ� ���� �÷� �̸�1, ��ȸ�ϰ� ���� �÷� �̸�2, ...
-- 1.   from ���̺� �̸�
-- 2.  where ����1 and/or ����2 and/or ����3 and/or ...

-- �μ�id�� 90�̰� �޿��� 5000�̻��� ������ ����id�� �̸�(first_name)�� ���
-- ���� >> 3
select department_id, salary, employee_id, first_name
  from employees
 where department_id = 90 and salary > 5000 ;
 
-- �μ�id�� 100�̰ų� �Ի��� �� 06�� 02�� 02�� ���Ŀ� �Ի��� ������ �� ����ΰ�?
-- ���� >> 55
select department_id, hire_date
  from employees
 where department_id = 100 or hire_date >= '06/02/02' ;
 
-- ������ 'SA_REP'�̸鼭 �޿��� 10000 �̻��� �޴� ������ �� ����ϱ��?
-- ���� >> 6
select job_id, salary, first_name
  from employees
 where job_id = 'SA_REP' and salary >= 10000 ;
 
-- �������� �켱����
-- and > or
 
-- �μ�id�� 100�̰ų� 90�� �����߿���
-- ����id�� 101�� ������ ����id, first_name, ������ ��� * ��, ������ AnnSal�̶�� ��Ī ���
-- ������ 1��!
select employee_id, first_name, salary*12 as AnnSal
  from employees
 where (department_id = 100 or department_id = 90) and employee_id = 101 ;
-- �켱������ ���� ������� ������ �޶��� �� �ִ�.
-- () �Ұ�ȣ�� �̿��Ͽ� �켱������ �ٲ��� �� �ִ�.


-- NULL�� ���굵 �ȵǰ� �񱳵� �ȵ�, FALSE ��µ�.
-- NULL ���� ������
-- DEPARTMENT_ID�� NULL�� ������ ����
select department_id, first_name
  from employees
 where department_id is null;

-- �μ��� ���� ������ �� ���? �� �̸� ���
-- ���� >> 1��, kimberely
-- NULL ���� ������
-- is null : ������ ���� null�� ���� ��ȸ
-- is not null : ������ ���� null�� �ƴ� ���� ��ȸ

-- ���ʽ��� �ް� ���ϴ� ������ ���� �� ����ΰ�?
-- ���� >> 35��
select *
  from employees
 where commission_pct is not null ;

-- SQL ������
--> SQL���� ����� �� �ִ� �����ڴ�
-- IN, BETWEEN A AND B, LIKE

-- IN ������ : Ư�� �÷��� ���Ե� �����͸� ���� �� ��ȸ�� �� ���
-- = + or ��� ���� ���� ���� ���
-- IN�����ڴ� NULL���� �����ϴ� Ư¡�� ������ �ֽ��ϴ�.

-- �������̺��� �μ�ID�� 30�̰ų� 50�̰ų� 90�� ��� ������ ������ ���
select *
  from employees
 where department_id = 30 or department_id = 50 or department_id = 90 or department_id is null;
 
-- IN������ Ȱ��
-- null���� �־ �ȳ���, ����Ϸ��� or�� Ȱ��!
select *
from employees
where department_id in (30, 50, 90, null) ;

-- �������̺��� �������̵� AV_VP �̰ų� ST_MAN�� ������ �̸��� �������̵� ��� (IN������ Ȱ��)
select first_name, employee_id, job_id
  from employees
 where job_id in ('AV_VP', 'ST_MAN');
 
 
-- NOT IN : IN �ڿ� ���ǿ� �ش����� �ʴ� �����͸� ���
-- NOT IN�� NULL���� �ְ� �Ǹ� �ƿ� �����Ͱ� ����� �ȵȴ�!
-- != + AND ��� ���� ���� �� ���

-- ���� ���̺��� �Ŵ��� ���̵� 100, 120, 121�� �ƴ� ������ �̸��� �Ŵ��� ���̵� ���
select first_name, manager_id
  from employees 
 where manager_id != 100 and manager_id != 120 and manager_id != 121 ;

-- NOT IN Ȱ��
select first_name, manager_id
  from employees
 where manager_id not in (100, 120, 121) ;

-- BEETWEEN A AND B
--> ���� ���� ���� �����͸� ��ȸ�� �� ���
--> BETWEEN �ּҰ� AND �ִ밪
--> Ư�� �� ���� �ּ�, �ְ� ������ �����Ͽ� �ش� ���� ���� �����͸� ��ȸ�ϴ� ��

-- �������̺��� �޿��� 10000�̻� 20000������ �޿��� �޴� ������ �̸��� �޿� ���� ���
select first_name, salary
  from employees
 where salary >= 10000 and salary <= 20000 ;

-- BETWEEN ������ Ȱ��
select first_name, salary
  from employees
 where salary between 10000 and 20000 ;
 
-- �޿��� 10000 �̻� 20000 ������ �������� �����͸� ���

-- �������̺��� 05�⿡ �Ի��� ������ �̸��� �Ի糯¥�� ���(BETWEEN �ּҰ� AND �ִ밪)
select first_name, hire_date
  from employees
 where hire_date between '05/01/01' and '05/12/31' ;
 
-- LIKE ������
-- �Ϻ� ���ڿ��� ���Ե� �����͸� ��ȸ�Ҷ� ����ϴ� ��
-- % , _ ��� ���ϵ� ī�带 �̿��ؼ� ��Ī ������ �����ϴ� ��

-- % : ���̿� ������� ��� ���� �����͸� �ǹ�
-- _ : � ���̵� ��� ���� �Ѱ��� ���� �����͸� �ǹ�

-- �ڵ�����ȣ�� 650���� �����ϴ� ������ �ڵ��� ��ȣ ã��
select phone_number
  from employees
 where phone_number like '650%' ;
 
-- �������̺��� �̸���(first_name) �빮�� 'S'�� �����ϰ� 'n'���� ������ ������ �̸� ã��
select first_name
  from employees
 where first_name like 'S%n';
-- where first_name like 'S%' and first_name like '%n';

-- �������̺��� �̸��� 'it'���� ������ �� 4������ ������ �̸� ã��
select first_name
  from employees
 where first_name like '__it';

-- �������̺��� �̸��� �ι�° ���ڰ� 'e'�� ������ �̸� ã��
select first_name
  from employees
 where first_name like '_e%';

-- �������̺��� 01���� �Ի��� ������ �Ի糯¥ ã��
select hire_date
  from employees
 where hire_date like '__/01%';



 