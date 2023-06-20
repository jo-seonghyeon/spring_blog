# 블로그 테이블 생성 구문
CREATE TABLE blog(
	blog_id int auto_increment primary key,
	writer varchar(16) not null,
    blog_title varchar(200) not null,
    blog_content varchar(4000) not null,
    published_at datetime default now(),
    updated_at datetime default now(),
    blog_count int default 0
);
# 더미데이터 입력용 구문
INSERT INTO blog VALUES
    (null, '1번유저', '1번제목', '1번본문', now(), now(), null),
    (null, '2번유저', '2번제목', '2번본문', now(), now(), null),
    (null, '3번유저', '3번제목', '3번본문', now(), now(), null);

## 댓글 테이블 설정
CREATE TABLE reply(
	reply_id int primary key auto_increment,
    blog_id int not null,
    reply_writer varchar(40) not null,
    reply_content varchar(200) not null,
    published_at datetime default now(),
    updated_at datetime default now()
);
# 외래키 설정
# blog_id에는 기존에 존재하는 글의 blog_id만 들어가야 한다.
alter table reply add constraint fk_reply foreign key (blog_id) references blog(blog_id);

# 더미 데이터 입력(테스트 DB에서만 사용)
INSERT INTO reply VALUES(null, 2, "댓글쓴사람", "1빠댓글이다~~", now(), now()),
(null, 2, "짹짹이", "짹짹짹짹짹짹짹짹", now(), now()),
(null, 2, "바둑이", "멍멍멍멍멍멍멍", now(), now()),
(null, 2, "야옹이", "야옹야옹야옹야옹", now(), now()),
(null, 3, "개발고수", "아 REST써버 개어렵당", now(), now());