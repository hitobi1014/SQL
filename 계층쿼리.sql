�������� : ��� ���õ� �ٸ����� ã�ư��� ����
START WITH ������ ���� : �������� �ϳ��� �ʿ�� ����, �������� ���õǴ� �����̸� �������� �ϳ��� ���������� ó��
CONNECT BY �������� : ��� �ٸ����� � �������� ã�ư���
PRIOR : ���� �а� �ִ� ��

SELECT deptcd,LPAD(' ',(LEVEL-1)*4) || deptnm,LEVEL
FROM dept_h
START WITH deptcd = 'dept0_01'
CONNECT BY p_deptcd = PRIOR deptcd;

����� ����¥��
������ : ����2��
���� : �ڽ��� �����μ��� ����
SELECT deptcd,LPAD(' ',(LEVEL-1)*4) || deptnm,LEVEL
FROM dept_h
START WITH deptcd = 'dept0_02_1'
CONNECT BY PRIOR p_deptcd = deptcd;

select * from dept_h;
s_id : id
ps_id : �θ�����̵�
value : ��� ��

SELECT LPAD(' ',(LEVEL-1)*4) || s_id, VALUE
FROM h_sum
START WITH s_id = '0'
CONNECT BY ps_id = PRIOR s_id;

������������ ����� �� �ִ� �Լ� 3����
1. CONNECT_BY_ROOT(col) �ֻ��� ����� col ������ ��ȯ�ϴ� �Լ�
2. SYS_CONNECT_BY_PATH(col,������) : ���� ��ȸ�������� ���� ����� col ������ �����ڷ� �̾ ǥ��
3. CONNECT_BY_ISLEAF : �ش� ��尡 �ڽ��� ���� ������� Ȯ��
                        1 : �ڽ��� ���� leaf node
                        0 : �ڽ��� �ִ� �߰� node 
                        
SELECT deptcd,LPAD(' ',(LEVEL-1)*4) || deptnm,LEVEL,
    CONNECT_BY_ROOT(deptnm) cbr,
    LTRIM(SYS_CONNECT_BY_PATH(deptnm,'-'),'-')scbp,
    CONNECT_BY_ISLEAF CBI
FROM dept_h
START WITH deptcd = 'dept0'
CONNECT BY p_deptcd = PRIOR deptcd;

SELECT *
FROM board_test;

SELECT seq, LPAD(' ',(LEVEL-1)*4)||title title
FROM board_test
START WITH parent_seq IS NULL
CONNECT BY parent_seq = PRIOR seq
ORDER SIBLINGS BY seq DESC;