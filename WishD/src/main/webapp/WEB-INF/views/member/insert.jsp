<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
 
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
    <script src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.smooth-scroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/member/js/insert.js"></script>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style_temp.css">
	<!-- 로그인 외부 CSS 연결 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/member/css/insert.css">
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
                	<input class="form-control" placeholder="ID를 입력해주세요" name="id" id="id" type="text" autofocus>
					<label id="label1"></label>
                	
                	
<!--                 <input type="text" id="user_id" name="user_id" placeholder="아이디를 입력하세요"> -->
<!--                 <button type="button" class="check-btn" id="idcheck">중복 확인</button> -->
               
            </div>
            <div class="input-group">
                <p>비밀번호</p>
                <input type="password" id="password" name="user_pass" placeholder="비밀번호를 입력하세요">
                
            </div>
            <div class="input-group">
                <p>비밀번호 확인</p>
                <input type="password" id="password-confirm" name="user_passCheck" placeholder="비밀번호를 다시 입력하세요">
                
            </div>
            <div class="input-group">
                <p>이름</p>
                <input type="text" id="name" name="user_name" placeholder="이름을 입력하세요">
               
            </div>
            <div class="input-group">
                <p>이메일</p>
                <input type="email" id="email" name="user_email" placeholder="이메일 주소를 입력하세요" onblur="emailCheck()">
                <p id="check-result"></p>
                <button type="button" class="check-btn" id="email-check">중복 확인</button>
                
            </div>
            <div class="input-group" id="email-actions" style="display:none;">
                <button type="button" class="check-btn" id="send-code">전송하기</button>
            </div>
            <div class="input-group emailCode" id="verification-code-group" style="display:none;">
   			 	<input type="text" id="verification-code" placeholder="인증코드를 입력하세요">
   			 	<button type="button" class="check-btn" id="verification-code-check">인증하기</button>
                
            </div>
            <div class="input-group">
                <p>전화번호</p>
                <input type="tel" id="phone" name="user_phone" placeholder="번호를 입력해주세요">
             
            </div>
            <div class="agree-item">
                <input type="checkbox" id="privacy-policy">
                <label for="privacy-policy">(필수) 개인정보 수집에 동의합니다.</label>
             </div>
             <div class="agree-item">
                <input type="checkbox" id="marketing-consent">
                <label for="marketing-consent">(선택) 마케팅 활용 동의와 광고성 정보의 수신에 동의합니다.</label>
            </div>
            <button class="signup-btn" type="submit">회원가입</button>
            
        </form>
    </div>
</div>
    <!-- 별배경 -->
<div class="noite"></div>
<div class="constelacao"></div>
<div class="chuvaMeteoro"></div>
<script type="text/javascript">
$(function(){
	//id="id_lbl" 포커스 해제 했을때 이벤트 발생
	$('#id_lbl').blur(function(){
//			alert("포커스 해제");
//			alert($('#id_lbl').val());

//      id="idcheck" div태그 "포커스 해제" 글자 넣기,글자색 바꾸기
//			$('#idcheck').html("포커스 해제").css('color','red');

//			${pageContext.request.contextPath}/member/idCheck?id=kim

		$.ajax({
			//속성 여러개 사용
			url:'${pageContext.request.contextPath}/member/idCheck',
			data:{'id':$('#id_lbl').val()},
			success:function(result){
//					alert(result);
				if(result == 'iddup'){
					result = "아이디 중복";
					$('#idcheck').html(result).css('color','red');
				}else{
					result = "아이디 사용가능";
					$('#idcheck').html(result).css('color','green');
				}
				
			}
		});//ajax()
		
	});//blur()
	
});//시작()
	


</script>
   
</body>
</html>
