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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/project/project.css">

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
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/money.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">예상 금액</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0"><span class="money_min">200</span> 만원 ~ <span class="money_max">400</span> 만원</p>
                        </div>
                    </div>
                    <!-- 시작 예정일 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/calendar.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">시작 예정일</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0">2024-08-29</p>
                        </div>
                    </div>
                    <!-- 예상 기간 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/date-range.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">예상 기간</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0"><span class="month_range">2</span> 개월</p>
                        </div>
                    </div>
                    <!-- 직군 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/job-group.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">직군</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0">웹 개발자</p>
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
                    <!-- 필요스킬 -->
                    <!-- 포문으로 skill 전부 다가져오기 -->
                    <div class="mb-3">
                        <div class="badge rounded-pill me-2 mb-1 fs-7">Java</div>
                        <div class="badge rounded-pill me-2 mb-1 fs-7">JavaScript</div>
                        <div class="badge rounded-pill me-2 mb-1 fs-7">Spring</div>
                    </div>
                    <!-- 경계선 -->
                    <hr class="custom-hr" />

                    <!-- 프로젝트 세부 내용 -->
                    <div class="mb-3">
                        <div class="d-flex mb-2">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/content.svg" style="max-width: 30px; max-height: 30px" />
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
            <div class="card col-4 bg-primary rounded-lg me-2 p-3">
                <div class="card-body" id="sideCardBody_background">
                    <div id="matching_Title">
                        <p class="card-title fs-5">해당 프로젝트가 마음에 드시나요?</p>
                        <p class="card-subtitle ms-1 mb-3">지금바로 매칭해보세요.</p>
                    </div>

                    <!-- 매칭하기 클릭시 -->
                    <div class="requestForm mx-2" id="requestForm" style="display: none">
                        <div>
                            <p class="fs-5">요청서를 작성하세요</p>
                        </div>
                        <!-- 한줄 자기소개 -->
                        <div class="mb-4">
                            <label for="request_title" class="mb-1">소개(타이틀)</label>
                            <input
                                    type="text"
                                    class="form-control bg-dark"
                                    id="request_title"
                                    placeholder="한줄로 자신을 소개해 주세요."
                                    autocomplete="off"
                            />
                        </div>
                        <!-- 직무 선택(selected) -->
                        <div class="mb-4">
                            <label for="request_jobGroup" class="mb-1">직무(선택)</label>
                            <select class="form-select bg-dark" aria-label="Default select example" id="request_jobGroup">
                                <option selected>직무를 선택하세요</option>
                                <option value="1">앱 개발자</option>
                                <option value="2">웹 개발자</option>
                                <option value="3">시스템 개발자</option>
                            </select>
                        </div>
                        <!-- 경력(년차) 입력(숫자만 입력하기) -->
                        <div class="row d-flex align-items-center mb-4">
                            <label for="request_job_history" class="mb-1">경력</label>
                            <div class="col-4">
                                <input type="text" class="form-control bg-dark" id="request_job_history" placeholder="숫자" autocomplete="off" />
                            </div>
                            <div class="col-4">년차</div>
                        </div>
                        <!-- 보유 스킬 -->
                        <div class="mb-4">
                            <label for="request_skill" class="mb-1">보유스킬</label>
                            <select class="form-select bg-dark mb-2" id="request_skill">
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

                        <!-- 프리랜서 경험 -->
                        <div class="mb-4">
                            <label class="request_experience d-block mb-1">프리랜서 경험</label>
                            <div class="form-check form-check-inline mx-3">
                                <input type="radio" class="form-check-input" name="experience" id="experience_true" value="true" />
                                <label for="experience_true" class="form-check-label">있다</label>
                            </div>
                            <div class="form-check form-check-inline ms-3">
                                <input type="radio" class="form-check-input" name="experience" id="experience_false" value="false" />
                                <label for="experience_false" class="form-check-label">없다</label>
                            </div>
                        </div>

                        <!-- 희망급여-->
                        <div class="row d-flex align-items-center mb-4">
                            <label for="request_minMoney" class="mb-1">희망금액</label>
                            <div class="col-5">
                                <input type="text" class="form-control bg-dark" id="request_minMoney" placeholder="최소(만원)" autocomplete="off" />
                            </div>
                            <div class="col-1">~</div>
                            <div class="col-5">
                                <input type="text" class="form-control bg-dark" id="request_maxMoney" placeholder="최대(만원)" autocomplete="off" />
                            </div>
                        </div>

                        <!-- 프로젝트 시작 가능일 -->
                        <div class="mb-4">
                            <label for="request_startDate" class="mb-2">프로젝트 시작 가능일</label>
                            <input type="date" class="form-control bg-dark" id="request_startDate" />
                        </div>

                        <!-- 이력서 / 경력증명서 / 포토폴리오-->
                        <div class="mb-4">
                            <label for="formFile" class="form-label">이력서 / 경력증명서 / 포토폴리오</label>
                            <p style="font-size: 12px; color: #aaaaaa">* 하나의 pdf 파일로 올려주세요</p>
                            <input class="form-control bg-dark" type="file" id="formFile" />
                        </div>

                        <!-- 약관 동의 -->
                        <div class="mb-4 pt-5">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="true" id="agree_1" />
                                <label class="form-check-label" for="agree_1"> [필수] 이용약관 동의합니다. </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="true" id="agree_2" />
                                <label class="form-check-label" for="agree_2"> [필수] 개인 정보 제 3자 제공 동의 </label>
                            </div>
                        </div>
                    </div>
                    <!-- 로그인시 -->
                    <div class="card">
                        <button type="button" class="btn btn-primary" id="matching_button">매칭하기</button>
                    </div>
                    <div class="card">
                        <button type="submit" class="btn btn-primary" id="agree_button" style="display: none">승인하기</button>
                    </div>
                    <!-- 비로그인시 -->
                    <div class="card">
                        <button class="btn btn-primary my-2 mx-4" style="display: none">로그인 / 회원가입</button>
                    </div>

                    <!-- 끝단 -->
                </div>
            </div>
            <!-- side rquest-form end-->

        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>
