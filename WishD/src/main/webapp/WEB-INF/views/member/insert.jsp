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
      href="${pageContext.request.contextPath}/resources/member/css/insert.css"
    />
  </head>
  <body class="text-light">
    <!-- Header -->
    <jsp:include page="../include/heard.jsp" />

    <!-- Main Content -->
    
   <div class="signup-container">
        <div class="signup-box">
            <h2>회원가입</h2>
            <form id="signup-form">
                <div class="input-group">
                    <input type="text" id="username" placeholder="아이디">
                    <button type="button" class="check-btn" id="username-check">중복 확인</button>
                    <div class="error-msg" id="username-error"></div>
                </div>
                <div class="input-group">
                    <input type="password" id="password" placeholder="비밀번호">
                    <div class="error-msg" id="password-error"></div>
                </div>
                <div class="input-group">
                    <input type="password" id="password-confirm" placeholder="비밀번호 재확인">
                    <div class="error-msg" id="password-confirm-error"></div>
                </div>
                <div class="input-group">
                    <input type="text" id="name" placeholder="이름">
                    <div class="error-msg" id="name-error"></div>
                </div>
                <div class="input-group">
                    <input type="email" id="email" placeholder="이메일 주소">
                    <button type="button" class="check-btn" id="email-check">중복 확인</button>
                    <div class="error-msg" id="email-error"></div>
                </div>
                <div class="input-group">
                    <input type="text" id="verification-code" placeholder="이메일 인증 코드">
                    <button type="button" class="check-btn" id="verification-code-check">인증 코드 확인</button>
                    <div class="error-msg" id="verification-code-error"></div>
                </div>
                <div class="input-group">
                    <input type="tel" id="phone" placeholder="전화번호">
                    <div class="error-msg" id="phone-error"></div>
                </div>
                <div class="input-group">
                    <input type="date" id="dob" placeholder="생년월일">
                    <div class="error-msg" id="dob-error"></div>
                </div>
                <div class="agree">
                    <input type="checkbox" id="privacy-policy">
                    <label for="privacy-policy">개인정보 수집에 동의합니다.</label>
                    <div class="error-msg" id="privacy-policy-error"></div>
                </div>
                <button class="signup-btn" type="submit">회원가입</button>
                <div class="success-msg" id="success-msg"></div>
            </form>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/member/js/insert.js"></script>
    <!-- Footer -->
    <jsp:include page="../include/footer.jsp" />
  </body>
</html>
