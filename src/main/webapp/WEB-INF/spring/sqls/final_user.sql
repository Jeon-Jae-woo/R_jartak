--파이널 프로젝트 유저 생성 system 으로 진행
CREATE USER FINAL_ADMIN IDENTIFIED BY FINALPASSWORD;
GRANT CONNECT, RESOURCE TO FINAL_ADMIN;





SELECT * FROM MEMBER_RANK;

INSERT INTO MEMBER_RANK
VALUES(1,'실버',100);

INSERT INTO MEMBER_RANK
VALUES(2,'골드',200);

INSERT INTO MEMBER_RANK
VALUES(3,'플래티넘',300);

INSERT INTO MEMBER_RANK
VALUES(4,'다이아',400);

INSERT INTO MEMBER_RANK
VALUES(0,'노멀',0);

SELECT * FROM MEMBER;
SELECT * FROM member_rank;

INSERT INTO MEMBER(EMAIL, NICKNAME, PASSWORD, GENDER, NAME, BIRTH, CREATED_AT, UPDATED_AT, ADDRESS, ADDRESS_DETAIL, AMOUNT, TX_AMOUNT, LEVEL_NO, STATUS_NO, RANK_NO, PHONE, ADDRESS_DETAIL2)
VALUES('user03@final.com','tester3','password','M','사용자3','20210901','20210901','20210901','주소','상세주소',0,0,3,1,1,'010-1234-5678','상세주소2');

INSERT INTO MEMBER
VALUES('user07@final.com','tester7','password','F','사용자7','20210902','20210902','20210902','주소','상세주소',0,0,3,1,1,'010-1234-5678','상세주소2');

INSERT INTO MEMBER(EMAIL, NICKNAME, PASSWORD, GENDER, NAME, BIRTH, CREATED_AT, UPDATED_AT, ADDRESS, ADDRESS_DETAIL, AMOUNT, TX_AMOUNT, LEVEL_NO, STATUS_NO, RANK_NO, PHONE, ADDRESS_DETAIL2)
VALUES('user05@final.com','tester5','password','M','사용자5','20210901','20210901','20210901','주소','상세주소',0,0,3,1,1,'010-1234-5678','상세주소2');

INSERT INTO MEMBER(EMAIL, NICKNAME, PASSWORD, GENDER, NAME, BIRTH, CREATED_AT, UPDATED_AT, ADDRESS, ADDRESS_DETAIL, AMOUNT, TX_AMOUNT, LEVEL_NO, STATUS_NO, RANK_NO, PHONE, ADDRESS_DETAIL2)
VALUES('user09@final.com','tester9','password','M','사용자9','20210901','20210901','20210901','주소','상세주소',0,0,3,1,1,'010-1234-5678','상세주소2');

INSERT INTO MEMBER(EMAIL, NICKNAME, PASSWORD, GENDER, NAME, BIRTH, CREATED_AT, UPDATED_AT, ADDRESS, ADDRESS_DETAIL, AMOUNT, TX_AMOUNT, LEVEL_NO, STATUS_NO, RANK_NO, PHONE, ADDRESS_DETAIL2)
VALUES('user08@final.com','tester8','password','M','사용자8','20210901','20210901','20210901','주소','상세주소',0,0,3,1,1,'010-1234-5678','상세주소2');

SELECT * FROM MEMBER;

SELECT * FROM MESSAGE;

commit;

SELECT * FROM bookmark;
SELECT * FROM AUCTION_TYPE;


SELECT * FROM AUCTION;



INSERT INTO interested_auctions
VALUES(1,3,'USER02');
INSERT INTO BOOKMARK
VALUES(2,4,'USER02');
INSERT INTO BOOKMARK
VALUES(3,5,'USER02');
INSERT INTO BOOKMARK
VALUES(4,6,'USER01');
INSERT INTO BOOKMARK
VALUES(5,7,'USER01');

SELECT * FROM BOOKMARK;
SELECT * FROM interested_auctions;


commit;

