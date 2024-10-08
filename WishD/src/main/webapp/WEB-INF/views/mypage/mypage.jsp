<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/community/notice.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- Header -->
	<jsp:include page="../include/heard.jsp" />

	<!-- Main Content -->


	<!-- 상단 내정보와 폼 부분 -->
	<div class="mycontainer">
		<div class="form-container-wrapper">
			<div class="form-title">내정보</div>

			<!-- 폼부분 시작 -->
			<form action="#" method="post" class="text-form-container"
				id="user-info-form">
				<div class="form-row">
					<div class="input-group">
						<input type="text" id="user_name" name="user_name"
							value="${myProfile.user_name}" readonly placeholder=" " /> <label
							for="user_name">이름</label>
					</div>
					<div class="input-group">
						<input type="email" id="email" name="email"
							value="${myProfile.email}" readonly placeholder=" " /> <label
							for="email">이메일</label>
					</div>
				</div>
				
				<c:if test="${myProfile.user_id != null }">
				<div class="form-row">
					<div class="input-group">
						<input type="text" id="user_phone" name="user_phone" readonly
							value="${myProfile.user_phone}" placeholder=" " /> <label
							for="user_phone">연락처</label>
					</div>

					<c:if test="${myProfile.user_id != null }">
						<div class="input-group">
							<input type="text" id="user_id" name="user_id"
								value="${myProfile.user_id}" placeholder=" " readonly/> <label
								for="user_id">아이디</label>
						</div>
						
					</c:if>
				</div>

				
				
				<hr> <!-- 비밀번호 변경 -->
					<div class="form-row">
						<div class="input-group">
							<input type="password" id="user_pass" name="access_Token"
								placeholder=" " /> <label for="user_pass">현재 비밀번호</label>
						</div>
					</div>

					<div class="form-row">
						<div class="input-group">
							<input type="password" id="password_new"
								placeholder=" " /> <label for="password_new">새 비밀번호</label>
						</div>
						<div class="input-group">
							<input type="password" id="password_new_check"
								name="user_pass" placeholder=" " /> <label
								for="password_new">새 비밀번호 확인</label>
						</div>
					</div>
				</c:if>
			</form>

		</div>
		<!-- 폼부분 끝 -->
		
		<c:if test="${myProfile.user_id != null }">
		<!-- 버튼 시작 -->
		<div class="form-buttons">
			<button class="btn-primary" type="button" id="member_update_btn">비밀번호
				수정</button>
			<button class="btn-secondary" type="button" id="member_delete_btn">회원탈퇴</button>
		</div>
		</c:if>
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
					<!-- header -->
					<div class="col-12 mt-4 mb-2 px-5">
						<div class="d-flex">
							<!-- 총 프리랜서 등록 개수 가져오기 -->
							<c:if test="${ empty myFreeRequestPageDTO }">
							<div class="ms-1 me-3">프리랜서
								${myFreelancerPageDTO.getCount()} 개</div>
							<div class="me-4">|</div>
							</c:if>
							<c:if test="${ ! empty myFreeRequestPageDTO }">
							<div class="ms-1 me-3">프리랜서
								${myFreeRequestDTOList.size()} 개</div>
							<div class="me-4">|</div>
							</c:if>
							<!-- 검색 창 -->
							<div class="col-auto ">
								<form
									action="${pageContext.request.contextPath}/mypage"
									method="get">
									<div class="input-group">
										<input type="text" id="search"
											class="form-control text border-0 bg-primary"
											name="freelancerSearch" placeholder="프리랜서 글 검색"
											autocomplete="off" />
											<input type="hidden" name="freelancerStatus" value="${param.freelancerStatus}" />
											<input type="hidden" name="requestFreelancer" value="${param.requestFreelancer}" />
										<button type="submit" class="btn bg-primary">
											<img
												src="${pageContext.request.contextPath}/resources/project/svg/search.svg"
												alt="Search" />
										</button>
									</div>
								</form>
							</div>
							<div class="me-4"></div>
							<!-- 구직중, 진행중, 완료 필터 -->
							<form
								action="${pageContext.request.contextPath}/mypage?freelancerStatus=구직중"
								method="get">
								<button type="submit" class="btn btn-primary"
									name="freelancerStatus" value="구직중">구직중</button>
							</form>
							<div class="me-4"></div>
							<form
								action="${pageContext.request.contextPath}/mypage?freelancerStatus=진행중"
								method="get">
								<button type="submit" class="btn btn-primary"
									name="freelancerStatus" value="진행중">진행중</button>
							</form>
							<div class="me-4"></div>
							<form
								action="${pageContext.request.contextPath}/mypage?freelancerStatus=완료"
								method="get">
								<button type="submit" class="btn btn-primary"
									name="freelancerStatus" value="완료">완료</button>
							</form>
							<div class="me-4"></div>
							<form
								action="${pageContext.request.contextPath}/mypage?requestFreelancer=보낸요청"
								method="get">
								<button type="submit" class="btn btn-primary"
									name="requestFreelancer" value="보낸요청">보낸요청</button>
							</form>
						</div>
					</div>
					
					<!-- 보낸요청 아닐때 -->
					<c:if test="${ empty myFreeRequestDTOList}">
					<c:forEach items="${myFreelancerDTOList}" var="myFreelancerDTO">
						<div class="container mb-4 px-5">
							<div class="board_card card h-100 p-2" style="height: 200px">

								<div class="card-body position-relative">
									<!-- 현재 상태 -->
									<!-- 구직중 일때 -->
									<c:if test="${myFreelancerDTO.getFreelancer_state() == '구직중'}">
										<span
											class="position-absolute top-0 start-100 translate-middle badge rounded-pill">
											${myFreelancerDTO.getFreelancer_state()} </span>
									</c:if>
									<!-- 진행중 일때 -->
									<c:if test="${myFreelancerDTO.getFreelancer_state() == '진행중'}">
										<span
											class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">
											${myFreelancerDTO.getFreelancer_state()} </span>
									</c:if>
									<!-- 완료 일때 -->
									<c:if test="${myFreelancerDTO.getFreelancer_state() == '완료'}">
										<span
											class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">
											${myFreelancerDTO.getFreelancer_state()} </span>
									</c:if>
										
									<a class="nav-link mb-3 fs-4"
										href="${pageContext.request.contextPath}/freelancerRead/${myFreelancerDTO.getFreelancer_id()}">
										${fn:substring(myFreelancerDTO.freelancer_introduction, 0, 40)}
   										<c:if test="${fn:length(myFreelancerDTO.freelancer_introduction) > 40}">...</c:if>
										</a>

									<!-- 필요 스킬 -->
									<div class="d-flex mb-2">
										<!-- 반복되는 스킬배지 -->
										<c:forEach items="${myFreelancerDTO.getSkills()}"
											var="myFreelancerSkill">
											<span class="badge mb-1 me-2">#
												${myFreelancerSkill.getSkill_name()}</span>
										</c:forEach>
									</div>

									<!-- 희망 급여 -->
									<p class="col-auto card-text mb-1">
										희망 월급:
										<fmt:formatNumber
											value="${myFreelancerDTO.getFreelancer_salary	()}"
											pattern="###,###,###" />
										만원
									</p>

									<div class="row d-flex">
										<!--업무 시작 가능 날짜 -->
										<p class="col-4 card-text mb-1">
											업무 시작일:
											<fmt:parseDate
												value="${myFreelancerDTO.getFreelancer_startdate()}"
												var="myFreeStartDate" pattern="yyyy-MM-dd" />
											<fmt:formatDate value="${myFreeStartDate}"
												pattern="yyyy년 MM월 dd일" />
										</p>
										<p class="col-3 card-text"></p>
										<c:if test="${myFreelancerDTO.getFreelancer_state() == '구직중' }">
										<button class="btn btn-primary ms-3"
											onclick="location.href='${pageContext.request.contextPath}/mypage/myfreelancerupdate?freelancerPageNum=${myFreelancerDTO.freelancer_id}'"
											style="width: auto; justify-content: flex-end;">글수정</button>
										</c:if>
										<!-- 	                        <p class="col-3 card-text"></p> -->
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 반복 end -->
					<!-- Pagination -->
					
					<!-- 보낸요청에서 다른 버튼 뜨는 문제 -->
					<c:if test="${myFreeRequestDTOList.size() > 0 || ! empty myFreelancerPageDTO}">
					
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
							<!-- 5칸씩 뒤로 이동 버튼 -->
							<c:if test="${myFreelancerPageDTO.startPage > pageBlock}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/mypage?freeLencerPageNum?=${myFreelancerPageDTO.startPage - 5}&freelencerSearch=${param.freelancerSearch}&freelencerStatus=${param.freelancerStatus}"></a>
								</li>
							</c:if>

							<c:forEach begin="${myFreelancerPageDTO.startPage}"
								end="${myFreelancerPageDTO.endPage}" var="page">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/mypage?freeLencerPageNum=${page}&freelancerSearch=${param.freelancerSearch}&freelancerStatus=${param.freelancerStatus}">${page}</a>
								</li>
							</c:forEach>


							<!-- 5칸씩 앞으로 이동 -->
							<c:if
								test="${myFreelancerPageDTO.endPage < myFreelancerPageDTO.pageCount}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/mypage?freeLencerPageNum=${myFreelancerPageDTO.endPage + 5}&freelancerSearch=${param.freelancerSearch}&freelancerStatus=${param.freelancerStatus}"></a>
								</li>
							</c:if>
						</ul>
					</nav>
					</c:if>
					
					</c:if> <!-- 보낸글 아닐때 끝 -->
					
					<!-- 요청글 눌렀을때 -->
					<c:if test="${ ! empty myFreeRequestDTOList}">
					<c:forEach items="${myFreeRequestDTOList}" var="myFreeRequestDTO">
						<div class="container mb-4 px-5">
							<div class="board_card card h-100 p-2" style="height: 200px">

								<div class="card-body position-relative">
									<!-- 현재 상태 -->
									<!-- 구직중 일때 -->
									<c:if test="${myFreeRequestDTO.getFreelancer_state() == '구직중'}">
										<span
											class="position-absolute top-0 start-100 translate-middle badge rounded-pill">
											${myFreeRequestDTO.getFreelancer_state()} </span>
									</c:if>
									<!-- 진행중 일때 -->
									<c:if test="${myFreeRequestDTO.getFreelancer_state() == '진행중'}">
										<span
											class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">
											${myFreeRequestDTO.getFreelancer_state()} </span>
									</c:if>
									<!-- 완료 일때 -->
									<c:if test="${myFreeRequestDTO.getFreelancer_state() == '완료'}">
										<span
											class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">
											${myFreeRequestDTO.getFreelancer_state()} </span>
									</c:if>

									<a class="nav-link mb-3 fs-4"
										href="${pageContext.request.contextPath}/freelancerRead/${myFreeRequestDTO.getFreelancer_id()}">
										
										${fn:substring(myFreeRequestDTO.freelancer_introduction, 0, 40)}
   										<c:if test="${fn:length(myFreeRequestDTO.freelancer_introduction) > 40}">...</c:if>
										</a>

									<!-- 필요 스킬 -->
									<div class="d-flex mb-2">
										<!-- 반복되는 스킬배지 -->
										<c:forEach items="${myFreeRequestDTO.getSkills()}"
											var="myFreelancerRequestSkill">
											<span class="badge mb-1 me-2">#
												${myFreelancerRequestSkill.getSkill_name()}</span>
										</c:forEach>
									</div>

									<!-- 희망 급여 -->
									<p class="col-auto card-text mb-1">
										희망 월급:
										<fmt:formatNumber
											value="${myFreeRequestDTO.getFreelancer_salary	()}"
											pattern="###,###,###" />
										만원
									</p>

									<div class="row d-flex">
										<!--업무 시작 가능 날짜 -->
										<p class="col-4 card-text mb-1">
											업무 시작일:
											<fmt:parseDate
												value="${myFreeRequestDTO.getFreelancer_startdate()}"
												var="myFreeStartDate" pattern="yyyy-MM-dd" />
											<fmt:formatDate value="${myFreeStartDate}"
												pattern="yyyy년 MM월 dd일" />
										</p>
										<p class="col-3 card-text"></p>
										
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 반복 end -->
					<!-- Pagination -->
