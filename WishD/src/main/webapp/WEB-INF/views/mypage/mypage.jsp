<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>마이페이지 | WishD</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/style_temp.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/mypage/mypage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/project/project.css">
</head>
<body>
	<!-- Header -->
	<jsp:include page="../include/heard.jsp" />

	<!-- Main Content -->
	<!-- 로그인 세션 체크 -->
	<c:if
		test="${ empty sessionScope.user_id || empty sessionScope.access_Token }">
		<%-- <c:redirect url="/login"></c:redirect> --%>
	</c:if>
	
	<!-- 상단 내정보와 폼 부분 -->
	<div class="mycontainer">
		<div class="form-container-wrapper">
			<div class="form-title">내정보</div>
			
			<!-- 폼부분 시작 -->
			<form action="#" method="post" class="text-form-container"
				id="user-info-form">

				<div class="input-group">
					<input type="text" id="user_name" name="user_name"	value="${memberDTO.user_name}" readonly placeholder=" " />
					<label for="user_name">이름</label>
				</div>
				<div class="input-group">
					<input type="email" id="email" name="email" value="${memberDTO.email}" readonly placeholder=" " />
					<label for="email">이메일</label>
				</div>
				<div class="input-group">
					<input type="text" id="user_id" name="user_id" value="${memberDTO.user_id}" placeholder=" " />
					<label for="user_id">아이디</label>
				</div>
				<div class="input-group">
					<input type="password" id="user_pass" name="user_pass" placeholder=" " />
					<label for="user_pass">비밀번호</label>
				</div>
				<div class="input-group">
					<input type="text" id="user_phone" name="user_phone" value="${memberDTO.user_phone}" placeholder=" " />
					<label for="user_phone">연락처</label>
				</div>
			</form>
			<!-- 폼부분 끝 -->
			
			<!-- 버튼 시작 -->
			<div class="form-buttons">
				<button class="btn-primary" type="button" id="member_update_btn">정보수정</button>
				<button class="btn-secondary" type="button" id="member_delete_btn">회원탈퇴</button>
			</div>
			<!-- 버튼 끝 -->
			
		</div>
		<!-- 상단 내정보와 폼 부분 끝 -->
		
		<!-- 탭전체 시작 -->
		<div class="tabs">
			<!-- 탭 목록 부분 시작 -->
			<div class="tab-header">
				<div class="active" data-tab="freelance">
					<i class="fa fa-code"></i> 프리랜서 글
				</div>
				<div data-tab="project">
					<i class="fa fa-pencil-square-o"></i> 프로젝트 글
				</div>
				<div data-tab="qna">
					<i class="fa fa-envelope-o"></i> QnA
				</div>
			</div>
			<!-- 탭 목록 부분 끝 -->
			
			<!-- 탭 내용 -->
			<div class="tab-body">
				<div class="active" id="freelance-content">
					<p>여기에 코드 섹션 내용이 들어갑니다.</p>
				</div>
				
				<div id="project-content">
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
<!--     <div class="row"> -->

        <!-- 반복되는 프로젝트 카드 -->
        <c:forEach items="${projectDTOList}" var="projectDTO">
<!--             <div class="card h-100 p-2" style="height: 200px"> -->
<!--                 <div class="card-body position-relative"> -->
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
<!--             </div> -->
        </c:forEach>
        <!-- 반복 end -->
<!--     </div> -->
<!-- 				</div> -->
				<div id="qna-content">
					<h2>연락처 섹션</h2>
					<p>여기에 연락처 섹션 내용이 들어갑니다.</p>
				</div>
			</div>
			<!-- 탭 내용 끝-->
		</div>
		<!-- 탭전체 끝 -->
	</div>
	<!-- 상단 내정보와 폼 부분 끝 -->
	
	<!-- 자바스크립트 -->
	<script>
    document.addEventListener("DOMContentLoaded", function () {
        const tabHeader = document.querySelector(".tab-header");
        const tabBody = document.querySelector(".tab-body");
        const tabsPane = tabHeader.querySelectorAll("div");

        // 저장된 탭 인덱스 불러오기
        let activeTabIndex = localStorage.getItem("activeTabIndex") || 0;

        function updateTabs(index) {
            // 기존 활성화된 탭과 내용 제거
            tabHeader.querySelector(".active").classList.remove("active");
            tabBody.querySelector(".active").classList.remove("active");

            // 새로 클릭된 탭과 내용 활성화
            tabsPane[index].classList.add("active");
            tabBody.children[index].classList.add("active");
        }

        // 페이지 로드 시 저장된 탭을 활성화
        updateTabs(activeTabIndex);

        function loadContent(tab) {
            // AJAX 요청 예제 (여기서는 fetch를 사용합니다)
            fetch(`/get-data?tab=${tab}`)
                .then(response => response.json())
                .then(data => {
                    document.getElementById(`${tab}-content`).innerHTML = `
                        <h2>${data.title}</h2>
                        <p>${data.content}</p>
                    `;
                })
                .catch(error => console.error('Error fetching data:', error));
        }

        tabsPane.forEach((tab, index) => {
            tab.addEventListener("click", function () {
                // 클릭된 탭의 인덱스를 저장
                localStorage.setItem("activeTabIndex", index);

                // 탭의 data-tab 속성을 가져옵니다.
                let tabData = tab.getAttribute("data-tab");

                updateTabs(index);
                loadContent(tabData);
            });
        });

        // 정보수정 버튼 클릭 이벤트
        document.getElementById("member_update_btn").addEventListener("click", function(event) {
            event.preventDefault();

            const form = document.getElementById("user-info-form");
            let email = document.getElementById("email");
            if (email.value === "") {
                alert("이메일을 입력해주세요.");
                email.focus();
                return;
            }

            let id = document.getElementById("user_id");
            if (id.value === "") {
                alert("아이디를 입력해주세요.");
                id.focus();
                return;
            }

            let phone = document.getElementById("user_phone");
            if (phone.value === "") {
                alert("전화번호를 입력해주세요.");
                phone.focus();
                return;
            }

            let password = document.getElementById("user_pass");
            if (password.value === "") {
                alert("정보수정 시 비밀번호가 필요합니다.");
                password.focus();
                return;
            }

            form.action = "${pageContext.request.contextPath}/mypage/mypageUpdatePro";
            form.method = "POST";
            form.submit();
        });

        // 회원탈퇴 버튼 클릭 이벤트
        document.getElementById("member_delete_btn").addEventListener("click", function(event) {
            event.preventDefault();

            const form = document.getElementById("user-info-form");
            let email = document.getElementById("email");
            if (email.value === "") {
                alert("이메일을 입력해주세요.");
                email.focus();
                return;
            }

            let phone = document.getElementById("user_phone");
            if (phone.value === "") {
                alert("전화번호를 입력해주세요.");
                phone.focus();
                return;
            }

            let password = document.getElementById("user_pass");
            if (password.value === "") {
                alert("회원 탈퇴 시 비밀번호가 필요합니다.");
                password.focus();
                return;
            }

            if (confirm("정말로 회원탈퇴 하시겠습니까?")) {
                form.action = "${pageContext.request.contextPath}/mypage/myuserDeletePro";
                form.method = "POST";
                form.submit();
            }
        });
    });
    
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"
    </script>

	<!-- Footer -->
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
