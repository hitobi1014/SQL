계층쿼리 : 행과 관련된 다른행을 찾아가는 쿼리
START WITH 시작점 고르기 : 시작점이 하나일 필요는 없음, 여러개가 선택되는 조건이면 여러개를 하나씩 순차적으로 처리
CONNECT BY 연결조건 : 행과 다른행을 어떤 조건으로 찾아갈지
PRIOR : 현재 읽고 있는 행

SELECT deptcd,LPAD(' ',(LEVEL-1)*4) || deptnm,LEVEL
FROM dept_h
START WITH deptcd = 'dept0_01'
CONNECT BY p_deptcd = PRIOR deptcd;

상향식 쿼리짜기
시작점 : 개발2팀
연결 : 자신의 상위부서와 연결
SELECT deptcd,LPAD(' ',(LEVEL-1)*4) || deptnm,LEVEL
FROM dept_h
START WITH deptcd = 'dept0_02_1'
CONNECT BY PRIOR p_deptcd = deptcd;

select * from dept_h;
s_id : id
ps_id : 부모노드아이디
value : 노드 값

SELECT LPAD(' ',(LEVEL-1)*4) || s_id, VALUE
FROM h_sum
START WITH s_id = '0'
CONNECT BY ps_id = PRIOR s_id;

계층쿼리에서 사용할 수 있는 함수 3가지
1. CONNECT_BY_ROOT(col) 최상위 노드의 col 정보를 반환하는 함수
2. SYS_CONNECT_BY_PATH(col,구분자) : 계층 순회과정에서 만난 행들의 col 정보를 구분자로 이어서 표현
3. CONNECT_BY_ISLEAF : 해당 노드가 자식이 없는 노드인지 확인
                        1 : 자식이 없는 leaf node
                        0 : 자식이 있는 중간 node 
                        
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