<%-- 					${myFreeRequestDTOList.size()} --%>
					
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
							<!-- 5칸씩 뒤로 이동 버튼 -->
							<c:if test="${myFreeRequestPageDTO.startPage > myFreeRequestPageDTO.pageBlock}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/mypage?freelancerRequestPageNum=${myFreeRequestPageDTO.startPage - 5}&freelencerSearch=${param.freelancerSearch}&requestFreelancer=${param.requestFreelancer}"></a>
								</li>
							</c:if>

							<c:forEach begin="${myFreeRequestPageDTO.startPage}"
								end="${myFreeRequestPageDTO.endPage}" var="page">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/mypage?freelancerRequestPageNum=${page}&freelancerSearch=${param.freelancerSearch}&requestFreelancer=${param.requestFreelancer}">${page}</a>
								</li>
							</c:forEach>

							<!-- 5칸씩 앞으로 이동 -->
							<c:if
								test="${myFreeRequestPageDTO.endPage < myFreeRequestPageDTO.pageCount}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/mypage?freelancerRequestPageNum=${myFreeRequestPageDTO.endPage + 5}&freelancerSearch=${param.freelancerSearch}&requestFreelancer=${param.requestFreelancer}"></a>
								</li>
							</c:if>
						</ul>
					</nav>
					
					</c:if>
					
					
				</div>
			</div>
			


			<!-- 프로젝트 글 내용 -->

			<div class="tab-content" id="project-content">

				<!-- 프로젝트 카드 -->
				<div>
					<!-- header -->


					<div class="col-12 mt-4 mb-2 px-5">
						<div class="d-flex">
						
							<!-- 총 프로젝트 등록 개수 가져오기 -->
							<c:if test="${ empty myProjectRequestPageDTO.getCount() }">
							<div class="ms-1 me-3">프로젝트 ${myProjectPageDTO.getCount()}
								개
							</div>
							</c:if>
							<c:if test="${ ! empty myProjectRequestPageDTO.getCount() }">
							<div class="ms-1 me-3">프로젝트 ${myProjectRequestDTOList.size()}
								개
							</div>
							</c:if>
							<div class="me-4">|</div>

							<!-- 검색 창 -->
							<div class="col-auto ">
								<form action="${pageContext.request.contextPath}/mypage"
									method="get">
									<div class="input-group">
										<input type="text" id="search"
											class="form-control text border-0 bg-primary" name="search"
											placeholder="프로젝트 글 검색" autocomplete="off" />
											<input type="hidden" name="projectStatus" value="${param.projectStatus}" />
											<input type="hidden" name="requestProject" value="${param.requestProject}" />
										<button type="submit" class="btn bg-primary">
											<img
												src="${pageContext.request.contextPath}/resources/project/svg/search.svg"
												alt="Search" />
										</button>
									</div>
								</form>
							</div>
							<div class="me-4"></div>
							<!-- 모집중, 진행중, 완료 필터 -->
							<form
								action="${pageContext.request.contextPath}/mypage?projectStatus=모집중"
								method="get">
								<button type="submit" class="btn btn-primary"
									name="projectStatus" value="모집중">모집중</button>
							</form>
							<div class="me-4"></div>
							<form
								action="${pageContext.request.contextPath}/mypage?projectStatus=진행중"
								method="get">
								<button type="submit" class="btn btn-primary"
									name="projectStatus" value="진행중">진행중</button>
							</form>
							<div class="me-4"></div>
							<form
								action="${pageContext.request.contextPath}/mypage?projectStatus=완료"
								method="get">
								<button type="submit" class="btn btn-primary"
									name="projectStatus" value="완료">완료</button>
							</form>
							<div class="me-4"></div>
							<form
								action="${pageContext.request.contextPath}/mypage?requestProject=보낸요청"
								method="get">
								<button type="submit" class="btn btn-primary"
									name="requestProject" value="보낸요청">보낸요청</button>
							</form>
						</div>
					</div>
					
					<!-- 보낸요청아니면 -->
					<c:if test="${ empty myProjectRequestDTOList}">
						
						<c:forEach items="${myProjectDTOList}" var="myprojectDTO">
							<div class="container mb-4 px-5">
								<div class="card h-100 p-2" style="height: 200px">
									<div class="card-body position-relative">
										<!-- 모집중 일때 -->
										<c:if test="${myprojectDTO.pboard_state == '모집중'}">
											<span
												class="position-absolute top-0 start-100 translate-middle badge rounded-pill">
												${myprojectDTO.pboard_state} </span>
										</c:if>

										<!-- 진행중 일때 -->
										<c:if test="${myprojectDTO.pboard_state == '진행중'}">
											<span
												class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">
												${myprojectDTO.pboard_state} </span>
										</c:if>

										<!-- 완료 일때 -->
										<c:if test="${myprojectDTO.pboard_state == '완료'}">
											<span
												class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">
												${myprojectDTO.pboard_state} </span>
										</c:if>

										<!-- 타이틀 -->
										<a class="nav-link mb-3 fs-4"
											href="${pageContext.request.contextPath}/projectRead/${myprojectDTO.pboard_id }">
											${fn:substring(myprojectDTO.pboard_title, 0, 40)}
   											<c:if test="${fn:length(myprojectDTO.pboard_title) > 40}">...</c:if>
										</a>

										<!-- 필요 스킬 -->
										<div class="d-flex mb-2">
											<!-- 반복되는 스킬배지 -->
											<c:forEach items="${myprojectDTO.skills}"
												var="myProjectSkillList">
												<span class="badge mb-1 me-2">#
													${myProjectSkillList.skill_name}</span>
											</c:forEach>
										</div>

										<!-- 예상 금액 -->
										<p class="col-auto card-text mb-1">예상 금액:
											${myprojectDTO.pboard_money} 만원</p>
										<div class="row d-flex">
											<!-- 시작 예정일 -->
											<p class="col-4 card-text mb-1">
												시작 예정일:
												<fmt:parseDate value="${myprojectDTO.pboard_startDate}"
													var="myProjectStartDate" pattern="yyyy-MM-dd" />
												<fmt:formatDate value="${myProjectStartDate}"
													pattern="yyyy년 MM월 dd일" />
 
											</p>
											<!-- 예상 기간 -->
											<p class="col-3 card-text">예상 기간:
												${myprojectDTO.pboard_rangeMonth} 개월</p>
												
												<!-- 진행중이나 완료면 수정버튼안보임 -->
											<c:if test="${myprojectDTO.getPboard_state() == '모집중' }">
											<button class="btn btn-primary ms-3"
												onclick="location.href='${pageContext.request.contextPath}/mypage/myprojectupdate?projectPageNum=${myprojectDTO.pboard_id}'"
												style="width: auto; justify-content: flex-end;">글수정</button>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- 반복 end -->
						<!-- Pagination -->
						
						<!-- 보낸요청에 다른버튼 뜨는 문제 -->
						<c:if test="${myProjectRequestDTOList.size() > 0 || ! empty myProjectPageDTO}">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center">
								<!-- 5칸씩 뒤로 이동 버튼 -->
								<c:if test="${myProjectPageDTO.startPage > pageBlock}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/mypage?projectPageNum=${myProjectPageDTO.startPage - 5}&search=${param.search}&projectStatus=${param.projectStatus}"></a>
									</li>
								</c:if>

								<c:forEach begin="${myProjectPageDTO.startPage}"
									end="${myProjectPageDTO.endPage}" var="page">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/mypage?projectPageNum=${page}&search=${param.search}&projectStatus=${param.projectStatus}">${page}</a>
									</li>
								</c:forEach>

								<!-- 5칸씩 앞으로 이동 -->
								<c:if
									test="${myProjectPageDTO.endPage < myProjectPageDTO.pageCount}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/mypage?projectPageNum=${myProjectPageDTO.endPage + 5}&search=${param.search}&projectStatus=${param.projectStatus}"></a>
									</li>
								</c:if>
							</ul>
						</nav>
					</c:if>
					</c:if>
					
					
					<!-- 내가 요청한글 눌렀을때 -->
					<c:if test="${ ! empty myProjectRequestDTOList}">
							<c:forEach items="${myProjectRequestDTOList}" var="myRequestProjectDTO">
							<div class="container mb-4 px-5">
								<div class="card h-100 p-2" style="height: 200px">
									<div class="card-body position-relative">
										<!-- 모집중 일때 -->
										<c:if test="${myRequestProjectDTO.pboard_state == '모집중'}">
											<span
												class="position-absolute top-0 start-100 translate-middle badge rounded-pill">
												${myRequestProjectDTO.pboard_state} </span>
										</c:if>

										<!-- 진행중 일때 -->
										<c:if test="${myRequestProjectDTO.pboard_state == '진행중'}">
											<span
												class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">
												${myRequestProjectDTO.pboard_state} </span>
										</c:if>

										<!-- 완료 일때 -->
										<c:if test="${myRequestProjectDTO.pboard_state == '완료'}">
											<span
												class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-secondary">
												${myRequestProjectDTO.pboard_state} </span>
										</c:if>

										<!-- 타이틀 -->
										<a class="nav-link mb-3 fs-4"
											href="${pageContext.request.contextPath}/projectRead/${myRequestProjectDTO.pboard_id }">
											${fn:substring(myRequestProjectDTO.pboard_title, 0, 40)}
   											<c:if test="${fn:length(myRequestProjectDTO.pboard_title) > 40}">...</c:if>
