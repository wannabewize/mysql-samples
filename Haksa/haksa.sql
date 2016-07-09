DROP DATABASE IF EXISTS haksa;
CREATE DATABASE IF NOT EXISTS haksa;
USE haksa;

#학과 테이블
create table department(
    dept_code int(2) Not null, #학과번호
    dept_name char(30) Not null, #학과명
    dept_ename varchar(50), #학과영문이름
    Create_date date default null, #학과생성날짜
    primary key (dept_code)
);

#우편 번호 테이블
create table post(
    post_no varchar(7) Not null, #우편번호
    post_dong char(30) Not null, #동이름
    post_address char(60) Not null, #주소
    ddd char(4), #DDD 전화지역번호
    primary key(post_no)
);


#학적(학생신상)테이블
create table student(
    stu_no char(10) Not null, #학번
    stu_name char(10) Not null, #학생이름
    stu_ename varchar(30), #영문이름
    dept_code int(2) Not null, #학과코드
    grade int(1) Not null, #학년
    class int (1) Not null, #반
    juya char(2), #주야구분
    id_num varchar(14) Not null, #주민등록번호
    post_no varchar(7), #우편번호
    address varchar(100), #주소
    tel varchar(14), #전화번호
    phone_no varchar(14), #휴대전화번호
    birth_year char(4), #출생년도
    primary key (stu_no),
    constraint s_dp_fk foreign key(dept_code) #외래키 학과 테이블의 학과코드
    references department(dept_code),
    constraint s_ps_fk foreign key(post_no) #외래키 우편번호테이블 우편번호코드
    references post(post_no)
);


#교과목테이블
create table subject(
    sub_code char(5) Not null, #과목번호
    sub_name varchar(50) Not null, #과목명
    sub_ename varchar(50), #영문과목명
    create_year char(4), #개설년도
    primary key (sub_code)
);


#교수테이블
create table professor(
    prof_code char(4) Not null, #교수번호
    prof_name char(10) Not null, #교수명
    prof_ename varchar(30), #교수영문이름
    Create_date date default null, #교수임용날짜
    primary key (prof_code)
);


#수강신청
create table attend(
    stu_no char(10) Not null, #학번
    att_year char(4) Not null, #수강년도
    att_term int(1) Not null, #수강학기
    att_isu int(1) Not null, #이수구분
    sub_code char(5) Not null, #과목코드
    prof_code char(4) Not null, #교수번호
    att_point int(1) Not null, #이수학점
    att_grade int(3) default '0', #취득점수
    att_div char(1) default 'N' Not null, #수강신청구분
    att_jae char(1) default '1', #재수강 구분 1(본학기 수강), 2(재수강), 3(계절학기 수강)
    att_date date Not null, #수강처리일자
    primary key (stu_no, att_year, att_term, sub_code, prof_code, att_jae),
    constraint su_att_fk foreign key(sub_code) #외래키 교과목 테이블의 과목코드
    references subject(sub_code),
    constraint pr_att_fk foreign key(prof_code) #외래키 교수 테이블의 교수코드
    references professor(prof_code)
);


#등록금테이블
create table fee(
    stu_no varchar(10) Not null, #학번
    fee_year varchar(4) Not null, #등록년도
    fee_term int(1) Not null, #등록학기
    fee_enter int(7), #입학금
    fee_price int(7) Not null, #등록금(수업료)
    fee_total int(7) Default '0' Not null, #등록금총액=입학금+수업료
    jang_code char(2) Null, #장학코드
    jang_total int(7), #장학금액
    fee_pay int(7) Default '0' Not null, #납부총액=등록금총액-장학금액
    fee_div char(1) Default 'N' Not null, #등록구분
    fee_date date Not null, #등록날짜
    primary key (stu_no, fee_year, fee_term)
);


#성적테이블
create table score(
    stu_no char(10) Not null, #학번
    sco_year char(4) Not null, #성적취득년도
    sco_term int(1) Not null, #학기
    req_point int(2), #신청학점
    take_point int(2), #취득학점
    exam_avg float(2,1), #평점평균
    exam_total int(4), #벡분율 총점
    sco_div char(1), #성적구분
    sco_date date, #성적처리일자
    primary key (stu_no, sco_year, sco_term)
);