INSERT INTO AUCTION VALUES(AUCTION_SEQ.NEXTVAL,1, 'tester3',1, 'CLASSIC ST MAWES', '[시계]CLASSIC ST MAWES', '<p>클래식 컬렉션의 핵심 모델인 Classic St Mawes는 여러분의 손목을 완벽하게 장식해 주는 슬림한 시계입니다. 깔끔하고 심플한 원형 다이얼, 고전적인 가죽밴드 그리고 우아한 케이스가 시계를 완성해줍니다. 울트라씬(6mm) Daniel Wellington 시계는 모든 경우에 어울립니다. 공식적인 행사에 참석 하든지, 테니스 게임을 즐기든지 혹은 컨트리 클럽에서 화창한 날씨를 만끽하든지 Daniel Wellington이 여러분의 멋진 스타일을 마무리 해 드립니다. 그것 뿐만 아니라 교체 할 수 있는 스트랩으로 매일 매일 그 날의 분위기에 맞는 개성 있는 분위기의 시계를 착용 하실 수 있습니다.
</p>', 260000, 10000, SYSDATE, SYSDATE+6,0, '시계2.jfif', 260000, null);
INSERT INTO AUCTION VALUES(AUCTION_SEQ.NEXTVAL,1, 'tester3',1, '오메가시계 210.30.42.20.01.001 씨마스터 다이버 300 마스터 크로노미터', '[시계]오메가시계', '<p>클래식 컬렉션의 핵심 모델인 Classic St Mawes는 여러분의 손목을 완벽하게 장식해 주는 슬림한 시계입니다. 깔끔하고 심플한 원형 다이얼, 고전적인 가죽밴드 그리고 우아한 케이스가 시계를 완성해줍니다. 울트라씬(6mm) Daniel Wellington 시계는 모든 경우에 어울립니다. 공식적인 행사에 참석 하든지, 테니스 게임을 즐기든지 혹은 컨트리 클럽에서 화창한 날씨를 만끽하든지 Daniel Wellington이 여러분의 멋진 스타일을 마무리 해 드립니다. 그것 뿐만 아니라 교체 할 수 있는 스트랩으로 매일 매일 그 날의 분위기에 맞는 개성 있는 분위기의 시계를 착용 하실 수 있습니다.
</p>', 3000000, 200000, SYSDATE, SYSDATE+7,0, '시계.jfif', 4000000, null);
INSERT INTO AUCTION VALUES(AUCTION_SEQ.NEXTVAL,2, 'tester7',1, '남성 레더 스니커즈', '[에이스]남성 레더 스니커즈', 
'<p>웹(Web) 스트라이프 위에 벌 모양 골드 자수 디테일이 있는 에이스 로우탑 스니커즈. 벌 심볼: 1970년대 구찌 레디-투-웨어에서 처음 선보인 아카이브 코드.
제조자: 구찌
제조국: 이태리
수입자: 구찌코리아
화이트 레더와 힐에 각각 레드/그린 레더 디테일
그린/레드 웹(Web)
벌 모양의 골드 자수
러버 솔
일반 사이즈보다 5mm 작은 상품을 선택하시기 바랍니다.
15mm 힐
품질보증기준: A/S 보증기간 2년 (상품 이상 시 무상수선, 고객의 부주의로 판단되는 경우 유상수선)
AS 유선접수: 클라이언트서비스센터 02-3452-1921 / 이메일접수: 클라이언트서비스센터 clientservice.kr@gucci.com
</p>', 870000, 200000, SYSDATE, SYSDATE+7,0, '신발1.jfif', 870000, null);
INSERT INTO AUCTION VALUES(AUCTION_SEQ.NEXTVAL,2, 'tester3',1, '캐논 EOS 200D', '[카메라] 캐논 EOS 200D', 
'<p>카메라 경매합니다</p>', 600000, 20000, SYSDATE, SYSDATE+6,0, '카메라.jfif', 600000, null);


INSERT INTO AUCTION VALUES(AUCTION_SEQ.NEXTVAL,1, 'tester8',1, '뷰소닉 M1+G2', '[빔] 뷰소닉 M1+G2', 
'<p>경매</p>', 400000, 50000, SYSDATE, SYSDATE+6,0, '빔.jfif', 400000, null);


INSERT INTO AUCTION VALUES(AUCTION_SEQ.NEXTVAL,1, 'tester5',1, '콜트 AD810', '[기타] 콜트 AD810', 
'<p>품명 / 모델명	콜트 / AD810
크기	D바디
색상	.
재질	.
제품구성	악기 + 전용가방 + 쇼핑몰 최다사은품 무료증정!
동일모델의 출시연월	상품상세참조
제조자(사)	콜트
제조국	인도네시아
상품별 세부사양	D바디/무광/스프루스 상판,마호가니 측후판 /입문용 추천기타
품질보증기준	제품 구입일로부터 1년
AS 책임자와 전화번호	기타랜드 (010-4903-9303) (010-4903-9303)
</p>', 150000, 5000, SYSDATE, SYSDATE+6,0, '기타.jpg', 150000, null);

INSERT INTO AUCTION VALUES(AUCTION_SEQ.NEXTVAL,2, 'tester9',1, '고퍼우드 G230MC', '[기타] 고퍼우드 G230MC', 
'<p>품명 / 모델명	고퍼우드 / G230MC
크기	GA바디
색상	상품상세참조
재질	상품상세참조
제품구성	악기 + 전용가방 + 쇼핑몰 최다사은품 무료증정!
동일모델의 출시연월	상품상세참조
제조자(사)	고퍼우드
제조국	중국
상품별 세부사양	GA바디 무광 올 아프리칸 사펠리 탑솔리드 컷어웨이
품질보증기준	제품 구입일로부터 1년
AS 책임자와 전화번호	기타랜드 (010-4903-9303) (010-4903-9303)
</p>', 250000, 25000, SYSDATE, SYSDATE+6,0, '기타2.jpg', 250000, null);

INSERT INTO AUCTION VALUES(AUCTION_SEQ.NEXTVAL,1, 'tester8',1, '콜드플레이 Music Of The Spheres', '[LP]콜드플레이 한정판', 
'<p>제조사/원산지
Coldplay (Artist) Format: Vinyl/상품상세 참조
모델번호
Coldplay (Artist) Format: Vinyl
상품번호
LO1579612263_1579612264
상품상태
새상품
</p>', 50000, 3000, SYSDATE, SYSDATE+6,0, '음반1.jpg', 50000, null);

INSERT INTO AUCTION VALUES(AUCTION_SEQ.NEXTVAL,2, 'tester8',1, '폴딩박스 캠핑테이블 포켓세트', '[캠핑]캠퍼필드', 
'<p>경매합니다
</p>', 35000, 1000, SYSDATE, SYSDATE+6,0, '캠핑1.jpg', 35000, null);

INSERT INTO AUCTION VALUES(AUCTION_SEQ.NEXTVAL,1, 'tester8',1, '브리츠 BZ-T7750', '[음향가전]블루투스 오디오', 
'<p>제조사	브리츠	브랜드	브리츠
모델명	브리츠 BZ-T7750	원산지	중국산(브리츠)
제조일자	2019.09.16.
</p>', 130000, 5000, SYSDATE, SYSDATE+6,0, '음향가전.jpg', 130000, null);

COMMIT;

