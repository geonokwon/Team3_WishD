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
    				<label for="userId" class="mb-1 mt-1 ms-2">아이디</label>
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
    				<label for="userPass" class="mb-2 mt-3 ms-2">비밀번호</label>
    					<div class="input-container">
    						<input 
    							type="password" 
    							class="form-control bg-dark mt-1" 
    							id="password" 
    							name="user_pass1" 
                				placeholder="비밀번호를 입력하세요"
                				autocomplete="off"
                				onblur="validateInput(this)"
                    			required
                			/>
                			
               	 	   	</div>
               	 	   	<!-- 에러메세지 -->    
        				<div class="invalid-feedback" id="passwordError" style="display: none;">
            				비밀번호는 특수문자를 포함하여 8~12글자여야 합니다.
       	 				</div>
				  </div>
            </div>
            
			<!-- 비밀번호 확인 -->
            <div class="row justify-content-center align-items-center" >
            	<div class="col-md-7">
    				<label for="userPass" class="mb-2 mt-3 ms-2">비밀번호 확인</label>
    					<div class="input-container">
    						<input 
    							type="password" 
    							class="form-control bg-dark mt-1" 
    							id="password-confirm" 
    							name="user_pass2" 
                				placeholder="비밀번호를 다시 입력하세요"
                				autocomplete="off"
                				onblur="validateInput(this)"
                    			required
                			/>
               	 		<!-- 에러메세지 -->	
                		<span id="password-confirm" style="color: red; display: none;"></span>
               	 	   </div>
				</div>
            </div>
			
			<!-- 이름 -->
            <div class="row justify-content-center align-items-center" >
            	<div class="col-md-7">
    				<label for="userName" class="mb-2 mt-3 ms-2">이름</label>
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
    				<label for="userMail" class="mb-1 mt-1 ms-2">이메일</label>
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
    				<label for="userMail" class="mb-2 mt-3 ms-2">인증코드 입력</label>
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
               			
               	 		<!-- 에러메세지 -->	
                		<div id="mailValidate" class="ms-4" style="color: red; display: none;"></div>
            			
               	 	   </div>
				</div>
            </div>
            
  			<!-- 전화번호 -->
            <div class="row justify-content-center align-items-center" >
            	<div class="col-md-7">
    				<label for="userPhone" class="mb-1 mt-1 ms-2">전화번호</label>
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
  				<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
  				<label class="form-check-label" for="flexCheckChecked">
    			(필수)개인정보 수집에 동의합니다.
  				</label>
			</div>
			<div class="agree-item">
  				<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
  				<label class="form-check-label" for="flexCheckDefault">
    			(선택)마케팅 활용 동의와 광고성 정보의 수신에 동의합니다.
  				</label>
			</div>
			
			<button class="signup-btn" type="submit">
    			회원가입
			</button>
           	
        	</form>
        	<!-- 폼 태그 끝 -->
        	
        	<!-- 회원가입 완료 모달창알림 -->
			<div class="modal fade mt-5" id="insertSave" tabindex="-1"  aria-hidden="true">
  				<div class="modal-dialog">
    				<div class="modal-content bg-primary ps-2 pt-2">
     	 				<div class="modal-header">
        					<h1 class="modal-title fs-6" id="insertTitle">회원가입이 완료되었습니다!</h1>
        					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      					</div>
      					<div class="modal-body">
        					WishD 회원이 되신걸 환영합니다!
      					</div>
      					<div class="modal-footer">
        					<button type="button" class="btn btn-sm btn-primary" data-bs-dismiss="modal">닫기</button>
        					<button type="button" class="btn btn-sm btn-secondary" id="goToLogin">로그인</button>
      					</div>
    				</div>
  				</div>
			</div>
    	</div>
	</div>
    <!-- 별배경 -->
<div class="noite"></div>
<div class="constelacao"></div>
<div class="chuvaMeteoro"></div>

<script type="text/javascript">
//비어있는 입력란의 경우 빨간 테두리 준다.
function validateInput(element) {
 const isEmpty = element.value.trim() === "";
 element.style.border = isEmpty ? "1px solid #ff0000ad" : "";
}

