-- CHAPTER 03. ����Ŭ�Լ� --

-- �Լ��� (FUNCTION
--> �Է� ���� �־ Ư���� ����� ���� ��� ���� ���

-- ����� �����Լ� : ����ڰ� �ʿ信 ���� ���� ������ �Լ�
-- �����Լ� : ����Ŭ���� �̸� ����� ���� �Լ�, �ʿ��� �� ���� ȣ���Ͽ� ���
--> ������, ������, ��¥��, ����ȯ��, nulló���Լ�, �����Լ�

-- >>�Լ��̸�()<<�Լ��� ���� -> �Լ��� �����Ҷ� ����ϴ� �Է� �� : ���� ��, �Ű�����

-- [ ������ �Լ� ]
-- upper() : ��ȣ �� ���� �����͸� ��� �빮�ڷ� ��ȯ�Ͽ� ���
-- lower() : ��ȣ �� ���� �����͸� ��� �ҹ��ڷ� ��ȯ�Ͽ� ���
select upper('abcde123@@')
  from dual;
  
-- dual���̺��̶�?
--> ����Ŭ �ְ� ������(sys) ������ ���̺�
--> �ӽ� �����̳� �Լ��� ����� Ȯ�� �뵵�� ����ϴ� �׽�Ʈ�� ���̺��̴�!!

-- �������̺��� ������ first_name, email ������ ���
-- first_name�� ��� �빮�ڷ� ���, email ������ �ҹ��ڷ� ���
select upper(first_name), lower(email)
  from employees ;
  
-- length() : ��ȣ �� ���� �������� ���̸� ���ϴ� �Լ�
select length('HELLO WORLD')
  from dual ;
  
-- �������̺��� ������ first_name�� first_name�� ���̸� ���
select first_name, length(first_name)
  from employees ;

-- ������ frist_name�� ���̰� 5�� �̻��� �������� ����id, �̸��� ���
select employee_id, first_name
  from employees
 where length(first_name) >= 5 ;
 
-- substr() : ���ڿ��� �����ϴ� �Լ��̴�.
-- 1) substr(�Է°�, ������ġ, �������)
--> ���ڿ� �������� ������ġ���� ������̸�ŭ ���
-- 2) substr(�Է°�, ������ġ)
--> ������� ���� �� ���ڿ� �������� ������ġ���� ������ ���
select substr('�ΰ����ɻ���б�JS_B', 5, 4), substr('�ΰ����ɻ���б�JS_B', 1, 4), substr('�������ְ���', 4, 2), substr('�ΰ����ɻ���б�JS_B', 9)
      ,substr('�ΰ����ɻ���б�JS_B', 3)
  from dual ;
  
-- �Ի糯¥�� ����, ��, �� ���� ��� (substr)
-- �� �÷����� ����, ��, �� ���� ��Ī�� ���
select substr(hire_date, 1, 2) as ����, substr(hire_date, 4, 2) as ��, substr(hire_date, 7) as ��
  from employees ;
  
-- replace() : Ư�� ���ڸ� �ٸ� ���ڷ� �ٲپ� �ִ� �Լ�
-- 1) replace(���ڿ�������, �ٲٰ� ���� ����, �ٲ�� �� ����)
-- 2) replace(���ڿ�������, �ٲٰ� ���� ����)
--> �ٲ�� �� ���ڸ� ������ �ٲٰ� ���� ���ڴ� ���ڿ� �����Ϳ��� ������ �ȴ�.
select replace('�ΰ�����#����б�', '#', '-'), replace('�ΰ�����#����б�', '#')
  from dual ;
  
-- �������̺��� �Ի糯¥�� ����ϵ�
-- /(������) ���ڿ��� -(������)���� �ٲ㼭 ����ϰ�
-- /(������) ���ڿ��� �����Ͽ� ������ּ���
select hire_date, replace(hire_date, '/', '-'), replace(hire_date, '/')
  from employees ;
  
-- concat() : �� ���ڿ� �����͸� ��ġ�� �Լ�!
-- ���ڰ����� 2���� �� �� �ִ�. 2���� ���ڿ��� ��ġ�� �Լ��̴�.
-- '||' : �ռ������� -> �ռ������ڸ� �̿��ϸ� ���ڿ��� ���Ѵ�� ������ �����ϴ�
select concat('JS_b��', '�ְ�') || '�Դϴ�' || '!!'
  from dual ;
  
-- trim() : �Է� ���� ������ �������� �� ���� ������ �������ִ� �Լ� / ������ ������ �������� ����
select trim('            ��ſ�   ������            ')
  from dual ;

-- replace()�� Ȱ���Ͽ� ������ ��� ������ �� ����
select replace(trim('            ��ſ�   ������            '), ' ')
  from dual ;
  
-- [ ������ �Լ� ]
-- round() : Ư�� ��ġ���� �ݿø� �ϴ� �Լ�
-- 1) round(�ݿø� �� ����, �ݿø� ��ġ)
--> �ݿø� ��ġ ������ �Ҽ��� ù° �ڸ����� ������ �ݿø� ����
select round(1234.56789, 2), round(1234.5678)
  from dual ;
  
-- trunc() : Ư�� ��ġ���� ������ �Լ�
-- trunc(������ ����, ���� ��ġ)
--> �ݿø� ��ġ ������ �Ҽ��� ù° �ڸ����� ������ �ݿø� ����
select trunc(1234.56789, 2), trunc(1234.56789)
  from dual ;
  
