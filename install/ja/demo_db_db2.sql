drop table if exists emp;
drop table if exists dept;
drop table if exists emp_file;
drop table if exists emp2;

create table emp
(
  empno     int NOT null,
  ename   varchar(10),
  job      varchar(9),
  mgr      int,
  hiredate  DATE,
  sal       DECIMAL(7,2),
  comm      DECIMAL(7,2),
  deptno    int,
  account   clob
)
;

create unique index idx_emp_pk on emp
(empno)
;
alter table emp add constraint emp_pk primary key (empno);

create table dept
(
  deptno  int NOT null,
  dname   varchar(14),
  loc     varchar(13)
)
;
create unique index idx_dept_pk on dept
(deptno)
;
alter table dept add constraint dept_pk primary key (deptno) ;


create table emp_file
(
  empno      varchar(4) NOT null,
  file_name  varchar(50),
  file_data  blob
)
;
create unique index idx_emp_file_pk on emp_file
(empno)
;
alter table emp_file add constraint emp_file_pk primary key (empno) ;


CREATE TABLE emp2
(
  empno     int,
  ename   varchar(10),
  job      varchar(9),
  mgr      int,
  hiredate  DATE,
  sal       DECIMAL(7,2),
  comm      DECIMAL(7,2),
  deptno    int,
  account   blob
);



Insert into DEPT
   (DEPTNO, DNAME, LOC)
 Values
   (10, '会計', 'ニューヨーク');
Insert into DEPT
   (DEPTNO, DNAME, LOC)
 Values
   (20, '研究', 'ダラス');
Insert into DEPT
   (DEPTNO, DNAME, LOC)
 Values
   (30, '販売', 'シカゴ');
Insert into DEPT
   (DEPTNO, DNAME, LOC)
 Values
   (40, '運営', 'ボストン');



Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (1111, 'ホン・ギルドン', '総務', 22,  DATE( REPLACE('2012/01/12','/','-')), 5555, 10);
  
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7369, 'SMITH', '事務', 7902,  DATE( REPLACE('1980/12/17','/','-')), 4157.28, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7499, 'ALLEN', '営業', 7698,  DATE( REPLACE('1981/02/20','/','-')), 1607, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7521, 'WARD', '営業', 7698,  DATE( REPLACE('1981/02/22','/','-')), 1250, 500, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
 Values
   (7566, 'JONES', '管理職', 7839,  DATE( REPLACE('1981/04/02','/','-')), 20);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7654, 'MARTIN', '営業', 7698,  DATE( REPLACE('1981/09/28','/','-')), 1250, 1400, 10);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7698, 'BLAKE', '管理職', 7839,  DATE( REPLACE('1981/05/01','/','-')), 2850, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7782, 'CLARK', '管理職', 7839,  DATE( REPLACE('1981/06/09','/','-')), 2450, 10);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7788, 'SCOTT', 'アナリスト', 7566,  DATE( REPLACE('1987/04/19','/','-')), 3000, 20);
Insert into EMP
   (EMPNO, ENAME, JOB, HIREDATE, SAL, DEPTNO)
 Values
   (7839, 'KING', '社長',  DATE( REPLACE('1981/11/17','/','-')), 5000, 10);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7844, 'TURNER', '営業', 7698,  DATE( REPLACE('1981/09/08','/','-')), 1500, 0, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7876, 'ADAMS', '事務', 7788,  DATE( REPLACE('1987/05/23','/','-')), 1100, 20);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7900, 'JAMES', '事務', 7698,  DATE( REPLACE('1981/12/03','/','-')), 950, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7902, 'FORD', 'アナリスト', 7566,  DATE( REPLACE('1981/12/03','/','-')), 3000, 20);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7934, 'MILLER', '事務', 7782,  DATE( REPLACE('1982/01/23','/','-')), 1300, 10);

COMMIT;