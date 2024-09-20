<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>freelancer_read</title>
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

<!-- Main Content -->
<div class="container my-4 mx-5 px-5 py-5">
    <!-- main -->
    <div class="container mt-5">
        <div class="container row align-items-start">
            <!-- freelancer Read card -->
            <div class="card col-xl-7 bg-primary rounded-lg me-2 p-3 h-100">
                <div class="card-body" style="height: 1000px">
                    <!-- 타이틀 -->
                    <p class="card-title fs-3" style="height: 90px">${freelancerDTO.getUser_name()}</p>

                    <!-- 현재 상태 -->

                    <!-- 구직중 일때 -->
                    <c:if test="${freelancerDTO.getFreelancer_state() == '구직중'}">
                        <p class="badge rounded-pill fs-7">${freelancerDTO.getFreelancer_state()}</p>
                    </c:if>
                    <!-- 진행중 일때 -->
                    <c:if test="${freelancerDTO.getFreelancer_state() == '진행중'}">
                        <p class="badge rounded-pill bg-secondary fs-7">${freelancerDTO.getFreelancer_state()}</p>
                    </c:if>
                    <!-- 완료 일때 -->
                    <c:if test="${freelancerDTO.getFreelancer_state() == '완료'}">
                        <p class="badge rounded-pill bg-secondary fs-7">${freelancerDTO.getFreelancer_state()}</p>
                    </c:if>

                    <!-- 예상 금액 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/freelancer/svg/money.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">희망 월급</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0"><span class="money_min"><fmt:formatNumber value="${freelancerDTO.getFreelancer_salary()}" pattern="###,###,###"/></span> 만원</p>
                        </div>
                    </div>

                   <!-- 업무 시작 가능일 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/freelancer/svg/calendar.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">시작 가능일</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <fmt:parseDate value="${freelancerDTO.getFreelancer_startdate()}" var="parsedDate" pattern="yyyy-MM-dd" />
                            <fmt:formatDate value="${parsedDate}" pattern="yyyy년 MM월 dd일" />
                        </div>
                    </div>

                    <!-- 직군 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/freelancer/svg/job-group.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">직군</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0">${freelancerDTO.getJob_name()}</p>
                        </div>
                    </div>

                    <!-- 필요경력 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/freelancer/svg/job-history.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">경력</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0"> ${freelancerDTO.getDev_exp()}년</p>
                        </div>
                    </div>

                    <!-- 필요스킬 -->
                    <!-- 포문으로 skill 전부 다가져오기 -->
                    <div class="mb-3">
                        <c:forEach items="${freelancerDTO.getSkills()}" var="skill">
                        <div class="badge rounded-pill me-2 mb-1 fs-7">${skill.getSkill_name()}</div>
                        </c:forEach>
                    </div>

                    <!-- 경계선 -->
                    <hr class="custom-hr" />

                    <!-- 프로젝트 세부 내용 -->
                    <div class="mb-3">
                        <div class="d-flex mb-2">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/freelancer/svg/content.svg" style="max-width: 30px; max-height: 30px" />
                            <p class="card-title fs-5">프로젝트 세부 내용</p>
                        </div>
                        <!-- 공백과 줄바꿈을 그대로 반영하는 pre 태그 사용 -->
                        <pre class="card-text">${freelancerDTO.getFreelancer_introduction()}</pre>
                    </div>

                    <!-- 끝단 -->
                </div>
            </div>

            <!-- side request-form card -->
            <div class="card col-xl-4 bg-primary rounded-lg me-2 p-3">
                <div class="card-body" id="sideCardBody_background">
                    <div id="matching_Title">
                        <p class="card-title fs-5">해당 프로젝트가 마음에 드시나요?</p>
                        <p class="card-subtitle ms-1 mb-3">지금바로 매칭해보세요.</p>
                    </div>

                    <!-- 매칭하기 클릭시 -->
                    <div class="requestForm container mx-2" id="requestForm" style="display: none">
                        <div>
                            <p class="fs-5">요청서를 작성하세요</p>
                        </div>

                        <!-- 폼 시작 -->
                        <form action="${pageContext.request.contextPath}/freelancerReadReq" method="post" id="freelancerReadForm">
                            <!-- 한줄 자기소개 -->
                            <div class="mb-4">
                                <label for="request_title" class="mb-1">소개(타이틀)</label>
                                <input type="text"
                                       class="form-control bg-dark"
                                       id="request_title"
                                       name="f_request_title"
                                       placeholder="한줄로 자신을 소개해 주세요."
                                       autocomplete="off"
                                       required />
                            </div>

                            <!-- 직무 선택(selected) -->
                            <div class="mb-4">
                                <label for="request_jobGroup" class="mb-1">직무(선택)</label>
                                <select class="form-select bg-dark" id="request_jobGroup" name="job_id" required>
                                    <option value="" disabled selected>직무를 선택하세요</option>
                                    <option value="1" >앱 개발자</option>
                                    <option value="2">웹 개발자</option>
                                    <option value="3">시스템 개발자</option>
                                </select>
                            </div>

                            <!-- 경력(년차) 입력(숫자만 입력하기) -->
                            <div class="row d-flex align-items-center mb-4">
                                <label for="request_job_history" class="mb-1">경력</label>
                                <div class="col-4">
                                    <input type="text"
                                           class="form-control bg-dark"
                                           id="request_job_history"
                                           name="f_request_history"
                                           placeholder="숫자"
                                           autocomplete="off"
                                           required />
                                </div>
                                <div class="col-4">년차</div>
                            </div>

                            <!-- 보유 스킬 -->
                            <div class="mb-4">
                                <label for="skill" class="mb-1">보유스킬</label>
                                <select class="form-select bg-dark mb-2" id="skill">
                                    <option value="" selected>스킬선택</option>
                                    <c:forEach items="${freelancerSkillList}" var="skill">
                                        <option value="${skill.getSkill_id()}">${skill.getSkill_name()}</option>
                                    </c:forEach>
                                </select>

                                <div id="badge_container">
                                    <c:if test="${! empty freelancerRequestDTO}">
                                        <c:forEach items="${freelancerRequestDTO.getSkills()}" var="skills">
                                        <p class="badge rounded-pill mb-1 me-2" id="skillSelectBadge">${skills.getSkill_name()}</p>
                                        </c:forEach>
                                    </c:if>
                                    <!--클릭시 베지 추가-->
                                </div>

                                <input type="hidden" name="skillList" id="skillList" required/>
                            </div>

                            <!-- 프리랜서 경험 -->
                            <div class="mb-4">
                                <label class="request_experience d-block mb-1">프리랜서 경험</label>
                                <div class="form-check form-check-inline mx-3">
                                    <input type="radio" class="form-check-input" name="f_request_exp" id="experience_true" value="true" required />
                                    <label for="experience_true" class="form-check-label">있다</label>
                                </div>
                                <div class="form-check form-check-inline ms-3">
                                    <input type="radio" class="form-check-input" name="f_request_exp" id="experience_false" value="false" required />
                                    <label for="experience_false" class="form-check-label">없다</label>
                                </div>
                            </div>

                            <!-- 희망급여-->
                            <div class="row d-flex align-items-center mb-4">
                                <label for="money" class="mb-1">희망금액</label>
                                <div class="col-5">
                                    <input type="text"
                                           class="form-control bg-dark"
                                           id="money"
                                           name="f_request_money"
                                           placeholder="숫자입력"
                                           autocomplete="off"
                                           required />
                                </div>
                                <div class="col-2"> 만원</div>
                            </div>

                            <!-- 프로젝트 시작 가능일 -->
                            <div class="mb-4">
                                <label for="request_startDate" class="mb-2">프로젝트 시작 가능일</label>
                                <input type="date" class="form-control bg-dark" id="request_startDate" name="f_request_startDate" required/>
                            </div>

                            <!-- 이력서 / 경력증명서 / 포토폴리오-->
                            <div class="mb-4">
                                <label for="formFile" class="form-label">이력서 / 경력증명서 / 포토폴리오</label>
                                <p style="font-size: 12px; color: #aaaaaa">* 하나의 pdf 파일로 올려주세요</p>
                                <input class="form-control bg-dark" type="file" id="formFile" name="file"
