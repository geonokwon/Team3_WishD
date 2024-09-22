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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerP.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style_temp.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerAside.css">
	<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sidebars/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

</head>
<body class="d-flex flex-column min-vh-100 justify-content">
<!-- Header -->
<jsp:include page="../include/heard.jsp"/>

<div class="wrap">
<!-- Aside -->
<jsp:include page="../include/managerAside.jsp"/>

<!-- Main Content -->
<div class="container my-4 mx-5 px-5 py-5">
    <!-- main -->
    <div class="container mt-5">
        <div class="container row align-items-start">
            <!-- project Read card -->
            <div class="card col-xl-7 bg-primary rounded-lg me-2 p-3 h-100">
                <div class="card-body project-details" style="height: 1000px">
                    <!-- 타이틀 -->
                    <p class="card-title fs-3" style="height: 90px">${projectDTO.getPboard_title()}</p>

                    <!-- 현재 상태 -->

                    <!-- 모집중 일때 -->
                    <c:if test="${projectDTO.getPboard_state() == '모집중'}">
                        <p class="badge rounded-pill fs-7">${projectDTO.getPboard_state()}</p>
                    </c:if>
                    <!-- 진행중 일때 -->
                    <c:if test="${projectDTO.getPboard_state() == '진행중'}">
                        <p class="badge rounded-pill bg-secondary fs-7">${projectDTO.getPboard_state()}</p>
                    </c:if>
                    <!-- 완료 일때 -->
                    <c:if test="${projectDTO.getPboard_state() == '완료'}">
                        <p class="badge rounded-pill bg-secondary fs-7">${projectDTO.getPboard_state()}</p>
                    </c:if>

                    <!-- 예상 금액 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/money.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">예상 금액</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0"><span class="money_min"><fmt:formatNumber value="${projectDTO.getPboard_money()}" pattern="###,###,###"/></span> 만원</p>
                        </div>
                    </div>

                    <!-- 시작 예정일 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/calendar.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">시작 예정일</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0">
                                <fmt:parseDate value="${projectDTO.getPboard_startDate()}" var="parsedDate" pattern="yyyy-MM-dd" />
                                <fmt:formatDate value="${parsedDate}" pattern="yyyy년 MM월 dd일" />
                            </p>
                        </div>
                    </div>

                    <!-- 예상 기간 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/date-range.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">예상 기간</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0"><span class="month_range">${projectDTO.getPboard_rangeMonth()}</span> 개월</p>
                        </div>
                    </div>

                    <!-- 직군 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/job-group.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">직군</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0">${projectDTO.getJob_id()}</p>
                        </div>
                    </div>

                    <!-- 필요경력 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/job-history.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">경력</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0">2 년차</p>
                        </div>
                    </div>
                    
                    <!-- 회사명 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" style="width: 20px; height: 20px" />
                            <p class="mb-0">회사명</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0">${projectDTO.getPboard_company_name()}</p>
                        </div>
                    </div>
                    
                    <!-- 회사명 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/img/btn_nextpage.png" style="width: 20px; height: 20px" />
                            <p class="mb-0">회사 연락처</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0">${projectDTO.getPboard_manager_phone()}</p>
                        </div>
                    </div>

                    <!-- 필요스킬 -->
                    <!-- 포문으로 skill 전부 다가져오기 -->
                    <div class="mb-3">
                        <c:forEach items="${projectDTO.getSkills()}" var="skill">
                        <div class="badge rounded-pill me-2 mb-1 fs-7">${skill.getSkill_name()}</div>
                        </c:forEach>
                    </div>

                    <!-- 경계선 -->
                    <hr class="custom-hr" />

                    <!-- 프로젝트 세부 내용 -->
                    <div class="mb-3">
                        <div class="d-flex mb-2">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/content.svg" style="max-width: 30px; max-height: 30px" />
                            <p class="card-title fs-5">프로젝트 세부 내용</p>
                        </div>
                        <div class="overlay-container"  style="height: 520px">
                            <c:if test="${!empty sessionScope.user_no}">
                                <!-- 로그인된 경우 프로젝트 세부 내용 표시 -->
                                <pre class="card-text">${projectDTO.getPboard_content()}</pre>
                            </c:if>
                            <c:if test="${empty sessionScope.user_no}">
                                <!-- 로그인되지 않은 경우 오버레이와 로그인 버튼 표시 -->
                                <pre class="card-text">${projectDTO.getPboard_content()}</pre>
                                <div class="overlay-message active">
                                    <div>
                                        <button class="btn btn-primary my-2 mx-4" onclick="location.href='${pageContext.request.contextPath}/login'">로그인 / 회원가입</button>
                                    </div>
                                </div>
                            </c:if>
                        </div>
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
                        <form action="${pageContext.request.contextPath}/manager/freelancerApprove/${projectDTO.getPboard_id()}" method="post" id="projectReadForm">
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
                                    <c:forEach items="${projectSkillList}" var="skill">
                                        <option value="${skill.getSkill_id()}">${skill.getSkill_name()}</option>
                                    </c:forEach>
                                </select>

                                <!--클릭시 베지 추가-->
                                <div id="badge_container">
                                    <c:if test="${! empty projectRequestDTO}">
                                        <c:forEach items="${projectRequestDTO.getSkills()}" var="skillList">
                                            <div class="badge rounded-pill mb-1 me-2" id="skillSelectBadge">${skillList.getSkill_name()}</div>
                                        </c:forEach>
                                    </c:if>
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
                                    <a href="${pageContext.request.contextPath}/resources/upload/${projectRequestFileDTO.getP_file_name()}"
                                       download="${projectRequestFileDTO.getFileOriginName()}">${projectRequestFileDTO.getFileOriginName()}</a>
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
                                    <h1 class="modal-title fs-6" id="agreeTitle">승인되었습니다.</h1>
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
                                    <h1 class="modal-title fs-6" id="disagreeTitle">승인 도중에 오류가 발생했습니다.</h1>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal" >돌아가기</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!-- side rquest-form end-->
        </div>
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
<script>
    if(${projectRequestDTO != null }){
        $("#sideCardBody_background").css("height", "1000px");
        $("#matching_Title").hide();
        $("#requestForm").show();
        $("#matching_button").hide();
        $("#agree_button").show();
        $("#badge_container").hide();
        $("#matching_button_waiting").hide();


        //프로젝트 등록한 사람은 전부 disabled 처리 하고 버튼 승인 대기중 변경
        let requestForm = $("#projectReadForm");
        requestForm.find('a').on('click', (e) => {
            e.preventDefault();
        })
        requestForm.find('input, select').prop('disabled', true);
        // form.find('select').prop('disabled', true);
        requestForm.find('input[type="checkbox"], input[type=radio], input[type=file]').prop('disabled', true);
        //배지에 class 에 "disabled" 추가해서 클릭이벤트시 막게 한다
        $('#badge_container .badge').addClass('disabled');

//         let agree_button = $('#agree_button');
//         agree_button.prop('disabled', true);
//         agree_button.text("승인 대기중");
        //승인 요청 완료 후 프로젝트 등록한 사람은 request_freelancer 에 등록한 사람의 승인 완료시

        //projectRequestDTO
        let sessionUserNo = parseInt("${sessionScope.user_no}");
        console.log("sessionUserNo : " + sessionUserNo);
        let projectUserNo = parseInt("${projectDTO.getUser_no()}")
        console.log("projectUserNo : " + projectUserNo);
        let requestUserNo = parseInt("${projectRequestDTO.getUser_no()}");
        console.log("requestUserNo : " +requestUserNo);
        let isAgree = "${projectRequestDTO.getF_request_isAgree()}";

        
            $("#formFile").hide();
            $("#requestFile").show();
            $("#badge_container").show();

            //한줄 자기 소개
            $("#request_title").val("${projectRequestDTO.getF_request_title()}");

            //직군
            $("#request_jobGroup").val(${projectRequestDTO.getJob_id()});

            //경력
            $("#request_job_history").val(${projectRequestDTO.getF_request_history()});

            //프리랜서 경험 ( true , false ) 값을 반환하고 radio 박스이므로 checked 처리함
            let experience = "${projectRequestDTO.getF_request_exp()}";
            if (experience === "true") {
                $("#experience_true").prop("checked", true);
            } else {
                $("#experience_false").prop("checked", true);
            }

            //희망금액
            $("#money").val(${projectRequestDTO.getF_request_money()});

            //진행가능 날짜 형식 맞춤
            let date = "${projectRequestDTO.getF_request_startDate()}".split(" ")[0];
            $("#request_startDate").val(date);

            //각종동의
            $("#agree_1").prop("checked", true);
            $("#agree_2").prop("checked", true);


            if(sessionUserNo === projectUserNo && isAgree === "true"){
                //버튼 비활성화
                agree_button.hide();
                //다운로드 a태그 활성화
                requestForm.find('a').off('click');
                // 버튼을 동적으로 추가할 HTML 문자열
                let matchButtonHtml = '<button type="button" class="btn btn-primary mb-2" id="match_button">매칭</button>';
                let cancelButtonHtml = '<button type="button" class="btn btn-secondary" id="cancel_button">취소</button>';

                // 버튼을 추가할 div 선택
                let buttonContainer = $('#btn-container');

                // 버튼들을 추가
                buttonContainer.append(matchButtonHtml);
                buttonContainer.append(cancelButtonHtml);

                // 버튼 클릭 이벤트 처리
                $('#match_button').click(function() {
                    console.log('매칭 버튼 클릭됨');
                    location.href="${pageContext.request.contextPath}/chatting/${projectDTO.getPboard_id()}"
                });

                $('#cancel_button').click(function() {
                    console.log('취소 버튼 클릭됨');
                    location.href="${pageContext.request.contextPath}/projectReqFalse/${projectDTO.getPboard_id()}"
                });
            }
    }
