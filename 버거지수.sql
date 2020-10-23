도시발전지수 : 시도 시군구별 (KFC+맥도날드 + 버거킹) / 롯데리아
도시발전지수가 높은 시도 시군구별로 데이터를 조회
순위  시도  시군구 버거지수(소수점 둘째자리까지만)
    서울시 강남구 5.23
    서울시 서초구 5.11

SELECT * FROM FASTFOOD;

SELECT aa.si AS si, aa.sigun AS sigun, ROUND(aa.ss/aa.cc,2) AS ran
    FROM
        (SELECT A.sido AS si,A.sigungu AS sigun, SUM(A.cnt) AS ss, B.cnt AS cc
        FROM  
            (SELECT sido, sigungu, gb ,COUNT(*) AS cnt
              FROM fastfood
              WHERE gb IN('맥도날드','KFC','버거킹')
              GROUP BY sido, sigungu, gb) A,
            (SELECT sido,sigungu, gb,COUNT(*) AS cnt
              FROM fastfood
              WHERE gb IN('롯데리아') 
              GROUP BY sido, sigungu, gb) B
        WHERE A.sido = B.sido AND A.sigungu = B.sigungu
        GROUP BY A.sido, A.sigungu, B.cnt) aa
ORDER BY ran DESC;