#동아리테이블
create table circle(
    cir_num int(4) Not null auto_increment, #동아리가입번호
    cir_name char(30) Not null, #동아리명
    stu_no char(10) Not null, #학번
    stu_name char(10) Not null, #이름
    president char(1) default '2' Not null, #동아리회장(0), 부회장(1), 회원(2)
    primary key (cir_num),
    constraint s_ci_fk foreign key(stu_no) #외래키 학적 테이블의 학번
    references student(stu_no)
);


CREATE INDEX STU_PRIM ON STUDENT (STU_NO);
CREATE INDEX ATT_PRIM ON ATTEND (STU_NO);
CREATE INDEX FEE_PRIM ON STUDENT(STU_NO);
CREATE INDEX SUB_PRIM ON SUBJECT(SUB_CODE);
CREATE INDEX SCO_PRIM ON STUDENT(STU_NO);
CREATE INDEX PRO_PRIM ON PROFESSOR(PROF_CODE);
CREATE INDEX POS_PRIM ON POST(POST_NO);
CREATE INDEX CIR_PRIM ON CIRCLE(CIR_NUM);
CREATE INDEX DEP_PRIM ON DEPARTMENT(DEPT_CODE);


#DEPARTMENT 입력
INSERT INTO DEPARTMENT VALUES (10,'간호학과','Dept. of Nersing','1954-02-01');
INSERT INTO DEPARTMENT VALUES (20,'경영학과','dept. of Management','1980-02-10');
INSERT INTO DEPARTMENT VALUES (30,'수학학과','dept. of Mathematics','1984-02-20');
INSERT INTO DEPARTMENT VALUES (40,'컴퓨터정보학과','dept. of Computer Information','1997-02-01');
INSERT INTO DEPARTMENT VALUES (50,'정보통신학과','dept. of Information Communication','1997-02-10');
INSERT INTO DEPARTMENT VALUES (60,'회계학과','dept.of Accounting','1998-03-01');


 #POST 입력
INSERT INTO POST VALUES ('556-820', '화양면', '전라남도 여수시 화양면', '061');
INSERT INTO POST VALUES ('540-130', '생목동', '전라남도 순천시 생목동', '061');
INSERT INTO POST VALUES ('451-800', '팽성읍', '경기도 평택시 팽성읍', '031');
INSERT INTO POST VALUES ('545-800', '광양읍', '전라남도 광양시 광양읍', '061');
INSERT INTO POST VALUES ('540-850', '해룡면', '전라남도 순천시 해룡면', '061');
INSERT INTO POST VALUES ('550-130', '서교동', '전라남도 여수시 서교동', '061');
INSERT INTO POST VALUES ('150-051', '신길1동', '서울특별시 영등포구 신길1동', '02');
INSERT INTO POST VALUES ('500-170', '운암동', '광주광역시 북구 운암동', '062');
INSERT INTO POST VALUES ('506-040', '소촌동', '광주광역시 광산구 소촌동', '062');
INSERT INTO POST VALUES ('545-080', '광영동', '전라남도 광양시 광영동', '061');
INSERT INTO POST VALUES ('550-160', '봉광동', '전라남도 여수시 봉강동', '061');
INSERT INTO POST VALUES ('540-170', '남정동', '전라남도 순천시 남정동', '061');
INSERT INTO POST VALUES ('550-260', '여서동', '전라남도 여수시 여서동', '061');
INSERT INTO POST VALUES ('540-310', '안풍동', '전라남도 순천시 안풍동', '061');
INSERT INTO POST VALUES ('546-121', '농성동', '광주광역시 서구 농성동', '062');
INSERT INTO POST VALUES ('590-020', '향교동', '전라북도 남원시 향교동', '063');
INSERT INTO POST VALUES ('548-820', '영남면', '전라남도 고흥군 영남면', '061');


