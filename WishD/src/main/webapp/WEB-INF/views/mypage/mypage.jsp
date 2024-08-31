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

	<div id="myContainer">
		<!-- Nav tabs -->
		<ul class="nav nav-tabs" id="myTab" role="tablist">
			<li class="my_nav-item" role="presentation">
				<button class="nav-link active" id="profile-tab"
					data-bs-toggle="tab" data-bs-target="#profile" type="button"
					role="tab" aria-controls="profile" aria-selected="true">기본
					정보</button>
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
				<form action="#" method="post">
					<div class="form-row">
						<div class="form-group">
							<label for="name">이름</label> <input type="text" id="name"
								name="user_name">
						</div>
						<div class="form-group">
							<label for="user_id">아이디</label> <input type="text" id="user_id"
								name="user_id">
						</div>
					</div>
					
					<div class="form-row">
						<div class="form-group">
							<label for="email">이메일</label> <input type="email" id="email"
								name="email">
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input type="password"
								id="password" name="user_pass">
						</div>
					</div>
					
					<div class="form-row">
						<div class="form-group">
							<label for="phone">연락처</label> <input type="number" id="phone"
								name="user_phone">
						</div>
					</div>
					
					<button type="submit">제출</button>
				</form>

			</div>



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
				<p class="necessary">*필수입력</p>
			</div>
		</div>


	</div>



	<!-- Footer -->
	<jsp:include page="../include/footer.jsp" />

</body>
</html>
