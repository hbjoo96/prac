-- CHAPTER 06. DDL (Data Definition Language) --

-- ddl�̶�?
-- ������ ���Ǿ�� ���̺� ���� ����� ��ü�� ����ų� �����մϴ�.

-- [ DDL�� ��ɾ� ���� ]
-- CREATE   : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
-- ALTER    : ���̺� ���� ��ü�� �����ϴ� ��ɾ�
-- RENAME   : ���̺��� �̸��� �����ϴ� ��ɾ�
-- TRUNCATE : ���̺��� �����͸� �����ϴ� ��ɾ�
-- DROP     : ���̺� ���� ��ü�� �����ϴ� ��ɾ�

-- [ ���̺� ������ ���� ����ϴ� �ڷ��� ]
-- varchar2(n) : ������ ������, nũ�⸸ŭ �Է¹���
-- number(p,s) : ������ ���� p�ڸ���ŭ �Է¹ް� s�ڸ� ��ŭ �Ҽ��� �Է¹���
--> ����Ŭ �����ͺ��̽������� �Ǽ��� ���� ��� ǥ���� �����ϴ�!!
--> �Ұ�ȣ�� �����ϰ� �Ǹ� �ִ� ���� 38 ũ�Ⱑ ����.
-- date : ���� ��¥ ���� �Է¹޴� ��¥�� �ڷ����̴�.

-- ���̺� �����ϱ�
-- ���������� ���̺��� Ȯ���ؼ� TEST_������������� ���̺��� ������
-- ���������� ���̺��� ���콺�� �巡���� ������ shift+f4�� ������ ���̺��� ������ Ȯ�ΰ���
create table test_���������� (
    �л�id varchar2(9),
    �л��̸� varchar2(50),
    �Ҽӹ� varchar2(5)
) ;

select * from test_���������� ;

-- ����ǥ ���̺��� Ȯ���ؼ� test_����ǥ ���̺��� ������!
create table test_����ǥ (
    �л�id varchar2(9),
    ���� varchar2(30), 
    ���� number
) ;

select * from test_����ǥ ;

-- ���̺� ���� �ǽ�1
create table ���̺��_login (
    id varchar2(20),
    pw varchar2(20),
    email varchar2(20),
    name  varchar2(20)
) ;

select * from ���̺��_login ;

-- ���������̶� ?
--> ���̺� �Է� ������ �����͸� �������� �����ϴ� ��
--> �����ͺ��̽��� ����Ǵ� �����ʹ� �׻� ��Ȯ�ϰ� �ϰ����� ������ �Ǿ�� �Ѵ�.
--> �׷��� ���ؼ� ���� ������ ������ ������Ѵ�.
--> ���� ���� ���� ��Ŀ� ���� �������� �����̳� ���� ���ο� ������ �޴´�.

-- [ ���� ������ ���� ]
-- PRIMARY KEY(PK) : �⺻Ű, NOT NULL + UNIQUE --> NULL�� �Ұ� + �ߺ� �Ұ�
-- UNIQUE KEY(UK) : ����Ű, NULL�� �Է� ���� �� �ߺ��� �Ұ�
-- NOT NULL : NULL�� �Ұ���, �� �ԷµǾ�� �ϴ� �������̴� �Ҷ� ����ϴ� ���� ����
-- CHECK : TRUE OR FALSE�� ���� �� �ִ� ���� ����, ������ �����͸� �Է� ����
-- FOREIGN KEY(FK) : �ܷ�Ű, ���̺��� �����ϴ� Ű

-- ������ ���Ἲ�̶� ?
--> �����Ϳ� ������ ���� ����
--> �����Ͱ� ��Ȯ�ϰ� ��ȿ�ϰ� ������ ����

-- ���Ἲ �������� ����
-- ��ü ���Ἲ(PK) : �⺻Ű �����̶�� �ϸ�, �ϳ��� ���̺� �ߺ��� ���� �������� �ʵ��� ����
-- ���� ���Ἲ(FK) : ���� �Է�, ����, ������ �� �����Ǵ� �ٸ� ���̺���� �����Ͱ� ��Ȯ�ϰ� �����ǵ��� ����
--> ���� ���迡 �ִ� �� ���̺��� �����Ͱ� �׻� �ϰ��� ���� ������ �ϴ� ��

-- [ �̹� ������ ���̺��� ���������� �����ϱ� ]
select * from ���̺��_login ;
-- �����
-- alter table ���̺� �̸� add constraint �������� �̸� ��������(�÷�)

-- ���̺� pk �������� �����ϱ�
alter table ���̺��_login add constraint ���̺��_id_pk primary key(id) ;

-- ���̺� uk �������� �����ϱ�
alter table ���̺��_login add constraint ���̺��_email_uk unique(email) ;