<%--                                       accept=".pdf" --%>
                                       required/>
                                <!-- 파일업로드 후 승인요청 시 파일 다운로드 할수있게 보여줌 -->
                                <div class="form-control bg-dark" type="text" id="requestFile" style="display: none">
                                    <a href="${pageContext.request.contextPath}/resources/upload/${freelancerRequestFileDTO.getP_file_name()}"
                                       download="${freelancerRequestFileDTO.getFileOriginName()}">${freelancerRequestFileDTO.getFileOriginName()}</a>
                                </div>

                            </div>

                            <!-- 약관 동의 -->
                            <div class="mb-4 pt-2">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="true" id="agree_1" required />
                                    <label class="form-check-label" for="agree_1"> [필수] 이용약관 동의합니다. </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="true" id="agree_2" required />
                                    <label class="form-check-label" for="agree_2"> [필수] 개인 정보 제 3자 제공 동의 </label>
                                </div>
                            </div>

                            <div class="card" id="btn-container">
                                <button type="submit" class="btn btn-primary" id="agree_button" >승인하기</button>
                            </div>
                        </form>
                        <!-- 폼 end -->
                    </div>

                    <!-- 성공 시 모달창 -->
                    <div class="modal fade mt-5" id="inputAlert_true" tabindex="-1"  aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content bg-primary ps-2 pt-2">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-6" id="agreeTitle">승인요청 완료 하였습니다.</h1>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal" >돌아가기</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 실패 시 모달창 -->
                    <div class="modal fade mt-5" id="inputAlert_false" tabindex="-1"  aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content bg-primary ps-2 pt-2">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-6" id="disagreeTitle">승인 요청 오류 (관리자 문의 바랍니다).</h1>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal" >돌아가기</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 로그인시 -->
                    <div class="card" id="matching_button">
                        <button type="button" class="btn btn-primary">매칭하기</button>
                    </div>

                    <!-- 비로그인시 -->
                    <div class="card" style="display: none">
                        <button class="btn btn-primary my-2 mx-4" >로그인 / 회원가입</button>
                    </div>

                </div>
            </div>
            <!-- side rquest-form end-->
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
></script>

</script>
<%-- <script src="${pageContext.request.contextPath}/resources/freelancer/freelancer_read.js"></script> --%>


</body>
</html>
