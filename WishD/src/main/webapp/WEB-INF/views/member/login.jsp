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
     <script src="${pageContext.request.contextPath}/resources/member/js/login.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style_temp.css">
	<!-- 로그인 외부 CSS 연결 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/member/css/login.css">
	
</head>
<body class="text-light">
<!-- Header -->
<jsp:include page="../include/heard.jsp"/>


  <!-- Main Content -->

   <div class="container1">
        <div class="login-box">
            <!-- 왼쪽 로그인 영역 -->
            <div class="login-left">
                <h2>Login</h2>
                <form id="loginForm" action="${pageContext.request.contextPath}/loginPro" method="post">
                    <input type="text" id="userId" name="user_id" placeholder="아이디를 입력하세요" required>
                    <input type="password" id="password" name="user_pass" placeholder="비밀번호를 입력하세요" required>
                    
                    <div class="remember-me">
                        <input type="checkbox" id="rememberMe">
                        <label for="rememberMe">아이디 기억하기</label>
                    </div>

                    <button type="submit" class="login-btn">로그인</button>

                    <!-- 아이디, 비밀번호찾기, 회원가입 탭 -->
                   <ul class="nav1 justify-content-center">
    			   	  <li class="nav2">
        				<a class="nav3" aria-current="page" href="${pageContext.request.contextPath}/idFind">아이디 찾기</a>
    				  </li>
    				  <li class="nav2">
        				<a class="nav3" aria-current="page" href="${pageContext.request.contextPath}/passFind">비밀번호 찾기</a>
    				  </li>
   					  <li class="nav2">
       					<a class="nav3" href="${pageContext.request.contextPath}/insert">회원가입</a>
    				  </li>
				  </ul>

                    <div id="errorMsg" class="error-msg">아이디와 비밀번호가 일치하지 않습니다.</div>
                    
                    <!-- 간편 로그인 버튼 -->
                    <div class="social-login">
                        <a href="#" class="social-btn">

                            <img src="${pageContext.request.contextPath}/resources/member/images/kakao.png" alt="카카오 로그인" class="social-image">
                        </a>
                        <a href="#" class="social-btn">
                            <img src="${pageContext.request.contextPath}/resources/member/images/naver.png" alt="네이버 로그인" class="social-image">
                        </a>
                    </div>

                </form>
            </div>

            <!-- 오른쪽 이미지 영역 -->
            <div class="login-right">
                <div class="image-container">
                    <img src="${pageContext.request.contextPath}/resources/member/images/WishD.png" alt="WishD 로고" class="promo-image">

                    <div class="image-text">WishD에 오신 것을 환영합니다!</div>
				</div> 
				 
                </div>
                
            </div>
           
        </div>
<!-- 별배경 -->
<div class="noite"></div>
<div class="constelacao"></div>
<div class="chuvaMeteoro"></div>

</body>
</html>
