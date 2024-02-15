CREATE DATABASE board;
USE board;

CREATE TABLE user (
	email VARCHAR(50) PRIMARY KEY,
	password VARCHAR(100) NOT NULL,
	nickname VARCHAR(20) UNIQUE NOT NULL,
	tel_number VARCHAR(15) UNIQUE NOT NULL,
	address TEXT NOT NULL,
	address_detail TEXT,
	profile_image TEXT,
	agreed_personal TINYINT NOT NULL
);
    
CREATE TABLE board (
   board_number INT AUTO_INCREMENT PRIMARY KEY,
   title VARCHAR(255) NOT NULL,
   contents TEXT NOT NULL,
   write_datetime DATETIME NOT NULL DEFAULT now(),
   favorite_count INT NOT NULL DEFAULT 0,
   comment_count INT NOT NULL DEFAULT 0,
   view_count INT NOT NULL DEFAULT 0,
   writer_email VARCHAR(50) NOT NULL,
   CONSTRAINT writer FOREIGN KEY (writer_email) REFERENCES user(email)
);

CREATE TABLE comment (
   comment_number INT PRIMARY KEY,
   contents TEXT NOT NULL,
   write_datetime DATETIME NOT NULL DEFAULT now(),
   user_email VARCHAR(50) NOT NULL,
   CONSTRAINT writer_comment FOREIGN KEY (user_email) REFERENCES user(email),
   board_number INt NOT NULL,
   CONSTRAINT board_comment FOREIGN KEY (board_number) REFERENCES board (board_number)
);

CREATE TABLE favorite (
   user_email varchar(50),
   board_board_number INT,
   PRIMARY KEY (user_email, board_board_number),
   CONSTRAINT user_favorite FOREIGN KEY (user_email) REFERENCES user(email),
   CONSTRAINT board_favorite FOREIGN KEY (board_board_number) REFERENCES board(board_number)
);

CREATE TABLE board_image (
   sequence INT AUTO_INCREMENT PRIMARY KEY,
   board_number INT NOT NULL,
   image_url TEXT,
   CONSTRAINT board_image FOREIGN KEY (board_number) REFERENCES board(board_number)
);

CREATE TABLE search_log (
   sequence INT PRIMARY KEY,
   search_word TEXT NOT NULL,
   relation_word TEXT,
   relation TINYINT NOT NULL
);

-- 1번
INSERT INTO user (email, password, nickname, tel_number, address, address_detail, agreed_personal) VALUES ('email@email.com', 'P!sswOrd', 'rose', '010-1234-5678', '부산광역시 사하구', '낙동대로', true);

-- 2번
UPDATE user 
SET profile_image = 'https://cdn.onews.tv/news/photo/202103/62559_62563_456.jpg'
WHERE email = 'email@email.com';

-- 3번
INSERT INTO board (title, contents, writer_email) VALUES ('첫번째 게시물' , '반갑습니다. 처음뵙겠습니다.', 'email2@email.com');

-- 4번
INSERT INTO board (title, contents, writer_email) VALUES ('첫번째 게시물' , '반갑습니다. 처음뵙겠습니다.', 'email@email.com');

-- 5번
INSERT INTO board_image (board_number, image_url) VALUES (1, 'https://image.van-go.co.kr/place_main/2022/04/04/12217/035e1737735049018a2ed2964dda596c_750S.jpg');

-- 6번
INSERT INTO board (user_email, post_id)
VALUES ('email@email.com', 1);

-- 7번
SELECT 
    B.board_number,
    B.title,
    B.contents,
    B.view_count,
    B.comment_count,
    B.favorite_count,
    B.write_datetime,
    B.writer_email, 
    U.profile_image AS writer_profile_image,
    U.nickname AS writer_nickname
FROM user AS U INNER JOIN board AS B;

-- 8번
CREATE VIEW board_view AS 
SELECT 
    B.board_number,
    B.title,
    B.contents,
    B.view_count,
    B.comment_count,
    B.favorite_count,
    B.write_datetime,
    B.writer_email, 
    U.profile_image AS writer_profile_image,
    U.nickname AS writer_nickname
FROM user AS U INNER JOIN board AS B;

-- 9번
SELECT * FROM board_view WHERE title LIKE '%반갑%';
SELECT * FROM board_view WHERE contents  LIKE '%반갑%';

-- 10번
CREATE INDEX board_title_idx
ON board (title);