#STUDENT 학생 테이블 입력
INSERT INTO STUDENT VALUES ('20001001', '김유신', 'Kim Yoo-Shin', 40, 4, 3, '야', '811007-1632013','556-820','안포리 28번지','061)685-7818','011-617-1290','1981');
INSERT INTO STUDENT VALUES ('20001015', '박도준', 'Park Do-Jun', 40, 4, 1, '주', '780116-1580715','540-130','16-2번지','061)744-6126','011-611-9884','1978');
INSERT INTO STUDENT VALUES ('20001021', '이상길', 'Lee Sang-Gil', 40, 4, 1, '주', '750819-1227014','451-800','안정리 주공APT 107동 504호','031)691-5423',NULL,'1975');
INSERT INTO STUDENT VALUES ('20041002', '김유미', 'Kim Yoo-Mi', 40, 3, 2, '주', '830207-2629715','545-800','덕례리 산 16-1번지','061)763-1439','010-617-1290','1983');
INSERT INTO STUDENT VALUES ('20041007', '정인정', 'Jeung Yin-Jeung', 40, 2, 2, '주', '830315-2351225','540-850','부영7차APT 304동 1210호','061)723-1078','016-605-7837','1983');
INSERT INTO STUDENT VALUES ('20041033', '연개소문', 'Yean Gae-So-Moon', 40, 3, 3, '야', '810615-1633111','550-130','280-50번지','061)642-9304','018-641-9304','1981');
INSERT INTO STUDENT VALUES ('20061011', '박정인', 'Park Jung-In', 40, 2, 1, '주', '830403-1635213','150-051','985번지 롯데APT 102-306','02)652-2439','017-3142-1294','1983');
INSERT INTO STUDENT VALUES ('20061014', '고혜진', 'Ko Hea-Jin', 10, 2, 1,'주', '870307-2638759','500-170','삼익APT 101동 102호','061)781-5135',NULL,'1987');
INSERT INTO STUDENT VALUES ('20061048', '김영호', 'Kim Young-Ho', 10, 4, 3 ,'야', '860811-1548758','506-040','라인APT 207동 309호','062)678-1010','017-614-7575','1986');
INSERT INTO STUDENT VALUES ('20071001', '장수인', 'Jang Soo-In', 40, 1, 1 ,'주', '890209-1616822','545-080','금광APT 108동 1101호','061)791-1236',NULL,'1989');
INSERT INTO STUDENT VALUES ('20071010', '홍길동', 'Hong Gil-Dong', 40, 1, 3,'야', '880402-1850838','550-160','해태APT 104동 605호','061)642-4034','010-6425-9245','1988');
INSERT INTO STUDENT VALUES ('20071022', '이순신', 'Lee Sun-Shin', 10, 1, 3,'야', '890222-1218818','540-170','560-18번지 ','061)745-7667','010-7141-1860','1989');
INSERT INTO STUDENT VALUES ('20071300', '유하나', 'Yoo Ha-Na', 50, 1, 1 ,'주', '880921-2573717','550-260','주공APT 204동 512호','061)651-5992','019-651-0707','1988');
INSERT INTO STUDENT VALUES ('20071307', '김문영', 'Kim Moon-Young', 50, 1, 3,'야', '880418-2121623','540-170','380-2번 지','061)745-5485','019-4624-0460','1988');
INSERT INTO STUDENT VALUES ('20071405', '최차영', 'Choi Cha-Young', 50, 1, 2 ,'주', '881003-2581516','540-310','금사리 1427','061)745-6893',NULL,'1988');


#SUBJECT 입력
INSERT INTO SUBJECT VALUES ('4001', '데이터베이스 응용', 'Database Application', '2002');
INSERT INTO SUBJECT VALUES ('4002', '웹사이트 구축', 'Web Site Construction', '2003');
INSERT INTO SUBJECT VALUES ('4003', '소프트웨어 공학', 'Soteware Engoneering', '2003');
INSERT INTO SUBJECT VALUES ('4004', '웹 프로그래밍', 'Web Programming', '2002');
INSERT INTO SUBJECT VALUES ('4005', '컴퓨터구조', 'Computer Structure', '2001');
INSERT INTO SUBJECT VALUES ('4006', '정보처리실무', 'Information Process Practical business', '2001');
INSERT INTO SUBJECT VALUES ('4007', 'ULM', 'Unifieded Modeling Language', '2005');
INSERT INTO SUBJECT VALUES ('4008', '운영체제', 'Operating System', '2002');
INSERT INTO SUBJECT VALUES ('4009', '전자상거래 실무', 'Electrinic Commerce', '2003');
INSERT INTO SUBJECT VALUES ('4010', '윈도우즈 프로그래밍', 'Windows Programming', '1998');
INSERT INTO SUBJECT VALUES ('4011', '자바프로그래밍', 'Java Programming', '1999');
INSERT INTO SUBJECT VALUES ('4012', '네트워크 프로그래밍', 'Network Programming', '2005');
INSERT INTO SUBJECT VALUES ('4013', '컴포넌트 프로그래밍', 'Component Programming', '2004');