</script>
<script src="${pageContext.request.contextPath}/resources/project/project.js"></script>
<script>
    $(document).ready(function() {
        $('#projectReadForm').on('submit', function(event) {
            $('#agree_button').prop('disabled', true);
            event.preventDefault(); // 폼의 기본 제출 동작을 방지
            const form = $(this);

            //formData 형식으로 반환
            const formData = new FormData(this);
            console.log(formData);

            //비동기 ajax 처리
            $.ajax({
                url: '${pageContext.request.contextPath}/manager/freelancerApprove/${projectDTO.getPboard_id()}',
                type: 'POST', //post 방식
                data: formData,
                contentType: false, // jQuery가 자동으로 설정한 컨텐츠 타입을 사용하지 않음
                processData: false, // jQuery가 자동으로 데이터를 처리하지 않음
                success: function(response) {
                    if (response) {
                        // 성공적으로 데이터가 제출되었을 때의 처리
                        let trueModal = new bootstrap.Modal(document.getElementById('inputAlert_true'), {
                            keyboard: false
                        });
                        trueModal.show();
                        //현재 성공적으로 제출되었을때 승인 대기중이므로 disabled 처리
                        form.find('input, select').prop('disabled', true);
                        // form.find('select').prop('disabled', true);
                        form.find('input[type="checkbox"], input[type=radio], input[type=file]').prop('disabled', true);
                        //배지에 class 에 "disabled" 추가해서 클릭이벤트시 막게 한다
                        $('#badge_container .badge').addClass('disabled');

                        //버튼 비활성화
//                         let agree_button = $('#agree_button');
//                         agree_button.prop('disabled', true);
//                         agree_button.text("승인 대기중");
                    }
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 처리
                    let falseModal = new bootstrap.Modal(document.getElementById('inputAlert_false'), {
                        keyboard: false
                    });
                    falseModal.show();
                    $('#agree_button').prop('disabled', false);
                }
            });
        });
    });
</script>

</body>
</html>

