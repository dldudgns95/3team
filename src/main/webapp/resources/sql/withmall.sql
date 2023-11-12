DROP SEQUENCE CP_SEQ;
DROP SEQUENCE ORDER_DETAIL_SEQ;
DROP SEQUENCE ORDER_SEQ;
DROP SEQUENCE CART_SEQ;
DROP SEQUENCE BOARD_ANSWER_SEQ;
DROP SEQUENCE BOARD_ASK_SEQ;
DROP SEQUENCE BOARD_FAQ_SEQ;
DROP SEQUENCE BOARD_ANNOUNCE_SEQ;
DROP SEQUENCE ZZIM_SEQ;
DROP SEQUENCE PRODUCT_CATEGORY_SEQ;
DROP SEQUENCE MEMBER_SEQ;

CREATE SEQUENCE MEMBER_SEQ NOCACHE;
CREATE SEQUENCE PRODUCT_CATEGORY_SEQ NOCACHE;
CREATE SEQUENCE ZZIM_SEQ NOCACHE;
CREATE SEQUENCE BOARD_ANNOUNCE_SEQ NOCACHE;
CREATE SEQUENCE BOARD_FAQ_SEQ NOCACHE;
CREATE SEQUENCE BOARD_ASK_SEQ NOCACHE;
CREATE SEQUENCE BOARD_ANSWER_SEQ NOCACHE;
CREATE SEQUENCE CART_SEQ NOCACHE;   
CREATE SEQUENCE ORDER_SEQ NOCACHE;
CREATE SEQUENCE ORDER_DETAIL_SEQ NOCACHE;
CREATE SEQUENCE CP_SEQ NOCACHE;

DROP TABLE CP_ISSUE;
DROP TABLE CP;
DROP TABLE ORDER_DETAIL;
DROP TABLE ORDER_T;
DROP TABLE CART;
DROP TABLE BOARD_ANSWER;
DROP TABLE BOARD_ASK;
DROP TABLE BOARD_FAQ;
DROP TABLE BOARD_ANNOUNCE;
DROP TABLE ZZIM;
DROP TABLE PRODUCT_IMAGE;
DROP TABLE PRODUCT;
DROP TABLE PRODUCT_CATEGORY;
DROP TABLE MEMBER_EXP;
DROP TABLE MEMBER_INACTIVE;
DROP TABLE MEMBER;

CREATE TABLE MEMBER (
    NUM              NUMBER                 NOT NULL,      
    NAME             VARCHAR2(30 BYTE)      NOT NULL,        
    PW               VARCHAR2(100 BYTE),       
    MOBILE           VARCHAR2(20 BYTE)      NOT NULL UNIQUE, 
    EMAIL            VARCHAR2(20 BYTE)      NOT NULL UNIQUE, 
    POSTCODE         VARCHAR2(20 BYTE)      NULL,        
    JIBUNADDRESS     VARCHAR2(90 BYTE)      NULL,   
    ROADADDRESS      VARCHAR2(90 BYTE)      NULL,  
    DETAILADDRESS    VARCHAR2(90 BYTE)      NULL,
    BIRTH            VARCHAR2(10 BYTE)      NULL,
    GENDER           NUMBER(1)              NULL,
    MDATE            DATE,                              
    AUTH             NUMBER(5)              NULL, -- 회원등급(0:일반,1:정지,2:탈퇴,9:관리) 기본설정은 0
    STATUS           NUMBER,                      -- 일반로그인0,네이버로그인1
    REG_DATE         DATE                   NOT NULL,
    CONSTRAINT PK_WM_MEMBER PRIMARY KEY(NUM)
);

CREATE TABLE MEMBER_INACTIVE (
    NUM              NUMBER                 NOT NULL,      
    NAME             VARCHAR2(30 BYTE)      NOT NULL,        
    PW               VARCHAR2(100 BYTE),       
    MOBILE           VARCHAR2(20 BYTE)      NOT NULL UNIQUE, 
    EMAIL            VARCHAR2(20 BYTE)      NOT NULL UNIQUE, 
    POSTCODE         VARCHAR2(20 BYTE)      NULL,        
    JIBUNADDRESS     VARCHAR2(90 BYTE)      NULL,   
    ROADADDRESS      VARCHAR2(90 BYTE)      NULL,  
    DETAILADDRESS    VARCHAR2(90 BYTE)      NULL,
    BIRTH            VARCHAR2(10 BYTE)      NULL,
    GENDER           NUMBER(1)              NULL,
    MDATE            DATE                   NULL,                              
    AUTH             NUMBER(5)              NULL,       -- 회원등급(0:일반,1:정지,2:탈퇴,9:관리) 기본설정은 0
    STATUS           NUMBER,                            -- 일반로그인0,네이버로그인1
    REG_DATE         DATE                   NOT NULL,
    STOP_DATE        DATE                   NOT NULL,
    CONSTRAINT PK_WM_MEMBER_INACTIVE PRIMARY KEY(NUM)
);


CREATE TABLE MEMBER_EXP (
    EMAIL          VARCHAR2(50 BYTE) NOT NULL UNIQUE,  -- 탈퇴한 회원 이메일
    REG_DATE       DATE,                               -- 가입일
    EXP_DATE       DATE                                -- 탈퇴일
);

CREATE TABLE PRODUCT_CATEGORY (
  CATEGORY_NUM       NUMBER(5) NOT NULL,
  CATEGORY_NAME      VARCHAR2(30) NOT NULL,
  CONSTRAINT PK_PRODUCT_CATEGORY PRIMARY KEY (CATEGORY_NUM)
);

-- 제품 상세
CREATE TABLE PRODUCT(
	PRDT_NUM        NUMBER(5)        NOT NULL,       -- 제품 식별 번호
	PRDT_NAME       VARCHAR2(60)     NOT NULL,	     -- 제품 이름
	PRDT_TITLE      VARCHAR2(100)    NOT NULL,	     -- 제품 타이틀
	PRDT_INFO       VARCHAR2(1000)   NOT NULL,       -- 제품 정보
	PRDT_REAL_PRICE NUMBER(7)        NOT NULL,       -- 제품 원가
	PRDT_STOCK      NUMBER(7)        NOT NULL,
    CATEGORY_NUM    NUMBER(5)        NOT NULL,
    PRDT_HIT        NUMBER(8)        DEFAULT 0,
 CONSTRAINT PK_PRODUCT PRIMARY KEY (PRDT_NUM),
 CONSTRAINT FK_PRODUCT_CATEGORY FOREIGN KEY (CATEGORY_NUM) REFERENCES PRODUCT_CATEGORY(CATEGORY_NUM)
);



-- 제품 이미지
CREATE TABLE PRODUCT_IMAGE(
    PRDT_NUM        NUMBER(5)            NOT NULL,        -- 제품 식별 번호
    IMAGE_PATH      VARCHAR2(100 BYTE)   NOT NULL,
    FILESYSTEM_NAME VARCHAR2(100 BYTE)   NOT NULL,
    
    CONSTRAINT FK_PRODUCT_IMAGE FOREIGN KEY(PRDT_NUM) REFERENCES PRODUCT(PRDT_NUM) ON DELETE CASCADE
    
);



-- 이런 식으로 원하는 수만큼 데이터를 삽입할 수 있습니다.


-- 찜 목록을 저장하기 위한 테이블
CREATE TABLE ZZIM (
	ZZIM_NUM    NUMBER(5) NOT NULL,          -- 찜 번호
	NUM         NUMBER   NOT NULL,           -- 회원 번호
	PRDT_NUM NUMBER(5) NOT NULL,             -- 제품 번호
	CONSTRAINT PK_ZZIM PRIMARY KEY(ZZIM_NUM),
	CONSTRAINT FK_MEMBER_ZZIM FOREIGN KEY(NUM) REFERENCES MEMBER(NUM) ON DELETE CASCADE,
	CONSTRAINT FK2_PRODUCT_ZZIM FOREIGN KEY(PRDT_NUM) REFERENCES PRODUCT(PRDT_NUM) ON DELETE CASCADE
);

-- 공지사항 정보를 저장하기 위한 테이블
CREATE TABLE BOARD_ANNOUNCE (
	ANN_NUM NUMBER NOT NULL,                            -- 공지사항 번호
	ANN_TITLE VARCHAR2(300) NOT NULL,                   -- 공지사항 제목
	ANN_CONTENT VARCHAR2(1000) NOT NULL,                -- 공지사항 내용
    ANN_FILE VARCHAR2(100) NULL,                        --공지사항첨부파일
	ANN_DATE DATE DEFAULT SYSDATE NOT NULL,             -- 등록일
	CONSTRAINT PK_BOARD_ANNOUNCE PRIMARY KEY (ANN_NUM)
);


-- FAQ 정보를 저장하기 위한 테이블
CREATE TABLE BOARD_FAQ (
	FAQ_NUM NUMBER,                         -- FAQ 번호
	FAQ_TITLE VARCHAR2(300) NOT NULL,       -- FAQ 제목
	FAQ_CONTENT VARCHAR2(3000) NOT NULL,    -- FAQ 내용
	FAQ_CATEGORY NUMBER(1) DEFAULT 1 NOT NULL, -- FAQ 카테고리
	FAQ_DATE DATE DEFAULT SYSDATE NOT NULL, -- FAQ 작성일
	CONSTRAINT PK_BOARD_FAQ PRIMARY KEY (FAQ_NUM)
);



-- 1:1 문의 게시판 정보를 저장하기 위한 테이블
CREATE TABLE BOARD_ASK (
	ASK_NUM NUMBER,                          -- 문의글 번호
	NUM     NUMBER NOT NULL,                 -- 문의자 번호
	ASK_TITLE VARCHAR2(100) NOT NULL,        -- 문의글 제목
	ASK_CONTENT VARCHAR2(1000) NOT NULL,     -- 문의글 내용
	ASK_FILE VARCHAR2(100) NULL,              -- 문의글 파일 첨부
	ASK_DATE DATE DEFAULT SYSDATE NOT NULL,  -- 문의글 작성 날짜
    AKS_STATE NUMBER(1) DEFAULT 0 NOT NULL,   -- 문의글 상태
	CONSTRAINT PK_BOARD_ASK PRIMARY KEY (ASK_NUM),
	CONSTRAINT FK_BOARD_ASK FOREIGN KEY (NUM) REFERENCES MEMBER(NUM) ON DELETE CASCADE
);


-- 1:1 문의 게시판 답변 정보를 저장하기 위한 테이블
CREATE TABLE BOARD_ANSWER (
	ASK_NUM NUMBER NOT NULL,                   -- 문의글 번호
    NUM     NUMBER NOT NULL,                   -- 문의자 번호
	ANSWER_NUM NUMBER(5),                      -- 답변 번호
	ANSWER_CONTENT VARCHAR2(1000) NOT NULL,    -- 답변 내용
	ANSWER_PHOTO VARCHAR2(100),                -- 답변 사진 첨부
	ANSWER_DATE DATE DEFAULT SYSDATE NOT NULL, -- 답변 작성 날짜
	CONSTRAINT PK_BOARD_ANSWER PRIMARY KEY (ANSWER_NUM),
	CONSTRAINT FK1_BOARD_ANSWER FOREIGN KEY (NUM) REFERENCES MEMBER (NUM) ON DELETE CASCADE,
    CONSTRAINT FK2_BOARD_ANSWER FOREIGN KEY (ASK_NUM) REFERENCES BOARD_ASK (ASK_NUM) ON DELETE CASCADE
);

-- 장바구니 정보를 저장하기 위한 테이블
CREATE TABLE CART (
	CART_NUM     NUMBER(20)   NOT NULL, -- 장바구니 번호
	PRDT_NUM     NUMBER       NOT NULL, -- 제품 번호
	NUM          NUMBER       NOT NULL, -- 회원 번호
	PRDT_QTY     NUMBER       NOT NULL, -- 제품 수량
	CONSTRAINT   PK_CART      PRIMARY KEY (CART_NUM),
	CONSTRAINT   FK_CART      FOREIGN KEY (PRDT_NUM) REFERENCES PRODUCT (PRDT_NUM) ON DELETE CASCADE,
	CONSTRAINT   FK2_CART     FOREIGN KEY (NUM)      REFERENCES MEMBER  (NUM)      ON DELETE CASCADE
);

