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
	<c:if
		test="${ empty sessionScope.user_id || empty sessionScope.access_Token }">
		<%-- 		<c:redirect url="/login"></c:redirect> --%>
	</c:if>

	<!-- 	상단 내정보와 폼 부분 -->
	<div id="profile-top">

		<form
			action="${pageContext.request.contextPath}/mypage/mypageUpdatePro"
			class="my-form" id="my-form" method="post">
			<h2 id="my-title">내 정보</h2>
			<p class="necessary">*필수입력</p>


			<div class="form-row">

				<div class="form-group">
					<label for="name" class="my-label">이름 <span
						class="necessary2">*</span></label> <input type="text" id="name"
						name="user_name" value="${memberDTO.user_name }" readonly>
				</div>

				<div class="form-group">
					<label for="email" class="my-label">이메일 <span
						class="necessary2">*</span></label> <input type="email" id="email"
						name="email" value="${memberDTO.email }">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label for="user_id" class="my-label">아이디 <span
						class="necessary2">*</span></label> <input type="text" id="user_id"
						name="user_id" value="${memberDTO.user_id }" readonly>
				</div>
				<div class="form-group">
					<label for="password" class="my-label">비밀번호 <span
						class="necessary2">*</span></label> <input type="password" id="password"
						name="user_pass" value="" placeholder="정보수정, 회원탈퇴시 필수입력">
				</div>
			</div>

			<div class="form-row">
				<div class="form-group">
					<label for="phone" class="my-label">연락처 <span
						class="necessary2">*</span></label> <input type="number" id="phone"
						name="user_phone" value="${memberDTO.user_phone }">
				</div>
			</div>

			<div class="button-container">
				<a href="#" class="btnFade btnPurple" id="mysubmitbtn">정보수정</a>
				<a href="#" class="btnFade btnPurple" id="mydeletebtn">회원탈퇴</a>
			</div>
		</form>
	</div>
	<!-- 상단 내정보와 폼 끝 -->

	<div class="tab-container">
		<!-- 네비 바 -->
		<div class="tabs">
			<button class="tab-button" data-tab="freelancer">프리랜서 글</button>
			<button class="tab-button" data-tab="project">프로젝트 글</button>
			<button class="tab-button" data-tab="qna">QnA</button>
		</div>

		<!-- Tab panes -->
		<div class="tab-content">
			<div id="freelancer" class="tab-pane">
				<div class="container">
					<c:forEach var="i" begin="1" end="3">
						<li class="post-item">
							<div class="post-title">글 제목 ${i}</div>
							<div class="tech-stack">
								<span>기술A</span> <span>기술B</span> <span>기술C</span>
							</div>
							<p class="post-summary">이 글은 ${i} 번째 글의 요약에 해당하며, 주제에 대한 간략한
								설명이 포함됩니다.</p>
							<div class="button-group">
								<a href="#" class="btn-read-more">자세히 보기</a> <a href="#"
									class="btn-extra">글 수정</a>
							</div>
						</li>
					</c:forEach>
				</div>
			</div>

			<div id="project" class="tab-pane">
				<p class="necessary">*필수입력</p>
				<!-- 프로젝트 정보 내용 -->
			</div>

			<div id="qna" class="tab-pane">
				<!-- QnA 내용 -->
			</div>

		</div>
	</div>

	<script>
		// 가져온 코드, 존재해야 버튼이벤트 작동
        document.addEventListener('DOMContentLoaded', function() {
            // 탭 버튼 클릭 이벤트
            document.querySelectorAll('.tab-button').forEach(button => {
                button.addEventListener('click', () => {
                    const tabId = button.getAttribute('data-tab');

                    // 모든 탭 버튼과 콘텐츠의 active 클래스를 제거합니다.
                    document.querySelectorAll('.tab-button.active').forEach(btn => btn.classList.remove('active'));
                    document.querySelectorAll('.tab-pane.active').forEach(pane => pane.classList.remove('active'));

                    // 클릭한 탭 버튼을 활성화합니다.
                    button.classList.add('active');
                    document.getElementById(tabId).classList.add('active');
                });
            });

            // 정보수정 버튼 클릭 이벤트
            document.getElementById("mysubmitbtn").addEventListener("click", function(event) {
                event.preventDefault();

                const form = document.getElementById("my-form");
                let email = document.getElementById("email");
                if (email.value == "") {
                    alert("이메일을 입력해주세요.");
                    email.focus();
                    return;
                }

                let phone = document.getElementById("phone");
                if (phone.value == "") {
                    alert("전화번호를 입력해주세요.");
                    phone.focus();
                    return;
                }

                let password = document.getElementById("password");
                if (password.value == "") {
                    alert("정보수정 시 비밀번호가 필요합니다.");
                    password.focus();
                    return;
                }
				
                document.getElementById("my-form").action = "${pageContext.request.contextPath}/mypage/mypageUpdatePro";
                document.getElementById("my-form").submit();
            });

            // 회원탈퇴 버튼 클릭 이벤트
            document.getElementById("mydeletebtn").addEventListener("click", function(event) {
                event.preventDefault();

                const form = document.getElementById("my-form");
                let email = document.getElementById("email");
                if (email.value == "") {
                    alert("이메일을 입력해주세요.");
                    email.focus();
                    return;
                }

                let phone = document.getElementById("phone");
                if (phone.value == "") {
                    alert("전화번호를 입력해주세요.");
                    phone.focus();
                    return;
                }

                let password = document.getElementById("password");
                if (password.value == "") {
                    alert("회원 탈퇴 시 비밀번호가 필요합니다.");
                    password.focus();
                    return;
                }

                document.getElementById("my-form").action = "${pageContext.request.contextPath}/mypage/myuserDeletePro";
                document.getElementById("my-form").submit();
            });
        });
    </script>



	<!-- Footer -->
	<jsp:include page="../include/footer.jsp" />

</body>
</html>
