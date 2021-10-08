/* Formatted on 10/8/2021 4:14:57 PM (QP5 v5.371) */
SET DEF OFF;

SET ESCAPE '\';

CREATE TABLE baninst1.zsrimst
(
  zsrimst_id           NUMBER GENERATED ALWAYS AS IDENTITY NOT NULL,
  zsrimst_imst_code    VARCHAR2 (2) NOT NULL,
  zsrimst_long_desc    VARCHAR2 (4000) NOT NULL
);

INSERT INTO baninst1.zsrimst (zsrimst_imst_code, zsrimst_long_desc)
       VALUES (
                'VC',
                'I am fully vaccinated, but have not yet uploaded proof of vaccination in Aggie Health. 
                 [A person is fully vaccinated two weeks after they received their final dose of a required and/or accepted vaccine (two doses for Comirnaty/Pfizer or Moderna; one for Johnson \& Johnson)]. I understand a univeristy may follow up with me regarding my vaccination status.
                 **Information for uploading my proof of vaccination can be found at <a href="https://aggiehealth.usu.edu">aggiehealth.usu.edu</a>');

INSERT INTO baninst1.zsrimst (zsrimst_imst_code, zsrimst_long_desc)
       VALUES (
                'PL',
                'I am not fully vaccinated, but I plan to be and will upload my proof of vaccination before Spring Semester starts on Monday, January 10, 2022. I understand that a university official will follow up with me regarding my vaccination status.  
                 **Information for vaccination clinics can be found at <a href="https://vaccine.usu.edu">vaccine.usu.edu</a>.');

INSERT INTO baninst1.zsrimst (zsrimst_imst_code, zsrimst_long_desc)
       VALUES (
                'XA',
                'I am under the age of 18 years old and will still be under 18 years old when Spring Semester starts on Monday, January 10, 2022 and because I am under the age of 18, I am claiming an exemption from USU''s vaccination requirement.');

INSERT INTO baninst1.zsrimst (zsrimst_imst_code, zsrimst_long_desc)
       VALUES (
                'NA',
                'During Spring Semester 2022, I will be attending courses fully online and reside outside the state of Utah and because I am attending courses <strong>fully online <em>and</em> reside outside the state of Utah</strong>, I am claiming an exemption from USU''s vaccination requirement.');

INSERT INTO baninst1.zsrimst (zsrimst_imst_code, zsrimst_long_desc)
       VALUES (
                'XM',
                'I am not fully vaccinated. I state that I am eligible for an exemption from USU''s vaccination requirement based on a <strong>medical reason</strong> provided under Utah Law.');

INSERT INTO baninst1.zsrimst (zsrimst_imst_code, zsrimst_long_desc)
       VALUES (
                'XR',
                'I am not fully vaccinated. I state that I am eligible for an exemption from USU''s vaccination requirement based on a <strong>religious belief</strong> provided under Utah Law.
                 Please provide an optional statement of religious beliefs in the comment box below');

INSERT INTO baninst1.zsrimst (zsrimst_imst_code, zsrimst_long_desc)
       VALUES (
                'XP',
                'I am not fully vaccinated. I state that I am eligible for an exemption from USU''s vaccination requirement based on a <strong>personal belief</strong> provided under Utah Law.
                 Please provide an optoinal statement of personal belief in the comment box below.');

SELECT * FROM BANINST1.ZSRIMST;