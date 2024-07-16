-- CHAPTER 05. JOIN --

-- join�̶� ?
--> ���� ���̺��� �ʿ��� �����͸� �ѹ��� �������� ���

-- ������(NON EQUI JOIN)
--> �� ���� ���̺� ���� ���� ��Ȯ�ϰ� ��ġ���� �ʴ� ��� Ȱ���ϴ� ����
--> �������(=)�� �ƴ� �����ڵ��� ����� ������ �ǹ�(>, >=, <, <=, BETWEEN)

-- ����� (EQUI JOIN)
--> �� ���� ���̺� ���� ���� ��Ȯ�ϰ� ��ġ�ϴ� ��� Ȱ���ϴ� ����
--> � �����ڸ� ����ؼ� ������ �ǹ�(=)
--> ���� ���� ���Ǵ� ������ �����̴�.

--> [ ������� ����� ]
-- select ���̺�1.�÷��̸�. ���̺�2.�÷��̸� --> ���� ���ϴ� �÷��̸�.(���)�� ���ؼ� �� ��ȸ����!
--   from ���̺�1, ���̺�2 --> ���̺�1�� ���̺�2�� join�ϰڴ�.
--  where ���̺�1.�÷��̸� = ���̺�2.�÷��̸� ; -- ���� ������ ���

-- ���������� ���̺�� ����ǥ ���̺��� �л�ID, �л��̸�, ����, ���� ������ ���

-- 1. ������ ��� ���̺��� ������ Ȯ��
-- 2. from���� ������ ���̺��� ,(�ĸ�) �������� �ۼ�
-- 3. ���� ������ �Ǵ� Ư�� �÷��� Ȯ���Ͽ�, where �������� '��������'�� �ۼ�
-- ���� ������ �Ǵ� Ư�� �÷� : ������ ���̺� ���� '���� ��� ��'�� ������ �÷��̴�.
-- 4. select ���� ����ϰ��� �ϴ� �÷��� .(���)�� �Բ� �ۼ�
select * from ���������� ;
select * from ����ǥ ;

select ����������.�л�id, ����������.�л��̸�, ����ǥ.����, ����ǥ.����
  from ����������, ����ǥ
 where ����������.�л�id = ����ǥ.�л�id ;
 
-- ����id, first_name, �μ��̸� ������ ����� ���ּ���
select * from employees ;

select employees.employee_id, employees.first_name, departments.department_name
  from employees, departments
 where employees.department_id = departments.department_id ;
 
-- from ���� ��Ī�� ���
select e.employee_id, e.first_name, d.department_name
  from employees e, departments d
 where e.department_id = d.department_id ;
 
-- ����id�� 100�� ������ �̸�, �μ����� ���
select e.first_name, d.department_name
  from employees e, departments d
 where e.department_id = d.department_id and e.employee_id = '100' ;
 
-- ����id�� 201�� ����id, �̸�, ����id, �������� ���
select e.employee_id, e.first_name, e.job_id, j.job_title
  from employees e, jobs j
 where e.job_id = j.job_id and e.employee_id = '201' ;
 
-- ansi join ������ �����
-- 3. selelct ���� ��ȸ�ϰ��� �ϴ� �÷� �̸�        --> dot(.)�� ���� ��θ� ���ؼ� ���̺��� �÷��� ��ȸ
-- 1.    from ���̺�1 join ���̺�2               --> ���̺�1�� ���̺�2�� join�ϰڴ�.
--         on (���̺�1.�÷� = ���̺�2.�÷�)        --> ���� �������� �ۼ�
-- 2.   where �Ϲ����ǽ��� ���� ����               --> �Ϲ� �������� �ۼ�

-- ����id�� 101�� ����id�� ������ �̸��� ������ �μ����� ���
select e.employee_id, e.first_name, d.department_name
  from employees e join departments d
    on (e.department_id = d.department_id)
 where e.employee_id = '101' ;
 
-- �ܵ������� �����ϴ� �÷��� .(���)�� �������൵ ����� ����.
-- ������ ���������� ��θ� ���ִ� ���� �����.
-- ���� ������ ��κ� pk�� fk����� �̷������. ������ �� �׷����� �ƴϴ�!!

-- cross join : ���� �������� ���� �ʰ� ���̺��� ��� �����͸� ������ ���� ���
--> ���� ������ ���� ��� ���� �� �ִ� ��� �������� ������ ��ȸ
--> īƼ�� ���̶�� �θ���.
--> īƼ�� �� : ��� ����� ���� ��Ÿ���� ��

-- [ cross join�� ����� ]
--  select ��ȸ�� �÷��̸�
--    from ���̺�1 cross join ���̺�2
-->> on�� ������������ ������ cross join�̴�!

-- ����id�� �μ����� ��� 107*27=2889 (īƼ�� ��)
select e.employee_id, e.department_id, d.department_name
  from employees e cross join departments d ;
  
-- �������̺��� �� ���� ����(107) * �μ����̺��� �� ���� ����(27) = 2889���� ��
-- īƼ�� �� -> ��� ����� ���� ����� �Ǵ� ���� ����

select * from employees ;

-- ���� ���� : ���� ���̺��� �����ϴ� ��
--> ��Ī�� ������� �ȴ� �ݵ��!

-- ������ �Ŵ��� �̸��� ���
-- ����id, �����̸�, �Ŵ���id, �Ŵ����̸�
select a.employee_id, a.first_name, a.manager_id, b.first_name
  from employees a join employees b
    on (a.manager_id = b.employee_id)
order by a.employee_id asc ;

select * from departments;

-- �� �μ��� �Ŵ��� �������� �μ��̸�, �Ŵ������̵�� ������ �̸��� ���
select d.department_name, d.manager_id, e.first_name
  from departments d join employees e
    on (d.manager_id = e.employee_id)
order by d.manager_id asc ;

-- outer join : �ܺ������̶�� �ϸ�, �ΰ��� ���̺� ���� �������� ��ȸ�ϰ�
-- ���� ���̺��� �ִ� �����͵� ���Խ��Ѽ� ��ȸ�ϰ� ���� �� ����ϴ� ���� �����̴�.
--> ���� ���̺��� null���� ����ϰ� ������ ���

-- left outer join : ���� ���̺��� �������� null���� �����Ͽ� ���
--> ����Ŭ ���� ���� : ���� �������� �ݴ��� ������ �÷��� (+) ��ȣ�� �ۼ�
select d.department_name, d.manager_id, e.first_name
  from departments d left outer join employees e
    on (d.manager_id = e.employee_id) ;
    
-- ����Ŭ ���� �������� Ǯ��
select d.department_name, d.manager_id, e.first_name
  from departments d join employees e
    on (d.manager_id = e.employee_id(+)) ;
    
-- right outer join
select d.department_name, d.manager_id, e.first_name
  from departments d right outer join employees e
    on (d.manager_id = e.employee_id) ;

-- ����Ŭ ���� �������� Ǯ��
select d.department_name, d.manager_id, e.first_name
  from departments d join employees e
    on (d.manager_id(+) = e.employee_id) ;

-- full outer join
select d.department_name, d.manager_id, e.first_name
  from departments d full outer join employees e
    on (d.manager_id = e.employee_id) ;
-- 16(left outer join) + 107(right outer join) = 123���� ��