-- CHAPTER 01. SELECT

-- �ּ� ���� �ٲٱ� : ���� > ȯ�漳�� > �ڵ� ������ > PL/SQL�ּ�
-- ���� ũ�� Ű��� : ���� > ȯ�漳�� > �ڵ������� > �۲�

-- �ּ���ȣ
-- �ּ�����(2) : /**/ -> ���� ���� �ѹ��� �ּ�ó�� ����

/*
1. SQL���忡�� ��ҹ��ڸ� �������� �ʴ´�.
2. ���⳪ �ٹٲ� ���� ��ɾ� ���࿡ ������ ���� �ʴ´�.
3. SQL ���� ������ �� �����ݷ� (;)�� ������ �Ѵ�.
4. SQL ���� ����Ű : CTRL + ENTER, F9
*/

desc employees ;

select first_name 
  from employees ;

-- [select �� �⺻ �����]

-- select ��ȸ�� �÷���
-- from   ��ȸ�� ���̺� �̸�

select first_name, email 
  from employees ;

-- �������̺��� ����ID, ��ȭ��ȣ, �μ����̵�, last_name�� ���

desc employees;
select employee_id, phone_number, department_id, last_name 
  from employees ;
-- DESC(DESCRIBE)>�����ϴ�, ��ɹ��� SQL���� ���Ǵ� �����ͺ��̽� ���̺��� ������ Ȯ���ϴ� ���� ���ԴϤ���.
-- �ַ� ���̺��� ��(�÷�)�� ���� ������ �����ϸ�,
-- Ư�� ���̺��̳� ���� ������ ��ȸ�� �� �����մϴ�.

-- ���� ���̺��� ����id, �޿�, �Ŵ������̵� ���
select employee_id, salary, manager_id
  from employees ;
  
-- �μ����̺��� �μ�id, �μ���, location_id�� ���
select department_id, department_name, location_id
  from departments ;
  
-- �������̺��� �μ�id, first_name, email, salary, ��ȭ��ȣ ������ ���
select department_id, first_name, email, salary, phone_number
  from employees ;
  
-- *(�ƽ�Ÿ����ũ) : ��ü�� �ǹ�, ��ü ��ȸ

-- �������̺��� ��� ������ ���
select *
  from employees ;
  
-- �μ����̺��� ��� ������ ��� -- ��� �μ��� �ִ���
select *
  from departments ;
  
-- �������̺��� ��� ������ ���
select *
  from employees ;
  
-- �������̺��� job_id�� ���
select job_id
  from employees ;
  
-- select [all/distinct] �÷��̸�
select distinct job_id
  from employees ;
  
-- �������̺��� �μ�ID�� �ߺ��� �����Ͽ� ���
select distinct department_id
  from employees ;

-- �������̺��� �Ի��������� �ߺ��� �����Ͽ� ���
select distinct hire_date
  from employees ;
  
-- �������̺��� job_id�� �μ�id�� �ߺ��� �����Ͽ� ���
select distinct job_id, department_id
  from employees ;
  
-- distinct �ڿ� 2�� �̻��� �÷��� ������
-- ���� �÷��� �ߺ��� �־ �ٸ� �� �÷��� ���� �ٸ��� �ٸ��� ��޵Ǽ� �ߺ����Ű� ���������� �ȵȴ�.
-- distinct�� 1���� �÷��� ����ؾ� �ȴ�.

desc employees ;

-- �÷��� �ڷ����� ������, ��¥���̸� ���� ������ �����մϴ�.(+,-,*,/)

-- ����id, �̸�, �޿� ������ ���
select employee_id, first_name, salary, salary*12
  from employees ;
  
-- ��Ī ����ϱ�
-- alias ��� �ϸ� �Ѵ��� ���� ���� ������ �� �ִ�.
-- as��� Ű���带 ����Ͽ� ��Ī�� �����Ѵ�.

-- ��Ī ��� �溡
-- 1. select �÷��̸� ��Ī
-- 2. select �÷��̸� "��Ī"
-- 3. select �÷��̸� as ��Ī
-- 4. select �÷��̸� as "��Ī"

-- �������̺��� ������ �̸��� �޿� ���� ������ ������ ���
-- ������ ���������̶�� ��Ī�� ����ؼ� ���
select first_name, salary*12 as ��������
  from employees ;
  
-- �������̺��� �̸�, �Ի���, �Ի��� �������� ���, �Ի��� ��Ʊ���� ���
-- �ٸ�, �Ի��� �������� "�Ի��� ������"�� ��Ī�� ����ؼ� ���
-- �Ի��� ��Ʊ���� "�Ի��� ��Ʊ��"�� ��Ī�� ����ؼ� ���
select first_name, hire_date, hire_date+1 "�Ի��� ������", hire_date+2 "�Ի��� ��Ʊ��"
  from employees ;
  
-- order by ��
-- Ư�� �÷��� �������� ���ĵ� ���·� ����ϰ��� �� �� ����Ѵ�.
-- SQL����������� ���� �������� ����ȴ�.
-- ������ ���� ����� �������� ������ �⺻������ ���������� ����ȴ�.

-- asc(Ascending) : �������� ���� (1, 2, 3, 4, 5, ....)
-- desc(Descending) : �������� ���� (10, 9, 8, 7, ...)

-- order by �⺻ �����

-- select ��ȸ�ϰ��� �ϴ� �÷� �̸�
--  from ��ȸ�ϰ��� �ϴ� ���̺� �̸�
-- order by Ư�� �÷��� �̿��ؼ� ����

-- ������ ��� ������ ���
-- ��, �޿� �������� ���������� �����Ͽ� ���
select *
  from employees
order by salary desc ;

-- �ֱٿ� �Ի��� ��¥�� �������� ������ �̸��� �Ի糯¥�� ���
select first_name, hire_date
  from employees
order by hire_date desc ;

-- �������̺��� ����id, �μ�id, �̸�, �޿� ������ ���
-- ��, �μ�id�� ������������, �޿��� ������������ ���
select employee_id, department_id, first_name, salary
  from employees
order by department_id asc, salary desc ;

-- ���� �μ����� �ٹ��ϰ� �ִ� �����鳢��
-- �޿��� ���� ������� �������� ������ �� ��
-- ���� �μ�id�� ������������ ������ �� �Ŀ� �޿��� ������������ ������ �� ���̴�.

-- NULL�̶�?
-- NULL ���̶� �������� ���� ������ ��� �ִ� ���¸� �ǹ��Ѵ�.
-- ���� �������� �ʰų� �������� �ʴ� ���� �ǹ��Ѵ�.
-- ����0 �� �� ���ڿ� ''�� NULL ���� �ƴϴ�!
-- NULL�� �����ϸ� ������� ������ NULL ���� ���´�.
-- NULL�� ���ϸ� ������� ������ FALSE ���� ���´�.

select *
  from employees ;
  
-- �������̺��� ����id, ���ʽ�, ���ʽ� 2���� ������ ���
-- ���ʽ� �ι�� up_bonus ��� ��Ī�� ����ؼ� ���
select employee_id, commission_pct, commission_pct*2 "up_bonus"
  from employees ;

-- ����1���� up_bonus�� ��� ���� ����� �غ��� ��� ���� Ȯ��, �� �׷��� ��� ���� ���Դ��� ����
