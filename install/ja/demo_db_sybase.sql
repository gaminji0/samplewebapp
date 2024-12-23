CREATE TABLE EMP
(
  EMPNO     INT NOT NULL,
  ENAME   VARCHAR(10),
  JOB      VARCHAR(9),
  MGR      INT,
  HIREDATE  DATE,
  SAL       DECIMAL(7,2),
  COMM      DECIMAL(7,2),
  DEPTNO    INT,
  ACCOUNT   TEXT,
  CONSTRAINT EMP_PK  PRIMARY KEY (EMPNO ASC)
)
;

CREATE UNIQUE INDEX IDX_EMP_PK ON EMP
(EMPNO)
;

CREATE TABLE DEPT
(
  DEPTNO  INT NOT NULL,
  DNAME   VARCHAR(14),
  LOC     VARCHAR(13),
  CONSTRAINT DEPT_PK  PRIMARY KEY (DEPTNO ASC)
)
;

CREATE UNIQUE INDEX IDX_DEPT_PK ON DEPT
(DEPTNO)
;

CREATE TABLE EMP_FILE
(
  EMPNO      INT NOT NULL,
  FILE_NAME  VARCHAR(50),
  FILE_DATA  IMAGE,
  CONSTRAINT EMP_FILE_PK  PRIMARY KEY (EMPNO ASC)
)
;

CREATE UNIQUE INDEX IDX_EMP_FILE_PK ON EMP_FILE
(EMPNO)
;

CREATE TABLE EMP2
(
  EMPNO     INT,
  ENAME   VARCHAR(10),
  JOB      VARCHAR(9),
  MGR      INT,
  HIREDATE  DATE,
  SAL       DECIMAL(7,2),
  COMM      DECIMAL(7,2),
  DEPTNO    INT,
  ACCOUNT   TEXT
)
;

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
   
  

Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (1111, 'ホン・ギルドン', '総務', 22, convert(date, '2012/01/12'), 5555, 10);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7369, 'SMITH', '事務', 7902, convert(date, '1980/12/17'), 4157.28, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7499, 'ALLEN', '営業', 7698, convert(date, '1981/02/20'), 1607, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7521, 'WARD', '営業', 7698, convert(date, '1981/02/22'), 1250, 500, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
 Values
   (7566, 'JONES', '管理職', 7839, convert(date, '1981/04/02'), 20);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7654, 'MARTIN', '営業', 7698, convert(date, '1981/09/28'), 1250, 1400, 10);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7698, 'BLAKE', '管理者', 7839, convert(date, '1981/05/01'), 2850, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7782, 'CLARK', '管理者', 7839, convert(date, '1981/06/09'), 2450, 10);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7788, 'SCOTT', 'アナリスト', 7566, convert(date, '1987/04/19'), 3000, 20);
Insert into EMP
   (EMPNO, ENAME, JOB, HIREDATE, SAL, DEPTNO)
 Values
   (7839, 'KING', '社長', convert(date, '1981/11/17'), 5000, 10);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7844, 'TURNER', '営業', 7698, convert(date, '1981/09/08'), 1500, 0, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7876, 'ADAMS', '事務', 7788, convert(date, '1987/05/23'), 1100, 20);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7900, 'JAMES', '事務', 7698, convert(date, '1981/12/03'), 950, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7902, 'FORD', 'アナリスト', 7566, convert(date, '1981/12/03'), 3000, 20);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7934, 'MILLER', '事務', 7782, convert(date, '1982/01/23'), 1300, 10);

commit;