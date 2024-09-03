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
	<link rel = "stylesheet" href = "${pageContext.request.contextPath}/resources/login.css">
</head>
<body class="text-light">
<!-- Header -->
<jsp:include page="../include/heard.jsp"/>

<!-- Main Content -->


<section class="login">
    <div class="login_box">
      <div class="left">
        <div class="contact">
          <form>
            <h3>로그인</h3>
            
<!--             아이디 입력란 -->
			아이디<br>
            <input type="text" placeholder="아이디를 입력하세요."> 
<!--             비밀번호 입력란 -->
			비밀번호<br>
            <input type="text" placeholder="비밀번호를 입력하세요.">
            
<!--             아이디, 비밀번호찾기, 회원가입 탭 -->
			<nav class="nav">
  				<a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/idSearch">아이디 찾기</a>
 				<a class="nav-link" href="${pageContext.request.contextPath}/passSearch">비밀번호 찾기</a>
 				<a class="nav-link" href="${pageContext.request.contextPath}/insert">회원가입</a>
 			</nav>
			
<!--  로그인 버튼 -->
            <button class="submit">로그인</button>
            
<!--  아이디 기억하기 체크박스 -->
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value="true" id="idRemember_1">
				<label class="form-check-label" for="idRemember_2">아이디 기억하기</label>
<!-- 				<input type="checkbox" id="checkbox-a" > -->
<!--   				<label for="label-a">아이디 기억하기</label> -->
 		    </div>
			
<!-- 	카카오 간편로그인 -->
		
			<a id="kakao-login-btn" href="#">
  				<img src="${pageContext.request.contextPath}}/resources/images/kakao_log.png"
   				 alt="카카오간편로그인" />
			</a>
<!-- 	네이버 간편로그인 -->
			<a id="naver-login-btn" href="#">
			<img src="./images/naver_log.png" width="100"
   				 alt="네이버간편로그인" />
			</a>
			
			
		   
          </form>
        </div>
      </div>
     
<!--      오른쪽 홍보 영역 -->
      <div class="right">
        <div class="right-text">
          <h2>WishD</h2>
          <h5>당신의 위한 맞춤 인재와 매칭해보세요!</h5>
        </div>
      </div>
    </div>
  </section>




<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>
