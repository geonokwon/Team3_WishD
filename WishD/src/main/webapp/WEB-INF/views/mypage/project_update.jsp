<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>글 수정 | WishD</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/style_temp.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/project/project.css">

</head>
<body class="d-flex flex-column min-vh-100 justify-content">
	<!-- Header -->
	<jsp:include page="../include/heard.jsp" />

	<!-- Main Content -->
	<div class="container-sm my-5 mx-5 px-5 pt-5" style="width: 1040px">
		<div class="d-flex align-items-start mt-5">
			<img class="float-start mt-1"
				src="${pageContext.request.contextPath}/resources/project/images/speaker.png" />
			<h2 class="ms-2 mb-2">프로젝트 정보를 수정해 주세요</h2>
		</div>
		<!-- 폼 태그 시작 -->
		<form
			action="${pageContext.request.contextPath}/mypage/myprojectupdatePro"
			method="post" id="projectUpdate">
			<div class="card p-2 mt-2">
				<div class="row card-body bg-primary">
					<p style="font-size: 14px">
						입력하신 정보는 프로젝트 매칭 이외의 <br /> 용도로는 사용되지 않습니다.
					</p>
					<!-- 필요한 값 히든으로 채워주기 -->
					<input type="hidden" name="pboard_id"
						value="${myProjectDTO.pboard_id}"> <input type="hidden"
						name="user_no" value="${myProjectDTO.user_no}"> <input
						type="hidden" name="pboard_state"
						value="${myProjectDTO.pboard_state}">

					<!-- 제목 타이틀 -->
					<div class="ms-2 mb-4">
						<label for="title" class="mb-1 ms-2">제목(타이틀)</label> <input
							type="text" class="form-control bg-dark" id="title"
							name="pboard_title" placeholder="프로젝트 타이틀을 입력해 주세요."
							autocomplete="off" style="width: 600px"
							value="${myProjectDTO.pboard_title}" required />
					</div>

					<!-- 직무 선택 -->
					<div class="ms-2 mb-4">
						<label for="pboard_job" class="mb-1">직무(선택)</label> <select
							class="form-select bg-dark" id="jobGroup" name="job_id"
							style="width: 320px" required>
							<option value="" disabled>직무를 선택하세요</option>
							<c:forEach items="${myProjectJobsDTO}" var="myProjectJobs">
								<option
									<c:if test="${myProjectDTO.job_id eq myProjectJobs.job_id}">selected</c:if>
									value="${myProjectJobs.job_id}">${myProjectJobs.job_name}</option>
							</c:forEach>
						</select>
					</div>

					<!-- 필요 스킬 -->
					<div class="col-4 ms-2 me-5 mb-4">
						<label for="skill" class="mb-1">프로젝트에 필요한 스킬을 선택</label>
						<p style="font-size: 14px">(필요 스킬 복수 선택 가능)</p>
						<select class="form-select bg-dark mb-2" id="skill">
							<option value="" disabled>스킬선택</option>
							<c:forEach items="${myProjectSkillList}" var="skill">
								<option value="${skill.getSkill_id()}">${skill.getSkill_name()}</option>
							</c:forEach>
						</select>
						<div id="badge_container">
							<!--                         클릭 시 배지 추가 -->
							<!--                         기존 선택된 스킬로 배지 추가 -->
							<c:forEach items="${myProjectDTO.skills}" var="selectedSkill">
								<p class="badge rounded-pill mb-1 me-2"
									data-skill-id="${selectedSkill.getSkill_id()}">
									${selectedSkill.getSkill_name()}</p>
							</c:forEach>
						</div>
						<input type="hidden" name="skillList" id="skillList"
							value="${selectedSkill}" required />
					</div>

					<!-- 프로젝트 보수 -->
					<div class="col-4 ms-2 mb-4">
						<label for="money" class="mb-1 ms-2">프로젝트 보수</label>
						<p class="ms-2" style="font-size: 14px">(프로젝트 단위)</p>
						<div class="row align-items-center">
							<div class="col-auto">
								<input type="text" class="form-control bg-dark" id="money"
									name="pboard_money" placeholder="프로젝트 단위 금액" autocomplete="off"
									value="${myProjectDTO.pboard_money}" required />
							</div>
							<div class="col-auto ms-2">
								<label class="mb-0">만원</label>
							</div>
						</div>
					</div>

					<!-- 프로젝트 시작 날짜 -->
					<div class="col-4 ms-2 me-5 mb-4">
						<label for="startDate" class="mb-2">프로젝트 시작 희망일</label>
						<!-- name="pboard_startDate" -->
						<fmt:parseDate value="${myProjectDTO.pboard_startDate}"
							var="myProUpdateStartDate" pattern="yyyy-MM-dd" />
						<input type="date" class="form-control bg-dark" id="startDate"
							name="pboard_startDate"
							value="<fmt:formatDate value='${myProUpdateStartDate}' pattern='yyyy-MM-dd' />" />
					</div>

					<!-- 프로젝트 진행 예상 기간 -->
					<div class="col-4 ms-2 mb-4">
						<label for="range_month" class="mb-1 ms-2">프로젝트 진행 예상 기간</label>
						<div class="row align-items-center">
							<div class="col-5">
								<input type="text" class="form-control bg-dark" id="range_month"
									name="pboard_rangeMonth" placeholder="개월 수" autocomplete="off"
									value="${myProjectDTO.pboard_rangeMonth}" required />
							</div>
							<div class="col-auto ms-2">
								<label for class="mb-0">개월</label>
							</div>
						</div>
					</div>
					
					<!-- 필요년차 -->
					<div class="col-4 ms-2 mb-4">
                    <label for="range_month" class="mb-1 ms-2">프로젝트 필요 년차</label>
                    <div class="row align-items-center">
                        <div class="col-6">
                            <input type="text"
                                   class="form-control bg-dark"
                                   id="history"
                                   name="pboard_history"
                                   placeholder="년수"
                                   autocomplete="off"
                                   required
                                   value="${myProjectDTO.pboard_history}"
                            />
                        </div>
                        <div class="col-auto ms-2">
                            <label for class="mb-0">년차 이상</label>
                        </div>
                    </div>
                </div>
                
					<!-- 프로젝트 세부 내용 -->
					<div class="col-10 ms-2 mb-4">
						<label for="content" class="form-label">프로젝트 세부 내용</label>
						<textarea class="form-control bg-dark" id="content"
							name="pboard_content" style="height: 300px; resize: none"
							required>${myProjectDTO.pboard_content}</textarea>
					</div>

					<!-- 경계선 -->
					<hr class="custom-hr" />
					<p style="font-size: 14px">여기서 부터 입력하신 정보는 노출되지 않는 정보입니다.</p>

					<!--                 기업 및 사업자 명 -->
					<div class="col-4 ms-2 me-5 mb-5">
						<label for="pboard_company_name" class="mb-1 ms-2">기업 및
							사업자 명</label> <input type="text" name="pboard_company_name"
							class="form-control bg-dark" id="pboard_company_name"
							placeholder="ex) (주)WhisD." autocomplete="off"
							value="${myProjectDTO.pboard_company_name}" required />
					</div>

					<!--                 프로젝트 등록 담당자 연락처 -->
					<div class="col-4 ms-2 mb-5">
						<label for="pboard_manager_phone" class="mb-1 ms-2">프로젝트
							등록 담당자 연락처</label> <input type="text" name="pboard_manager_phone"
							class="form-control bg-dark" id="pboard_manager_phone"
							placeholder=" ‘-’ 까지 작성해 주세요." autocomplete="off"
							value="${myProjectDTO.pboard_manager_phone}" required />
					</div>

					<!-- 등록하기 버튼 -->
					<div class="row container mt-5 px-5 justify-content-center">
						<button type="button" class="col-4 me-3 btn btn-primary" id="pro_update_btn"
    						onclick="validateAndShowModal()">수정하기</button>
						<button type="button" class="col-2 btn btn-secondary"
							data-bs-toggle="modal" data-bs-target="#disagree">돌아가기</button>
					</div>

					<!-- 등록버튼 확인 모달창 -->
					<div class="modal fade mt-5" id="agreeSave" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content bg-primary ps-2 pt-2">
								<div class="modal-header">
									<h1 class="modal-title fs-6" id="agreeTitle">현재 상태로
										수정하시겠습니까?</h1>
								</div>
								<div class="modal-footer">
									<input type="submit" class="btn btn-sm btn-primary"
										id="agree_btn" value="수정하기">
									<button type="button" onclick=""
										class="btn btn-sm btn-secondary" data-bs-dismiss="modal">돌아가기</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 돌아가기 버튼 확인 모달창 -->
					<div class="modal fade mt-5" id="disagree" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content bg-primary ps-2 pt-2">
								<div class="modal-header">
									<h1 class="modal-title fs-6" id="disagreeTitle">작성중 내용이
										사라집니다 돌아가시겠습니까?</h1>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-sm btn-primary"
										data-bs-dismiss="modal">계속 작성하기</button>
									<button type="button" class="btn btn-sm btn-secondary"
										id="disagree_btn"
										onclick="location.href='${pageContext.request.contextPath}/mypage'">돌아가기</button>
								</div>
							</div>
						</div>
					</div>
					<!--modal end-->

				</div>
			</div>
		</form>
		<!-- 폼 태그 끝 -->

	</div>
	<!-- Footer -->
	<jsp:include page="../include/footer.jsp" />

	<script>
