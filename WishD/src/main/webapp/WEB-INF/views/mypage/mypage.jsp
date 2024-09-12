<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style_temp.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/mypage/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/project/project.css">

</head>
<body>
    <!-- Header -->
    <jsp:include page="../include/heard.jsp" />

    <!-- Main Content -->
    <!-- 로그인 세션 체크 -->
    <c:if test="${ empty sessionScope.user_id || empty sessionScope.access_Token }">
        <%-- <c:redirect url="/login"></c:redirect> --%>
    </c:if>
    
    <!-- 상단 내정보와 폼 부분 -->
    <div class="mycontainer">
        <div class="form-container-wrapper">
            <div class="form-title">내정보</div>
            
            <!-- 폼부분 시작 -->
            <form action="#" method="post" class="text-form-container" id="user-info-form">
                <div class="input-group">
                    <input type="text" id="user_name" name="user_name" value="${memberDTO.user_name}" readonly placeholder=" " />
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
            </div>
            <!-- 폼부분 끝 -->
            
            <!-- 버튼 시작 -->
            <div class="form-buttons">
                <button class="btn-primary" type="button" id="member_update_btn">정보수정</button>
                <button class="btn-secondary" type="button" id="member_delete_btn">회원탈퇴</button>
            </div>
            <!-- 버튼 끝 -->
            
        </div>
        <!-- 상단 내정보와 폼 부분 끝 -->
        
        <!-- 탭 전체 시작 -->
        <div class="tabs">
            <!-- 탭 목록 부분 시작 -->
            <div class="tab-header">
                <div class="tab-item active" data-tab="freelance">
                    <i class="fa fa-code"></i> 프리랜서 글
                </div>
                <div class="tab-item" data-tab="project">
                    <i class="fa fa-pencil-square-o"></i> 프로젝트 글
                </div>
                <div class="tab-item" data-tab="qna">
                    <i class="fa fa-envelope-o"></i> QnA
                </div>
            </div>
            <!-- 탭 목록 부분 끝 -->
            
            <!-- 탭 내용 -->
            <div class="tab-body">
                <!-- 프리랜서 글 내용 -->
                <div class="tab-content active" id="freelance-content">
                    <div>
                    <!-- 프로젝트 카드 -->
	    
	    
                    </div>
                    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <!-- 10칸씩 뒤로 이동 버튼 -->
            <c:if test="${myProjectPageDTO.startPage > myProjectPageDTO.pageBlock}">
                <li class="page-item">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/mypage?freelancePageNum=${myProjectPageDTO.startPage - 10}"></a>
            </li>
            </c:if>

            <c:forEach begin="${myProjectPageDTO.startPage}" end="${myProjectPageDTO.endPage}" var="page">
                <li class="page-item">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/mypage?freelancepageNum=${page}">${page}</a>
                </li>
            </c:forEach>

            <!-- 10칸씩 앞으로 이동 -->
            <c:if test="${myProjectPageDTO.endPage < myProjectPageDTO.pageCount}">
                <li class="page-item">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/mypage?freelancePageNum=${myProjectPageDTO.endPage + 10}"></a>
            </li>
            </c:if>
        </ul>
    </nav>
                </div>
                <!-- 프리랜서 글 끝 -->
                
                
                
                <!-- 프로젝트 글 내용 -->
                
                <div class="tab-content" id="project-content">
                
                    <!-- 프로젝트 카드 -->
                    <div>
    <!-- header -->
    

    <div class="col-12 mt-4 mb-2 px-5">
        <div class="d-flex">
            <!-- 총 프로젝트 등록 개수 가져오기 -->
            <div class="ms-1 me-3">프로젝트 ${myProjectPageDTO.getCount()} 개</div>
            <div class="me-4">|</div>

            <!-- 검색 창 -->
            <div class="col-auto ">
                <form action="${pageContext.request.contextPath}/mypage?search=" method="get">
                    <div class="input-group">
                        <input type="text"  id="search" class="form-control text border-0 bg-primary" name="search" placeholder="프로젝트명 검색" autocomplete="off" />
                        <button type="submit" class="btn bg-primary"><img src="${pageContext.request.contextPath}/resources/project/svg/search.svg" alt="Search" /></button>
                    </div>
                </form>
            </div>
            <div class="me-4"> </div>
            <!-- 모집중, 진행중, 완료 필터 -->
            <form action="${pageContext.request.contextPath}/mypage?projectStatus=모집중" method="get">
            	<button type="submit" class="btn bg-primary" name="projectStatus" value="모집중">모집중</button>
            </form>
            <div class="me-4"> </div>
            <form action="${pageContext.request.contextPath}/mypage?projectStatus=진행중" method="get">
            	<button type="submit" class="btn bg-primary" name="projectStatus" value="진행중">진행중</button>
            </form>
            <div class="me-4"> </div>
            <form action="${pageContext.request.contextPath}/mypage?projectStatus=완료" method="get">
            	<button type="submit" class="btn bg-primary" name="projectStatus" value="완료">완료</button>
            </form>
        </div>
    </div> 	
                    <c:forEach items="${myProjectDTOList}" var="myprojectDTO">
                        <div class="container mb-4 px-5">
                            <div class="card h-100 p-2" style="height: 200px">
                                <div class="card-body position-relative">
                                    <!-- 모집중 일때 -->
                                    <c:if test="${myprojectDTO.pboard_state == '모집중'}">
                                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill">
                                            ${myprojectDTO.pboard_state}
                                        </span>
                                    </c:if>
                                    
                                    <!-- 진행중 일때 -->
                                    <c:if test="${myprojectDTO.pboard_state == '진행중'}">
                                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">
                                            ${myprojectDTO.pboard_state}
                                        </span>
                                    </c:if>
                                    
                                    <!-- 완료 일때 -->
                                    <c:if test="${myprojectDTO.pboard_state == '완료'}">
                                        <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">
                                            ${myprojectDTO.pboard_state}
                                        </span>
                                    </c:if>
									
                                    <!-- 타이틀 -->
                                    <a class="nav-link mb-3 fs-4" href="${pageContext.request.contextPath}/projectRead/${myprojectDTO.pboard_id }">${myprojectDTO.pboard_title}</a>
                                    
                                    <!-- 필요 스킬 -->
                                    <div class="d-flex mb-2">
                                        <!-- 반복되는 스킬배지 -->
                                        <c:forEach items="${myprojectDTO.skills}" var="myProjectSkillList">
                                            <span class="badge mb-1 me-2"># ${myProjectSkillList.skill_name}</span>
                                        </c:forEach>
                                    </div>
                                    
                                    <!-- 예상 금액 -->
                                    <p class="col-auto card-text mb-1">예상 금액: ${myprojectDTO.pboard_money} 만원</p>
                                    <div class="row d-flex">
                                        <!-- 시작 예정일 -->
                                        <p class="col-4 card-text mb-1">시작 예정일: <fmt:formatDate value="${myprojectDTO.pboard_startDate}" pattern="yyyy년 MM월 dd일" /> </p>
                                        <!-- 예상 기간 -->
                                        <p class="col-3 card-text">예상 기간: ${myprojectDTO.pboard_rangeMonth} 개월</p>
                                        <button class="btn btn-primary ms-3"
                                        		onclick="location.href='${pageContext.request.contextPath}/mypage/myprojectupdate?projectPageNum=${myprojectDTO.pboard_id}'"
                                        		style="width:auto; justify-content: flex-end;">글수정</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <!-- 반복 end -->
                    <!-- Pagination -->
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <!-- 10칸씩 뒤로 이동 버튼 -->
            <c:if test="${myProjectPageDTO.startPage > pageBlock}">
                <li class="page-item">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/projectPageNum?pageNum=${myProjectPageDTO.startPage - 10}&search=${param.search}&projectStatus=${param.projectStatus}"></a>
            </li>
            </c:if>

            <c:forEach begin="${myProjectPageDTO.startPage}" end="${myProjectPageDTO.endPage}" var="page">
                <li class="page-item">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/mypage?projectPageNum=${page}&search=${param.search}&projectStatus=${param.projectStatus}">${page}</a>
                </li>
            </c:forEach>

            <!-- 10칸씩 앞으로 이동 -->
            <c:if test="${myProjectPageDTO.endPage < myProjectPageDTO.pageCount}">
                <li class="page-item">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/mypage?projectPageNum=${myProjectPageDTO.endPage + 10}&search=${param.search}&projectStatus=${param.projectStatus}"></a>
            </li>
            </c:if>
        </ul>
    </nav>
                </div>
                
                <!-- QnA 내용 -->
                <div class="tab-content" id="qna-content">
                    <div>
                        <div class="d-flex justify-content-center my-3">
            
            <!-- 큐앤에이 게시판  -->
            <div class="col-8 text-center card bg-primary">
                <table class="table">
                  <thead>
                     <tr>
                      <p class="text-start my-4 mx-4 fs-5 fw-bold lh-1" style="color: #fff;">Q & A</p>
                        <th scope="col fw-bold">No.</th>
                        <th scope="col fw-bold">제목</th>
                        <th scope="col fw-bold">작성일자</th>
                      </tr>
                    </thead>
                    <tr>
                        <th scope="row" class="align-middle" style="height: 80px;">1</th>
                        <td class="align-middle">문의드립니다 (승인요청건)</td>
                        <td class="align-middle">2024-02-06</td>
                    
                    </tr>
                    <tr>
                        <th scope="row" class="align-middle" style="height: 80px;">2</th>
                        <td class="align-middle">문의드립니다 (승인요청건)</td>
                        <td class="align-middle">2024-02-06</td>
                    
                    </tr>
                    <tr>
                        <th scope="row" class="align-middle" style="height: 80px;">3</th>
                        <td class="align-middle">문의드립니다 (승인요청건)</td>
                        <td class="align-middle">2024-02-06</td>
                    
                    </tr>
                    <tr>
                        <th scope="row" class="align-middle" style="height: 80px;">4</th>
                        <td class="align-middle">문의드립니다 (승인요청건)</td>
                        <td class="align-middle">2024-02-06</td>
                    
                    </tr>
                    <tr>
                        <th scope="row" class="align-middle" style="height: 80px;">5</th>
                        <td class="align-middle">문의드립니다 (승인요청건)</td>
                        <td class="align-middle">2024-02-06</td>
                    
                    </tr>
                   
                  </table>
                  <!--페이지-->
                  <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <!-- 10칸씩 뒤로 이동 버튼 -->
            <c:if test="${myProjectPageDTO.startPage > myProjectPageDTO.pageBlock}">
                <li class="page-item">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/mypage?qnaPageNum=${myProjectPageDTO.startPage - 10}"></a>
            </li>
            </c:if>

            <c:forEach begin="${myProjectPageDTO.startPage}" end="${myProjectPageDTO.endPage}" var="page">
                <li class="page-item">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/mypage?qnaPageNum=${page}">${page}</a>
                </li>
            </c:forEach>

            <!-- 10칸씩 앞으로 이동 -->
            <c:if test="${myProjectPageDTO.endPage < myProjectPageDTO.pageCount}">
                <li class="page-item">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/mypage?qnaPageNum=${myProjectPageDTO.endPage + 10}"></a>
            </li>
            </c:if>
        </ul>
    </nav>
                 
            </div>
        </div>
                    </div>
                </div>
            </div>
            <!-- 탭 내용 끝-->
        </div>
        <!-- 탭 전체 끝 -->
    </div>
    <!-- 상단 내정보와 폼 부분 끝 -->
    
    <!-- 자바스크립트 -->
    <script>
    document.addEventListener("DOMContentLoaded", function () {
        const tabHeader = document.querySelector(".tab-header");
        const tabsPane = tabHeader.querySelectorAll(".tab-item");
        const tabContents = document.querySelectorAll(".tab-content");
        const tabBody = document.querySelector(".tab-body"); // 탭 바디를 정의합니다.

        function updateTabs(index) {
            // 기존 활성화된 탭과 내용 제거
            tabHeader.querySelector(".tab-item.active").classList.remove("active");
            document.querySelector(".tab-content.active").classList.remove("active");

            // 새로 클릭된 탭과 내용 활성화
            tabsPane[index].classList.add("active");
            const activeTabContent = tabContents[index];
            activeTabContent.classList.add("active");

            // 탭 바디의 높이를 활성화된 콘텐츠의 높이에 맞게 조정
            if (activeTabContent) {
                const newHeight = activeTabContent.scrollHeight; // 활성화된 콘텐츠의 높이 측정
                tabBody.style.height = `${newHeight}px`; // 측정한 높이로 설정
            } else {
                tabBody.style.height = '0px';  // 내용이 없을 때 높이를 0으로 설정
            }
        }

        // 페이지 로드 시 저장된 탭을 활성화
        let savedTabIndex = localStorage.getItem("activeTabIndex");
        if (savedTabIndex === null || savedTabIndex >= tabsPane.length) {
            savedTabIndex = 0; // 기본값
        }
        updateTabs(savedTabIndex);

        tabsPane.forEach((tab, index) => {
            tab.addEventListener("click", function () {
                // 클릭된 탭의 인덱스를 저장
                localStorage.setItem("activeTabIndex", index);

                // 탭의 data-tab 속성을 가져옵니다.
                let tabData = tab.getAttribute("data-tab");

                updateTabs(index);
//                 loadContent(tabData, index);
            });
        });

//         function loadContent(tabData, tabIndex) {
//             // 이 함수는 서버에서 데이터를 로드하거나 DOM을 업데이트하는 데 사용됩니다.
//             // 예를 들어, AJAX 요청을 통해 탭 콘텐츠를 가져오고 처리합니다.

//             // AJAX 요청의 예 (fetch를 사용하는 경우):
//             fetch(`/path/to/your/content/${tabData}`)
//                 .then(response => response.text())
//                 .then(data => {
//                     // 탭 콘텐츠를 업데이트
//                     document.getElementById(`${tabData}-content`).innerHTML = data;

//                     // 콘텐츠 로드 후 높이 조정
//                     updateTabs(tabIndex);
//                 })
//                 .catch(error => console.error('Error loading content:', error));
//         }

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
    </script>

    <!-- Include Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

    <!-- Footer -->
    <jsp:include page="../include/footer.jsp" />
</body>
</html>