-- 주문 정보를 저장하기 위한 테이블
CREATE TABLE ORDER_T (
	ORDER_NUM             NUMBER          NOT NULL,  -- 주문번호
	NUM                   NUMBER          NOT NULL,  -- 회원번호
	ORDER_TOTAL_PRICE     NUMBER(10)      NOT NULL,  -- 구매금액 : 각 주문번호 ORDER_PRICE의 합-쿠폰
	ORDER_STATUS          NUMBER(1)       NOT NULL,  -- 상품 주문 상태 (0: 주문 완료, 1: 배송중, 2: 배송완료)
	ORDER_DATE            DATE            NOT NULL,  -- 구매일
	ORDER_NOTICE          VARCHAR2(100),             -- 배송요청사항
	RECEIVER_NAME         VARCHAR2(20)    NOT NULL,  -- 수령자 이름
	RECEIVER_PHONE        VARCHAR2(20)    NOT NULL,  -- 수령자 휴대폰번호
	ORDERER_NAME          VARCHAR2(20)    NOT NULL,  -- 주문자 이름
	ORDERER_PHONE         VARCHAR2(20)    NOT NULL,  -- 주문자 휴대폰번호
	DELIVERY_METHOD       VARCHAR2(40)    NOT NULL,  -- 배송방법
	PAY_METHOD            VARCHAR2(200)   NOT NULL,  -- 결제방법
	CARD_NAME             VARCHAR2(50),              -- 카드 이름
	CARD_PAY              VARCHAR2(20),              -- 할부개월
	CONSTRAINT            PK_ORDER        PRIMARY KEY (ORDER_NUM),
	CONSTRAINT            FK_ORDER        FOREIGN KEY (NUM) REFERENCES MEMBER(NUM) ON DELETE SET NULL
);

-- 주문 상세 정보를 저장하기 위한 테이블
CREATE TABLE ORDER_DETAIL (
	ORDER_DETAIL_NUM     NUMBER       NOT NULL,   -- 구매상세 식별번호
	ORDER_NUM            NUMBER       NOT NULL,   -- 주문번호
	PRDT_NUM             NUMBER(5)    NOT NULL,   -- 제품번호
	ORDER_PRICE          NUMBER(7)    NOT NULL,   -- 제품구매총액 (상품개수*상품가격)
    ORDER_QTY            NUMBER(5)    NOT NULL,   -- 제품구매개수
	CONSTRAINT           PK_ORDER_DETAIL        PRIMARY KEY (ORDER_DETAIL_NUM),
	CONSTRAINT           FK_ORDER_DETAIL        FOREIGN KEY (ORDER_NUM)         REFERENCES ORDER_T (ORDER_NUM)     ON DELETE CASCADE,
	CONSTRAINT           FK2_ORDER_DETAIL       FOREIGN KEY (PRDT_NUM)          REFERENCES PRODUCT (PRDT_NUM) ON DELETE SET NULL
);  

--쿠폰 정보
CREATE TABLE CP (
  CP_NUM          NUMBER           NOT NULL,     -- 쿠폰 번호
  CP_NAME         VARCHAR2(50)     NOT NULL,     -- 쿠폰 이름
  CP_INFO         VARCHAR2(100)    NOT NULL,     -- 쿠폰 정보
  CP_PRICE        NUMBER(7)        NOT NULL,     -- 쿠폰 가격
  CP_MIN          NUMBER(7)        NOT NULL,     -- 쿠폰 최소주문가격
  START_AT        DATE             NOT NULL,     -- 쿠폰 시작일
  END_AT          DATE             NOT NULL,     -- 쿠폰 만료일

 CONSTRAINT PK_CP PRIMARY KEY (CP_NUM)
);



-- 쿠폰 발급 내역
CREATE TABLE CP_ISSUE (
  NUM     NUMBER NOT NULL,
  CP_NUM  NUMBER NOT NULL,
  CP_USE  NUMBER NOT NULL,    -- (1:미사용, 2: 사용)
  
  CONSTRAINT FK_CP_ISSUE FOREIGN KEY (NUM) REFERENCES MEMBER(NUM) ON DELETE CASCADE,
  CONSTRAINT FK2_CP_ISSUE FOREIGN KEY (CP_NUM) REFERENCES CP(CP_NUM) ON DELETE CASCADE
   
);

-- 제품 카테고리 삽입 쿼리
INSERT INTO PRODUCT_CATEGORY(CATEGORY_NUM, CATEGORY_NAME) VALUES (PRODUCT_CATEGORY_SEQ.NEXTVAL, '상의');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NUM, CATEGORY_NAME) VALUES (PRODUCT_CATEGORY_SEQ.NEXTVAL, '하의');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NUM, CATEGORY_NAME) VALUES (PRODUCT_CATEGORY_SEQ.NEXTVAL, '아우터');
INSERT INTO PRODUCT_CATEGORY (CATEGORY_NUM, CATEGORY_NAME) VALUES (PRODUCT_CATEGORY_SEQ.NEXTVAL, '기타');

