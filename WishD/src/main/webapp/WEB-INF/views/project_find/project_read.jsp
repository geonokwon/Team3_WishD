<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>project_read</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/project_find/project.css">

</head>
<body class="d-flex flex-column min-vh-100 justify-content">
<!-- Header -->
<jsp:include page="../include/heard.jsp"/>

<!-- Main Content -->
<div class="container my-4 mx-5 px-5 py-5">
    <!-- main -->
    <div class="container">
        <div class="container row align-items-start">
            <!-- project Read card -->
            <div class="card col-7 bg-primary rounded-lg me-2 p-3 h-100">
                <div class="card-body project-details" style="height: 1000px">
                    <!-- 타이틀 -->
                    <p class="card-title fs-3" style="height: 90px">[웹개발] HR SaaS 솔루션 인사/조직 관리 백앤드 개발</p>
                    <!-- 현재 상태 -->
                    <p class="badge fs-7">모집중</p>
                    <!-- 예상 금액 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project_find/svg/money.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">예상 금액</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0"><span class="money_min">200</span> 만원 ~ <span class="money_max">400</span> 만원</p>
                        </div>
                    </div>
                    <!-- 시작 예정일 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project_find/svg/calendar.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">시작 예정일</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0">2024-08-29</p>
                        </div>
                    </div>
                    <!-- 예상 기간 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project_find/svg/date-range.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">예상 기간</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0"><span class="month_range">2</span> 개월</p>
                        </div>
                    </div>
                    <!-- 직군 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project_find/svg/job-group.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">직군</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0" class="job_group">웹 개발자</p>
                        </div>
                    </div>
                    <!-- 필요스킬 -->
                    <!-- 포이치문으로 skill 전부 다가져오기 -->
                    <div class="mb-3">
                        <div class="badge rounded-pill me-2 mb-1 fs-7">Java</div>
                        <div class="badge rounded-pill me-2 mb-1 fs-7">JavaScript</div>
                        <div class="badge rounded-pill me-2 mb-1 fs-7">Spring</div>
                    </div>
                    <!-- 경계선 -->
                    <hr class="custom-hr" />

                    <!-- 프로젝트 세부 내용 -->
                    <div class="mb-3">
                        <div class="d-flex">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project_find/svg/content.svg" style="max-width: 30px; max-height: 30px" />
                            <p class="card-title fs-5">프로젝트 세부 내용</p>
                        </div>

                        <p class="card-text">
                            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Repellat quibusdam iure dolorum sit vero dolore porro in velit sed
                            laudantium voluptate rem corrupti numquam eos fugiat, eum id labore modi?
                        </p>
                    </div>

                    <!-- 끝단 -->
                </div>
            </div>
            <!-- side request-form card -->
            <div class="card col-4 bg-primary rounded-lg me-2 p-3 h-100">
                <p class="card-title fs-5">해당 프로젝트가 마음에 드시나요?</p>
                <p class="card-subtitle ms-1 mb-3">지금바로 매칭해보세요.</p>
                <!-- 비로그인시 -->
                <button class="btn btn-primary my-2 mx-4" style="display: none">로그인 / 회원가입</button>
                <!-- 로그인시 -->
                <button class="btn btn-primary my-2 mx-4">매칭하기</button>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>

