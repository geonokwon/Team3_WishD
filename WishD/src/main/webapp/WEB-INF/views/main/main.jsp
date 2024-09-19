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
	<div class="gate1">
	<div class="gate2">
		<div class="gate_text">
			<p class="praise">검증된 개발자 프리랜서들이 있는 곳, WishD</p>
			<p>평균 2년 차 이상의 경력 많은 프리랜서를 만나보세요</p>
		</div>
	</div>
	</div>
</div>

<div class="wrap">
	<p class="pre-intro">WishD를 사용해야 하는 이유</p>
</div>
<div class="wrap">
	<div class="intro">
		<div class="intro-head">100% FREE</div>
		<p class="intro-text">검색과 프리랜서 찾기, 프로젝트 찾기는 돈이 들지 않아요!</p>
	</div>
	<div class="intro">
		<div class="intro-head">100% 인증</div>
		<p class="intro-text">게시글을 작성할 시 100% 운영자 인증 완료 후 게시해요!</p>
	</div>
	<div class="intro">
		<div class="intro-head">검증된 프리랜서</div>
		<p class="intro-text">경력 10년 이상의 매칭 매니저가 평가 데이터 및 정성/정량 평가서를 기반으로 프리랜서를 정교하게 검증합니다!</p>
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
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">JAVA</div>
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">Python</div>
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">C++</div>
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">JavaScript</div>
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">Kotlin</div>
		<div class="stack" style="cursor:pointer;" onclick="location.href='#';">PHP</div>
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
		<div class="list-head" style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath }/projectFind';">프로젝트 목록</div>
		<table class="instant-table">
			<tr>
				<td><p>ㅁㄴㅇㄹ</p></td>
			</tr>
			<tr>
				<td><p>ㅁㄴㅇㄹ</p></td>
			</tr>
			<tr>
				<td><p>ㅁㄴㅇㄹ</p></td>
			</tr>
			<tr>
				<td><p>ㅁㄴㅇㄹ</p></td>
			</tr>
			<tr>
				<td><p>ㅁㄴㅇㄹ</p></td>
			</tr>
			<tr>
				<td><p>ㅁㄴㅇㄹ</p></td>
			</tr>
			<tr>
				<td><p>ㅁㄴㅇㄹ</p></td>
			</tr>
			<tr>
				<td><p>ㅁㄴㅇㄹ</p></td>
			</tr>
		</table>
	</div>
	
<!-- 	프리랜서 리스트 -->
	<div class="freelancer-list">
		<div class="list-head" style="cursor:pointer;" onclick="location.href='${pageContext.request.contextPath }/freelancerFind';">프리랜서 목록</div>
		<table class="instant-table">
			<tr>
				<td><p>ㅁㄴㅇㄹ</p></td>
			</tr>
			<tr>
				<td><p>ㅁㄴㅇㄹ</p></td>
			</tr>
			<tr>
				<td><p>ㅁㄴㅇㄹ</p></td>
			</tr>
			<tr>
				<td><p>ㅁㄴㅇㄹ</p></td>
			</tr>
			<tr>
				<td><p>ㅁㄴㅇㄹ</p></td>
			</tr>
			<tr>
				<td><p>ㅁㄴㅇㄹ</p></td>
			</tr>
			<tr>
				<td><p>ㅁㄴㅇㄹ</p></td>
			</tr>
			<tr>
				<td><p>ㅁㄴㅇㄹ</p></td>
			</tr>
		</table>
	</div>
</div>
</div>

<hr>
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
		if(ListOrder!=null){
			e.classList.remove("active");
		}
	});
	e.target.classList.add("active");

	tabContent.forEach(function(event){
		if(ListOrder!=null){
			if(event.dataset.order == ListOrder) {
				event.classList.add("show");
			} else event.classList.remove("show");
		}
	});
});
</script>

</body>
</html>
