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



 <!-- Main Content -->

    <!-- <div class="container justify-content"> -->
    <section class="container justify-content login">
      <div class="row login_box">

        <!-- 왼쪽 로그인 영역 -->

        
        <div class="col left">
         
          <div class="contact">
            <form action="#">
              <h3>Login</h3>


              <!-- 아이디 입력란 -->
              <p class="user">아이디</p>
              <input class="user_1" type="text" placeholder="아이디를 입력하세요." />

              <!-- 비밀번호 입련란 -->
              <p class="user">비밀번호</p>
              <input  class="user_1"type="text" placeholder="비밀번호를 입력하세요." />
           
           
              <!-- 아이디, 비밀번호찾기, 회원가입 탭 -->
              <ul class="nav justify-content-center">
                <li class="nav-item">
                  <a class="nav-link active" aria-current="page" href="#">아이디 찾기</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">비밀번호 찾기</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">회원가입</a>
                </li>

              <!--  로그인 버튼 -->
              <button class="submit">로그인</button>
             
            </form>

            
            <form>

              <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                <label class="form-check-label" for="flexCheckDefault">
                  Default checkbox
                </label>
              </div>


              <div>
              
              <input type="checkbox" id="idSaveCheck">
              <label for="remember">아이디 저장</label>
          
              </div>


              <!-- 	카카오 간편로그인 -->

              <a id="kakao-login-btn" href="#">
                <img
                  src="${pageContext.request.contextPath}/resources/images/kakao_log.png"
                  alt="카카오간편로그인"
                />
              </a>

              <!-- 	네이버 간편로그인 -->

              <a id="naver-login-btn" href="#">
                <img
                  src="${pageContext.request.contextPath}/resources/images/naver_log.png"
                  alt="네이버간편로그인"
                />
              </a>

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
            <img
              src="https://lh3.googleusercontent.com/fife/ABSRlIoGiXn2r0SBm7bjFHea6iCUOyY0N2SrvhNUT-orJfyGNRSMO2vfqar3R-xs5Z4xbeqYwrEMq2FXKGXm-l_H6QAlwCBk9uceKBfG-FjacfftM0WM_aoUC_oxRSXXYspQE3tCMHGvMBlb2K1NAdU6qWv3VAQAPdCo8VwTgdnyWv08CmeZ8hX_6Ty8FzetXYKnfXb0CTEFQOVF4p3R58LksVUd73FU6564OsrJt918LPEwqIPAPQ4dMgiH73sgLXnDndUDCdLSDHMSirr4uUaqbiWQq-X1SNdkh-3jzjhW4keeNt1TgQHSrzW3maYO3ryueQzYoMEhts8MP8HH5gs2NkCar9cr_guunglU7Zqaede4cLFhsCZWBLVHY4cKHgk8SzfH_0Rn3St2AQen9MaiT38L5QXsaq6zFMuGiT8M2Md50eS0JdRTdlWLJApbgAUqI3zltUXce-MaCrDtp_UiI6x3IR4fEZiCo0XDyoAesFjXZg9cIuSsLTiKkSAGzzledJU3crgSHjAIycQN2PH2_dBIa3ibAJLphqq6zLh0qiQn_dHh83ru2y7MgxRU85ithgjdIk3PgplREbW9_PLv5j9juYc1WXFNW9ML80UlTaC9D2rP3i80zESJJY56faKsA5GVCIFiUtc3EewSM_C0bkJSMiobIWiXFz7pMcadgZlweUdjBcjvaepHBe8wou0ZtDM9TKom0hs_nx_AKy0dnXGNWI1qftTjAg=w1920-h979-ft"
              alt=""
            />
          </div>
        </div>
      </div>
    </section>



<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>
