-- CHAPTER 07. DML (Data manipulation Language) --

-- DML�̶�?
--> ������ ���۾�� ���̺� �����͸� ��ȸ, �߰�, ����, ���� �� �� ����ϴ� ���Ǿ�
--> ���̺��� ���ϴ� �����͸� �Է�, ����, �����Ѵ�.

-- [ DML�� ���� ] - ���̾���
-- SELECT : ������ ��ȸ
-- INSERT : ������ �߰�
-- UPDATE : ������ ����
-- DELETE : ������ ����

-- INSERT �����
-- 1) INSERT INTO ���̺� �̸� (�÷� LIST...)
--    VALUES (��....)
--> *** INSERT INTO�� �Է��� �÷��� VALUES�� �Է��� ���� ������ �ڷ����� �°� ��� �ȴ�.(1:1����)

-- 2) INSERT INTO ���̺� �̸�
--    VALUE(��...)
--> INESERT�� �÷�����Ʈ�� ������ VALUES�� �Է��� ���� ���̺��� �÷� ���� ������ �ڷ����� ���ƾ� �ȴ�!

-- ���� ������ �־��
SELECT * FROM TEST_JOIN ;

insert into test_join (id, pw, name, join_date, age, tel, email)
values ('SMHRD01', '1111', 'ȫ�浿', sysdate, 20, '010-1234-5678', 'hong11@gmail.com') ;
SELECT * FROM TEST_JOIN ;

-- ģ���� ������ �ֱ�
insert into test_join (id, pw, name, join_date, age, tel, email)
values ('SMHRD02', '0000', 'Ȳ�ص�', SYSDATE, 31, NULL, '' ) ;
SELECT * FROM TEST_JOIN ;

-- ģ���� ������ �ֱ�(2)
insert into test_join (id, pw, name, join_date, age, tel, email)
values('SMHRD03', '1111', '����ǥ', sysdate, 21, '', '') ;

-- ģ���� ������ �ֱ�(3)
insert into test_join (id, pw, name, join_date, age, tel, email)
values('smhrd04', '2222', '������', sysdate, 16, '010-2222-2222', 'bong@naver.com');

-- ���̺� ������ ���� ����Ʈ 

-- 1. �÷�����Ʈ�� �Է� ���� ������ �ٸ� ���
INSERT INTO test_join (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM', 'N');
 
--  SQL ����: ORA-00913: too many values 
--> �÷� ����Ʈ�� ������ �Է� �� ������ ��ġ�ؾ� �Ѵ�!

-- 2. �ĺ��ڿ� NULL�� �Է��� ���
INSERT INTO test_join (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES (NULL, '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."ID")
--> �÷��� ���� �������ǿ� �°� �ۼ� �ؾ��� (�ĺ��ڴ� NOT NULL + UNIQUE �ߺ��Ұ�)

-- 3. NOT NULL�� �÷��� NULL�� ���� ���
INSERT INTO test_join (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', NULL , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01400: cannot insert NULL into ("HR"."SMHRD_JOIN"."NAME")
--> �÷��� ���� �������ǿ� �°� �ۼ� �ؾ��� ( NOT NULL ���� )

-- 4. �ڷ����� ���� �ʰ� �Է� ���� ���� ���
INSERT INTO test_join (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, '29��', '010-111-1111', 'HODO@GMAIL.COM');

-- ORA-01722: invalid number
--> �÷��� ���� �ڷ����� �°� �ۼ��� �Ǿ� �Ѵ�. (AGE�� ������ �ڷ���)

-- 5. �ĺ��� �÷��� �ߺ� ���� ���� ���� ���
INSERT INTO test_join (ID, PW, NAME, JOIN_DATE, AGE, TEL, EMAIL)
 VALUES ('ȣ�ξƺ�', '33333', '�ں���' , SYSDATE, 29, '010-111-1111', 'HODO@GMAIL.COM');
 
-- unique constraint (HR.SYS_C007110) violated
--> ���� �� ���¿��� �ѹ��� ������ �Ǹ� �ĺ��ڰ� ���� �ߺ��� �Ǽ� ������ ��

-- update : ���̺��� �����͸� �����ϰ� ������ ���
-- �����
-- update ���̺� �̸�
-- set ������ �÷� = ������
-- where �����͸� ������ ��� ���� �����ϱ� ���� ���ǽ� ;
--> *** where �������� ������ ��� ���̺� �� ����� ��� �÷��� �����Ͱ� ������ �ȴ�!!

select * from test_join ;
update test_join
set age = 99
where name = 'ȫ�浿' ;
select * from test_join ;

update test_join
set tel='010-2222-3333', email='kkk@naver.com'
where name = '����ǥ' ;

update test_join
set tel='010-4444-5555', email='hhh@naver.com'
where name = 'Ȳ�ص�' ;

update test_join
set id='SMHRD04'
where name = '������' ;
select * from test_join ;
-- DML�� �������� ���� ���ǹ��� �÷��� pk�� �ϴ°��� ��Ģ�̴�!!

-- DELETE : �����͸� �����Ҷ� ����ϴ� ��ɾ�
-- �����
-- DELETE FROM ���̺� �̸�
-- WHERE ������ ��� ���� �����ϱ� ���� ���ǽ� ;
--> *** WHERE �������� ������ ��� ���̺��� ��� �����Ͱ� ������ �ȴ�!
DELETE FROM test_join
where id='SMHR02' ;
SELECT * FROM TEST_JOIN ;

DELETE FROM TEST_join
where id='SMHRD03' ;
SELECT * from test_join ;

-- 30�� ������ ȸ������ ������ ����
delete from test_join
where age<30 ;
select * from test_join ;