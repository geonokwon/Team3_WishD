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
    <title>WishD | 프리랜서 보기</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style_temp.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/project/project.css">

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
                <div class="card-body" style="height: 1200px;">
                    <!-- 타이틀 -->
                    <p class="card-title fs-3" style="height: 90px">${freelancerDTO.getUser_name()}</p>

                    <!-- 현재 상태 -->

                    <!-- 구직중 일때 -->
                    <c:if test="${freelancerDTO.getFreelancer_state() eq '구직중'}">
                        <p class="badge rounded-pill fs-7">${freelancerDTO.getFreelancer_state()}</p>
                    </c:if>
                    <!-- 진행중 일때 -->
                    <c:if test="${freelancerDTO.getFreelancer_state() eq '진행중'}">
                        <p class="badge rounded-pill bg-secondary fs-7">${freelancerDTO.getFreelancer_state()}</p>
                    </c:if>
                    <!-- 완료 일때 -->
                    <c:if test="${freelancerDTO.getFreelancer_state() eq '완료'}">
                        <p class="badge rounded-pill bg-secondary fs-7">${freelancerDTO.getFreelancer_state()}</p>
                    </c:if>

                    <!-- 예상 금액 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 160px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/freelancer/svg/money.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">희망 월급</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0"><span class="money_min"><fmt:formatNumber value="${freelancerDTO.getFreelancer_salary()}" pattern="###,###,###"/></span> 만원</p>
                        </div>
                    </div>

                   <!-- 업무 시작 가능일 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 160px">
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
                        <div class="col-6 d-flex align-items-center" style="width: 160px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/freelancer/svg/job-group.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">직군</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0">${freelancerDTO.getJob_name()}</p>
                        </div>
                    </div>

                    <!-- 필요경력 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 160px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/freelancer/svg/job-history.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">경력</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0"> ${freelancerDTO.getDev_exp()}년</p>
                        </div>
                    </div>
                    
                    <!-- 프리랜서 경험 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 160px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/freelancer/svg/experience.png" style="width: 20px; height: 20px" />
                            <p class="mb-0">프리랜서 경험</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
 							<c:if test="${freelancerDTO.isFreelancer_exp()}">
									있음
                            </c:if>
                            <c:if test="${!freelancerDTO.isFreelancer_exp()}">
									없음
                            </c:if>
                        </div>
                    </div>
                    
                    <!-- 링크 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 160px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/freelancer/svg/link.png" style="width: 20px; height: 20px" />
                            <p class="mb-0">링크</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0"><a href="${freelancerDTO.getFreelancer_link()}" class="link-primary" style="text-decoration-line:none;">${freelancerDTO.getFreelancer_link()}</a></p>
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

                    <!-- 프리랜서 세부 내용 -->
                    <div class="mb-3">
                        <div class="d-flex mb-2">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/freelancer/svg/content.svg" style="max-width: 30px; max-height: 30px" />
                            <p class="card-title fs-5">프리랜서 상세 소개</p>
                        </div>
                        <div class="overlay-container"  style="height: 520px">
                            <c:if test="${!empty sessionScope.user_no}">
                                <!-- 로그인된 경우 프로젝트 세부 내용 표시 -->
                                <pre  class="textArea1 card-text" style="overflow-y: auto; max-height: 100%; word-wrap: break-word; white-space: pre-wrap; word-break:break-all;">${freelancerDTO.getFreelancer_introduction()}
                                </pre>
                            </c:if>
                            <c:if test="${empty sessionScope.user_no}">
                                <!-- 로그인되지 않은 경우 오버레이와 로그인 버튼 표시 -->
                                <pre  class="textArea1 card-text" style="overflow-y: auto; max-height: 100%; word-wrap: break-word; white-space: pre-wrap; word-break:break-all;">
                                    ${freelancerDTO.getFreelancer_introduction()}
                                </pre>
                                <div class="overlay-message active">

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
                
					<!--  프리랜서 글쓴이 본인이 아닌경우 매칭 권유 문구 출력 -->
                    <c:if test="${sessionScope.user_no != freelancerDTO.getUser_no()}">
	                    <div id="matching_Title">
	                        <p class="card-title fs-5">해당 프리랜서가 마음에 드시나요?</p>
	                        <p class="card-subtitle ms-1 mb-3">지금바로 매칭해보세요.</p>
	                    </div>
                    </c:if>
                    
                    <!-- 매칭하기 클릭시 -->
                    <div class="requestForm container mx-2" id="requestForm" style="display: none">
                        <div>
                            <p class="fs-5">요청서를 작성하세요</p>
                        </div>

                        <!-- 폼 시작 -->
                        <form action="${pageContext.request.contextPath}/freelancerReadReq/" method="post" id="freelancerReadForm">
                            <!-- 한줄 자기소개 -->
                            <div class="mb-4">
                                <label for="cl_subject" class="mb-1">프로젝트 제목</label>
                                <input type="text"
                                       class="form-control bg-dark"
                                       id="cl_subject"
                                       name="cl_subject"
                                       placeholder="프로젝트 제목"
                                       autocomplete="off"
                                       required />
                            </div>