#PROFESSOR 입력
INSERT INTO PROFESSOR VALUES ('4001','정진용','Jung jin-yong','1995-09-01');
INSERT INTO PROFESSOR VALUES ('4002','나인섭','Na in-sub','2006-02-02');
INSERT INTO PROFESSOR VALUES ('4003','정창부','Jung chang-boo','2003-03-01');
INSERT INTO PROFESSOR VALUES ('4004','박상철','Park sang-chul','2000-01-15');
INSERT INTO PROFESSOR VALUES ('4005','정병열','Jung byeong-yeol','1998-03-01');
INSERT INTO PROFESSOR VALUES ('4006','고진광','Go jin-gwang','1988-03-01');
INSERT INTO PROFESSOR VALUES ('4007','김영식','Kim young-sik','1986-03-01');
INSERT INTO PROFESSOR VALUES ('4008','최우진','Choi woo-jin','1997-03-01');
INSERT INTO PROFESSOR VALUES ('4009','문창수','Moon chang-soo','1995-03-01');
INSERT INTO PROFESSOR VALUES ('5010','정종필','Jung jong-phil','1997-03-01');
INSERT INTO PROFESSOR VALUES ('5011','최종주','Choi jong-joo','1992-03-05');


#ATTEND 입력
INSERT INTO ATTEND VALUES ('20061011','2006',1,3,4001,'4002',3, 99,'Y','1','2006-03-05');
INSERT INTO ATTEND VALUES ('20061011','2006',1,4,4002,'4003',3, 95,'Y','1','2006-03-05');
INSERT INTO ATTEND VALUES ('20061011','2006',1,4,4003,'4004',3, 97,'Y','1','2006-03-05');
INSERT INTO ATTEND VALUES ('20061011','2006',1,4,4004,'4001',3, 98,'Y','1','2006-03-06');
INSERT INTO ATTEND VALUES ('20061011','2006',1,4,4005,'4007',3, 96,'Y','1','2006-03-05');
INSERT INTO ATTEND VALUES ('20061011','2006',1,4,4006,'4008',3, 93,'Y','1','2006-03-05');
INSERT INTO ATTEND VALUES ('20061011','2006',2,3,4007,'4009',3, 93,'Y','1','2006-09-03');
INSERT INTO ATTEND VALUES ('20061011','2006',2,4,4008,'4005',3, 92,'Y','1','2006-09-03');
INSERT INTO ATTEND VALUES ('20061011','2006',2,4,4009,'4006',3, 94,'Y','1','2006-09-02');
INSERT INTO ATTEND VALUES ('20061011','2006',2,4,4010,'4001',3, 90,'Y','1','2006-09-03');
INSERT INTO ATTEND VALUES ('20061011','2006',2,4,4011,'4002',3, 91,'Y','1','2006-09-03');
INSERT INTO ATTEND VALUES ('20061011','2006',2,4,4012,'4003',3, 92,'Y','1','2006-09-03');
INSERT INTO ATTEND VALUES ('20071300','2007',1,3,4001,'4002',3, 99,'Y','1','2007-03-05');
INSERT INTO ATTEND VALUES ('20071300','2007',1,4,4002,'4003',3, 95,'Y','1','2007-03-05');
INSERT INTO ATTEND VALUES ('20071300','2007',1,4,4003,'4004',3, 97,'Y','1','2007-03-05');
INSERT INTO ATTEND VALUES ('20071300','2007',1,4,4004,'4001',3, 98,'Y','1','2007-03-05');
INSERT INTO ATTEND VALUES ('20071300','2007',1,4,4005,'4007',3, 93,'Y','1','2007-03-05');
INSERT INTO ATTEND VALUES ('20071300','2007',1,4,4006,'4008',3, 95,'Y','1','2007-03-05');


