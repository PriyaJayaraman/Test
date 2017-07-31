OPTIONS (DIRECT=TRUE,ERRORS=0,ROWS=10000,silent=feedback)
LOAD DATA
DISCARDMAX 999
TRUNCATE
INTO TABLE TEST_MRCH_STG
FIELDS TERMINATED BY '|~|' optionally enclosed by '"'
TRAILING NULLCOLS
(
        PLTFRM_CD         CONSTANT "TCC",
        MRCH_NO           POSITION(1:20)  "LTRIM(LTRIM(RTRIM(:MRCH_NO)),'0')",
        ADDR1             POSITION(61:100)     CHAR(40) "LTRIM(RTRIM(:ADDR1))",
        ADDR2             POSITION(101:140)    CHAR(40) "LTRIM(RTRIM(:ADDR2))",
        CTY               POSITION(141:180)    CHAR(40) "LTRIM(RTRIM(:CTY))",
        ST                POSITION(181:183)    CHAR(3) "LTRIM(RTRIM(:ST))",
        ZIP               POSITION(184:193)    CHAR(10) "LTRIM(RTRIM(:ZIP))",
        CNTRY             POSITION(194:196)    CHAR(3) "nvl(LTRIM(RTRIM(:CNTRY)),'USA')",
        CRE_DT             "TRUNC(SYSDATE)",
)