<!--                             프로젝트 시작 가능일 -->
                            <div class="mb-4">
                                <label for="request_startDate" class="mb-2">프로젝트 시작 예정일</label>
                                <input type="date" class="form-control bg-dark" id="request_startDate" name="cl_startDate" required/>
                            </div>

<!--                             프로젝트 예상 기간(숫자만 입력하기) -->
                            <div class="row d-flex align-items-center mb-4">
                                <label for="cl_rangeMonth" class="mb-1">예상 기간</label>
                                <div class="col-4">
                                    <input type="text"
                                           class="form-control bg-dark"
                                           id="cl_rangeMonth"
										   name="cl_rangeMonth"
                                           placeholder="개월 수"
                                           autocomplete="off"
                                           required />
                                </div>

                                <div class="col-4">개월</div>
                            </div>
                            



							<!-- 요청 전 프로젝트 상세 소개 -->
							<c:if test = "${empty freelancerRequestDTO.getCl_content() }">
					    		<div class="mb-4">
	                                <label for="cl_content" class="mb-1">프로젝트 상세 소개</label>
										 <textarea class="form-control bg-dark" 
										 	 id="cl_content"
											 name="cl_content" 
											 style="height:200px; width:100%; resize:none;" 
											 rows="5" 
											 cols="5" 
											 maxlength="5000"
											 required></textarea>
					    		</div>			
							</c:if>

							<!-- 요청 후 프로젝트 상세 소개 -->

								<c:if test = "${freelancerDTO.getFreelancer_state() ne '구직중'}">
								    <c:if test = "${sessionScope.user_no == freelancerRequestDTO.getUser_no() || freelancerRequestDTO.getCl_request_isAgree()}">
								        <div class="mb-4">
								            <label for="cl_content" class="mb-1">프로젝트 상세 소개</label>
								            <pre class="form-control bg-dark" 
								                 id="cl_content" 
								                 style="overflow-y: auto; width:100%; height:200px; word-wrap: break-word; white-space: pre-wrap; word-break: break-all;"><c:out value="${freelancerRequestDTO.getCl_content()}" escapeXml="false"/></pre>
								        </div>
								    </c:if>
								</c:if>

<!--                             프로젝트 예상금액 -->
                            <div class="row d-flex align-items-center mb-4">
                                <label for="money" class="mb-1">프로젝트 예상금액</label>
                                <div class="col-5">
                                    <input type="text"
                                           class="form-control bg-dark"
                                           id="money"
                                           name="cl_money"
                                           placeholder="숫자입력"
                                           autocomplete="off"
                                           required />
                                </div>
                                <div class="col-3"> 만원</div>
                            </div>



<!--                             증명서 -->
                            <div class="mb-4">
                                <label for="formFile" class="form-label">사업자 등록증</label>
                                <p style="font-size: 12px; color: #aaaaaa">* 하나의 pdf파일 로 올려주세요</p>
                                <input class="form-control bg-dark" type="file" id="formFile" name="file"
							accept=".pdf"
                                       required/>
