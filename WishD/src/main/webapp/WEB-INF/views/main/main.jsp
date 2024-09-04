<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>main</title>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
	
</head>
<body class="text-light">
<!-- Header -->
<jsp:include page="../include/heard.jsp"/>

<!-- Main Content -->

<!-- 사이트 대문 -->
<div class="wrap">
<div class="gate">

</div>
</div>

<!-- 기술 스택별로 프로젝트/프리랜서 찾기 -->
<div class="wrap">
<div class="tab">
	<p>둘러보기</p>
<!-- 	프로젝트/프리랜서를 나누는 탭 -->
	<ul class="tab__list">
		<li class="tab__list__item active" data-list="1" style="cursor:pointer;">프로젝트</li>
		<li class="tab__list__item" data-list="2" style="cursor:pointer;">프리랜서</li>
	</ul>
	
<!-- 	기술 스택별 프로젝트 찾기 -->
	<div class="tab__contents show" data-order="1">
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">stack1</div>
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">stack2</div>
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">stack3</div>
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">stack4</div>
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">stack5</div>
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">stack6</div>
	</div>
	
<!-- 	기술 스택별 프리랜서 찾기 -->
	<div class="tab__contents" data-order="2">
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">stack6</div>
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">stack5</div>
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">stack4</div>
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">stack3</div>
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">stack2</div>
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">stack1</div>
	</div>
</div>
</div>

<!-- 소형 리스트들 -->
<div class="wrap">
<div class="instant-list">
<!-- 	프로젝트 리스트 -->
	<div class="project-list">
		<p><a href="#">프로젝트 목록</a></p>
		<table class="instant-table">
			<tr>
				<td>ㅁㄴㅇㄹ</td>
			</tr>
			<tr>
				<td>ㅁㄴㅇㄹ</td>
			</tr>
			<tr>
				<td>ㅁㄴㅇㄹ</td>
			</tr>
			<tr>
				<td>ㅁㄴㅇㄹ</td>
			</tr>
			<tr>
				<td>ㅁㄴㅇㄹ</td>
			</tr>
			<tr>
				<td>ㅁㄴㅇㄹ</td>
			</tr>
			<tr>
				<td>ㅁㄴㅇㄹ</td>
			</tr>
			<tr>
				<td>ㅁㄴㅇㄹ</td>
			</tr>
		</table>
	</div>
	
<!-- 	프리랜서 리스트 -->
	<div class="freelancer-list">
		<p><a href="#">프리랜서 목록</a></p>
		<table class="instant-table">
			<tr>
				<td>ㅁㄴㅇㄹ</td>
			</tr>
			<tr>
				<td>ㅁㄴㅇㄹ</td>
			</tr>
			<tr>
				<td>ㅁㄴㅇㄹ</td>
			</tr>
			<tr>
				<td>ㅁㄴㅇㄹ</td>
			</tr>
			<tr>
				<td>ㅁㄴㅇㄹ</td>
			</tr>
			<tr>
				<td>ㅁㄴㅇㄹ</td>
			</tr>
			<tr>
				<td>ㅁㄴㅇㄹ</td>
			</tr>
			<tr>
				<td>ㅁㄴㅇㄹ</td>
			</tr>
		</table>
	</div>
</div>
</div>

<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

<script>
// 프로젝트/프리랜서 탭 구현
const tab = document.querySelector(".tab");
const tabListItem = document.querySelectorAll(".tab__list__item");
const tabContent = document.querySelectorAll(".tab__contents");
const active = document.querySelector(".active");
const showing = document.querySelector("show");

tab.addEventListener("click", (e) => {
	const ListOrder = e.target.dataset.list;
	tabListItem.forEach(function(e){
		e.classList.remove("active");
	});
	e.target.classList.add("active");
	tabContent.forEach(function(event){
		if(event.dataset.order == ListOrder) {
			event.classList.add("show");
		} else event.classList.remove("show");
	});
});
</script>

</body>
</html>
