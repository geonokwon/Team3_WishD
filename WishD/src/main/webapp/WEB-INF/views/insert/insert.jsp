<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>insert</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/style_temp.css"
    />
    <!-- 로그인 외부 CSS 연결 -->
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/login/insert.css"
    />
  </head>
  <body class="text-light">
    <!-- Header -->
    <jsp:include page="../include/heard.jsp" />

    <!-- Main Content -->
    
    <!-- Main Content -->

      <form action="doJoin" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this); return false;">
                                                                                              
        <h2>회원가입</h2>
        <div class="textForm">
          <input name="loginId" type="text" class="id" placeholder="아이디를 입력하세요.">
          </input>
          <input type="submit" class="btn_id" value="중복확인"/>
        </div>
        <div class="textForm">
          <input name="loginPw" type="password" class="pw" placeholder="비밀번호를 입력하세요.">
        </div>
         <div class="textForm">
          <input name="loginPwConfirm" type="password" class="pw" placeholder="비밀번호 확인">
        </div>
        <div class="textForm">
          <input name="name" type="password" class="name" placeholder="이름">
        </div>
         <div class="textForm">
          <input name="email" type="text" class="email" placeholder="이메일">
        </div>
        <div class="textForm">
          <input name="email2" type="text" class="email2" placeholder="이메일 인증코드를 입력하세요.">
        </div>
        <div class="textForm">
          <input name="cellphoneNo" type="number" class="cellphoneNo" placeholder="전화번호">
        </div>
        <input type="submit" class="btn" value="J O I N"/>
      </form>

    

    <!-- Footer -->
    <jsp:include page="../include/footer.jsp" />
  </body>
</html>
