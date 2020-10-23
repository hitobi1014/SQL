SELECT sido, sigungu,
        ROUND(
        (SUM(DECODE(gb, '맥도날드',1,0)) +
         SUM(DECODE(gb, '버거킹',1,0)) + 
         SUM(DECODE(gb, 'KFC',1,0))
         ) /
         DECODE(SUM(DECODE(gb,'롯데리아',1,0)),0,1, SUM(DECODE(gb,'롯데리아',1,0))),2) idx       
FROM fastfood
WHERE gb IN('KFC','맥도날드','버거킹','롯데리아')
GROUP BY sido, sigungu
ORDER BY idx DESC;

오라클 함수
1. SINGLE ROW FUNCTION ==> LENGTH, TRIM, UPPER
2. MULTI ROW FUNCTION ==> SUM, AVG, COUNT, MAX, MIN
CONNECT BY LEVEL : 임의로 행을 만들고 싶을때

--결과가 단건인 경우 테이블을 가상테이블로 사용 DUAL
'202010' ==> 31
'202009' ==> 30
'202002' ==> 29
SELECT LEVEL, LAST_DAY(TO_DATE('202002','YYYYMM'))
FROM DUAL
CONNECT BY LEVEL <30;

주간요일
일요일(1)부터 시작 ~ 토요일(7)
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