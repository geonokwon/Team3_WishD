<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>관리자 페이지</title>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerAside.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerTable.css">
	<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sidebars/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

</head>
<body class="text-light">
<!-- Header -->
<jsp:include page="../include/heard.jsp"/>

<!-- Main Content -->
<div class="wrap">
	<!-- Aside -->
	<jsp:include page="../include/managerAside.jsp"/>
	<div class="content">
<!-- 	페이지 제목 -->
	<div class="content-head">${userInfo.user_name } 님의 회원 정보</div>
<!-- 	페이지 내용 -->
		<div>
			<div>식별번호 : ${userInfo.user_no }</div>
			<div>이름 : ${userInfo.user_name }</div>
			<div>이메일 : ${userInfo.email }</div>
			<div>가입일 : ${userInfo.join_date }</div>
			<div>로그인 유형 : ${userInfo.user_type }</div>
			<div>계정 유형 : ${userInfo.getUser_Role() }</div>
			<div>차단 여부 : ${userInfo.user_yn }</div>
		</div>
		
		<div class="buttons">
			<a href="${pageContext.request.contextPath}/manager/managerUserProList/${userInfo.user_no }" class="btn btn-primary2 text-light text-decoration-none">작성한 프로젝트 보기</a>
			<a href="${pageContext.request.contextPath}/manager/managerUserFreeList/${userInfo.user_no }" class="btn btn-primary2 text-light text-decoration-none">작성한 프리랜서 보기</a>
			<a href="${pageContext.request.contextPath}/manager/managerUserQnaList/${userInfo.user_no }" class="btn btn-primary2 text-light text-decoration-none">작성한 질문 글 보기</a>
			<c:if test="${userInfo.user_yn == false }">
				<a href="#" class="btn btn-primary3 text-light text-decoration-none" onclick="blackCheck()">블랙리스트 추가</a>
			</c:if>
			<c:if test="${userInfo.user_yn == true }">
				<a href="#" class="btn btn-primary3 text-light text-decoration-none" onclick="whiteCheck()">블랙리스트 해제</a>
			</c:if>
			<c:if test="${userInfo.getUser_Role() == 'user' }">
				<a href="#" class="btn btn-primary6 text-light text-decoration-none" onclick="adminOn()">관리자 권한 추가</a>
			</c:if>
			<c:if test="${userInfo.getUser_Role() == 'admin' }">
				<a href="#" class="btn btn-primary6 text-light text-decoration-none" onclick="adminOff()">관리자 권한 해제</a>
			</c:if>
		</div>
	</div>
</div>

<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

<script>
function blackCheck(){
	if(confirm("정말 해당 유저를 블랙리스트에 추가하시겠습니까?")==true){
		location.href = "${pageContext.request.contextPath}/manager/blackUser/${userInfo.user_no }"
	} else {
		return false;
	}
}

function whiteCheck(){
	if(confirm("정말 해당 유저를 블랙리스트에서 해제하시겠습니까?")==true){
		location.href = "${pageContext.request.contextPath}/manager/whiteUser/${userInfo.user_no }"
	} else {
		return false;
	}
}

function adminOn(){
	if(confirm("정말 해당 계정에게 관리자 권한을 부여하시겠습니까?")==true){
		location.href = "${pageContext.request.contextPath}/manager/adminOn/${userInfo.user_no }"
	} else {
		return false;
	}
}

function adminOff(){
	if(confirm("정말 해당 계정에게 관리자 권한을 해제하시겠습니까?")==true){
		location.href = "${pageContext.request.contextPath}/manager/adminOff/${userInfo.user_no }"
	} else {
		return false;
	}
}
</script>
</body>
</html>
