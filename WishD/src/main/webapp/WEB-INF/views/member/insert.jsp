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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                <input type="text" id="user_id" name="user_id" placeholder="아이디를 입력하세요">
                <button type="button" class="check-btn" id="id_check">중복 확인</button>
                <!-- 결과출력 -->
                <div id="output"></div>
                <span id="usernameError" style="color: red; display: none;"></span> 
                
            </div>
            <div class="input-group">
                <p>비밀번호</p>
                <input type="password" id="password" name="user_pass" placeholder="비밀번호를 입력하세요">
                <span id="passwordError" style="color: red; display: none;">비밀번호는 특수문자를 포함하여 8~12글자여야 합니다.</span>
                
            </div>
            <div class="input-group">
                <p>비밀번호 확인</p>
                <input type="password" id="password-confirm" name="user_passCheck" placeholder="비밀번호를 다시 입력하세요">
                 <span id="passwordConfirmError" style="color: red; display: none;">비밀번호가 일치하지 않습니다.</span>
            </div>
            <div class="input-group">
                <p>이름</p>
                <input type="text" id="name" name="user_name" placeholder="이름을 입력하세요">
               
            </div>
            <div class="input-group">
            	<p>이메일</p>
    			<input type="text" id="email" name="email" placeholder="이메일주소를 입력하세요" required>
    			<button type="button" class="check-btn" id="email_check">중복 확인</button>
    			<button type="button" class="check-btn" id="send-code" style="display: none;">전송하기</button>
   				 <!-- 결과출력 -->
    			<div id="output1"></div>
			</div>
			 <div class="input-group">
            	<p>인증코드 입력</p>
    			<input type="text" id="verification-code" name="email" placeholder="인증코드를 입력하세요" required>
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
// 아이디 중복체크
$(function(){
	$('#id_check').click(function(){
		const userId = $('#user_id').val(); // 입력된 아이디 값 
		if (!userId){
			$('#output').html('아이디를 입력하세요').css('color', 'red');
			return;
		}
		$.ajax({
			url: `${pageContext.request.contextPath}/idCheck`, // 요청url
			type: 'GET',
			data:{id:userId}, // 쿼리스트링 방식으로 전달 
			success: function(result){
				if(result === 'iddup'){
					
					$('#output').html('이미 존재하는 아이디 입니다.').css('color', 'red');
					
				} else {
					
					$('#output').html('사용가능한 아이디 입니다.').css('color', 'green');
				}
			}
		});
		
	}); // blur()
	
}); // 시작
</script>
<script>
// 이메일 중복체크
$(function(){
	$('#email_check').click(function(){
		
		const userEmail = $('#email').val(); // 입력된 이메일값
		if (! userEmail){
			$('#output1').html('이메일 주소를 입력하세요').css('color', 'red');
			return;
		}
		$.ajax({
			url: `${pageContext.request.contextPath}/emailCheck`,  // 요청 URL에 이메일 추가
			type: 'GET',
			data: {id:userEmail}, 
			success: function(result){
				if(result === 'emailDup'){
					
					$('#output1').html('이미 존재하는 이메일입니다.').css('color', 'red');
                    $('#send-code').hide(); // '전송하기' 버튼 숨기기
                } else {
                    $('#output1').html('사용 가능한 이메일입니다.').css('color', 'green');
                    $('#email_check').hide(); // '중복 확인' 버튼 숨기기
                    $('#send-code').show(); // '전송하기' 버튼 보이기
					}
				},
				error: function() {
			        $('#output1').html('서버 오류 발생').css('color', 'red');
			    }
		});
		
	}); //blur()
	
}); //시작

</script>
   
</body>
</html>