-- 제품 상세 삽입 쿼리
-- 상의
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (1, '상의1', '상의1 타이틀', '상의1 정보', 50000, 10, 1, 55);
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (2, '상의2', '상의2 타이틀', '상의2 정보', 55000, 25, 1, 23);
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (3, '상의3', '상의3 타이틀', '상의3 정보', 60000, 30, 1, 36);
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (4, '상의4', '상의4 타이틀', '상의4 정보', 65000, 40, 1, 17);
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (5, '상의5', '상의5 타이틀', '상의5 정보', 70000, 0, 1, 313);

-- 하의
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (6, '하의1', '하의1 타이틀', '하의1 정보', 55000, 8, 2, 11);
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (7, '하의2', '하의2 타이틀', '하의2 정보', 35000, 15, 2, 33);
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (8, '하의3', '하의3 타이틀', '하의3 정보', 38000, 56, 2, 22);
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (9, '하의4', '하의4 타이틀', '하의4 정보', 62000, 1, 2, 44);
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (10, '하의5', '하의5 타이틀', '하의5 정보', 51000, 3, 2, 66);

-- 아우터
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (11, '아우터1', '아우터1 타이틀', '아우터1 정보', 70000, 8, 3, 11);
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (12, '아우터2', '아우터2 타이틀', '아우터2 정보', 150000, 5, 3, 321);
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (13, '아우터3', '아우터3 타이틀', '아우터3 정보', 97000, 2, 3, 346);
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (14, '아우터4', '아우터4 타이틀', '아우터4 정보', 40000, 10, 3, 863);
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (15, '아우터5', '아우터5 타이틀', '아우터5 정보', 71000, 2, 3, 754);

-- 기타
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (16, '기타1', '기타1 타이틀', '기타1 정보', 10000, 5, 4, 11);
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (17, '기타2', '기타2 타이틀', '기타2 정보', 17000, 3, 4, 911);
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (18, '기타3', '기타3 타이틀', '기타3 정보', 34000, 2, 4, 161);
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (19, '기타4', '기타4 타이틀', '기타4 정보', 31500, 0, 4, 131);
INSERT INTO PRODUCT (PRDT_NUM, PRDT_NAME, PRDT_TITLE, PRDT_INFO, PRDT_REAL_PRICE, PRDT_STOCK, CATEGORY_NUM, PRDT_HIT)
VALUES (20, '기타5', '기타5 타이틀', '기타5 정보', 76000, 7, 4, 112);


-- PRODUCT_IMAGE 테이블에 데이터 삽입
-- 상의
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (1, 'withmall/resources/images/top', 't1.jpg');
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (2, 'withmall/resources/images/top', 't2.jpg');
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (3, 'withmall/resources/images/top', 't3.jpg');
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (4, 'withmall/resources/images/top', 't4.jpg');
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (5, 'withmall/resources/images/top', 't5.jpg');
-- 하의
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (6, 'withmall/resources/images/bottom', 'b1.jpg');
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (7, 'withmall/resources/images/bottom', 'b2.jpg');
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (8, 'withmall/resources/images/bottom', 'b3.jpg');
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (9, 'withmall/resources/images/bottom', 'b4.jpg');
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (10, 'withmall/resources/images/bottom', 'b5.jpg');
-- 아우터
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (11, 'withmall/resources/images/outer', 'o1.jpg');
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (12, 'withmall/resources/images/outer', 'o2.jpg');
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (13, 'withmall/resources/images/outer', 'o3.jpg');
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (14, 'withmall/resources/images/outer', 'o4.jpg');
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (15, 'withmall/resources/images/outer', 'o5.jpg');
-- 기타
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (16, 'withmall/resources/images/etc', 'e1.jpg');
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (17, 'withmall/resources/images/etc', 'e2.jpg');
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (18, 'withmall/resources/images/etc', 'e3.jpg');
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (19, 'withmall/resources/images/etc', 'e4.jpg');
INSERT INTO PRODUCT_IMAGE (PRDT_NUM, IMAGE_PATH, FILESYSTEM_NAME) VALUES (20, 'withmall/resources/images/etc', 'e5.jpg');

COMMIT;



