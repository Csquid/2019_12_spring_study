
create table member (
    member_idx int AUTO_INCREMENT primary key,
    id varchar(20) not null,
    pw varchar(20) not NULL,
    NAME VARCHAR(20) NOT NULL,
    alias VARCHAR(20) not NULL,
    gender varchar(20) not null,
    address varchar(20) not NULL,
    role varchar(20) not null default 'iron',
    LEVEL INT NOT NULL DEFAULT 1
);

/*

  creation_date: 생성된 날짜
  file_size: 파일 사이즈 
  original_file_name: 원래 이름  
  stored_file_name: 저장된 이름 
  file_path: 파일이 저장된 위치  
  delete_whether: 삭제 여부   --> 나중에 일괄 처리 한다.
  
  
  기록해야되는 필드
    member_idx
    file_size               --> 파일 사이즈
    original_file_name      --> 원래 파일 이름
    stored_file_name        --> 저장된 파일 이름
    file_path               --> 파일패치
    extension               --> 확장자
  
  자동으로 기록 되는 필드
    profile_img_idx
	 creation_date
	 delete_whether  
	 
*/

CREATE TABLE profile_img (
    profile_img_idx int AUTO_INCREMENT primary key,
    member_idx INT,
    FOREIGN KEY(member_idx) REFERENCES member(member_idx),
    creation_date DATE DEFAULT CURDATE(),
    file_size int NOT NULL,
    original_file_name VARCHAR(260) NOT NULL,    
    stored_file_name VARCHAR(260) NOT NULL,
    file_path VARCHAR(260) NOT NULL,
    delete_whether VARCHAR(1) DEFAULT 'N' NOT NULL,
    extension VARCHAR(20) NOT NULL 
);

DESC member;
DESC profile_img;

DROP TABLE profile_img;

/* 1번만 실행 */
INSERT INTO member(id, pw, NAME, alias, gender, address) VALUES('lake0019', '1234', 'hello', 'bonobono', 'woman', 'daegu');
INSERT INTO member(id, pw, name, role) VALUES('admin', '1234', 'jjy', 'admin');
INSERT INTO profile_img(member_idx, file_size, original_file_name, stored_file_name, file_path) VALUES(1, 145, 'original', '2019121914595814_original_1S3121KD-EFW-WAS', '/image/');

UPDATE profile_img SET delete_whether = 'Y' WHERE member_idx = 1;

SELECT * FROM member;
SELECT * FROM profile_img;
SELECT * FROM profile_img WHERE member_idx = 1 AND delete_whether = 'Y';

/* auto_increment 1로 초기화 시키는 구문 */
ALTER TABLE member AUTO_INCREMENT=1

ALTER TABLE profile_img  ADD extension VARCHAR(20) NOT NULL;
ALTER TABLE member ADD NAME VARCHAR(20) NOT NULL;
DELETE FROM member WHERE id = 'lake0019';
DELETE FROM member;
DELETE FROM profile_img;

COMMIT;

DROP TABLE member;
DROP TABLE profile_img;