const selectElement = document.getElementById("skill");
const badgeContainer = document.getElementById("badge_container");

if (selectElement) {
    selectElement.addEventListener("change", function() {
        const selectText = this.options[this.selectedIndex].text;
        const selectValue = this.value;

        // 이미 선택된 배지인지 확인
        const existingBadges = Array.from(badgeContainer.getElementsByClassName("badge"));
        const existingBadge = existingBadges.find((badge) => badge.dataset.skillId === selectValue);

        if (existingBadge) {
            // 이미 선택된 배지인 경우 제거
            existingBadge.remove();
        } else {
            // 새 배지 추가
            const badge = document.createElement("p");
            badge.className = "badge rounded-pill mb-1 me-2";
            badge.textContent = selectText;
            badge.dataset.skillId = selectValue;

            // 배지 클릭 시 삭제 기능 추가
            badge.addEventListener("click", () => {
                badge.remove();
                updateHiddenInput();
            });

            badgeContainer.appendChild(badge);
        }
        // 숨겨진 입력 필드 업데이트
        updateHiddenInput();
        // 선택 초기화 (다시 처음 상태로)
        selectElement.selectedIndex = 0;
    });

    // 배지 클릭 이벤트를 badgeContainer에 위임
    badgeContainer.addEventListener("click", function(event) {
        if (event.target.classList.contains("badge")) {
            event.target.remove();
            updateHiddenInput();
        }
    });
}

