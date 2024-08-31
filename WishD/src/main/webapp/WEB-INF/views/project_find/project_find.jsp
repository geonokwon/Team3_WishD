<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/project_find/project_find.css">

</head>
<body class="d-flex flex-column min-vh-100 justify-content">
<!-- Header -->
<jsp:include page="../include/heard.jsp"/>

<!-- Main Content -->
<div class="container my-4 mx-5 px-5 py-5">
    <!-- header -->
    <div class="container">
        <div class="row align-items-center px-4">
            <!-- 제목 -->
            <div class="col">
                <div class="d-flex align-items-center">
                    <img class="float-start" src="${pageContext.request.contextPath}/resources/project_find/image/speaker.png" />
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
                        <li><a class="dropdown-item" href="#">Java</a></li>
                        <li><a class="dropdown-item" href="#">JavaScript</a></li>
                        <li><a class="dropdown-item" href="#">Spring</a></li>
                        <li><a class="dropdown-item" href="#">Spring Boot</a></li>
                        <li><a class="dropdown-item" href="#">TypeScript</a></li>
                        <li><a class="dropdown-item" href="#">React</a></li>
                        <li><a class="dropdown-item" href="#">Nest.js</a></li>
                    </ul>
                </div>
            </div>

            <!-- 검색 창 -->
            <div class="col-auto ms-auto">
                <div class="input-group">
                    <input type="text" class="form-control text border-0 bg-primary" style="width: 200px" placeholder="프로젝트명 검색" />
                    <button class="btn bg-primary"><img src="${pageContext.request.contextPath}/resources/project_find/svg/search.svg" alt="Search" /></button>
                </div>
            </div>
        </div>
    </div>

    <div class="col-12 mt-4 mb-2 px-5">
        <div class="d-flex">
            <div class="ms-1 me-3">프로젝트 52개</div>
            <div class="me-4">|</div>
            <a class="me-4 nav-link" href="#">최신 순</a>
            <img src="${pageContext.request.contextPath}/resources/project_find/svg/down.svg" alt="Sort" />
        </div>
    </div>

    <!-- Project Cards -->
    <div class="row">
        <!-- 반복되는 프로젝트 카드 -->
        <div class="container mb-4 px-5">
            <div class="card h-100 p-2" style="height: 200px">
                <div class="card-body">
                    <a class="nav-link mb-3 fs-4" href="#">(반상주 / 판교) HR SaaS 솔루션 인사/조직 관리 백앤드 개발</a>
                    <div class="d-flex mb-2">
                        <span class="badge me-2"># Java</span>
                        <span class="badge me-2"># spring</span>
                        <span class="badge me-2"># spring boot</span>
                    </div>
                    <p class="card-text mb-1">예상 금액: 450만원 ~ 520만원</p>
                    <p class="card-text mb-1">시작 예정일: 2024년 08월 01일</p>
                    <p class="card-text">예상 기간: 10 개월</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Pagination -->
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <li class="page-item">
                <a class="page-link" href="#"></a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#"></a>
            </li>
        </ul>
    </nav>
</div>
<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

<script>
    //드롭다운 클래스를 가진 애들이 클릭시 이벤트 추가
    document.querySelectorAll(".dropdown-item").forEach(function (item) {
        item.addEventListener("click", skillSelect);
    });

    function skillSelect() {
        //.dropdown-item 클래스의 클릭된 요소 가져오기
        let select = this.textContent;
        // 클릭된 요소를 가져와 버튼 안의 값으로 변경
        document.querySelector("#skillMenuButton").innerText = select;
    }
</script>
</body>
</html>