-- 회원 추가
INSERT INTO MEMBER(NUM, NAME, PW,MOBILE, EMAIL, POSTCODE, JIBUNADDRESS, ROADADDRESS, DETAILADDRESS, BIRTH, GENDER,MDATE, AUTH, STATUS, REG_DATE
	 ) VALUES(MEMBER_SEQ.NEXTVAL, 'mem1',  STANDARD_HASH('1111', 'SHA256'), '010-1111-1111', 'mem1@naver.com', '11244', '서울 금천구 가산디지털2로 95 3층 305호'
              , '가산동 550-7', '구디아카데미', TO_DATE('20001001', 'YYYYMMDD'), 1, TO_DATE('20231009', 'YYYYMMDD'), 0, 0, SYSDATE);

INSERT INTO MEMBER(NUM, NAME, PW,MOBILE, EMAIL, POSTCODE, JIBUNADDRESS, ROADADDRESS, DETAILADDRESS, BIRTH, GENDER,MDATE, AUTH, STATUS, REG_DATE
	 ) VALUES(MEMBER_SEQ.NEXTVAL, 'mem2',  STANDARD_HASH('2222', 'SHA256'), '010-2222-2222', 'mem2@naver.com', '11244', '서울 성동구 뚝섬로11길 21 2층'
              , '성수동2가 328-6', '포케올데이 성수점', TO_DATE('20001001', 'YYYYMMDD'), 1, TO_DATE('20231009', 'YYYYMMDD'), 0, 0, SYSDATE);

INSERT INTO MEMBER(NUM, NAME, PW,MOBILE, EMAIL, POSTCODE, JIBUNADDRESS, ROADADDRESS, DETAILADDRESS, BIRTH, GENDER,MDATE, AUTH, STATUS, REG_DATE
	 ) VALUES(MEMBER_SEQ.NEXTVAL, 'mem3',  STANDARD_HASH('3333', 'SHA256'), '010-3333-3333', 'mem3naver.com', '32489', '서울 광진구 아차산로 242 1층'
              , '서울 성동구 연무장길 45', '샐러디', TO_DATE('20101001', 'YYYYMMDD'), 1, TO_DATE('20231009', 'YYYYMMDD'), 0, 0, SYSDATE);

INSERT INTO MEMBER(NUM, NAME, PW,MOBILE, EMAIL, POSTCODE, JIBUNADDRESS, ROADADDRESS, DETAILADDRESS, BIRTH, GENDER,MDATE, AUTH, STATUS, REG_DATE
	 ) VALUES(MEMBER_SEQ.NEXTVAL, 'mem4',  STANDARD_HASH('4444', 'SHA256'), '010-4444-4444', 'mem4@naver.com', '29393', '서울 금천구 가산디지털2로 95 3층 309호'
              , '서울 성동구 왕십리로4길 13', '햄버거집', TO_DATE('20021001', 'YYYYMMDD'), 1, TO_DATE('20231009', 'YYYYMMDD'), 0, 0, SYSDATE);

INSERT INTO MEMBER(NUM, NAME, PW,MOBILE, EMAIL, POSTCODE, JIBUNADDRESS, ROADADDRESS, DETAILADDRESS, BIRTH, GENDER,MDATE, AUTH, STATUS, REG_DATE
	 ) VALUES (MEMBER_SEQ.NEXTVAL, 'mem5',  STANDARD_HASH('5555', 'SHA256'), '010-5555-5555', 'mem5@naver.com', '08505', '경기 가평군 상면 삐삐키즈풀빌라 글램핑 풀카라반'
              , '임초리 199-3', '삐삐키즈풀빌라', TO_DATE('19921001', 'YYYYMMDD'), 1, TO_DATE('20231009', 'YYYYMMDD'), 0, 0, SYSDATE);
                                         
         
-- 휴면 회원
INSERT INTO MEMBER_INACTIVE(NUM, NAME, PW,MOBILE, EMAIL, POSTCODE, JIBUNADDRESS, ROADADDRESS, DETAILADDRESS, BIRTH, GENDER, MDATE, AUTH, STATUS, REG_DATE,STOP_DATE
	 ) VALUES(MEMBER_SEQ.NEXTVAL, 'mem6',  STANDARD_HASH('6666', 'SHA256'), '010-6666-6666', 'mem6@naver.com', '11244', '서울 금천구 가산디지털2로 95 3층 305호'
   , '가산동 550-9', '구디아카데미', TO_DATE('19921006', 'YYYYMMDD'), 1, TO_DATE('20231009', 'YYYYMMDD'), 0, 0, SYSDATE, TO_DATE('20190101', 'YYYYMMDD'));   