<%-- 											${myRequestProjectDTO.pboard_title} --%>
										</a>

										<!-- 필요 스킬 -->
										<div class="d-flex mb-2">
											<!-- 반복되는 스킬배지 -->
											<c:forEach items="${myRequestProjectDTO.skills}"
												var="myProjectSkillList">
												<span class="badge mb-1 me-2"># 
													${myProjectSkillList.skill_name}</span>
											</c:forEach>
										</div>

										<!-- 예상 금액 -->
										<p class="col-auto card-text mb-1">예상 금액:
											${myRequestProjectDTO.pboard_money} 만원</p>
										<div class="row d-flex">
											<!-- 시작 예정일 -->
											<p class="col-4 card-text mb-1">
												시작 예정일:
												<fmt:parseDate value="${myRequestProjectDTO.pboard_startDate}"
													var="myRequestProjectStartDate" pattern="yyyy-MM-dd" />
												<fmt:formatDate value="${myRequestProjectStartDate}"
													pattern="yyyy년 MM월 dd일" />

											</p>
											<!-- 예상 기간 -->
											<p class="col-3 card-text">예상 기간:
												${myRequestProjectDTO.pboard_rangeMonth} 개월</p>
											
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- 반복 end -->
						<c:if test="${myProjectRequestDTOList.size() != null}">
						<c:if test="${myProjectRequestPageDTO.pageCount > 0}">
						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center">
								<!-- 5칸씩 뒤로 이동 버튼 -->
								<c:if test="${myProjectRequestPageDTO.startPage > myProjectRequestPageDTO.pageBlock}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/mypage?projectRequestPageNum=${myProjectRequestPageDTO.startPage - 5}&search=${param.search}&requestProject=${param.requestProject}"></a>
									</li>
								</c:if>
								
								<c:forEach begin="${myProjectRequestPageDTO.startPage}"
									end="${myProjectRequestPageDTO.endPage}" var="page">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/mypage?projectRequestPageNum=${page}&search=${param.search}&requestProject=${param.requestProject}&">${page}</a>
									</li>
								</c:forEach>

								<!-- 5칸씩 앞으로 이동 -->
								<c:if
									test="${myProjectRequestPageDTO.endPage < myProjectRequestPageDTO.pageCount}">
									<li class="page-item"><a class="page-link"
										href="${pageContext.request.contextPath}/mypage?projectRequestPageNum=${myProjectRequestPageDTO.endPage + 5}&search=${param.search}&requestProject=${param.requestProject}"></a>
									</li>
								</c:if>
							</ul>
						</nav>
						</c:if>
						</c:if>
					</c:if>
					
				</div>
			</div>

			<!-- QnA 내용 -->
			<div class="tab-content" id="qna-content">
				<div class="col-8 col-8-c second-section-2">

					<c:forEach items="${myQnaDTOList}" var="myQnaDTO">
						<div class="row">
							<div class="col">
								<div class="custom-title text-change-box">${myQnaDTO.qcommunity_title }</div>
								<div class="custom-content">
