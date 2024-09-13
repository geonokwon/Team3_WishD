<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>프리랜서 찾기</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/freelancer/freelancer.css">

</head>
<body class="d-flex flex-column min-vh-100 justify-content">
	<!-- Header -->
	<jsp:include page="../include/heard.jsp"/>
	
	<!-- main content -->
	<div class="container mb-4 mx-5 px-5 py-5" style="margin-top:100px; min-height: 100vh; width: 1100px; ">
	
	
	
		    		
		<!-- 메인타이틀, 검색 -->
		<div class="row px-4 py-4" >
		            <!-- 제목 -->
		            <div class="col-md title" onclick="location.href='${pageContext.request.contextPath}/freelancerFind?pageNum='">
		                <div class="d-flex align-items-center">
		                    <img class="float-start" 
		                    	 src="${pageContext.request.contextPath}/resources/freelancer/images/speaker.png" 
		                    	 alt="speaker"/>
		                    <h2 class="ms-2 mb-0">구인 중인 프리랜서</h2>
		                </div>
		            </div>
		
		            <!-- 스킬 선택 창-->
		            <div class="col-auto">
		                <div class="dropdown">
		                    <button class="btn btn-sm btn-primary dropdown-toggle"
		                            type="button"
		                            id="skillMenuButton"
		                            data-bs-toggle="dropdown"
		                            aria-expanded="false"
		                            style="width: 120px;"
		                    >스킬 선택</button>
		                    <ul class="dropdown-menu" aria-labelledby="skillMenuButton">
		                        <c:forEach items="${freelancerSkillList}" var="skill">
		                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/freelancerFind?skill=${skill.getSkill_id()}">${skill.getSkill_name()}</a></li>
		                        </c:forEach>
		                    </ul>
		                </div>
		            </div>
		            
		            <div class="col-auto">
		                <form action="${pageContext.request.contextPath}/freelancerFind" method="get" >
		                    <div class="input-group" >
		                        <input type="text"  id="search" class="form-control text border-0 bg-primary" name="search" placeholder="프리랜서 내용 검색" autocomplete="off" />
		                        <button type="submit" class="btn bg-primary" ><img src="${pageContext.request.contextPath}/resources/freelancer/svg/search.svg" alt="Search" /></button>
		                    </div>
		                </form>
		            </div>
		

		            
		            
		            
		</div><!-- main title끝 -->
	    
	    <div class="col-12 mt-4 mb-2 px-5">
	        <div class="d-flex">
	            <!-- 총 프리랜서 등록 개수 가져오기 -->
	            <div class="ms-1 me-3">프리랜서 ${freelancerPageDTOList.getCount()} 명</div>
	            <div class="me-4">|</div>
	
	            <!-- 정렬 방식 변경 -->
	            <c:if test="${sortState == 0}">
	                <a class="sort me-4 nav-link" href="${pageContext.request.contextPath}/freelancerFind?sort=1">최신 순</a>
	                <img src="${pageContext.request.contextPath}/resources/freelancer/svg/down.svg" alt="Sort"/>
	            </c:if>
	            <c:if test="${sortState == 1}">
	                <a class="sort me-4 nav-link" href="${pageContext.request.contextPath}/freelancerFind?sort=0">오래된 순</a>
	                <img src="${pageContext.request.contextPath}/resources/freelancer/svg/down.svg" alt="Sort" style="transform: rotate(180deg)"/>
	            </c:if>
	        </div>
 			</div>
	
		<!-- Freelancer Cards -->
	    <div class="row">
	        <!-- 반복되는 프리랜서 카드 -->
	        <c:forEach items="${freelancerDTOList}" var="freelancerDTO">
	            <div class="container mb-4 px-5">
	            <div class="board_card card h-100 p-2" style="height: 200px">
	            	
	                <div class="card-body position-relative">
	                    <!-- 현재 상태 -->
	                    <!-- 모집중 일때 -->
	                    <c:if test="${freelancerDTO.getFreelancer_state() == '모집중'}">
	                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill">
	                                ${freelancerDTO.getFreelancer_state()}
	                        </span>
	                    </c:if>
	                    <!-- 진행중 일때 -->
	                    <c:if test="${freelancerDTO.getFreelancer_state() == '진행중'}">
	                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">
	                                ${freelancerDTO.getFreelancer_state()}
	                        </span>
	                    </c:if>
	                    <!-- 완료 일때 -->
	                    <c:if test="${freelancerDTO.getFreelancer_state() == '완료'}">
	                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">
	                                ${freelancerDTO.getFreelancer_state()}
	                        </span>
	                    </c:if>
	
	                    <!-- 이름 -->
	                    <a class="nav-link mb-3 fs-4" href="${pageContext.request.contextPath}/freelancerRead/${freelancerDTO.getFreelancer_id()}">${freelancerDTO.getUser_name() }</a>
	
	                    <!-- 필요 스킬 -->
	                    <div class="d-flex mb-2">
	                        <!-- 반복되는 스킬배지 -->
	                        <c:forEach items="${freelancerDTO.getSkills()}" var="freelancerSkill">
	                        <span class="badge mb-1 me-2"># ${freelancerSkill.getSkill_name()}</span>
	                        </c:forEach>
	                    </div>
	
	                    <!-- 희망 급여 -->
	                    <p class="col-auto card-text mb-1">희망 월급:  <fmt:formatNumber value="${freelancerDTO.getFreelancer_salary	()}" pattern="###,###,###"/>  만원</p>
	
	                    <div class="row d-flex">
	                        <!--업무 시작 가능 날짜 -->
	                        <p class="col-4 card-text mb-1">업무 시작가능일:
	                            <fmt:parseDate value="${freelancerDTO.getFreelancer_startdate()}" var="parsedDate" pattern="yyyy-MM-dd" />
	                            <fmt:formatDate value="${parsedDate}" pattern="yyyy년 MM월 dd일" />
	                        </p>
	                        <!-- 예상 기간 -->
<!-- 	                        <p class="col-3 card-text"></p> -->
	                    </div>
	                </div>
	            </div>
	        </div>
	        </c:forEach>
	        <!-- 반복 end -->
	    </div>
	
	    <!-- Pagination -->
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <!-- 10칸씩 뒤로 이동 버튼 -->
            <c:if test="${freelancerPageDTOList.startPage > freelancerPageDTOList.pageBlock}">
                <li class="page-item">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/freelancerFind?pageNum=${freelancerPageDTOList.startPage - 10}"></a>
            </li>
            </c:if>

            <c:forEach begin="${freelancerPageDTOList.startPage}" end="${freelancerPageDTOList.endPage}" var="page">
                <li class="page-item">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/freelancerFind?pageNum=${page}">${page}</a>
                </li>
            </c:forEach>

            <!-- 10칸씩 앞으로 이동 -->
            <c:if test="${freelancerPageDTOList.endPage < freelancerPageDTOList.pageCount}">
                <li class="page-item">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/freelancerFind?pageNum=${freelancerPageDTOList.endPage + 10}"></a>
            </li>
            </c:if>
        </ul>
    </nav>
	
	
	
	
	</div> <!-- main container -->






	<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>


<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
></script>

	<script src="${pageContext.request.contextPath}/resources/freelancer/freelancer_find.js"></script>

</body>
</html>

