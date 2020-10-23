���ù������� : �õ� �ñ����� (KFC+�Ƶ����� + ����ŷ) / �Ե�����
���ù��������� ���� �õ� �ñ������� �����͸� ��ȸ
����  �õ�  �ñ��� ��������(�Ҽ��� ��°�ڸ�������)
    ����� ������ 5.23
    ����� ���ʱ� 5.11

SELECT * FROM FASTFOOD;

SELECT aa.si AS si, aa.sigun AS sigun, ROUND(aa.ss/aa.cc,2) AS ran
    FROM
        (SELECT A.sido AS si,A.sigungu AS sigun, SUM(A.cnt) AS ss, B.cnt AS cc
        FROM  
            (SELECT sido, sigungu, gb ,COUNT(*) AS cnt
              FROM fastfood
              WHERE gb IN('�Ƶ�����','KFC','����ŷ')
              GROUP BY sido, sigungu, gb) A,
            (SELECT sido,sigungu, gb,COUNT(*) AS cnt
              FROM fastfood
              WHERE gb IN('�Ե�����') 
              GROUP BY sido, sigungu, gb) B
        WHERE A.sido = B.sido AND A.sigungu = B.sigungu
        GROUP BY A.sido, A.sigungu, B.cnt) aa
ORDER BY ran DESC;
