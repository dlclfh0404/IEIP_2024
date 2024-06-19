DROP TABLE student_tbl_03;

CREATE TABLE STUDENT_TBL_03 (
	sno varchar2(6) NOT NULL,
	sname varchar2(10),
	sphone varchar2(15),
	sgender varchar2(4),
	saddress varchar2(50),
	CONSTRAINTS stu_pk PRIMARY KEY(sno)
); 

insert into STUDENT_TBL_03
values ('10101', '김행복', '010-1111-2222', 'M', '서울 동대문구 휘경1동');
insert into STUDENT_TBL_03
values ('10102', '이축복', '010-1111-3333', 'F', '서울 동대문구 휘경2동');
insert into STUDENT_TBL_03
values ('10103', '장믿음', '010-1111-4444', 'M', '울릉군 울릉읍 독도1리');
insert into STUDENT_TBL_03
values ('10104', '최사랑', '010-1111-5555', 'F', '울릉군 울릉읍 독도2리');
insert into STUDENT_TBL_03
values ('10105', '진평화', '010-1111-6666', 'M', '제주도 제주시 외나무골');
insert into STUDENT_TBL_03
values ('10106', '차공단', '010-1111-7777', 'M', '제주도 제주시 감나무골');

DROP TABLE EXAM_TBL_03;

CREATE TABLE EXAM_TBL_03 (
	sno varchar2(6) NOT NULL,
	ekor number(4),
	emath number(4),
	eeng number(4),
	ehist number(4),
	CONSTRAINTS exam_pk PRIMARY KEY(sno)
);

insert into EXAM_TBL_03
values ('10101', 98, 91, 95, 90);
insert into EXAM_TBL_03
values ('10102', 87, 89, 92, 82);
insert into EXAM_TBL_03
values ('10103', 76, 79, 74, 99);
insert into EXAM_TBL_03
values ('10104', 92, 89, 84, 95);
insert into EXAM_TBL_03
values ('10105', 85, 87, 91, 94);
insert into EXAM_TBL_03
values ('10106', 78, 76, 81, 77);

select sno, sname, substr(sno,1,1) grade, substr(sno,2,2) class, substr(sno,4,2) classnum, case when sgender = 'M' then '남' else '여' end sgender, sphone, saddress from student_tbl_03

select substr(s.sno,1,1) grade, substr(s.sno,2,2) class, substr(s.sno,4,2) classnum, s.sname, e.ekor, e.emath, e.eeng, e.ehist, sum(ekor+emath+eeng+ehist) sum, sum(ekor+emath+eeng+ehist)/4 avg, rank() over (order by sum(ekor+emath+eeng+ehist) desc) rank from student_tbl_03 s, exam_tbl_03 e where s.sno = e.sno group by substr(s.sno,1,1), substr(s.sno,2,2), substr(s.sno,4,2), s.sname, e.ekor, e.emath, e.eeng, e.ehist union all
select nvl(to_char(null),1), to_char(null), to_char(null), to_char(null), sum(ekor), sum(emath), sum(eeng), sum(ehist), sum(ekor+emath+eeng+ehist), sum(ekor+emath+eeng+ehist)/4, to_number(null) from exam_tbl_03 union all
select to_char(null), to_char(null), to_char(null), to_char(null), avg(ekor), avg(emath), avg(eeng), avg(ehist), avg(ekor+emath+eeng+ehist), avg(ekor+emath+eeng+ehist)/4, to_number(null) from exam_tbl_03