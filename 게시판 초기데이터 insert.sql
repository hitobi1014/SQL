INSERT INTO 	MANGERS 	VALUES(	'admin',	'admin'	);
INSERT INTO 	MANGERS 	VALUES(	'cmj',	'cmj'	);
INSERT INTO 	MANGERS 	VALUES(	'super',	'super'	);

INSERT INTO 	USERS	VALUES(	'a001',	'김응대',	'a1234',	'대전 중구 중앙로',	'86',	'35269',	'2020-10-26'	);
INSERT INTO 	USERS	VALUES(	'b001',	'김안경',	'b1234',	'서울 서초구',	'46',	'35111',	'2020-10-26'	);
INSERT INTO 	USERS	VALUES(	'c001',	'사용자',	'c1234',	'부산 기장',	'66',	'30152',	'2020-10-26'	);
INSERT INTO 	USERS	VALUES(	'd001',	'고수',	'd1234',	'진주시',	'77',	'29410',	'2020-10-26'	);
INSERT INTO 	USERS	VALUES(	'e001',	'이파람',	'e1234',	'대구 달서구',	'89',	'13251',	'2020-10-26'	);

INSERT INTO 	NOTICE_GUBUN	VALUES(	'NT001',	'1',	'자유게시판'	);
INSERT INTO 	NOTICE_GUBUN	VALUES(	'NT002',	'2',	'FAQ'	);
INSERT INTO 	NOTICE_GUBUN	VALUES(	'NT003',	'3',	'질의게시판'	);

INSERT INTO 	MINI_NOTICE	VALUES(	1,	'NT001',	'a001',	1,	1,	'2020-10-26',	'초기데이터1',	'초기데이터1',	null	);
INSERT INTO 	MINI_NOTICE	VALUES(	2,	'NT001',	'b001',	1,	1,	'2020-10-26',	'답글내용1',	'답글입니다1',	1	);
INSERT INTO 	MINI_NOTICE	VALUES(	3,	'NT002',	'c001',	1,	1,	'2020-10-26',	'초기데이터2',	'초기데이터2',	null	);
INSERT INTO 	MINI_NOTICE	VALUES(	4,	'NT002',	'd001',	1,	1,	'2020-10-26',	'답글내용2',	'답글입니다2',	3	);
INSERT INTO 	MINI_NOTICE	VALUES(	5,	'NT003',	'e001',	1,	1,	'2020-10-26',	'로그인,,',	'문의합니다',	null	);

INSERT INTO 	NT_REPLY	VALUES(	1,	1,	1,	'2020-10-26',	'댓글 초기데이터',	'b001'	);
INSERT INTO 	NT_REPLY	VALUES(	2,	2,	1,	'2020-10-26',	'댓글 초기데이터',	'c001'	);
INSERT INTO 	NT_REPLY	VALUES(	3,	3,	1,	'2020-10-26',	'댓글 초기데이터',	'd001'	);
INSERT INTO 	NT_REPLY	VALUES(	4,	4,	1,	'2020-10-26',	'댓글 초기데이터',	'e001'	);
INSERT INTO 	NT_REPLY	VALUES(	5,	5,	1,	'2020-10-26',	'댓글 초기데이터',	'a001'	);

commit;