-- mod() : ���ڸ� ���� ������ ���� ���ϴ� �Լ�
--> Ȧ��, ¦���� �����Ҷ� �����ϰ� ����Ѵ�.
-- mod(���� ����, ���� ����)
select mod(10, 2), mod(10, 3), mod(15, 6)
  from dual ;
  
--[ ��¥�� �Լ� ]
-- sysdate : ���� ��¥�� �ð��� ������ִ� �Լ�
--> �Է½� �ٷ� ����� �Ǹ�, ���� �ð��� �� �������� ����� �����ϴ�.
--> ��¥�� �����ʹ� ������ ����
--> ��¥�� �����ͳ����� ������ �Ұ����ϴ�!
select sysdate
  from dual ;
  
-- ��¥ ���� ����
-- ���� > ȯ�漳�� > �����ͺ��̽� > NLS > ��¥���� > YYYY/MM/DD HH24:MI:SS
select sysdate as ���糯¥, sysdate +1 as ������
--   , sysdate + sysdate --> ��¥ �����ͳ����� ������ �Ұ���
  from dual ;
  
-- ��¥�����͸� Ȱ�� (�ǹ�)
select sysdate as ����, sysdate +1 as �Ϸ����, sysdate+1/24 as �ѽð�����, sysdate+1/24/60 as �Ϻд���, sysdate+1/24/60/60 as ���ʴ���
  from dual ;
  
-- add_months() : ��� ���� ��¥�� ���ϴ� �Լ�
-- add_months(��¥������, ���ϰų� �� ������)
select sysdate as ����, add_months(sysdate, -1) as "1���� ��", add_months(sysdate, +6) as "6���� ��"
  from dual ;
  
-- [ �� ��ȯ �Լ� ]
-- �� ��ȯ ������ ����
-- �Ͻ��� ����ȯ : �����ͺ��̽��� �ڵ����� ����ȯ�� ���ִ� ��
select salary*'12' -- salary�� ���ڿ� '12'�� ���ߴµ� ����� ���������� ��µ� -> �Ͻ��� ����ȯ / ��, Ư�����ڳ� ���ڰ� ���� �ȵ�
  from employees ;
  
-- ����� ����ȯ : ������ ��ȯ�� �Լ��� ����ؼ� ����ڰ� ���� �ڷ����� �������ִ� ��

-- to_char() : ��¥, ���� �����͸� ���� �����ͷ� ��ȯ���ִ� �Լ�
-- to_char(��ȯ �� ������, ��� ����)
select salary, to_char(sysdate, '$999,999')
  from employees ;
  
select to_char(sysdate, 'yy/mm/dd/day')
  from dual ;
  
-- to_number() : ���� �����͸� ���� �����ͷ� ��ȯ�ϴ� �Լ�
-- to_number(���ڿ� ������, �νĵ� ��������)
select to_number('1,000', '9,999') + 500
  from dual ;
  
-- to_date() : ���� �����͸� ��¥ �����ͷ� ��ȯ�ϴ� �Լ�
-- to_date(���ڿ� ������, �νĵ� ��¥ ����)
select to_date('2024/06/26', 'yyyy-mm-dd')
--select to_date('24/06/26', 'yy-mm-dd')
  from dual ;
  
-- [ NULL ó�� �Լ� ]
-- nvl / nvl2 : null���� ��ü �� �� �ִ� �Լ�
-- 1) nvl(null���� ���θ� �˻��� ������, null�� ��� ��ȯ�� ������)
select first_name, department_id, nvl(department_id, 0)
  from employees;
  
-- 2) nvl2(null���� ���θ� �˻��� ������ <1>, <1>���� null�� �ƴ� ��� ��ȯ�� ������ <2>, <1>�� null�� ��� ��ȯ�� ������ <3> )
select first_name, department_id, nvl(department_id, 0), nvl2(department_id, 1, 0)
  from employees;
  
-- ���ʽ��� ���� �������� ���� 0���� ��ü�ؼ� ���
select first_name, commission_pct, nvl(commission_pct, 0)
  from employees;
  
-- ����id, first_name, manager_id�� ���. ��, �Ŵ����� �ִ� ������ '����'���� ���, �Ŵ����� ���� ������ '��ǥ'�� ���
select employee_id, first_name, nvl2(manager_id, '����', '��ǥ')
  from employees;
  
-- [ ���� �Լ� ]
-- decode() : ��Ȳ�� ���� �ٸ� �����͸� ��ȯ�ϴ� �Լ�
--> �˻����� ���ؼ� ������ ���� ��ȯ
-- decode(�˻����� �� �÷� �Ǵ� ������(����) <1>, <1>�� �񱳰� <2>, ��ġ �� ��ȯ�� �� <3>, ��ġ���� ���� �� ��ȯ�� �� <4>)

-- ����id, first_name, manager_id�� ���. ��, �Ŵ����� �ִ� ������ '����'���� ���, �Ŵ����� ���� ������ '��ǥ'�� ���
select employee_id, first_name, manager_id, decode(manager_id, null, '��ǥ', '����')
  from employees;
  
-- �Ŵ��� ���̵� null�̸� ��ǥ, ����id�� 101�̸� �����̻�, ����id�� 102�� ���̻�, ����id�� 103�̸� ����
select employee_id, first_name, manager_id, decode(employee_id, 100, '��ǥ', 101, '�����̻�', 102, '���̻�', 103, '����', '����')
  from employees;