/* Formatted on 9/28/2021 4:17:58 PM (QP5 v5.371) */
/*
GOAIMMU - Immunization Information (GOAIMMU) page
GTVIMMU - Immunization Code Validation (GTVIMMU) page
GTVIMST - Immunization Status Code Validation 
*/

SELECT * FROM GTVIMST;

DESC GTVIMST;

SELECT * FROM GTVIMMU;

DESC GTVIMMU;

SELECT * FROM GORIMMU;

DESC GORIMMU;

--AIPImmunizationCode

SELECT gtvimmu_code           "immu_code",
       gtvimmu_desc           "immu_desc",
       gtvimmu_surrogate_id   "id"
  FROM gtvimmu
 WHERE gtvimmu_code = NVL ( :immu_code, gtvimmu_code);

 --AIPImmunizationStatus

SELECT gtvimst_code           "imst_code",
       gtvimst_desc           "imst_desc",
       gtvimst_surrogate_id   "id"
  FROM gtvimst
 WHERE gtvimst_code = NVL ( :imst_code, gtvimst_code);

--AIPImmunizationRecord

SELECT gorimmu_pidm            "pidm",
       gorimmu_immu_code       "immu_code",
       gtvimmu_desc            "immu_desc",
       gorimmu_imst_code       "imst_code",
       gtvimst_desc            "imst_desc",
       gorimmu_user_id         "user_id",
       gorimmu_activity_date   "activity_date",
       gorimmu_immu_date       "immunization_date",
       gorimmu_comment         "immunization_comment",
       gorimmu_surrogate_id    "id"
  FROM gorimmu
       JOIN gtvimmu ON gtvimmu_code = gorimmu_immu_code
       JOIN gtvimst ON gtvimst_code = gorimmu_imst_code
 WHERE     gorimmu_pidm = NVL ( :pidm, gorimmu_pidm)
       AND gorimmu_immu_code = NVL ( :immu_code, gorimmu_immu_code);

--comment is 4000 characters

DECLARE
  lv_user      VARCHAR2 (30) := SUBSTR (USER, 1, 30);
  lv_seq_no    NUMBER (2) := 0;
  lv_comment   VARCHAR2 (4000) := SUBSTR ( :immunization_comment, 1, 4000);
BEGIN
  SELECT NVL (MAX (gorimmu_seq_no), 0) + 1   new_seq_no
    INTO lv_seq_no
    FROM gorimmu
   WHERE gorimmu_pidm = :pidm AND gorimmu_immu_code = :immu_code;

  INSERT INTO gorimmu (gorimmu_pidm,
                       gorimmu_code,
                       gorimmu_seq_no,
                       gorimmu_user_id,
                       gorimmu_activity_date,
                       gorimmu_immu_date,
                       gorimmu_imst_code,
                       gorimmu_comment,
                       gorimmu_data_origin)
       VALUES ( :pidm,
               NVL ( :immu_code, 'COVID-19'),
               lv_seq_no,
               :user_id,
               NVL ( :activity_date, SYSDATE),
               NVL ( :immunization_date, NULL),
               :imst_code,
               lv_comment,
               lv_user);
END;