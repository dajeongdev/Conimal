# MyBoard
![myboard_main](https://user-images.githubusercontent.com/61612976/117928981-41983780-b337-11eb-91a8-21f73aba9d9b.png)
<br />
<br />

## 개요
- **구성원 및 역할** : 백엔드 1, 프론트엔드 2, 디자이너 1 / 자바 백엔드
- **기간** : 2020.07.10 - 2020.09.21 -> 2021.05 리팩토링
- **주제** : 기본형 게시판 웹 사이트
- **개발 배경** : 서버 구축부터 데이터베이스 구성, 로그인, 회원가입, 정보수정까지 처음부터 끝까지 구현해보고 싶어 제작하게 되었습니다.
- **제작 목표** : Spring, MyBatis를 기반으로 한 기본형 게시판 및 로그인, 회원가입, 정보수정 기능을 제공합니다.
<br />

## 개발 환경
|개발 환경|설정|
|---|---|
|서버|Apache Tomcat 9.0|
|개발 언어|Java 1.8|
|Database|MySQL (AWS RDS)|
|개발 IDE|Spring Tool Suite 4|
|Java Framework|Spring 4.3.26|
|Persistent Framework|MyBatis 3|
|CSS Framework|Bootstrap 4.4.1|
|Javascript Library|jQuery 3.2.1|
|형상 관리|Github|
|빌드 도구|Gradle|
|협업 도구|Notion|
<br />

## 구현 및 담당 기능
* AWS RDS를 이용한 서버 구축
* DataGrip을 사용한 MySQL 데이터베이스 구성
* 이메일 인증을 통한 회원가입 및 비밀번호/이메일 변경
* 로그인 후 이용 가능한 이미지 게시판 및 댓글
* 제목, 본문, 작성자의 키워드를 통한 검색
<br />

### 메인 페이지
![myboard_main_after_login](https://user-images.githubusercontent.com/61612976/117929003-465ceb80-b337-11eb-97ab-71772b4a6561.png)
<br />

### 로그인
![myboard_login](https://user-images.githubusercontent.com/61612976/117929005-46f58200-b337-11eb-83fe-d56a109c10db.png)
<br />

### 회원가입
* 아이디, 비밀번호, 닉네임, 이메일을 입력해야 하며, 이메일을 통해 인증을 진행한다.
![myboard_join](https://user-images.githubusercontent.com/61612976/117929008-478e1880-b337-11eb-805b-1bfc5c582790.png)
![myboard_join_success](https://user-images.githubusercontent.com/61612976/117936412-c7b87c00-b33f-11eb-9930-91c7e2d4d85e.png)
![myboard_authenticate_email](https://user-images.githubusercontent.com/61612976/117933618-b457e180-b33c-11eb-8338-9ddade330c3b.png)
<br />

### 정보수정
* 아이디는 변경할 수 없으며, 이메일을 변경할 때는 재인증 절차를 진행한다.
![myboard_user_update](https://user-images.githubusercontent.com/61612976/118242410-447e5e00-b4d8-11eb-9689-329a2a1a996b.png)
<br />

### 게시판 글 목록
* 게시글의 목록을 볼 수 있으며, 페이징과 검색이 가능하다.
![myboard_list](https://user-images.githubusercontent.com/61612976/117929000-45c45500-b337-11eb-9873-1a83a1affd25.png)
![스크린샷 2021-05-12 오후 3 42 30](https://user-images.githubusercontent.com/61612976/117930228-b0c25b80-b338-11eb-8eba-d3fef5bb36b4.png)

<br />

### 게시판 글 작성  
* 제목과 내용은 필수이며, 이미지를 추가할 수 있다.
![myboard_insert_form](https://user-images.githubusercontent.com/61612976/117929002-465ceb80-b337-11eb-985d-4e65352ff639.png)
<br />

### 게시판 글 수정 및 삭제
* 글 작성한 본인만이 글을 수정하고 삭제할 수 있다.
![myboard_update](https://user-images.githubusercontent.com/61612976/117929009-478e1880-b337-11eb-96ca-e30234e93867.png)
![myboard_delete](https://user-images.githubusercontent.com/61612976/117930872-79a07a00-b339-11eb-9e54-fd558ee03b8b.png)
<br />

### 게시판 글 상세 보기
* 작성한 글과 댓글을 볼 수 있으며, 댓글 작성이 가능하고 글과 동일하게 댓글 작성자 본인만이 수정 및 삭제가 가능하다.
![myboard_detail_with_img](https://user-images.githubusercontent.com/61612976/117934132-49f37100-b33d-11eb-83df-2fe5d78a9754.png)
<br />

### 게시판 검색
* 제목, 본문, 작성자로 검색이 가능하며, 검색한 내용에 페이징도 가능하다.
![myboard_search](https://user-images.githubusercontent.com/61612976/117929001-465ceb80-b337-11eb-960c-90175d0792b8.png)
<br />