<script>
    //숫자만 입력할수 있는 (input text 타입)
    document.getElementById("request_job_history").addEventListener("keypress", function (event) {
        //숫자가 아닐 경우
        if (!/\d/.test(event.key)) {
            // 입력을 방지
            event.preventDefault();
        }
    });

    const selectElement = document.getElementById("request_skill");
    const badgeContainer = document.getElementById("badge_container");
    const hiddenInput = document.getElementById("selected-skills");

    selectElement.addEventListener("change", function () {
        const selectValue = this.value;

        //이미 선택된 배지인지 확인
        const existingBadges = Array.from(badgeContainer.getElementsByClassName("badge"));
        const existingBadge = existingBadges.find((badge) => badge.textContent === this.value);
        if (existingBadge) {
            existingBadge.remove();
            updateHiddenInput();
        } else {
            const badge = document.createElement("p");
            badge.className = "badge mb-1 me-2";
            badge.textContent = this.value;
            badgeContainer.appendChild(badge);
            // 숨겨진 입력 필드 업데이트
            updateHiddenInput();
        }
        // 선택 초기화 (다시 처음 상태로)
        selectElement.selectedIndex = 0;
    });

    //나중에 어떻게 보낼지 생각해봐야함!
    //현재는 배열에 저장하고 있음
    function updateHiddenInput() {
        const badges = Array.from(badgeContainer.getElementsByClassName("badge"));
        const selectedSkills = badges.map((badge) => badge.textContent);

        let result_skill = "";
        for (let i = 0; i < selectedSkills.length; i++) {
            if (i === selectedSkills.length - 1) {
                result_skill += selectedSkills[i];
            } else {
                result_skill += selectedSkills[i] + ",";
            }
        }

        console.log(selectedSkills);
        console.log(result_skill);
        //나중에 넘겨줄 값은 result_skill String 값으로 hidden 으로 넘겨주고 java 단에서 ',' 로 나눠서 배열에 담고 배열 갯수만큼 스킬 저장
    }

    //로그인 되고 나서 매칭시 버튼 클릭시 폼 보여주기
    document.getElementById("matching_button").addEventListener("click", () => {
        document.querySelector("#sideCardBody_background").style.height = "1000px";
        document.querySelector("#matching_Title").style.display = "none";
        document.querySelector("#requestForm").style.display = "block";
        document.querySelector("#matching_button").style.display = "none";
        document.querySelector("#agree_button").style.display = "block";
    });
</script>
</body>
</html>

