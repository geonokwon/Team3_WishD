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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerSmallTable.css">
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
	<div class="content" style="width:75%; margin-left:100px;">
<!-- 	페이지 제목 -->
	<div class="content-head">사이트에 등록된 직무 목록</div>
<!-- 	페이지 내용 -->
	<div class="list">
<!-- 		테이블 -->
		<table class="table" style="width:40%">
			<thead>
				<tr>
					<th scope="col" style="width:25%;">식별번호</th>
					<th scope="col">직무</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="jobDTO" items="${jobList }">
				<tr>
					<td>${jobDTO.job_id }</td>
					<td>${jobDTO.job_name }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
<!-- 		페이지 번호 -->
		<div class="pagination">
		<c:if test="${pageDTO.count ne 0 }">
			<a href="${pageContext.request.contextPath}/manager/managerJobList?pageNum=1" class="firstpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_firstpage.png" alt="첫 페이지로 이동"></a>
<!-- 				처음 페이지 아닌 경우 => 이전 버튼 보이기 -->
				<c:if test="${pageDTO.currentPage ne 1}">
					<a href="${pageContext.request.contextPath}/manager/managerJobList?pageNum=${pageDTO.currentPage-1}" class="prevpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_prevpage.png" alt="이전 페이지로 이동"></a>
				</c:if>
				
				<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					<c:if test="${pageDTO.currentPage eq i}">
						<a href="${pageContext.request.contextPath}/manager/managerJobList?pageNum=${i}"><span class="pagenum currentpage">${i}</span></a>
					</c:if>
					<c:if test="${pageDTO.currentPage ne i}">
						<a href="${pageContext.request.contextPath}/manager/managerJobList?pageNum=${i}"><span class="pagenum">${i}</span></a>
					</c:if>
				</c:forEach>
<!-- 				마지막 페이지 아닌 경우 => 다음 버튼 보이기 -->
				<c:if test="${pageDTO.currentPage ne pageDTO.pageCount}">
					<a href="${pageContext.request.contextPath}/manager/managerJobList?pageNum=${pageDTO.currentPage+1}" class="nextpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" alt="다음 페이지로 이동"></a>
				</c:if>
				
			<a href="${pageContext.request.contextPath}/manager/managerJobList?pageNum=${pageDTO.pageCount}" class="lastpage  pbtn"><img src="${pageContext.request.contextPath}/resources/img/btn_lastpage.png" alt="마지막 페이지로 이동"></a>	
		</c:if>
		</div>
		<div class="navi">
			<form action="${pageContext.request.contextPath}/manager/managerInsertJob" method="post" id="insert" onsubmit="return false">
            	<div class="input-group2">
                	<input type="text"  id="newItem" class="form-control text border-0 bg-secondary" name="newItem" placeholder="새로운 직무" autocomplete="off" />
                    <button type="submit" class="btn btn-primary5" onclick="insertCheck();">직무 추가하기</button>
            	</div>
           </form>
           
			<form action="${pageContext.request.contextPath}/manager/managerJobList" method="get">
            	<div class="input-group">
                	<input type="text"  id="search" class="form-control text border-0 bg-primary" name="search" placeholder="직무 검색" autocomplete="off" />
                    <button type="submit" class="btn bg-primary"><img src="${pageContext.request.contextPath}/resources/project/svg/search.svg" alt="Search" /></button>
            	</div>
           </form>
		</div>
	</div>
	</div>
</div>

<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

<script>
function insertCheck(){
	if(confirm("정말 새로운 직무를 추가하시겠습니까?")==true){
		let form = document.getElementById("insert");
		form.submit();
	} else {
		return false;
	}
}
</script>
</body>
</html>
