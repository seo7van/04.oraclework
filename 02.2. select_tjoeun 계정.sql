








-- 각 부서별 급여의 합계
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 각 부서별 사원의 수
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

SELECT DEPT_CODE, COUNT(*),SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 1;

-- 각 직급별 직원의 수와 급여의 합계를 조회
SELECT JOB_CODE,SUM(SALARY),COUNT(*)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY JOB_CODE;

-- 각 직급별 직원 수, 보너스를 받는 사원수, 급여 합, 평균급여, 최저급여, 최고급여
SELECT JOB_CODE,COUNT(BONUS),SUM(SALARY),CEIL(AVG(SALARY)),MIN(SALARY),MAX(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY 1;

-- GRDER BY 함수식 사용가능
SELECT DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여')성별,COUNT(*)인원수
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO,8,1);

-- GRDER BY절에 여러 컬럼 기술
SELECT DEPT_CODE,JOB_CODE, COUNT(*),SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE, JOB_CODE
ORDER BY DEPT_CODE;

--------------------------------------------------------------------------------
/*
    *HAVING 절 : 그룹에 대한 조건을 제시할 때 사용(주로 그룹함수식을 가지고 조건을 제시할 때 사용)
*/
-- 각 부서별 평균 급여 조회
SELECT DEPT_CODE, AVG(SALARTY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 각 부서별 평균 급여가 3백만원 이상힌 부서들만 조회
/*
    SELECT DEPT_CODE,AVG(SALARTY)
    FROM EMPLOYEE
    WHERE AVG(SALATY) >= 3000000
    GROUP BY DEPT_CODE; --오류 : 그룹함수에는 WHERE절을 쓸수가 없음
*/
SELECT DEPT_CODE,CEIL(AVG(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY) >= 3000000;

-- 문제
-- 1. 직급별 총 급여함(단, 직급별 급여합이 1000만원 이상인 직급만 조회), 직급코드, 급여함

-- 2. 부서별 보너스를 받지만 사원이 없는 부서만 부서코드를 조회
