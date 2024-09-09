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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/member/css/idFind.css">
</head>
<body class="text-light">
<!-- Header -->
<jsp:include page="../include/heard.jsp"/>


<div class="find-container">
        <div class="find-box">
            <h2>아이디 찾기</h2>
            <form id="find-id-form">
                <div class="input-group">
                    <input type="email" id="find-email" placeholder="이메일 주소">
                    <div class="error-msg" id="find-email-error"></div>
                </div>
                <button class="find-btn" type="submit">아이디 찾기</button>
                <div class="success-msg" id="find-id-success"></div>
            </form>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/member/js/idFind.js"></script>
    
<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>