//아이디 중복 체크
$(document).ready(function() {
    $('#id_check').click(function() {
        const userId = $('#user_id').val(); // 입력된 아이디 값

        // 아이디가 비어있을 경우 빨간 테두리 추가
        if (!userId) {
            $('#user_id').css('border', '1px solid #ff0000ad'); // 빨간 테두리 추가
            $('#output').hide(); // 에러 메시지 숨김
            return; // 아이디가 비어있으면 함수 종료
        } else {
            $('#user_id').css('border', ''); // 테두리 초기화
        }

        $.ajax({
            url: `${pageContext.request.contextPath}/idCheck`,
            type: 'GET',
            data: { id: userId },
            success: function(result) {
                if (result === 'iddup') {
                    $('#output').html('이미 존재하는 아이디입니다.').css('color', 'red').show();
                    $('#user_id').css('border', '1px solid #ff0000ad'); // 빨간 테두리 추가
                } else {
                    $('#output').html('사용 가능한 아이디입니다.').css('color', 'green').show();
                    $('#user_id').css('border', ''); // 테두리 초기화
                }
            },
            error: function() {
                $('#output').html('오류가 발생했습니다. 다시 시도해주세요.').css('color', 'red').show();
                $('#user_id').css('border', '1px solid #ff0000ad'); // 빨간 테두리 추가
            }
        });
    });
});

	//비밀번호 확인
	$('#password').blur(function() {
    	const password = $(this).val();

    	if (!password) {
        	$(this).css('border', '1px solid #ff0000ad'); // 빨간 테두리 추가
        	$('#passwordError').hide(); // 에러 메시지 숨김
    	} else if (password.length < 8 || password.length > 12 || !/[!@#$%^&*]/.test(password)) {
        	$('#passwordError').show(); // 에러 메시지 표시
        	$(this).css('border', '1px solid #ff0000ad'); // 빨간 테두리 추가
    	} else {
        	$('#passwordError').hide();
        	$(this).css('border', ''); // 테두리 초기화
    	}
	});

	// 비밀번호 일치 확인
	$('#password-confirm').blur(function() {
    	const password = $('#password').val();
    	const passwordConfirm = $(this).val();

    	if (password && passwordConfirm && password !== passwordConfirm) {
        	$(this).css('border', '1px solid #ff0000ad'); // 빨간 테두리 추가
    	} else {
        	$(this).css('border', ''); // 테두리 초기화
    	}
	});


    // 이메일 인증
	$('#email_check').click(function() {
	    const userEmail = $('#email').val();
	    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

	    if (!emailRegex.test(userEmail)) {
	        $('#output1').html('올바른 이메일 주소를 입력하세요').show();
	        return;
	    }

	    $.ajax({
	        url: `${pageContext.request.contextPath}/emailCheck`,
	        type: 'GET',
	        data: { id: userEmail },
	        success: function(result) {
	            if (result === 'emailDup') {
	                $('#output1').html('이미 존재하는 이메일입니다.').show();
	            } else {
	                $('#output1').html('사용 가능한 이메일입니다.').css('color', 'green').show();
	                $('#send-code').show();
	                $('#email_check').hide();
	            }
	        }
	    });
	});

	//인증코드 발송 SMTP
	//메일 중복확인 완료시 인증코드 전송
	let emailCode;
	$('#send-code').click(() => {
		let email = $('#email');
		$('#send-code').prop('disabled', true);
		$.ajax({
			url: '${pageContext.request.contextPath}/emailSendCode',  //이메일 전송
			type: 'POST',
			data: {
				'userEmail': email.val()
			},
			success: (response) => {
				if(response !== 'failed'){
					email.prop('readonly', true);
					$('#output1').html('이메일 전송 완료.').css('color', 'green');
					$('#send-code').prop('disabled', true);
					emailCode = parseInt(response);
				} else {
					$('#output1').html('이메일 전송 오류 이메일을 확인하세요!.').css('color', 'red');
				}
			},
			error: function() {
				$('#output1').html('서버 오류 발생').css('color', 'red');
			}
		});
	})

	let isCodeState;
	$('#code-check').click(() => {
		let inputCode = parseInt($('#code').val());

		console.log(emailCode);
		if (inputCode === emailCode ){
			$('#mailValidate').html('인증완료').css('color', 'green');
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
	})

    //인증코드 필드 확인
    $('#code').blur(function() {
        const code = $(this).val();
        if (!code) {
            $('#mailValidate').next('span').text('인증코드를 입력하세요').css('color', 'red').show();
        } else {
            $('#mailValidate').next('span').hide();
        }
    });

   
	// 전화번호 유효성 검사
	$('#phone').on('input', function() {
	    // 하이픈 제거
	    const phone = $(this).val().replace(/-/g, '');

	    // 하이픈이 제거된 값으로 다시 입력
	    $(this).val(phone);

	    const phoneRegex = /^\d{10,11}$/; // 예시: 01012345678 형식

	    if (!phoneRegex.test(phone)) {
	        $('#phoneError').text('올바른 전화번호 형식이 아닙니다').css('display', 'block');
	        isPhoneValid = false;
	    } else {
	        $('#phoneError').hide();
	        isPhoneValid = true;
	    }
	});

	// 폼 제출 시 유효성 검사 통과 여부 확인
	$('form').submit(function(e) {
	    e.preventDefault(); // 기본 제출 동작 방지
	    
	   
	    // 비밀번호 확인 검사 (필요 시)
	    if (password !== confirmPassword) {
	        alert('비밀번호가 일치하지 않습니다.');
	        return;
	    }

	    // 모든 유효성 검사가 통과되었을 때 회원가입 완료 모달 표시
	    $('#insertSave').modal('show'); // 회원가입 완료 모달 띄우기
	});

	// 모달의 '로그인 화면으로 가기' 버튼 클릭 시 로그인 화면으로 이동
	$('#goToLogin').click(function() {
	    location.href = '${pageContext.request.contextPath}/login'; // 로그인 화면으로 이동
	});


</script>

</body>
</html>
