<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
 
 <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>WishD | 회원가입</title>
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
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    <!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- Bootstrap JS (including Popper.js) -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
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
    	<div class="signup-box" style="max-width: 600px; margin: auto;">
        	<h2>Sign up</h2>
        	<form id="signup-form" action="${pageContext.request.contextPath}/insertPro" method="post">
        	
        	<!-- 아이디 -->
        	<div class="row justify-content-center align-items-center" >
        		<div class="col-md-7">
    				<label for="user_id" class="mb-1 mt-1 ms-2">아이디</label>
    					<div class="input-container">
    						<input 
    							type="text" 
    							class="form-control bg-dark mt-1" 
    							id="user_id" 
    							name="user_id" 
                				placeholder="아이디를 입력하세요"
                				autocomplete="off"
                				onblur="validateInput(this)"
                    			required
                			/>
               			<!-- 중복확인버튼 -->
               			<button type="button" id="id_check" class="btn btn-primary">중복확인</button>
               		</div>
                	<!-- 메세지 출력 -->
   					 <div class="invalid-feedback" id="output"></div>
    			</div>
  			</div>
        	
        	<!-- 비밀번호 -->
            <div class="row justify-content-center align-items-center" >
            	<div class="col-md-7">
    				<label for="password" class="mb-2 mt-3 ms-2">비밀번호</label>
    					<div class="input-container">
    						<input 
    							type="password" 
    							class="form-control bg-dark mt-1" 
    							id="password" 
    							name="user_pass" 
                				placeholder="비밀번호를 입력하세요"
                				autocomplete="off"
                				onblur="validateInput(this)"
                    			required
                			/>
                			
               	 	   	</div>
               	 	   	<!-- 에러메세지 -->
        				<div class="invalid-feedback" id="passwordError" style="display: none;">
            				비밀번호는 특수문자를 포함하여 8~12자의 영문 대/소문자, 숫자를 사용해 주세요.
            				
       	 				</div>
				  </div>
            </div>
            
			<!-- 비밀번호 확인 -->
            <div class="row justify-content-center align-items-center" >
            	<div class="col-md-7">
    				<label for="password-1" class="mb-2 mt-3 ms-2">비밀번호 확인</label>
    					<div class="input-container">
    						<input 
    							type="password" 
    							class="form-control bg-dark mt-1" 
    							id="password-1"
    							name="user_pass2"  
                				placeholder="비밀번호를 다시 입력하세요"
                				autocomplete="off"
                				onblur="validateInput(this)" 
                    			required  
                			/> 
               	 	   </div> 
               	 	   <!-- 에러메세지 -->
        				<div class="invalid-feedback" id="password-confirm" style="display: none;"></div>
				</div>
            </div>
			
			<!-- 이름 -->
            <div class="row justify-content-center align-items-center" >
            	<div class="col-md-7">
    				<label for="name" class="mb-2 mt-3 ms-2">이름</label>
    					<div class="input-container">
    						<input 
    							type="text" 
    							class="form-control bg-dark mt-1" 
    							id="name" 
    							name="user_name" 
                				placeholder="이름을 입력하세요"
                				autocomplete="off"
                				onblur="validateInput(this)"
                    			required
                			/>
               	 	   </div>
				 </div>
            </div>
			
			<!-- 이메일 -->
            <div class="row justify-content-center align-items-center" >
            	<div class="col-md-7">
    				<label for="email" class="mb-1 mt-1 ms-2">이메일</label>
    					<div class="input-container">
    						<input 
    							type="text" 
    							class="form-control bg-dark mt-1" 
    							id="email" 
    							name="email" 
                				placeholder="이메일주소를 입력하세요"
                				autocomplete="off"
                				onblur="validateInput(this)"
                    			required
                			/>
                			<!-- 중복확인버튼 -->
               				<button type="button" id="email_check" class="btn btn-primary">중복확인</button>
               				<button type="button" id="send-code" class="btn btn-primary" style="display: none;">전송하기</button>
               				</div>
               	 			<!-- 에러메세지 -->
               	 			<div class="invalid-feedback" id="output1" style="display: none;"></div>
               	</div>
			</div>
           
            <!-- 이메일 인증코드 -->
            <div class="row justify-content-center align-items-center" >
            	<div class="col-md-7">
    				<label for="code" class="mb-2 mt-3 ms-2">인증코드 입력</label>
    					<div class="input-container">
    						<input 
    							type="text" 
    							class="form-control bg-dark mt-1" 
    							id="code" 
    							name="emailCode" 
                				placeholder="인증코드를 입력하세요"
                				autocomplete="off"
                				onblur="validateInput(this)"
                    			required
                			/>
                		<!-- 인증하기버튼 -->
               			<button type="button" id="code-check" class="btn btn-primary">인증하기</button>
               	 	   </div>
					<!-- 에러메세지 -->
					<div id="mailValidate" class="invalid-feedback" style="color: red; display: none;"></div>
				</div>
            </div>
            
  			<!-- 전화번호 -->
            <div class="row justify-content-center align-items-center" >
            	<div class="col-md-7">
    				<label for="phone" class="mb-1 mt-1 ms-2">전화번호</label>
    					<div class="input-container">
    						<input 
    							type="text" 
    							class="form-control bg-dark mt-1" 
    							id="phone" 
    							name="user_phone" 
                				placeholder="번호를 입력하세요"
                				autocomplete="off"
                				onblur="validateInput(this)"
                    			required
                			/>
                		</div>
               	 		<!-- 에러메세지 -->	
                		<div class="invalid-feedback" id="phoneError"></div>
				</div>
            </div>
            <!-- 약관동의 체크박스 -->
            
            <div class="agree-item">
            	<label class="form-check-label" for="flexCheckChecked">
  					<input class="form-check-input" type="checkbox" id="flexCheckChecked">
    				(필수)개인정보 수집에 동의합니다.
  				</label>
			</div>
			<div class="agree-item">
				<label class="form-check-label" for="flexCheckDefault">
  					<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
    				(선택)마케팅 활용 동의와 광고성 정보의 수신에 동의합니다.
  				</label>
			</div>
			
			<button class="signup-btn" type="submit">
    			회원가입
			</button>
        	</form>
        	<!-- 폼 태그 끝 -->
    	</div>
	</div>
    <!-- 별배경 -->
