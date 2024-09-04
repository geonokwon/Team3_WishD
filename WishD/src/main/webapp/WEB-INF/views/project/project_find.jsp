<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>project_find</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/project/project.css">

</head>
<body class="d-flex flex-column min-vh-100 justify-content">
<!-- Header -->
<jsp:include page="../include/heard.jsp"/>

<!-- Main Content -->
<div class="container my-4 mx-5 px-5 py-5" style="min-height: 100vh; width: 1040px;">
    <!-- header -->
    <div class="container">
        <div class="row align-items-center px-4">
            <!-- 제목 -->
            <div class="col" onclick="location.href='${pageContext.request.contextPath}/projectFind?pageNum='">
                <div class="d-flex align-items-center">
                    <img class="float-start" src="${pageContext.request.contextPath}/resources/project/images/speaker.png" alt="speaker"/>
                    <h2 class="ms-2 mb-0">구인 중인 프로젝트</h2>
                </div>
            </div>

            <!-- 스킬 선택 창-->
            <div class="col-auto">
                <div class="dropdown">
                    <button
                            class="btn btn-sm btn-primary dropdown-toggle"
                            type="button"
                            id="skillMenuButton"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                            style="width: 120px"
                    >스킬 선택
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="skillMenuButton">
                        <c:forEach items="${projectSkillList}" var="skill">
                            <li><a class="dropdown-item" href="#">${skill.getSkill_name()}</a></li>
                        </c:forEach>


                    </ul>
                </div>
            </div>

            <!-- 검색 창 -->
            <div class="col-auto ms-auto">
                <form action="${pageContext.request.contextPath}/projectFind" method="get">
                    <div class="input-group">
                        <input type="text"  id="search" class="form-control text border-0 bg-primary" name="search" placeholder="프로젝트명 검색" />
                        <button type="submit" class="btn bg-primary"><img src="${pageContext.request.contextPath}/resources/project/svg/search.svg" alt="Search" /></button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="col-12 mt-4 mb-2 px-5">
        <div class="d-flex">
            <!-- 총 프로젝트 등록 개수 가져오기 -->
            <div class="ms-1 me-3">프로젝트 ${requestScope.projectPageDTOList.getCount()} 개</div>
            <div class="me-4">|</div>
            <!-- 정렬 방식 변경 -->
            <a class="me-4 nav-link" href="#">최신 순</a>
            <img src="${pageContext.request.contextPath}/resources/project/svg/down.svg" alt="Sort" />
        </div>
    </div>

    <!-- Project Cards -->
    <div class="row">

        <!-- 반복되는 프로젝트 카드 -->
        <c:forEach items="${projectDTOList}" var="projectDTO">
        <div class="container mb-4 px-5">
            <div class="card h-100 p-2" style="height: 200px">
                <div class="card-body position-relative">
                    <!-- 현재 상태 -->
                    <!-- 모집중 일때 -->
                    <c:if test="${projectDTO.getPboard_state() == '모집중'}">
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill">
                            ${projectDTO.getPboard_state()}
                    </span>
                    </c:if>
                    <!-- 진행중 일때 -->
                    <c:if test="${projectDTO.getPboard_state() == '진행중'}">
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">
                            ${projectDTO.getPboard_state()}
                    </span>
                    </c:if>
                    <!-- 완료 일때 -->
                    <c:if test="${projectDTO.getPboard_state() == '완료'}">
                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">
                            ${projectDTO.getPboard_state()}
                    </span>
                    </c:if>

                    <!-- 타이틀 -->
                    <a class="nav-link mb-3 fs-4" href="${pageContext.request.contextPath}/projectRead?${projectDTO.getPboard_id()}">${projectDTO.getPboard_title()}</a>
                    <!-- 필요 스킬 -->
                    <div class="d-flex mb-2">
                        <!-- 반복되는 스킬배지 -->
                        <c:forEach items="${projectDTO.getSkills()}" var="projectSkill">
                        <span class="badge mb-1 me-2"># ${projectSkill.getSkill_name()}</span>
                        </c:forEach>
                    </div>
                    <!-- 예상 금액 -->
                    <p class="col-auto card-text mb-1">예상 금액: ${projectDTO.getPboard_money()} 만원</p>
                    <div class="row d-flex">
                        <!-- 시작 예정일 -->
                        <p class="col-4 card-text mb-1">시작 예정일: <fmt:formatDate value="${projectDTO.getPboard_startDate()}" pattern="yyyy년 MM월 dd일" /> </p>
                        <!-- 예상 기간 -->
                        <p class="col-3 card-text">예상 기간: ${projectDTO.getPboard_rangeMonth()} 개월</p>
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
            <c:if test="${projectPageDTOList.startPage > projectPageDTOList.pageBlock}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/projectFind?pageNum=${projectPageDTOList.startPage - 10}"></a>
            </li>
            </c:if>

            <c:forEach begin="${projectPageDTOList.startPage}" end="${projectPageDTOList.endPage}" var="page">
                <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/projectFind?pageNum=${page}">${page}</a></li>
            </c:forEach>

            <!-- 10칸씩 앞으로 이동 -->
            <c:if test="${projectPageDTOList.endPage < projectPageDTOList.pageCount}">
            <li class="page-item">
                <a class="page-link" href="${pageContext.request.contextPath}/projectFind?pageNum=${projectPageDTOList.endPage + 10}"></a>
            </li>
            </c:if>
        </ul>
    </nav>

    <div class="noite"></div>

    <div class="constelacao"></div>

    <div class="chuvaMeteoro"></div>
</div>
<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

<script src="${pageContext.request.contextPath}/resources/project/project.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
></script>
</body>
</html>