<!--                                 파일업로드 후 승인요청 시 파일 다운로드 할수있게 보여줌 -->
                                <div class="form-control bg-dark" type="text" id="requestFile" style="display: none">
                                    <a href="${pageContext.request.contextPath}/resources/upload/${freelancerRequestFileDTO.getP_file_name()}"
                                       download="${freelancerRequestFileDTO.getFileOriginName()}">${freelancerRequestFileDTO.getFileOriginName()}</a>
                                </div>

                            </div>

							<!-- 담당자 이름 -->
                            <div class="mb-4">
                                <label for="request_name" class="mb-1">담당자 이름</label>
                                <input type="text"
                                       class="form-control bg-dark"
                                       id="request_name"
                                       name="cl_name"
                                       placeholder="이름을 입력해 주세요"
                                       autocomplete="off"
                                       required />
                            </div>

                            <!-- 담당자 이메일 -->
                            <div class="mb-4">
                                <label for="request_email" class="mb-1">담당자 이메일</label>
                                <input type="email"
                                       class="form-control bg-dark"
                                       id="request_email"
                                       name="cl_email"
                                       placeholder="이메일을 입력해 주세요"
                                       autocomplete="off"
                                       required />
                            </div>

                            약관 동의
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
                    <c:if test="${! empty sessionScope.user_no}">
                        <c:if test="${sessionScope.user_no != freelancerDTO.getUser_no()}">
                            <div class="card" id="matching_button">
                                <button type="button" class="btn btn-primary">매칭하기</button>
                            </div>
                        </c:if>
                        
                        
                        <c:if test="${sessionScope.user_no == freelancerDTO.getUser_no()}">
                            <div class="card" id="update_button">
                                <button type="button" class="btn btn-primary" >글 수정하기</button>
                            </div>
                        </c:if>
                    </c:if>

                    <!-- 비로그인시 -->
                    <c:if test="${empty sessionScope.user_no}">
                        <div class="card">
                            <button class="btn btn-primary my-2 mx-4" onclick="location.href='${pageContext.request.contextPath}/login'">로그인 / 회원가입</button>
                        </div>
                    </c:if>

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
<script>
const userNo1 = "${sessionScope.user_no}";
const freelancerUserNo1 = "${freelancerDTO.getUser_no()}";
const freelancerId = "${freelancerDTO.getFreelancer_id()}";
let completeFreelancer = "${freelancerDTO.getFreelancer_state()}";
let isAgree = "${freelancerRequestDTO.getCl_request_isAgree()}";
console.log(isAgree);
	if (userNo1 === freelancerUserNo1) {
	    $('#update_button').click(function() {
	        console.log('글 수정 버튼 클릭됨');
	        location.href = "${pageContext.request.contextPath}/mypage/myfreelancerupdate?freelancerPageNum=" + freelancerId;
	    });
	}

	if(${freelancerRequestDTO != null }){
	    $("#sideCardBody_background").css("height", "1200px");
	    $("#matching_Title").hide();
	    $("#requestForm").show();
	    $("#matching_button").hide();
	    $("#agree_button").show();
	    $("#update_button").hide();
	    
	
	    //프로젝트 등록한 사람은 전부 disabled 처리 하고 버튼 승인 대기중 변경
	    let requestForm = $("#freelancerReadForm");
	    requestForm.find('a').on('click', (e) => {
	        e.preventDefault();
	    })
	    requestForm.find('input, select, textarea').prop('disabled', true);
	    // form.find('select').prop('disabled', true);
	    requestForm.find('input[type="checkbox"], input[type=radio], input[type=file]').prop('disabled', true);

	
	    let agree_button = $('#agree_button');
	    agree_button.prop('disabled', true);
	    
	    // 관리자 승인 전, 승인 후, 매칭 완료로 구분하여 agree_button이 동적으로 변함
	    if(isAgree === "false"){
	    	agree_button.text("관리자 승인 대기중");
	    }else {
		    if(completeFreelancer === "진행중"){
	    		agree_button.text("프리랜서 승인 대기중");
	    	}else{// 프리랜서 매칭 완료된 경우
	    		agree_button.hide();
	    	}
	    }

	    //승인 요청 완료 후 프로젝트 등록한 사람은 request_freelancer 에 등록한 사람의 승인 완료시
		
	    //freelancerRequestDTO
	    let sessionUserNo = parseInt("${sessionScope.user_no}");
	    console.log("sessionUserNo : " + sessionUserNo);
	    let freelancerUserNo = parseInt("${freelancerDTO.getUser_no()}")
	    console.log("freelancerUserNo : " + freelancerUserNo);
	    let requestUserNo = parseInt("${freelancerRequestDTO.getUser_no()}");
	    console.log("requestUserNo : " +requestUserNo);

	   

	    if (sessionUserNo === requestUserNo || ((sessionUserNo === freelancerUserNo) && isAgree === "true")){
	        $("#formFile").hide();
	        $("#requestFile").show();
	
	        //프로젝트 제목
	        $("#cl_subject").val("${freelancerRequestDTO.getCl_subject()}");
	        

	        //상세 소개
// 			$("#cl_content").val("<c:out value='${freelancerRequestDTO.getCl_content()}' />");
	
	        //프로젝트 예상기간
	        $("#cl_rangeMonth").val("${freelancerRequestDTO.getCl_rangeMonth()}");
	

	
	        //희망금액
	        $("#money").val("${freelancerRequestDTO.getCl_money()}");
	        console.log("freelancerRequestDTO.getCl_money(): '" + ${freelancerRequestDTO.getCl_money()} + "'");
	        //진행가능 날짜 형식 맞춤
	        let date = "${freelancerRequestDTO.getCl_startDate()}".split(" ")[0];
	        $("#request_startDate").val(date);
			
	        
	        
	        
	        
	        if(completeFreelancer === "완료"){
	        	//매칭완료된 이후 프리랜서 글작성자, 요청 작성자 모두 프로젝트 담당자 확인 가능
		        //담당자 이름
		        $("#request_name").val("${freelancerRequestDTO.getCl_name()}");
		        
		        //담당자 이메일
		        $("#request_email").val("${freelancerRequestDTO.getCl_email()}");
	        }else{
	        	if(sessionUserNo === freelancerUserNo){
			        $("#request_name").val("매칭 후 담당자 이름이 공개됩니다"); 
			        $("#request_email").val("매칭 후 담당자 이메일이 공개됩니다");
		        }else{
					//요청 작성자는 매칭 완료전에도 담당자 이름과 이메일을 확인 가능
			        //담당자 이름
			        $("#request_name").val("${freelancerRequestDTO.getCl_name()}");
			        
			        //담당자 이메일
			        $("#request_email").val("${freelancerRequestDTO.getCl_email()}");
		        }
		    }
	        //각종동의
	        $("#agree_1").prop("checked", true);
	        $("#agree_2").prop("checked", true);
	
			//관리자 승인되고 프리랜서 본인이 볼경우
	        if(sessionUserNo === freelancerUserNo && isAgree === "true" && completeFreelancer === "진행중"){
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
				// 담당자
	                location.href="${pageContext.request.contextPath}/freelancerMatching/${freelancerDTO.getFreelancer_id()}"
	                alert("매칭되었습니다.");
	            });
	
	            $('#cancel_button').click(function() {
	                console.log('취소 버튼 클릭됨');
	                location.href="${pageContext.request.contextPath}/freelancerReqFalse/${freelancerDTO.getFreelancer_id()}"
	                alert("매칭 취소하였습니다.");
	            });
	        }
	    }
	}

