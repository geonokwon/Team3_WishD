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
	<div class="content-head">미답변 질문 글 목록</div>
<!-- 	페이지 내용 -->
	<div class="list">
<!-- 		테이블 -->
		<table class="table">
			<thead>
				<tr>
					<th scope="col" style="width:20%;">작성자 식별번호</th>
					<th scope="col" style="width:20%;">질문글 번호</th>
					<th scope="col">제목</th>
					<th scope="col" style="width:30%;">등록일자</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="communityQnaDTO" items="${QcoList }">
				<tr>
					<td style="width:20%;">${communityQnaDTO.user_no }</td>
					<td style="width:20%;">${communityQnaDTO.qcommunity_num }</td>
					<td><a href="${pageContext.request.contextPath}/qna_detail?qcommunity_num=${communityQnaDTO.qcommunity_num}">${communityQnaDTO.qcommunity_title }</a></td>
					<td style="width:30%;">${communityQnaDTO.qcommunity_date }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
<!-- 		페이지 번호 -->
		<div class="pagination">
			<a href="${pageContext.request.contextPath}/manager/managerQnA?pageNum=1" class="firstpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="첫 페이지로 이동"></a>
<!-- 				처음 페이지 아닌 경우 => 이전 버튼 보이기 -->
				<c:if test="${pageDTO.currentPage ne 1}">
					<a href="${pageContext.request.contextPath}/manager/managerQnA?pageNum=${pageDTO.currentPage-1}" class="prevpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
				</c:if>
				
				<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					<c:if test="${pageDTO.currentPage eq i}">
						<a href="${pageContext.request.contextPath}/manager/managerQnA?pageNum=${i}"><span class="pagenum currentpage">${i}</span></a>
					</c:if>
					<c:if test="${pageDTO.currentPage ne i}">
						<a href="${pageContext.request.contextPath}/manager/managerQnA?pageNum=${i}"><span class="pagenum">${i}</span></a>
					</c:if>
				</c:forEach>
<!-- 				마지막 페이지 아닌 경우 => 다음 버튼 보이기 -->
				<c:if test="${pageDTO.currentPage ne pageDTO.pageCount}">
					<a href="${pageContext.request.contextPath}/manager/managerQnA?pageNum=${pageDTO.currentPage+1}" class="nextpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
				</c:if>
				
			<a href="${pageContext.request.contextPath}/manager/managerQnA?pageNum=${pageDTO.pageCount}" class="lastpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="마지막 페이지로 이동"></a>	
		</div>
	</div>
	</div>
</div>

<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>