<div class="noite"></div>
<div class="constelacao"></div>
<div class="chuvaMeteoro"></div>

<script type="text/javascript">
$(document).ready(function() {

    let emailCode; // 이메일 인증 코드
    let isCodeState = false; // 이메일 인증 여부
    
    // 아이디에 포커스
    $("#user_id").focus();

    // 비어있는 입력란의 경우 빨간 테두리 추가
    function validateInput(element) {
        const isEmpty = element.value.trim() === "";
        element.style.border = isEmpty ? "1px solid #ff0000ad" : "";
        return !isEmpty;
    }

    // 아이디 중복 체크
    $('#id_check').click(function() {
        const userId = $('#user_id').val().trim();

        if (!userId) {
            $('#user_id').css('border', '1px solid #ff0000ad');
            $('#output').hide();
            return;
        }

        $.ajax({
            url: `${pageContext.request.contextPath}/idCheck`,
            type: 'GET',
            data: { id: userId },
            success: function(result) {
                if (result === 'iddup') {
                    $('#output').html('이미 존재하는 아이디입니다.').css('color', 'red').show();
                    $('#user_id').css('border', '1px solid #ff0000ad');
                } else {
                    $('#output').html('사용 가능한 아이디입니다.').css('color', 'green').show();
                    $('#user_id').css('border', '');
                }
            },
            error: function() {
                $('#output').html('오류가 발생했습니다. 다시 시도해주세요.').css('color', 'red').show();
                $('#user_id').css('border', '1px solid #ff0000ad');
            }
        });
    });

    // 비밀번호 확인
    $('#password').blur(function() {
        const password = $(this).val();
      if (!password || password.length < 8 || password.length > 12 || !/[!@#$%^&*]/.test(password)) {
            $('#passwordError').show();
            $(this).css('border', '1px solid #ff0000ad');
        } else {
            $('#passwordError').hide();
            $(this).css('border', '');
        }
    });

        

 // 비밀번호 일치 확인
    $('#password-1').blur(function() {
        const password = $('#password').val();
        const passwordConfirm = $(this).val();

        if (!passwordConfirm) {
            // 비밀번호 확인란이 비어 있을 때
            $(this).css('border', '1px solid #ff0000ad');
            $('#password-confirm').text('비밀번호 확인란이 비어 있습니다.').show();
        } else if (password && passwordConfirm && password !== passwordConfirm) {
            // 비밀번호가 일치하지 않을 때
            $(this).css('border', '1px solid #ff0000ad');
            $('#password-confirm').text('비밀번호가 일치하지 않습니다.').show();
        } else {
            // 비밀번호가 일치하고 비어 있지 않을 때
            $(this).css('border', '');
            $('#password-confirm').hide();
        }
    });

	
 // 이름 입력 확인
    $('#name').blur(function() {
        const name = $(this).val().trim(); // 입력된 이름 값

        if (!name) {
            // 이름 입력란이 비어 있을 때
            $(this).css('border', '1px solid #ff0000ad'); // 빨간 테두리 추가
        } else {
            // 이름 입력란이 비어 있지 않을 때
            $(this).css('border', ''); // 테두리 초기화
        }
    });

 
 // 이메일 중복 체크 및 인증 코드 발송 버튼 활성화
    $('#email_check').click(function() {
        const userEmail = $('#email').val();
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!userEmail) {
            $('#email').css('border', '1px solid #ff0000ad'); // 빨간 테두리 추가
            return; // 이메일이 비어있으면 종료
        } else {
            $('#email').css('border', ''); // 테두리 초기화
        }
        if (!emailRegex.test(userEmail)) {
            $('#output1').html('올바른 이메일 주소를 입력하세요').show();
            $('#email').css('border', '1px solid #ff0000ad'); // 유효하지 않은 이메일에 빨간 테두리
            return;
        } else {
            $('#email').css('border', ''); // 테두리 초기화
        }

        $.ajax({
            url: `${pageContext.request.contextPath}/emailCheck`,
            type: 'GET',
            data: { id: userEmail },
            success: function(result) {
                if (result === 'emailDup') {
                    $('#output1').html('이미 존재하는 이메일입니다.').show();
                    $('#email').css('border', '1px solid #ff0000ad'); // 중복된 이메일에 빨간 테두리
                } else {
                    $('#output1').html('사용 가능한 이메일입니다.').css('color', 'green').show();
                    $('#send-code').show();
                    $('#email_check').hide();
                }
            }
        });
    });

    // 이메일 입력란 블러 이벤트
    $('#email').blur(function() {
        if (!$(this).val()) {
            $(this).css('border', '1px solid #ff0000ad'); // 비어 있을 때 빨간 테두리
        } else {
            $(this).css('border', ''); // 비어 있지 않으면 테두리 초기화
        }
    });

    // 인증 코드 전송
    $('#send-code').click(function() {
        const email = $('#email').val();

        if (!email) {
            $('#email').css('border', '1px solid #ff0000ad'); // 빨간 테두리 추가
            return; // 이메일이 비어있으면 종료
        } else {
            $('#email').css('border', ''); // 테두리 초기화
        }

        $.ajax({
            url: '${pageContext.request.contextPath}/emailSendCode',
            type: 'POST',
            data: { 'userEmail': email },
            success: function(response) {
                if (response !== 'failed') {
                    $('#output1').html('이메일 전송 완료.').css('color', 'green');
                    emailCode = parseInt(response);
                } else {
                    $('#output1').html('이메일 전송 오류. 이메일을 확인하세요.').css('color', 'red');
                }
            },
            error: function() {
                $('#output1').html('서버 오류 발생').css('color', 'red');
            }
        });
    });

    // 인증 코드 확인
   $('#code-check').click(() => {
		let inputCode = parseInt($('#code').val());

		console.log(emailCode);
		if (inputCode === emailCode ){
			let mailValidate =  $('#mailValidate');
			mailValidate.show();
			mailValidate.html('인증완료').css('color', 'green');
			$('#code-check').prop('disabled', true);
			$('#code').prop('disabled', true);
			$('#email').prop('readonly', true);
			isCodeState = true;
		}
		else{
			$('#mailValidate').html('인증코드가 틀립니다.').css('color', 'red');
			$('#email').prop('readonly', false);
			$('#code').val('');
			isCodeState = false;
		}
	});

    // 인증 코드 입력란 블러 이벤트
    $('#code').blur(function() {
        if (!$(this).val()) {
            $(this).css('border', '1px solid #ff0000ad'); // 비어 있을 때 빨간 테두리
        } else {
            $(this).css('border', ''); // 비어 있지 않으면 테두리 초기화
        }
    });

    // 전화번호 유효성 검사
    $('#phone').on('input', function() {
        const phone = $(this).val().replace(/-/g, '');
        $(this).val(phone);

        const phoneRegex = /^\d{10,11}$/;

        if (!phone) {
            $(this).css('border', '1px solid #ff0000ad'); // 비어 있을 때 빨간 테두리
        } else {
            $(this).css('border', ''); // 비어 있지 않으면 테두리 초기화
            if (!phoneRegex.test(phone)) {
                $('#phoneError').text('올바른 전화번호 형식이 아닙니다').show();
            } else {
                $('#phoneError').hide();
            }
        }
    });

    // 전화번호 입력란 블러 이벤트
    $('#phone').blur(function() {
        if (!$(this).val()) {
            $(this).css('border', '1px solid #ff0000ad'); // 비어 있을 때 빨간 테두리
        } else {
            $(this).css('border', ''); // 비어 있지 않으면 테두리 초기화
        }
    });


    // 폼 제출 시 유효성 검사
    $('#signup-form').submit(function(e) {
        e.preventDefault();

        let isValid = true;
        
        // 필수 입력 필드 검증
        $('input[required]').each(function() {
            if (!validateInput(this)) {
                isValid = false;
            }
        });

        // 체크박스 필수 항목 검증
        if (!$('#flexCheckChecked').is(':checked')) {
            alert('이용 약관에 동의해야 합니다.');
            isValid = false;
        }

        // 이메일 인증 여부 확인
        if (!isCodeState) {
            alert('이메일 인증을 완료해주세요.');
            isValid = false;
        }

        // 최종적으로 모든 유효성 검사를 통과했을 때만 폼 제출
        if (isValid) {
            alert('회원가입이 성공적으로 완료되었습니다!');
            this.submit();
        } else {
            alert('모든 필드를 올바르게 입력해주세요.');
        }
    });

});
</script>

</body>
</html>