</script>
<script src="${pageContext.request.contextPath}/resources/freelancer/freelancer_read.js"></script>

<script>
    $(document).ready(function() {
        $('#freelancerReadForm').on('submit', function(event) {
            $('#agree_button').prop('disabled', true);
            event.preventDefault(); // 폼의 기본 제출 동작을 방지
            const form = $(this);
            //formData 형식으로 반환
            const formData = new FormData(this);
            console.log(formData);

        // FormData 내용 확인
			for (let pair of formData.entries()) {
			    if (pair[1] instanceof File) {
			        console.log(pair[0], pair[1].name);  // 파일 이름 출력
			        console.log(pair[0], pair[1].size);  // 파일 크기 출력
			        console.log(pair[0], pair[1].type);  // 파일 타입 출력
			    } else {
			        console.log(pair[0] + ', ' + pair[1]); // 다른 필드는 일반적으로 출력
			    }
			}
        
            //비동기 ajax 처리
            $.ajax({
                url: '${pageContext.request.contextPath}/freelancerReadReq/${freelancerDTO.getFreelancer_id()}',
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
                        form.find('input, select, textarea').prop('disabled', true);
                        // form.find('select').prop('disabled', true);
                        form.find('input[type="checkbox"], input[type=radio], input[type=file]').prop('disabled', true);


                        //버튼 비활성화
                        let agree_button = $('#agree_button');
                        agree_button.prop('disabled', true);
                        agree_button.text("관리자 승인 대기중");
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