<%-- 								${myQnaDTO.qcommunity_content } --%>
											${fn:substring(myQnaDTO.qcommunity_content, 0, 40)}
   											<c:if test="${fn:length(myQnaDTO.qcommunity_content) > 40}">...</c:if>
								</div>
							</div>
							<div class="col">
								<div class="custom-date">${myQnaDTO.qcommunity_date }</div>
								<div class="custom-writer">
									<c:if test="${ empty myQnaDTO.qcommunity_answer }">
										<p class="col-auto card-text mb-1">답변대기</p>
									</c:if>
									<c:if test="${ ! empty myQnaDTO.qcommunity_answer }">
										<p class="col-auto card-text mb-1">답변완료</p>
									</c:if>
								</div>
							</div>
							<div class="row-line"></div>
						</div>
					</c:forEach>
				</div>
				<!-- qna 페이지네이션 -->
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<!-- 5칸씩 뒤로 이동 버튼 -->
						<c:if test="${myQnaPageDTO.startPage > myQnaPageDTO.pageBlock}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/mypage?qnaPageNum=${myQnaPageDTO.startPage - 5}"></a>
							</li>
						</c:if>

						<c:forEach begin="${myQnaPageDTO.startPage}"
							end="${myQnaPageDTO.endPage}" var="page">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/mypage?qnaPageNum=${page}">${page}</a>
							</li>
						</c:forEach>

						<!-- 5칸씩 앞으로 이동 -->
						<c:if test="${myQnaPageDTO.endPage < myQnaPageDTO.pageCount}">
							<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/mypage?qnaPageNum=${myQnaPageDTO.endPage + 5}"></a>
							</li>
						</c:if>
					</ul>
				</nav>

			</div>
		</div>
	</div>
	<!-- 탭 내용 끝-->
	<!-- 탭 전체 끝 -->
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
            });
        });
		
        // 중복확인 버튼 누르면
