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
    
   <div class="signup-container">
      <h2>회원가입</h2>
      <form id="signup-form">
        <div class="form-group">
          <label for="username">아이디</label>
          <div class="input-with-button">
            <input
              type="text"
              id="username"
              name="username"
              class="form-input"
              placeholder="아이디를 입력하세요"
            />
            <button
              type="button"
              class="check-button"
              onclick="checkUsername()"
            >
              중복 확인
            </button>
          </div>
          <div id="username-check-result" class="check-result"></div>
        </div>

        <div class="form-group">
          <label for="password">비밀번호</label>
          <input
            type="password"
            id="password"
            name="password"
            class="form-input"
            placeholder="비밀번호를 입력하세요"
          />
        </div>

        <div class="form-group">
          <label for="confirm-password">비밀번호 재확인</label>
          <input
            type="password"
            id="confirm-password"
            name="confirm-password"
            class="form-input"
            placeholder="비밀번호를 다시 입력하세요"
          />
          <div id="password-check-result" class="check-result"></div>
        </div>

        <div class="form-group">
          <label for="name">이름</label>
          <input
            type="text"
            id="name"
            name="name"
            class="form-input"
            placeholder="이름을 입력하세요"
          />
        </div>

        <div class="form-group">
          <label for="email">이메일</label>
          <div class="input-with-button">
            <input
              type="email"
              id="email"
              name="email"
              class="form-input"
              placeholder="이메일을 입력하세요"
            />
            <button type="button" class="check-button" onclick="checkEmail()">
              중복 확인
            </button>
          </div>
          <div id="email-check-result" class="check-result"></div>
        </div>

        <div class="form-group">
          <label for="email-verification">이메일 인증 코드</label>
          <div class="input-with-button">
            <input
              type="text"
              id="email-verification"
              name="email-verification"
              class="form-input"
              placeholder="인증 코드를 입력하세요"
            />
            <button
              type="button"
              class="check-button"
              onclick="verifyEmailCode()"
            >
              인증 코드 확인
            </button>
          </div>
          <div id="email-verification-result" class="check-result"></div>
        </div>

        <div class="form-group">
          <label for="phone">전화번호</label>
          <input
            type="text"
            id="phone"
            name="phone"
            class="form-input"
            placeholder="전화번호를 입력하세요"
          />
        </div>

        <div class="form-group">
          <label for="birthdate">생년월일</label>
          <input
            type="date"
            id="birthdate"
            name="birthdate"
            class="form-input"
          />
        </div>

        <div class="form-group checkbox-group">
          <label>
            <input type="checkbox" id="agree-terms" name="agree-terms" />
            개인정보 처리방침에 동의합니다.
          </label>
          <div id="terms-check-result" class="check-result"></div>
        </div>

        <button type="submit" class="submit-button">회원가입</button>
      </form>
    </div>

    <script src="scripts.js"></script>
   
    <!-- Footer -->
    <jsp:include page="../include/footer.jsp" />
  </body>
</html>
