INSERT INTO 	MANGERS 	VALUES(	'admin',	'admin'	);
INSERT INTO 	MANGERS 	VALUES(	'cmj',	'cmj'	);
INSERT INTO 	MANGERS 	VALUES(	'super',	'super'	);

INSERT INTO 	USERS	VALUES(	'a001',	'������',	'a1234',	'���� �߱� �߾ӷ�',	'86',	'35269',	'2020-10-26'	);
INSERT INTO 	USERS	VALUES(	'b001',	'��Ȱ�',	'b1234',	'���� ���ʱ�',	'46',	'35111',	'2020-10-26'	);
INSERT INTO 	USERS	VALUES(	'c001',	'�����',	'c1234',	'�λ� ����',	'66',	'30152',	'2020-10-26'	);
INSERT INTO 	USERS	VALUES(	'd001',	'���',	'd1234',	'���ֽ�',	'77',	'29410',	'2020-10-26'	);
INSERT INTO 	USERS	VALUES(	'e001',	'���Ķ�',	'e1234',	'�뱸 �޼���',	'89',	'13251',	'2020-10-26'	);

INSERT INTO 	NOTICE_GUBUN	VALUES(	'NT001',	'1',	'�����Խ���'	);
INSERT INTO 	NOTICE_GUBUN	VALUES(	'NT002',	'2',	'FAQ'	);
INSERT INTO 	NOTICE_GUBUN	VALUES(	'NT003',	'3',	'���ǰԽ���'	);

INSERT INTO 	MINI_NOTICE	VALUES(	1,	'NT001',	'a001',	1,	1,	'2020-10-26',	'�ʱⵥ����1',	'�ʱⵥ����1',	null	);
INSERT INTO 	MINI_NOTICE	VALUES(	2,	'NT001',	'b001',	1,	1,	'2020-10-26',	'��۳���1',	'����Դϴ�1',	1	);
INSERT INTO 	MINI_NOTICE	VALUES(	3,	'NT002',	'c001',	1,	1,	'2020-10-26',	'�ʱⵥ����2',	'�ʱⵥ����2',	null	);
INSERT INTO 	MINI_NOTICE	VALUES(	4,	'NT002',	'd001',	1,	1,	'2020-10-26',	'��۳���2',	'����Դϴ�2',	3	);
INSERT INTO 	MINI_NOTICE	VALUES(	5,	'NT003',	'e001',	1,	1,	'2020-10-26',	'�α���,,',	'�����մϴ�',	null	);

INSERT INTO 	NT_REPLY	VALUES(	1,	1,	1,	'2020-10-26',	'��� �ʱⵥ����',	'b001'	);
INSERT INTO 	NT_REPLY	VALUES(	2,	2,	1,	'2020-10-26',	'��� �ʱⵥ����',	'c001'	);
INSERT INTO 	NT_REPLY	VALUES(	3,	3,	1,	'2020-10-26',	'��� �ʱⵥ����',	'd001'	);
INSERT INTO 	NT_REPLY	VALUES(	4,	4,	1,	'2020-10-26',	'��� �ʱⵥ����',	'e001'	);
INSERT INTO 	NT_REPLY	VALUES(	5,	5,	1,	'2020-10-26',	'��� �ʱⵥ����',	'a001'	);

commit;


