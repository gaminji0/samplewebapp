CREATE TABLE dept (
	deptno INTEGER NOT NULL,
	dname CHARACTER VARYING (255),
	loc CHARACTER VARYING (4096),
	CONSTRAINT pk PRIMARY KEY(deptno)
)
COLLATE euckr_bin
REUSE_OID;

CREATE TABLE emp (
	empno INTEGER NOT NULL,
	ename CHARACTER VARYING (255),
	job CHARACTER VARYING (255),
	mgr INTEGER,
	hiredate DATE,
	sal DOUBLE,
	comm DOUBLE,
	deptno INTEGER,
	account CLOB,
	CONSTRAINT pk PRIMARY KEY(empno)
)
COLLATE euckr_bin
REUSE_OID;

CREATE TABLE emp_file (
	empno INTEGER NOT NULL,
	file_name CHARACTER VARYING (255),
	file_data BLOB,
	CONSTRAINT pk PRIMARY KEY(empno)
)
COLLATE euckr_bin
REUSE_OID;

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
   (30, '営業', 'シカゴ');
Insert into DEPT
   (DEPTNO, DNAME, LOC)
 Values
   (40, '運営', 'ボストン');

commit;

Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (1111, 'ホン・ギルドン', '総務', 22, cast(SYSDATETIME AS DATE) , 5555, 10);
   
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7369, 'SMITH', '事務', 7902, cast(SYSDATETIME AS DATE) , 4157.28, 30);
   
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7499, 'ALLEN', '営業', 7698, cast(SYSDATETIME AS DATE) , 1607, 30);
   
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7521, 'WARD', '営業', 7698, cast(SYSDATETIME AS DATE) , 1250, 500, 30);
   
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
 Values
   (7566, 'JONES', '管理職', 7839, cast(SYSDATETIME AS DATE) , 20);
   
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7654, 'MARTIN', '営業', 7698, cast(SYSDATETIME AS DATE) , 1250, 1400, 10);
   
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7698, 'BLAKE', '管理職', 7839, cast(SYSDATETIME AS DATE) , 2850, 30);
   
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7782, 'CLARK', '管理職', 7839, cast(SYSDATETIME AS DATE) , 2450, 10);
   
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7788, 'SCOTT', 'アナリスト', 7566, cast(SYSDATETIME AS DATE) , 3000, 20);
   
Insert into EMP
   (EMPNO, ENAME, JOB, HIREDATE, SAL, DEPTNO)
 Values
   (7839, 'KING', '社長', cast(SYSDATETIME AS DATE) , 5000, 10);
   
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7844, 'TURNER', '営業', 7698, cast(SYSDATETIME AS DATE) , 1500, 0, 30);
   
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7876, 'ADAMS', '事務', 7788, cast(SYSDATETIME AS DATE) , 1100, 20);
   
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7900, 'JAMES', '事務', 7698, cast(SYSDATETIME AS DATE) , 950, 30);
   
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7902, 'FORD', 'アナリスト', 7566, cast(SYSDATETIME AS DATE) , 3000, 20);
   
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7934, 'MILLER', '事務', 7782, cast(SYSDATETIME AS DATE) , 1300, 10);
 
 commit;