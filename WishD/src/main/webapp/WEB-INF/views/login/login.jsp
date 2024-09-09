<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
 
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>login</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style_temp.css">
	<!-- 로그인 외부 CSS 연결 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/login/login.css">
</head>
<jsp:include page="../include/heard.jsp"/>
<body class="text-light">
<!-- Header -->
<%--<jsp:include page="../include/heard.jsp"/>--%>


  <!-- Main Content -->

    <!-- <div class="container justify-content"> -->
    <section class="container justify-content login">
      <div class="row login_box">

        <!-- 왼쪽 로그인 영역 -->
        <div class="col left">
          <div class="contact">
            <form action="${pageContext.request.contextPath }/login/loginPro">
              <h3>Login</h3>


              <!-- 아이디 입력란 -->
              <p class="user">아이디</p>
              <input class="user_1" type="text" placeholder="아이디를 입력하세요." />

              <!-- 비밀번호 입련란 -->
              <p class="user">비밀번호</p>
              <input  class="user_1"type="text" placeholder="비밀번호를 입력하세요." />

              <!--  아이디 기억하기 체크박스 -->
              <div class="rememberId">
                <input type="checkbox" class="rememberId">
                <label>아이디 기억하기</label>
              </div>

              <!-- 아이디, 비밀번호찾기, 회원가입 탭 -->
              <ul class="nav justify-content-center">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#">아이디 찾기</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">비밀번호 찾기</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="${pageContext.request.contextPath}/insert/insert">회원가입</a>
                </li>

              <!--  로그인 버튼 -->
              <button class="submit">로그인</button>

              
            </form>
          


            <form>
              <!--  카카오 로그인 버튼 -->
              <div>
                <a id="kakao-login-btn" href="#" class="simpleLog">
                  <img
                    src="${pageContext.request.contextPath}/resources/login/images/kakaoLog.png"
                    alt="카카오간편로그인"
                  />
                </a>
                
             <!--  네이버 로그인 버튼 -->
               <a id="naver-login-btn" href="#" class="simpleLog">
                  <img
                    src="${pageContext.request.contextPath}/resources/login/images/naverLog.png"
                    alt="네이버간편로그인"
                  />
                </a>
                
        </div>

            </form>
          </div>
        </div>

        <!-- 오른쪽 홍보 영역 -->
        <div class="col right">
          <div class="right-text">
            <h2>WishD</h2>
            <h5>당신의 위한 맞춤 인재와 매칭해보세요!</h5>
          </div>
          <div class="right-inductor">
            <img src="">
          </div>
        </div>
      </div>
    </section>

    
        
<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>
