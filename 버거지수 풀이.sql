SELECT sido, sigungu,
        ROUND(
        (SUM(DECODE(gb, '�Ƶ�����',1,0)) +
         SUM(DECODE(gb, '����ŷ',1,0)) + 
         SUM(DECODE(gb, 'KFC',1,0))
         ) /
         DECODE(SUM(DECODE(gb,'�Ե�����',1,0)),0,1, SUM(DECODE(gb,'�Ե�����',1,0))),2) idx       
FROM fastfood
WHERE gb IN('KFC','�Ƶ�����','����ŷ','�Ե�����')
GROUP BY sido, sigungu
ORDER BY idx DESC;

����Ŭ �Լ�
1. SINGLE ROW FUNCTION ==> LENGTH, TRIM, UPPER
2. MULTI ROW FUNCTION ==> SUM, AVG, COUNT, MAX, MIN
CONNECT BY LEVEL : ���Ƿ� ���� ����� ������

--����� �ܰ��� ��� ���̺��� �������̺�� ��� DUAL
'202010' ==> 31
'202009' ==> 30
'202002' ==> 29
SELECT LEVEL, LAST_DAY(TO_DATE('202002','YYYYMM'))
FROM DUAL
CONNECT BY LEVEL <30;

�ְ�����
�Ͽ���(1)���� ���� ~ �����(7)
--, dt, d, 
SELECT DECODE(d,1,iw+1,iw),
    MIN(DECODE(d,1,dt)) s, MIN(DECODE(d,2,dt))m, MIN(DECODE(d,3,dt)) t,
    MIN(DECODE(d,4,dt)) w, MIN(DECODE(d,5,dt))th, MIN(DECODE(d,6,dt)) f, 
    MIN(DECODE(d,7,dt)) sat
FROM
(SELECT LEVEL -1 + TO_DATE(:yyyymm,'YYYYMM')dt,
        TO_CHAR(LEVEL -1 + TO_DATE(:yyyymm,'YYYYMM'),'D')d, 
        TO_CHAR(LEVEL -1 + TO_DATE(:yyyymm,'YYYYMM'),'iw')iw
FROM dual
CONNECT BY LEVEL <= TO_CHAR(LAST_DAY(TO_DATE(:yyyymm,'YYYYMM')),'DD'))
GROUP BY DECODE(d,1,iw+1,iw)
ORDER BY DECODE(d, 1, iw+1, iw);
SELECT * FROM SALES;

SELECT NVL(MIN(m1),0)m1, NVL(MIN(m2),0)m2, NVL(MIN(m3),0)m3,
       NVL(MIN(m4),0)m4, NVL(MIN(m5),0)m5, NVL(MIN(m6),0)m6
FROM
(SELECT DECODE(TO_CHAR(dt,'mm'),'01',sum(sales))M1,
                DECODE(TO_CHAR(dt,'mm'),'02',sum(sales))M2,
                DECODE(TO_CHAR(dt,'mm'),'03',sum(sales))M3,
                DECODE(TO_CHAR(dt,'mm'),'04',sum(sales))M4,
                DECODE(TO_CHAR(dt,'mm'),'05',sum(sales))M5,
                DECODE(TO_CHAR(dt,'mm'),'06',sum(sales))M6
FROM sales
GROUP BY TO_CHAR(dt,'mm')
ORDER BY TO_CHAR(dt,'mm'));

SELECT TO_CHAR(LEVEL - 1 + TO_DATE(dt,'YYYYMM'),'MM') m
FROM sales
CONNECT BY LEVEL <= TO_CHAR(LAST_DAY(TO_DATE(:yyyymm,'YYYYMM')),'DD');