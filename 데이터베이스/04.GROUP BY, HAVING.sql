-- CHAPTER 04. GROUP BY / HAVING --

-- �����Լ��� ����

-- ������ �Լ� : �Էµ� �ϳ��� ��� ����� �ϳ��� ������ �Լ�
-- ������ �Լ� : ���� ���� �Է¹޾Ƽ� �ϳ��� ��� ������ ����� �Ǵ� �Լ�
--> ������ �Լ��� �����Լ���� �θ���.

-- �������Լ� (�����Լ�)�� Ư¡
-- 1. �����Լ��� null���� �����ϴ� Ư���� ������ �ִ�.
-- 2. �����Լ��� �׷�ȭ(group by)�� �Ǿ� �ִ� ���¿����� ����� �����ϴ�.

-- [ ���� �Լ��� ���� ]
-- count() : ������ �������� ������ ��ȯ
-- sum() : ������ �������� ���� ��ȯ
-- max() : ������ ������ �� �ִ밪 ��ȯ
-- min() : ������ ������ �� �ּҰ� ��ȯ
-- avg() : ������ �������� ��հ� ��ȯ

-- �������̺��� ����id�� ���� ������ ��ȸ (�� ���� ��)
select count(employee_id) as "������ ��"
  from employees
group by() ;
-- �������̺��� �ϳ��� �׷����� ���� �ɷ� �ν��� -> group by�� �� ����

-- �μ����̺��� �μ�id�� ���� ������ ��ȸ >> 27
select count(department_id)
  from departments ;

-- �������̺��� �μ�id�� ���� ������ ��ȸ >> 106
select count(department_id)
  from employees ;
  
-- count�Լ��� *(�ƽ�Ÿ����ũ)�� �� �� ����
-- �ٸ� �Լ��� ����� �� ����
select count(*)
  from employees ;

-- ���� �޿��� �� �հ踦 ��� >> 691416
select sum(salary)
  from employees ;

-- �������� �ִ� �޿��� �ּ� �޿��� ��� >> max : 24000, min : 2100
select max(salary), min(salary)
  from employees ;
  
-- �μ� id�� 100�� ������ ��� �޿��� ��� >> 8601.3
select round(avg(salary), 1)
  from employees
 where department_id = 100 ;
-- where '100' in department_id ;

select *
  from ���������� ;

select *
  from ����ǥ ; 

-- group by : Ư�� �÷��� �������� �׷�ȭ (����)

-- SQL �ۼ�����
-- select > from > where > group by > having > order by

-- *** SQL ������� ***
-- from > where > group by > having > select > order by

-- [ group by ����� ]
-- 4. select    ���ϴ� �÷� �̸�
-- 1. from      ���̺� �̸�
-- 2. where     ���ϴ� ���� �����ϱ� ���� ���ǽ�
-- 3. group by  Ư�� �÷��� �������� �׷�ȭ

-- ���������� ���̺��� �Ҽӹ� ��(group by) �л��� �ο����� ��ȸ
select *
  from ���������� ;
  
select �Ҽӹ�, count(�л��̸�), �л��̸�
  from ����������
group by �Ҽӹ�, �л��̸� ;

-- group by�� ��� �� ���ǻ���
-- 1. group by�� Ư�� �÷��� ����ϴ� ���� ���� ������ �����ϱ� ������ group by���� �ʰ� ����Ǵ� ����
-- having, select, order by���� ����� �� �ִ� ���� ������ �ɸ���.
-- �ֳ�? SQL ��������� ���ؼ�

-- 2. �ٸ�, �����Լ��� ó���ϴ� �÷��� ����� �����ϴ�.

-- ����ǥ ���̺��� ����(group by) �ְ� ������ ���������� ���
select max(����), min(����)
  from ����ǥ
group by ���� ;

-- ����ǥ ���̺��� �л���(group by) ��� ������ ���
-- ��� ������ 2��° �ڸ����� �ݿø�
select �л�id, round(avg(����), 2)
  from ����ǥ
group by �л�id ;

-- ����ǥ ���̺��� �л����� JAVA�� DATABASE������ ������ ���� ���
select sum(����)
  from ����ǥ
-- where ���� in ('JAVA', 'DATABASE')
 where ���� != 'PYTHON'
group by �л�id ;

-- having �� : group by ���� ������ ���� ����� �����ϴ�.
--> ���谡 �Ϸ�� ����� ������ ���� ���͸� �ϴ� �����̴�.
--> ������ ���� ����� ����� �ȴٴ� �������� where���� ���������, 
--> having���� �׷�ȭ(group by)�� ��󿡼� ����� �ȴٴ� ������ �ٸ���.

-- ����ǥ ���̺��� �л��� ��� ������ ���ϰ�, ��� ������ 75������ �л��鸸 ���
select �л�id, round(avg(����), 1)
  from ����ǥ
group by �л�id
having avg(����) <= 75 ;

-- ����1) ���������� ���̺��� �Ҽӹ� �� �ο����� 3�� �̻��� �ݸ� ���
select �Ҽӹ�, count(�Ҽӹ�)
  from ����������
group by �Ҽӹ� 
having count(�Ҽӹ�) >= 3 ;

-- ����2) ����ǥ ���̺��� �л��� ��� ������ ���ϵ�, ��� ������ null�� �ƴ� ���� ��� ��, �Ҽ��� 1�� �ڸ������� ���
select �л�id, round(avg(����), 1)
  from ����ǥ
 where ���� is not null
group by �л�id;

-- ����3) �μ��� �ְ� ������ 100000 �̻��� �μ��� ���
select department_id, max(salary*12)
  from employees
group by department_id
having max(salary*12) >= 100000 ;

-- ����4) ������ �ְ� �޿� ���
select job_id, max(salary)
  from employees
group by job_id ;

-- ���� ����) IR_PROG�� AD_PRES�� �ƴ� ������ �ְ� ������ 150000 �̻��� ������ ���
select job_id, max(salary*12)
  from employees 
 where job_id != 'AD_PRES' and job_id != 'IT_PROG'
-- where job_id not in ('IT_PROG', 'AD_PRES')
group by job_id
having max(salary*12) >= 150000 ;