// 숨겨진 입력 필드 업데이트
function updateHiddenInput() {
    const badges = Array.from(badgeContainer.getElementsByClassName("badge"));
    const selectedSkills = badges.map((badge) => badge.dataset.skillId);
    let skillList = selectedSkills.join(",");
    document.getElementById("skillList").value = skillList;

    // skillList에 대한 유효성 검사
    if (skillList === "") {
        document.getElementById("skill").style.border = "1px solid #ff0000ad";
    } else {
        document.getElementById("skill").style.border = "";
    }
}

function validateAndShowModal() {
    var title = document.querySelector('input[name="pboard_title"]');
    var job = document.querySelector('select[name="job_id"]');
    var money = document.querySelector('input[name="pboard_money"]');
    var date = document.querySelector('input[name="pboard_startDate"]');
    var month = document.querySelector('input[name="pboard_rangeMonth"]');
    var content = document.querySelector('textarea[name="pboard_content"]');
    var name = document.querySelector('input[name="pboard_company_name"]');
    var phone = document.querySelector('input[name="pboard_manager_phone"]');

    // 유효성 검사
    if (title.value.trim() === '') {
        title.focus();
//         alert("제목을 입력하세요.");
        return;
    }

    if (job.value === '') {
        job.focus();
//         alert("직무를 선택하세요.");
        return;
    } 

    if (money.value.trim() === '') {
        money.focus();
//         alert("프로젝트 보수를 입력하세요.");
        return;
    } 

    if (date.value === '') {
        date.focus();
//         alert("프로젝트 시작 희망일을 입력하세요.");
        return;
    } 

    if (month.value.trim() === '') {
        month.focus();
//         alert("프로젝트 진행 예상 기간을 입력하세요.");
        return;
    } 

    if (content.value.trim() === '') {
        content.focus();
//         alert("프로젝트 세부 내용을 입력하세요.");
        return;
    } 

    if (name.value.trim() === '') {
        name.focus();
//         alert("기업 및 사업자 명을 입력하세요.");
        return;
    } 

    var phonePattern = /^\d{3}-\d{3,4}-\d{4}$/;
    if (!phonePattern.test(phone.value.trim())) {
    	alert("올바른 전화번호 형식을 입력하세요. (예: 010-1234-5678)");
        phone.focus();
        return;
    } 

    // 모든 유효성 검사를 통과한 경우 모달 띄우기
    var modal = new bootstrap.Modal(document.getElementById('agreeSave'));
    modal.show();
}



</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script>
    let basePath = "${pageContext.request.contextPath}";
</script>
	<script
		src="${pageContext.request.contextPath}/resources/project/project.js"></script>
</body>
</html>
