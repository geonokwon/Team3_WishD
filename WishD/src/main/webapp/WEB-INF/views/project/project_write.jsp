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
<div class="container my-4 mx-5 px-5 pt-5" style="width: 1040px">
    <div class="d-flex align-items-start">
        <img class="float-start mt-1" src="${pageContext.request.contextPath}/resources/project/images/speaker.png" />
        <h2 class="ms-2 mb-0">프로젝트 정보를 입력해 주세요</h2>
    </div>
    <div class="card p-2 mt-2">
        <div class="row card-body bg-primary">
            <p style="font-size: 14px">
                입력하신 정보는 프로젝트 매칭 이외의 <br />
                용도로는 사용되지 않습니다.
            </p>
            <!-- 제목 타이틀 -->
            <div class="ms-2 mb-4">
                <label for="title" class="mb-1 ms-2">제목(타이틀)</label>
                <input
                        type="text"
                        class="form-control bg-dark"
                        id="title"
                        placeholder="프로젝트 타이틀을 입력해 주세요."
                        autocomplete="off"
                        style="width: 600px"
                />
            </div>
            <!-- 직무 선택 -->
            <div class="ms-2 mb-4">
                <label for="jobGroup" class="mb-1">직무(선택)</label>
                <select class="form-select bg-dark" id="jobGroup" style="width: 320px">
                    <option selected>직무를 선택하세요</option>
                    <option value="1">앱 개발자</option>
                    <option value="2">웹 개발자</option>
                    <option value="3">시스템 개발자</option>
                </select>
            </div>

            <!-- 필요 스킬 -->
            <div class="col-4 ms-2 me-5 mb-4">
                <label for="skill" class="mb-1">프로젝트 에 필요한 스킬을 선택</label>
                <p style="font-size: 14px">(필요 스킬 복수 선택 가능)</p>
                <select class="form-select bg-dark mb-2" id="skill">
                    <option value="" selected>스킬선택</option>
                    <option value="Java">Java</option>
                    <option value="Python">Python</option>
                    <option value="JavaScript">JavaScript</option>
                </select>
                <div id="badge_container">
                    <!--클릭시 베지 추가-->
                </div>
                <!-- 자바단으로 넘겨줄떼 히든으로 text 값 그대로 넘겨줄지 고민-->
                <input type="hidden" id="" name="" />
            </div>
            <!-- 프로젝트 보수 -->
            <div class="col-4 ms-2 mb-4">
                <label for="money" class="mb-1 ms-2">프로젝트 보수</label>
                <p class="ms-2" style="font-size: 14px">(프로젝트 단위)</p>
                <div class="row align-items-center">
                    <div class="col-auto">
                        <input type="text" class="form-control bg-dark" id="money" placeholder="프로젝트 단위 금액" autocomplete="off" />
                    </div>
                    <div class="col-auto ms-2">
                        <label for class="mb-0">만원</label>
                    </div>
                </div>
            </div>
            <!-- 프로젝트 시작 날짜 -->
            <div class="col-4 ms-2 me-5 mb-4">
                <label for="startDate" class="mb-2">프로젝트 시작 희망일</label>
                <input type="date" class="form-control bg-dark" id="startDate" />
            </div>
            <!-- 프로젝트 진행 예상 기간-->
            <div class="col-4 ms-2 mb-4">
                <label for="range_month" class="mb-1 ms-2">프로젝트 진행 예상 기간</label>
                <div class="row align-items-center">
                    <div class="col-5">
                        <input type="text" class="form-control bg-dark" id="range_month" placeholder="개월 수" autocomplete="off" />
                    </div>
                    <div class="col-auto ms-2">
                        <label for class="mb-0">개월</label>
                    </div>
                </div>
            </div>
            <!-- 프로젝트 세부 내용 -->
            <div class="col-10 ms-2 mb-4">
                <label for="contnet" class="form-label">프로젝트 세부 내용</label>
                <textarea class="form-control bg-dark" id="contnet" style="height: 300px; resize: none"></textarea>
            </div>
            <!-- 경계선 -->
            <hr class="custom-hr" />
            <p style="font-size: 14px">여기서 부터 입력하신 정보는 노출되지 않는 정보입니다.</p>
            <!--기업 및 사업자 명-->
            <div class="col-4 ms-2 me-5 mb-5">
                <label for="companyName" class="mb-1 ms-2">기업 및 사업자 명</label>
                <input type="text" class="form-control bg-dark" id="companyName" placeholder="ex) (주)WhisD." autocomplete="off" />
            </div>
            <!-- 프로젝트 등록 담당자 연락처 -->
            <div class="col-4 ms-2 mb-5">
                <label for="companyManager_phone" class="mb-1 ms-2">프로젝트 등록 담당자 연락처</label>
                <input type="text" class="form-control bg-dark" id="companyManager_phone" placeholder=" ‘-’ 까지 작성해 주세요." autocomplete="off" />
            </div>

            <!-- 등록하기 버튼 -->
            <div class="row container mt-5 px-5 justify-content-center">
                <button type="button" class="col-4 me-3 btn btn-primary" >등록하기</button>
                <button type="button" class="col-2 btn btn-primary" >돌아가기</button>
            </div>
        </div>
    </div>
    <div class="noite"></div>

    <div class="constelacao"></div>

    <div class="chuvaMeteoro"></div>
</div>
<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
></script>
<script src="${pageContext.request.contextPath}/resources/project/project.js"></script>
</body>
</html>