//         $(function(){
//         	console.log(`중복 확인 버튼 클릭됨`); 
//     		$('#id_check').click(function(){
//     			$.ajax({
//     				url:'${pageContext.request.contextPath}/mypage/idCheck',
//     				data:{'id':$('#user_id').val()}, // input id=user_id에값을 저장
//     				success:function(result){
//     					if(result == 'iddup'){
//     						result = "아이디 중복";
//     						$('#idcheck').html(result).css('color','red');
//     					}else{
//     						result = "아이디 사용가능";
//     						$('#idcheck').html(result).css('color','green');
//     					}
//     				}
//     			});//ajax()
//     		});//blur()
//     	});//시작()

        // 정보수정 버튼 클릭 이벤트
        document.getElementById("member_update_btn").addEventListener("click", function(event) {
        	event.preventDefault();

        	let form = document.getElementById("user-info-form");
            let password = document.getElementById("user_pass");
            let password_new = document.getElementById("password_new");
            let password_new_check = document.getElementById("password_new_check");

            if (password.value === "") {
                alert("비밀번호 수정 시 현재 비밀번호가 필요합니다.");
                password.focus();
                return;
            } 

            if (password_new.value === "") {
                alert("새 비밀번호를 입력해 주세요.");
                password_new.focus();
                return;
            }
            
            if (password_new_check.value === "") {
                alert("새 비밀번호를 확인해 주세요.");
                password_new_check.focus();
                return;
            }

            // 새 비밀번호가 8자 이상인지 확인
            if (password_new.value.length < 8) {
                alert("새 비밀번호는 8자 이상이어야 합니다.");
                password_new.focus();
                return;
            }

            // 새 비밀번호 확인이 일치하는지 확인
            if (password_new.value !== password_new_check.value) {
                alert("새 비밀번호가 일치하지 않습니다.");
                password_new_check.focus();
                return;
            }

            if (!confirm("비밀번호를 수정하시겠습니까?")) {
                return; // 사용자가 취소하면 함수 종료
            }

            // 모든 검증을 통과한 경우 폼 제출
            form.action = "${pageContext.request.contextPath}/mypage/mypageUpdatePro";
            form.method = "POST";
            form.submit();
            
        });

        // 회원탈퇴 버튼 클릭 이벤트
        document.getElementById("member_delete_btn").addEventListener("click", function(event) {
            event.preventDefault();
	
            let form = document.getElementById("user-info-form");
            
            let password = document.getElementById("user_pass");
            if (password.value === "") {
                alert("회원 탈퇴 시 비밀번호가 필요합니다.");
                password.focus();
                return;
            }

            if (confirm("정말로 회원탈퇴 하시겠습니까? 모든 정보가 삭제됩니다.")) {
                form.action = "${pageContext.request.contextPath}/mypage/myuserDeletePro";
                form.method = "POST";
                form.submit();
            }
        });
    });
    
    
    </script>

	<!-- Include Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<!-- Footer -->
	<jsp:include page="../include/footer.jsp" />
</body>
</html>
