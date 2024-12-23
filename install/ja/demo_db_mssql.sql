CREATE TABLE [DEPT](
	[DEPTNO] [numeric](2, 0) NOT NULL,
	[DNAME] [varchar](14) NULL,
	[LOC] [varchar](13) NULL,
 CONSTRAINT [PK_DEPT] PRIMARY KEY CLUSTERED 
(
	[DEPTNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
;

CREATE TABLE [EMP](
	[EMPNO] [numeric](4, 0) NOT NULL,
	[ENAME] [varchar](10) NULL,
	[JOB] [varchar](9) NULL,
	[MGR] [numeric](4, 0) NULL,
	[HIREDATE] [datetime2](0) NULL,
	[SAL] [numeric](7, 2) NULL,
	[COMM] [numeric](7, 2) NULL,
	[DEPTNO] [numeric](2, 0) NULL,
	[ACCOUNT] [varchar](max) NULL,
	[HAND_PHONE] [varchar](30) NULL,
 CONSTRAINT [PK_EMP] PRIMARY KEY CLUSTERED 
(
	[EMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [EMP_FILE](
	[EMPNO] [varchar](4) NOT NULL,
	[FILE_NAME] [varchar](50) NULL,
	[FILE_DATA] [varbinary](max) NULL,
 CONSTRAINT [EMP_FILE_PK] PRIMARY KEY CLUSTERED 
(
	[EMPNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;

CREATE TABLE [EMP2](
	[EMPNO] [numeric](4, 0) NULL,
	[ENAME] [varchar](10) NULL,
	[JOB] [varchar](9) NULL,
	[MGR] [numeric](4, 0) NULL,
	[HIREDATE] [datetime2](0) NULL,
	[SAL] [numeric](7, 2) NULL,
	[COMM] [numeric](7, 2) NULL,
	[DEPTNO] [numeric](2, 0) NULL,
	[ACCOUNT] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
;


CREATE TABLE [TB_EMP](
	[EMP_NO] [numeric](4, 0) NOT NULL,
	[EMP_NAME] [varchar](10) NULL,
	[EMP_JOB] [varchar](9) NULL,
	[EMP_MGR] [numeric](4, 0) NULL,
	[EMP_HIREDATE] [datetime2](0) NULL,
	[EMP_SAL] [numeric](7, 2) NULL,
	[EMP_COMM] [numeric](7, 2) NULL,
	[EMP_DEPTNO] [numeric](2, 0) NULL,
	[EMP_ACCOUNT] [varchar](max) NULL,
 CONSTRAINT [PK_TB_EMP] PRIMARY KEY CLUSTERED 
(
	[EMP_NO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
   (1111, 'ホンギルドン', '総務', 22,  convert(DATE, '2012/01/02', 111) , 5555, 10);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7369, 'SMITH', '事務', 7902, convert(DATE, '1980/12/17', 111), 4157.28, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7499, 'ALLEN', '営業', 7698, convert(DATE, '1981/02/20', 111) , 1607, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7521, 'WARD', '営業', 7698, convert(DATE, '1981/02/22', 111) , 1250, 500, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
 Values
   (7566, 'JONES', '管理職', 7839, convert(DATE, '1980/04/02', 111) , 20);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7654, 'MARTIN', '営業', 7698, convert(DATE, '1980/09/28', 111) , 1250, 1400, 10);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7698, 'BLAKE', '管理職', 7839, convert(DATE, '1981/05/01', 111) , 2850, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7782, 'CLARK', '管理職', 7839, convert(DATE, '1980/06/09', 111) , 2450, 10);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7788, 'SCOTT', 'アナリスト', 7566, convert(DATE, '1987/04/19', 111)  , 3000, 20);
Insert into EMP
   (EMPNO, ENAME, JOB, HIREDATE, SAL, DEPTNO)
 Values
   (7839, 'KING', '社長', convert(DATE, '1981/11/17', 111) , 5000, 10);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
 Values
   (7844, 'TURNER', '営業', 7698, convert(DATE, '1981/09/08', 111) , 1500, 0, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7876, 'ADAMS', '事務', 7788, convert(DATE, '1987/05/23', 111) , 1100, 20);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7900, 'JAMES', '事務', 7698, convert(DATE, '1981/12/03', 111) , 950, 30);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7902, 'FORD', 'アナリスト', 7566, convert(DATE, '1984/12/09', 111) , 3000, 20);
Insert into EMP
   (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO)
 Values
   (7934, 'MILLER', '事務', 7782, convert(DATE, '1982/01/17', 111) , 1300, 10);
 
commit;
