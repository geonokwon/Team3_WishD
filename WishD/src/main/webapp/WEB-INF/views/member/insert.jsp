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
        <h2>Sign up</h2>
        <form id="signup-form" action="${pageContext.request.contextPath}/insertPro" method="post">
            <div class="input-group">
                <p>아이디</p>
                <input type="text" id="username" name="user_id" placeholder="아이디를 입력하세요">
                <button type="button" class="check-btn" id="username-check">중복 확인</button>
                <div class="error-msg" id="username-error"></div>
            </div>
            <div class="input-group">
                <p>비밀번호</p>
                <input type="password" id="password" name="user_pass" placeholder="비밀번호를 입력하세요">
                <div class="error-msg" id="password-error"></div>
            </div>
            <div class="input-group">
                <p>비밀번호 확인</p>
                <input type="password" id="password-confirm" name="user_passCheck" placeholder="비밀번호를 다시 입력하세요">
                <div class="error-msg" id="password-confirm-error"></div>
            </div>
            <div class="input-group">
                <p>이름</p>
                <input type="text" id="name" name="user_name" placeholder="이름을 입력하세요">
                <div class="error-msg" id="name-error"></div>
            </div>
            <div class="input-group">
                <p>이메일</p>
                <input type="email" id="email" name="email" placeholder="이메일 주소를 입력하세요">
                <button type="button" class="check-btn" id="email-check">중복 확인</button>
                <div class="error-msg" id="email-error"></div>
            </div>
            <div class="input-group" id="email-actions" style="display:none;">
                <button type="button" class="check-btn" id="send-code">전송하기</button>
            </div>
            <div class="input-group emailCode" id="verification-code-group" style="display:none;">
   			 	<input type="text" id="verification-code" placeholder="인증코드를 입력하세요">
   			 	<button type="button" class="check-btn" id="verification-code-check">인증하기</button>
                <div class="error-msg" id="verification-code-error"></div>
            </div>
            <div class="input-group">
                <p>전화번호</p>
                <input type="tel" id="phone" name="user_phone" placeholder="번호를 입력해주세요">
                <div class="error-msg" id="phone-error"></div>
            </div>
            <div class="agree">
                <input type="checkbox" id="privacy-policy">
                <label for="privacy-policy">(필수) 개인정보 수집에 동의합니다.</label>
                <div class="error-msg" id="privacy-policy-error"></div>
                <input type="checkbox" id="marketing-consent">
                <label for="marketing-consent">(선택) 마케팅 활용 동의와 광고성 정보의 수신에 동의합니다.</label>
            </div>
            <button class="signup-btn" type="submit">회원가입</button>
            <div class="success-msg" id="success-msg"></div>
        </form>
    </div>
    <!-- backGround-star -->
    
</div>
    <div class="noite"></div>

    <div class="constelacao"></div>

    <div class="chuvaMeteoro"></div>

    <script src="${pageContext.request.contextPath}/resources/member/js/insert.js"></script>
   
  </body>
</html>