#FEE 입력
INSERT INTO FEE VALUES ('20061011','2006',1, 500000,3000000,3500000,01,500000,3000000,'Y','2006-02-18');
INSERT INTO FEE VALUES ('20061011','2006',2, NULL,3000000,3000000,10,2500000,500000,'Y','2006-08-20');
INSERT INTO FEE VALUES ('20061011','2007',1, NULL,3000000,3000000,11,2000000,1000000,'Y','2007-02-18');
INSERT INTO FEE VALUES ('20061011','2007',2, NULL,3000000,3000000,21,800000,2200000,'Y','2007-08-10');
INSERT INTO FEE VALUES ('20001015','2000',1,500000,2500000,3000000,02,1000000,2000000,'Y','2000-02-01');
INSERT INTO FEE VALUES ('20001015','2000',2, NULL,2500000,2500000,10,2500000,0,'Y','2000-08-10');
INSERT INTO FEE VALUES ('20001015','2001',1, NULL,2800000,2800000,10,2500000,300000,'Y','2001-02-15');
INSERT INTO FEE VALUES ('20001015','2001',2, NULL,2800000,2800000,10,2500000,300000,'Y','2001-08-16');
INSERT INTO FEE VALUES ('20001015','2006',1, NULL,3000000,3000000,10,2500000,500000,'Y','2006-02-14');
INSERT INTO FEE VALUES ('20001015','2006',2, NULL,3000000,3000000,10,2500000,500000,'Y','2006-08-18');
INSERT INTO FEE VALUES ('20001015','2007',1, NULL,3000000,3000000,11,2000000,1000000,'Y','2007-02-10');
INSERT INTO FEE VALUES ('20001015','2007',2, NULL,3000000,3000000,10,2500000,500000,'Y','2007-08-19');
INSERT INTO FEE VALUES ('20071300','2007',1, 500000,3000000,3500000,01,500000,3000000,'Y','2007-02-18');
INSERT INTO FEE VALUES ('20071300','2007',2, NULL,3000000,3000000,11,2000000,1000000,'Y','2007-08-10');
INSERT INTO FEE VALUES ('20071001','2007',1, 500000,3000000,3500000,01,500000,3000000,'Y','2007-02-18');
INSERT INTO FEE VALUES ('20071001','2007',2, NULL,3000000,3000000,NULL,NULL,3000000,'Y','2007-08-10');
INSERT INTO FEE VALUES ('20071010','2007',1, 500000,3000000,3500000,01,500000,3000000,'Y','2007-02-18');
INSERT INTO FEE VALUES ('20071010','2007',2, NULL,3000000,3000000,NULL,NULL,3000000,'Y','2007-08-10');
INSERT INTO FEE VALUES ('20071022','2007',1, 500000,3000000,3500000,01,500000,3000000,'Y','2007-02-18');
INSERT INTO FEE VALUES ('20071022','2007',2, NULL,3000000,3000000,NULL,NULL,3000000,'Y','2007-08-10');
INSERT INTO FEE VALUES ('20071307','2007',1, 500000,3000000,3500000,01,500000,3000000,'Y','2007-02-18');
INSERT INTO FEE VALUES ('20071307','2007',2, NULL,3000000,3000000,NULL,NULL,3000000,'Y','2007-08-10');
INSERT INTO FEE VALUES ('20071405','2007',1, 500000,3000000,3500000,01,500000,3000000,'Y','2007-02-18');
INSERT INTO FEE VALUES ('20071405','2007',2, NULL,3000000,3000000,10,2500000,500000,'Y','2007-08-10');


#SCORE 입력
INSERT INTO SCORE VALUES ('20061011','2006',1,18,18,4.5,580,'Y','2006-08-10');
INSERT INTO SCORE VALUES ('20061011','2006',2,18,18,4.0,552,'Y','2007-01-11');
INSERT INTO SCORE VALUES ('20071300','2007',1,18,18,4.4,577,'Y','2007-08-09');
INSERT INTO SCORE VALUES ('20071307','2007',1,18,18,4.4,575,'Y','2007-08-09');
INSERT INTO SCORE VALUES ('20071405','2007',1,18,18,4.2,572,'Y','2007-08-09');
INSERT INTO SCORE VALUES ('20061011','2007',2,18,18,0,0,'N','2007-11-10');
INSERT INTO SCORE VALUES ('20061300','2007',2,18,18,0,0,'N','2007-11-10');
INSERT INTO SCORE VALUES ('20061307','2007',2,18,18,0,0,'N','2007-11-10');
INSERT INTO SCORE VALUES ('20061405','2007',2,18,18,0,0,'N','2007-11-10');

#CIRCLE 입력
INSERT INTO CIRCLE VALUES (1,'컴맹탈출','20061011','고혜진','0');
INSERT INTO CIRCLE VALUES (2,'컴맹탈출','20071300','유하나','1');
INSERT INTO CIRCLE VALUES (3,'컴맹탈출','20071307','김문영','2');
INSERT INTO CIRCLE VALUES (4,'Java길라잡이','20071001','장수인','2');
INSERT INTO CIRCLE VALUES (5,'Java길라잡이','20041007','정인정','1');
INSERT INTO CIRCLE VALUES (6,'Java길라잡이','20001015','박도준','0');
INSERT INTO CIRCLE VALUES (7,'PHP길라잡이','20001021','이상길','0');