-- 관리자
INSERT INTO MEMBER(NUM, NAME, PW,MOBILE, EMAIL, POSTCODE, JIBUNADDRESS, ROADADDRESS, DETAILADDRESS, BIRTH, GENDER, MDATE, AUTH, STATUS, REG_DATE
	 ) VALUES(MEMBER_SEQ.NEXTVAL, 'mem7',  STANDARD_HASH('7777', 'SHA256'), '010-7777-7777', 'mem7@naver.com', '11244', '서울 금천구 디지털로 121 1층 104-1호'
              , '가산동 550-1', '샌디커피', TO_DATE('19991101', 'YYYYMMDD'), 2, TO_DATE('20231019', 'YYYYMMDD'), 9, 0, SYSDATE);

INSERT INTO MEMBER(NUM, NAME, PW,MOBILE, EMAIL, POSTCODE, JIBUNADDRESS, ROADADDRESS, DETAILADDRESS, BIRTH, GENDER, MDATE, AUTH, STATUS, REG_DATE
	 ) VALUES(MEMBER_SEQ.NEXTVAL, 'mem8',  STANDARD_HASH('8888', 'SHA256'), '010-8888-8888', 'mem8@naver.com', '24344', '서울 금천구 디지털로 121 103호  에이스가산타워'
              , '가산동 550-9', '매머드커피', TO_DATE('19931201', 'YYYYMMDD'), 2, TO_DATE('20231115', 'YYYYMMDD'), 9, 0, SYSDATE);
COMMIT;

-- 쿠폰 정보 테이블 삽입
INSERT INTO CP VALUES(CP_SEQ.NEXTVAL, '1000원 할인 쿠폰', '5000원이상 구매 시, 1000원 할인해드립니다!', 1000, 5000, SYSDATE, SYSDATE + 14);
INSERT INTO CP VALUES(CP_SEQ.NEXTVAL, '2000원 할인 쿠폰', '10000원이상 구매 시, 2000원 할인해드립니다!', 2000, 10000, SYSDATE, SYSDATE + 14);
INSERT INTO CP VALUES(CP_SEQ.NEXTVAL, '3000원 할인 쿠폰', '15000원이상 구매 시, 3000원 할인해드립니다!', 3000, 15000, SYSDATE, SYSDATE + 14);
INSERT INTO CP VALUES(CP_SEQ.NEXTVAL, '4000원 할인 쿠폰', '20000원이상 구매 시, 4000원 할인해드립니다!', 4000, 20000, SYSDATE, SYSDATE + 14);
COMMIT;
-- 쿠폰발급내역 테이블 삽입
INSERT INTO CP_ISSUE VALUES(1, 1, 1);
INSERT INTO CP_ISSUE VALUES(1, 2, 1);
INSERT INTO CP_ISSUE VALUES(1, 4, 2);
INSERT INTO CP_ISSUE VALUES(2, 3, 2);
INSERT INTO CP_ISSUE VALUES(2, 2, 2);
INSERT INTO CP_ISSUE VALUES(2, 4, 1);
INSERT INTO CP_ISSUE VALUES(3, 4, 1);
INSERT INTO CP_ISSUE VALUES(3, 3, 2);
INSERT INTO CP_ISSUE VALUES(4, 1, 1);
INSERT INTO CP_ISSUE VALUES(4, 2, 1);
INSERT INTO CP_ISSUE VALUES(4, 3, 1);
INSERT INTO CP_ISSUE VALUES(4, 4, 1);
COMMIT;

-- 찜하기 테이블 삽입
INSERT INTO ZZIM VALUES(ZZIM_SEQ.NEXTVAL, 1, 1);
INSERT INTO ZZIM VALUES(ZZIM_SEQ.NEXTVAL, 2, 1);
INSERT INTO ZZIM VALUES(ZZIM_SEQ.NEXTVAL, 3, 2);    
INSERT INTO ZZIM VALUES(ZZIM_SEQ.NEXTVAL, 4, 1);
INSERT INTO ZZIM VALUES(ZZIM_SEQ.NEXTVAL, 4, 2);
INSERT INTO ZZIM VALUES(ZZIM_SEQ.NEXTVAL, 3, 1);
COMMIT;
