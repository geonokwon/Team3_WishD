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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/member/css/userFind.css">
</head>
<body class="text-light">
<!-- Header -->
<jsp:include page="../include/heard.jsp"/>

 <div class="navbar1">
        <a href="${pageContext.request.contextPath}/idFind" class="nav1-link active" data-target="find-id">아이디 찾기</a>
        <a href="${pageContext.request.contextPath}/passFind" class="nav1-link active" data-target="find-password">비밀번호 찾기</a>
    </div>
    
    <div class="form-container">
        <h2>비밀번호 찾기</h2>
        <form action="passResult.html" method="GET">
        	<div class="input-group">
            	<input type="text" id="username-pw" placeholder="아이디를 입력하세요">
       	 	</div>
        	<div class="input-group">
            	<input type="email" id="email-pw" placeholder="이메일 주소를 입력하세요">
       	 	</div>
        	<button type="submit" class="submit-btn">비밀번호 찾기</button>
       </form>  
    </div>
    

<!-- 별배경 -->
    <div class="noite"></div>
   	<div class="constelacao"></div>
   	<div class="chuvaMeteoro"></div>
    <script src="${pageContext.request.contextPath}/resources/member/js/passFind.js"></script>

 <!-- Footer -->
<%-- <jsp:include page="../include/footer.jsp"/> --%>

</body>
</html>