# Quiz-Website
## 📑 Description
- 동국대학교 관련 다양한 정보를 바탕으로 한 퀴즈 웹사이트

### Demo Website
- http://donggukquiz.herokuapp.com/

(현재 웹사이트가 휴면 상태일 경우 첫 로딩에 시간이 소요되므로 조금 기다려야 한다.)

## 📚 Stack
<div align=center>
  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
  <br>
  
  <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">
  <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
  <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black">
  <br>
  
  <img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
  <img src="https://img.shields.io/badge/maven-C71A36?style=for-the-badge&logo=ApacheMaven&logoColor=white">
  <img src="https://img.shields.io/badge/heroku-430098?style=for-the-badge&logo=heroku&logoColor=white">
  <br>
  
  <img src="https://img.shields.io/badge/Eclipse-2C2255?style=for-the-badge&logo=Eclipse&logoColor=white">
  <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
  <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
</div>

## ⚙️ Environment
### Server
- Tomcat 8.5
- JDK 1.8
### Client
- Google Chrome
- Mozilla Firefox

## 💡 Functionality
- 회원가입/로그인
  - 회원가입: ID, Password, Name 입력 (ID 중복 불가)
  - 로그인: ID, Password 입력
- 학습 모드
  - 문제 리스트 제공
  - 제목 선택 시 문제 풀이 가능
  - 선지 선택 시 답안 제공
- 퀴즈 모드
  - 랜덤 10문제 출제, 문제 당 10초
  - 남은 시간이 점수로 저장
  - 문제 풀이 종료 후 점수는 데이터베이스에 저장됨
- 랭킹
  - 퀴즈 모드 점수를 랭킹으로 제공
- 마이페이지
  - ID, Name, Score, Ranking 확인 가능
  - 회원 탈퇴 시 비밀번호 재입력 필요
