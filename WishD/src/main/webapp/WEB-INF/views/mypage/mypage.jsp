<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>마이페이지 | WishD</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/style_temp.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mypage.css">

</head>
<body class="text-light">
	<!-- Header -->
	<jsp:include page="../include/heard.jsp" />

	<!-- Main Content -->
<!-- 	로그인 세션 체크 -->
	<c:if test="${ empty sessionScope.user_no }">
<%-- 		<c:redirect url="/"></c:redirect> --%>
	</c:if>
	<div id="myContainer">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="my_nav-item" role="presentation">
				<button class="nav-link active" id="profile-tab"
					data-bs-toggle="tab" data-bs-target="#profile" type="button"
					role="tab" aria-controls="profile" aria-selected="true">기본정보</button>
			</li>
			<li class="my_nav-item" role="presentation">
				<button class="nav-link" id="freelancer-tab" data-bs-toggle="tab"
					data-bs-target="#freelancer" type="button" role="tab"
					aria-controls="freelancer" aria-selected="false">프리랜서 정보</button>
			</li>
			<li class="my_nav-item" role="presentation">
				<button class="nav-link" id="project-tab" data-bs-toggle="tab"
					data-bs-target="#project" type="button" role="tab"
					aria-controls="project" aria-selected="false">프로젝트 정보</button>
			</li>
			<li class="my_nav-item" role="presentation">
				<button class="nav-link" id="qna-tab" data-bs-toggle="tab"
					data-bs-target="#qna" type="button" role="tab" aria-controls="qna"
					aria-selected="false">QnA</button>
			</li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div class="tab-pane active" id="profile" role="tabpanel"
				aria-labelledby="profile-tab">
				
				<p class="necessary">*필수입력</p>
				
<!-- 			내정보탭 -->
<!-- 			${pageContext.request.contextPath}/ updatepro에 전달-->
				<form action="${pageContext.request.contextPath}/mypage/mypageUpdatePro" class="my-form" id="my-form" method="post" name="fr">
					<div class="form-row">
						<div class="form-group">
							<label for="name" class="my-label">이름 <span class="necessary2">*</span></label> <input type="text" id="name"
								name="user_name" value="${memberDTO.user_name }" readonly>
						</div>
						<div class="form-group">
							<label for="email" class="my-label">이메일 <span class="necessary2">*</span></label> <input type="email" id="email"
								name="email" value="${memberDTO.email }">
						</div>
						
					</div>
					
<!-- 					간편유저는 가리는 정보 -->
					<c:if test="${ memberDTO.user_type == 'notsim' }">
					<div class="form-row">
						<div class="form-group">
							<label for="user_id" class="my-label">아이디 <span class="necessary2">*</span></label> <input type="text" id="user_id"
								name="user_id" value="${memberDTO.user_id }" readonly>
						</div>
						<div class="form-group">
							<label for="password" class="my-label">비밀번호 <span class="necessary2">*</span></label><input type="password"
								id="password" name="user_pass" value="${memberDTO.user_pass }" placeholder="정보수정, 회원탈퇴시 필수입력">
						</div>
					</div>
					
					<div class="form-row">
						<div class="form-group">
							<label for="phone" class="my-label">연락처 <span class="necessary2">*</span></label> <input type="number" id="phone"
								name="user_phone" value="${memberDTO.user_phone }">
						</div>
					</div>
					</c:if>
				</form>
				<div class="button-container">
<!-- 				간편유저는 정보수정 버튼 가림 -->
					<c:if test="${ memberDTO.user_type == 'notsim' }">
<!-- 				javascript:document.fr.submit(); 대신 document.fr.submit();로 폼전달 -->
					<a href="#" class="button btnFade btnPurple" id="mysubmitbtn">정보수정</a></c:if>
					<a href="#" class="button btnFade btnPurple" id="mydeletebtn">회원탈퇴</a>
				</div>
			</div>
<!-- 			내정보탭 끝 -->

			<div class="tab-pane" id="freelancer" role="tabpanel"
				aria-labelledby="freelancer-tab">
				<p class="necessary">*필수입력</p>
			</div>

			<div class="tab-pane" id="project" role="tabpanel"
				aria-labelledby="project-tab">
				<p class="necessary">*필수입력</p>
			</div>

			<div class="tab-pane" id="qna" role="tabpanel"
				aria-labelledby="qna-tab">
			</div>
		</div>


	</div>

	<script>
	let mysubmitbtn = document.getElementById("mysubmitbtn");
	mysubmitbtn.addEventListener("click", mysubmitbtnClick, false);
	
	function mysubmitbtnClick() {
		let email = document.getElementById("email");
		if(email.value == ""){
			alert("이메일을 입력해주세요.");
			email.focus();
			return false;
		}
	
		let phone = document.getElementById("phone");
		if(phone.value == ""){
			alert("전화번호를 입력해주세요.");
			phone.focus();
			return false;
		}
		
		let password = document.getElementById("password");
		if(password.value == ""){
			alert("정보수정 시 비밀번호가 필요합니다.");
			password.focus();
			return false;
		}
		
		document.fr.submit();
	}
	
	
	let mydeletebtn = document.getElementById("mydeletebtn");
	mydeletebtn.addEventListener("click", mydeletebtnClick, false);
	
	function mydeletebtnClick() {
		let email = document.getElementById("email");
		if(email.value == ""){
			alert("이메일을 입력해주세요.");
			email.focus();
			return false;
		}
	
		let phone = document.getElementById("phone");
		if(phone.value == ""){
			alert("전화번호를 입력해주세요.");
			phone.focus();
			return false;
		}
		
		let password = document.getElementById("password");
		if(password.value == ""){
			alert("회원 탈퇴 시 비밀번호가 필요합니다.");
			password.focus();
			return false;
		} 
	
		document.fr.action = "${pageContext.request.contextPath}/mypage/myuserDeletePro";
		document.fr.submit();
	}
	
	</script>


	<!-- Footer -->
	<jsp:include page="../include/footer.jsp" />

</body>
</html>