-- ���̺� check �������� �����ϱ�
alter table ���̺��_login add constraint ���̺��_pw_check check(length(pw) >3 ) ;

-- ���̺� fk ���������� �����ϱ�
-- fk �������� �����ϴ� ���
-- alter tabel ���̺� �̸� add constrint ���������̸� ��������(�÷�)
-- references �������̺�(�����÷���) ;

-- test_���������� ���̺� �л�id�÷��� pk�� ���������� �ɾ��ּ���!!
alter table test_���������� add constraint test_id_pk primary key(�л�id) ;
select * from test_���������� ;

-- test_����ǥ ���̺��� �л�id �÷��� fk�� ���������� �ɾ��ֱ�
alter table test_����ǥ add constraint �л�id_fk foreign key(�л�id)
references test_����������(�л�id);

-- �������� �����ϱ�
-- alter table ���̺� �̸� modify �÷� �̸� �ٲ� �������� ;
select * from ���̺��_login ;
alter table ���̺��_login modify name not null ;

-- �������� �����ϱ�
-- alter table ���̺��̸� drop constraint �������� �̸� ;
alter table ���̺��_login drop constraint ���̺��_PW_CHECK ;

-- ���̺��� �÷� �߰�
--alter table ���̺���̸� add �÷��� �ڷ��� (ũ��) ;
alter table ���̺��_login add tel varchar2(10);
select * from ���̺��_login ;

-- �÷��� �ڷ����� �����ϱ�
-- alter table ���̺� �̸� modify �÷��� �ٲ� �ڷ���(����) ;
alter table ���̺��_login modify tel varchar2(20) ;

-- Ư�� �÷��� �����ϱ�
-- alter table ���̺��̸� drop column �÷��� ;
alter table ���̺��_login drop column tel ;

-- ���̺��� �̸��� �����ϱ�
-- rename ���̺��̸� to �ٲ� ���̺��̸� ;
rename ���̺��_login to kk_login ;
select * from kk_login ;

-- ���̺� ����
-- �����
-- drop table ���̺� �̸� ;
drop table test_���������� ;
-- ORA-02449: unique/primary keys in table referenced by foreign keys
-- test_����ǥ ���̺��� �л�id��� �÷��� fk�� �����ǰ� �ֱ� ������ ������ �Ұ����ϴ�.

-- �������Ǳ��� ������ �ϴ� ���
-- drop table ���̺��̸� cascade constraint ;
drop table test_���������� cascade constraint;

-- truncate : ���̺��� �����͸� ���� ���� -> �ѹ��ص� ���ƿ��� ����
-- truncate table ���̺� �̸� ;

-- ���̺��� �����ϴ� ������
create table drop_����ǥ as select * from ����ǥ ;
select * from drop_����ǥ ;
--> ���̺��� �������Ǳ����� ���簡 ���� �ʴ´�.
--> ����ǥ ���̺�� ������ �����͸� ������ ���̺��� �����ϴ� �������̴�!
truncate table drop_����ǥ ;
rollback;

-- ���̺� ���� ��� 1)
create table tb_test1(
    pk�׽�Ʈ number primary key,
    uk�׽�Ʈ number unique, 
    nl�׽�Ʈ number not null, 
    ck�׽�Ʈ number check (length(ck�׽�Ʈ)>5)
);
-- ���̺� ���� ��� 2)
create table tb_test2(
    pk�׽�Ʈ number, 
    uk�׽�Ʈ number, 
    nl�׽�Ʈ number not null, 
    ck�׽�Ʈ number, 
    fk�׽�Ʈ number, 
    -- ���������� �߰�
    -- constraint �������Ǹ� ��������(�÷�)
    constraint pk�׽�Ʈ_pk primary key (pk�׽�Ʈ),
    constraint uk�׽�Ʈ_uk unique (uk�׽�Ʈ), 
    constraint ck�׽�Ʈ_ck check (ck�׽�Ʈ> 0), 
    constraint fk�׽�Ʈ_fk foreign key (fk�׽�Ʈ)
    references tb_test1 (pk�׽�Ʈ)
);

-- ���̺� ���� �ǽ�2
create table test_join (
    id varchar2(20) primary key,
    pw varchar2(20) not null,
    name varchar2(10) not null,
    join_date date,
    age number(3),
    tel varchar2(20),
    email varchar2(50) unique
);
select * from test_join ;

-- VIEW(��)�� ?
--> �ϳ� �̻��� ���̺��� ���� ������ ���� ��������� ������ ���̺��̴�.
-- �� ���� ���
-- CREATE VIEW �� �̸�
-- AS ������ SELECT ����

CREATE VIEW EMP_100
AS SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, SALARY
     FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 100 ;

SELECT * FROM EMP_100 ;