<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>글 수정 | WishD</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style_temp.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/freelancer/freelancer.css">


</head>
<body class="text-light">

    <!-- 헤더 -->
    <jsp:include page="../include/heard.jsp" />

    
<!-- main content -->
	
    <div class="container pt-4 px-5" style="width: 920px; margin-top:150px;">
    <span>
    <img class="float-start mt-1"
				src="${pageContext.request.contextPath}/resources/project/images/speaker.png" />
    <h2> 프리랜서 정보를 수정해 주세요</h2></span></div>
		
	
    <div class="container mt-5" style="width: 920px">
    	
    	<div class="card p-2 mt-2">
    		
					
			<form action="${pageContext.request.contextPath}/mypage/myFreelancerUpdatePro" class="appForm" method="post" name="fr">
				
				<!-- 히든 입력 -->
                <input type="hidden" name="freelancer_id" value="${myfreelancerDTO.freelancer_id}">
                <input type="hidden" name="user_no" value="${myfreelancerDTO.user_no}">

				<!-- 1) 근무조건 -->
		    	<div class="row mx-4 my-4 py-5" style="border-bottom: 1px solid rgba(128,128,128,0.2);">
		    		<h6 style="color:red; margin-bottom:20px;"> *필수입력</h6>
		    		
		    		<h5><b>1) 근무조건을 선택해 주세요.</b></h5>
		    		
		    		<!-- 1-1) 희망 월급 -->
		    		<div class="col-md-6 my-1 px-5 p-1 ">
							<h6>희망 월급<span style="color:red;"> *</span></h6>
							<div><input type = "number"
										 name="freelancer_salary" 
										 class="bg-dark form-control" 
										 style="color:white; display:inline; width:150px;" 
										 min= "10" 
										 step="10"  
										 required
										 onblur="validateSalary()" value="${myfreelancerDTO.freelancer_salary}"
										 > 만원</div>
						<span id="salary_error" class="text-danger" style="font-size: 12px;"></span> <!-- 경고 메시지 -->										 
		    		</div>
		    		
		    		<!-- 1-2) 프로젝트 시작 가능일 -->
		    		<fmt:parseDate value="${myfreelancerDTO.freelancer_startdate}" var="myFreeUpdateStartDate" pattern="yyyy-MM-dd" />
		    		<div class="col-md-6 my-1 px-5 p-1">
							<h6>프로젝트 시작 가능일<span style="color:red;"> *</span></h6>
							<input type = "date" 
								   id="date" 
								   name = "freelancer_startdate"
								   class="form-control bg-dark" 
								   style="color:white; width:200px;"
								   onclick="this.showPicker()"
								   required
								   onblur="validateStartDate()"
								   value="<fmt:formatDate value='${myFreeUpdateStartDate}' pattern='yyyy-MM-dd' />">
						<span id="startdate_error" class="text-danger" style="font-size: 12px;"></span> <!-- 경고 메시지 -->	   
	    			</div>
		    
		    	</div>
		    
		    
				<!-- 2) 경력 및 보유 스킬 -->
		        <div class="row mx-4 my-4 py-5" style="border-bottom: 1px solid rgba(128,128,128,0.2);">
		    		<h5 style="margin-bottom:20px;"><b>2) 경력 및 보유 스킬을 입력해 주세요.</b></h5>
	
					<!-- 2-1) 프리랜서 경험 -->
					<div class="col-md-6 my-1 px-5 p-1"> 
					    <h6>프리랜서 경험<span style="color:red;"> *</span></h6>
					    <span class="form-check">
					        <input type="radio" class="form-check-input" id="radio1" name="freelancer_exp"
					        value="true" <c:if test="${myfreelancerDTO.freelancer_exp == true }">checked</c:if> onclick="validateExperience()">
					        <label class="form-check-label" for="radio1">있음</label>
					    </span>
					    <span class="form-check">
					        <input type="radio" class="form-check-input" id="radio2" name="freelancer_exp"
					        value="false" <c:if test="${myfreelancerDTO.freelancer_exp == false }">checked</c:if> onclick="validateExperience()">
					        <label class="form-check-label" for="radio2">없음</label>
					    </span>	    			
					    <span id="exp_error" class="text-danger" style="font-size: 12px;"></span> <!-- 경고 메시지 -->
					</div>
		    		
		    		<!-- 2-2) 직무 -->
		    		<div class="col-md-6 my-1 px-5 p-1">
						<h6>직무<span style="color:red;"> *</span></h6>
							<select name="job_id" class="form-select bg-dark form-control" style="color:white; width:200px;" onblur="validateJob()">
		                       		<option value="" disabled>직무를 선택하세요</option>
		                        	<c:forEach items="${myFreeJobsDTO}" var="myFreeJobs"> --%>
                                		<option <c:if test="${myfreelancerDTO.job_id == myFreeJobs.job_id}">selected</c:if> value="${myFreeJobs.job_id}">${myFreeJobs.job_name}</option>
                            		</c:forEach>
	                    	</select>
	                    <span id="job_error" class="text-danger" style="font-size: 12px;"></span> <!-- 경고 메시지 -->
		    		</div>
		    		
					<!-- 2-3) 개발자 경력 -->
		    		<div class="col-md-6 my-1 px-5 p-1">
						<div class="mini_temp2">
							<h6>개발자 경력<span style="color:red;"> *</span></h6>
								<input type = "number" 
										name = "dev_exp" 
										class="bg-dark form-control" 
										style="color:white; display:inline; width:200px;" 
										min= "0" 
										step="1"  
										required
										onblur="validateDevExp()"
										value="${myfreelancerDTO.dev_exp}"
										> 년
		    			</div>
		    			<span id="devexp_error" class="text-danger" style="font-size: 12px;"></span> <!-- 경고 메시지 -->
		    		</div>
		    		
					<!-- 2-4) 보유 스킬 -->
		    		<div class="col-md-6 my-1 px-5 p-1">
						<h6>보유 스킬<span style="color:red;"> *</span></h6>
						<!-- 스킬을 선택할때마다 하단에 있는 영역에 스킬추가 -->
					  	<select id="skill" class="form-select bg-dark" style="color:white; width:200px;" onchange="addSkill()" required  onblur="validateSkill()">
	                        <option value="" disabled>스킬선택</option>
	                        <c:forEach items="${myFreelancerSkillList}" var="skill"> --%>
                                <option value="${skill.getSkill_id()}">${skill.getSkill_name()}</option>
                            </c:forEach>

                    	</select>
                    	
                    	<span id="skill_error" class="text-danger" style="font-size: 12px;"></span> <!-- 경고 메시지 -->	
<!-- 선택된 스킬을 보여주는 영역 -->
                        <div id="selected_skill">
                            <c:forEach items="${myfreelancerDTO.skills}" var="selectedSkill">
                                <p class="badge rounded-pill mb-1 me-2" data-skill-id="${selectedSkill.getSkill_id()}">${selectedSkill.getSkill_name()}</p>
                            </c:forEach>
                        </div>
<!-- 						선택된 스킬을 hidden input으로 담아서 서버에 전송 -->
						<input type="hidden" id="skills_hidden" name="skillList" required>    		

		    		</div>
		    
		    	</div>
		    
				<!-- 3)상세 경력 -->
		        <div class="row mx-4 my-4 py-5" style="border-bottom: 1px solid rgba(128,128,128,0.2);">
		    		<h5><b>3) 상세경력을 입력해 주세요.</b></h5>
		    		
					<!-- 3-1) 상세 소개 -->
		    		<div class="col-md-12 my-1 px-5 p-1">
							<h6>상세 소개</h6>
							 <textarea class="form-control bg-dark" 
								 name="freelancer_introduction" 
								 style="color:white; height:200px; width:100%; resize:none;" 
								 rows="20" 
								 cols="20" 
								 maxlength="5000">${myfreelancerDTO.freelancer_introduction}</textarea>
		    		</div>
	
					<!-- 3-2) 링크 -->
		    		<div class="col-md-8 my-1 px-5 p-1">
							<h6>링크<span style="color:rgba(128,128,128,0.5);">(깃헙, 포트폴리오, 노션 등)</span></h6>
							 <input type="text" 
							 		class="form-control bg-dark" 
							 		name="freelancer_link" 
							 		style="color:white;" 
							 		placeholder="https://github.com/"
							 		onclick="this.placeholder='';" 
       								onblur="this.placeholder='https://github.com/';"
       								value="${myfreelancerDTO.freelancer_link}">
		    		</div>
		    
		    	</div>

<!--         		                수정 버튼 -->
                <div class="container px-5 mb-5" style="height: 50px;">
 	                <button type="button" class="btn btn-primary btn-lg" id="free_update_cancel_btn" style="float: right; background-color:#666;">취소</button>
                    <button type="button" class="btn btn-primary btn-lg" id="free_update_btn" style="float: right; margin-right: 10px;">수정</button>
                </div>

		    	
		    </form>
		</div>
    </div>

    
    
    
    
<!--     <div class="container pt-4 mt-5" style="width: 1040px"> -->
<!--         <div class="card p-2 mt-2"> -->
<%--             <form action="${pageContext.request.contextPath}/mypage/myFreelancerUpdatePro" class="appForm" method="post" name="fr"> --%>
<!--                 히든 입력 -->
<%--                 <input type="hidden" name="freelancer_id" value="${myfreelancerDTO.freelancer_id}"> --%>
<%--                 <input type="hidden" name="user_no" value="${myfreelancerDTO.user_no}"> --%>

<!--                 근무 조건 -->
<!--                 <div class="row mx-4 my-4 py-5" style="border-bottom: 1px solid grey;"> -->
<!--                     <h6 style="color: red; margin-bottom: 20px;">*필수 입력</h6> -->
<!--                     <h5><b>1) 근무 조건을 선택해 주세요.</b></h5> -->

<!--                     희망 월급 -->
<!--                     <div class="col-md-6 my-5 p-4"> -->
<!--                         <h6>희망 월급<span style="color: red;"> *</span></h6> -->
<%--                         <input type="number" name="freelancer_salary" class="bg-dark form-control" style="color: white; width: 150px;" min="10" value="${myfreelancerDTO.freelancer_salary}" step="10" required> 만원 --%>
<!--                     </div> -->

<!--                     프로젝트 시작 가능일 -->
<!--                     <div class="col-md-6 my-5 p-4"> -->
<!--                         <h6>프로젝트 시작 가능일<span style="color: red;"> *</span></h6> -->
<%--                         <fmt:parseDate value="${myfreelancerDTO.freelancer_startdate}" var="myFreeUpdateStartDate" pattern="yyyy-MM-dd" /> --%>
<%--                         <input type="date" id="date" name="freelancer_startdate" class="form-control bg-dark" style="color: white; width: 200px;" value="<fmt:formatDate value='${myFreeUpdateStartDate}' pattern='yyyy-MM-dd' />" onclick="this.showPicker()"> --%>
<!--                     </div> -->
<!--                 </div> -->

<!--                 경력 및 보유 스킬 -->
<!--                 <div class="row mx-4 my-4 py-5" style="border-bottom: 1px solid grey;"> -->
<!--                     <h5 style="margin-bottom: 20px;"> -->
<!--                         <b>2) 경력 및 보유 스킬을 입력해 주세요.</b> -->
<!--                     </h5> -->

<!--                     프리랜서 경험 -->
<!--                     <div class="col-md-6 my-5 p-4"> -->
<!--                         <h6>프리랜서 경험<span style="color: red;"> *</span></h6> -->
<!--                         <span class="form-check">  -->
<%--                             <input type="radio" class="form-check-input" id="radio1" name="freelancer_exp" value="true" <c:if test="${myfreelancerDTO.freelancer_exp == true }">checked</c:if>> --%>
<!--                             <label class="form-check-label" for="radio1">있음</label> -->
<!--                         </span>  -->
<!--                         <span class="form-check">  -->
<%--                             <input type="radio" class="form-check-input" id="radio2" name="freelancer_exp" value="false" <c:if test="${myfreelancerDTO.freelancer_exp == false }">checked</c:if>> --%>
<!--                             <label class="form-check-label" for="radio2">없음</label> -->
<!--                         </span> -->
<!--                     </div> -->

<!--                     직무 -->
<!--                     <div class="col-md-6 my-5 p-4"> -->
<!--                         <h6>직무<span style="color: red;"> *</span></h6> -->
<!--                         <select name="job_id" class="form-select bg-dark form-control" style="color: white; width: 200px;"> -->
<!--                             <option disabled>직무를 선택하세요</option> -->
<%--                             <c:forEach items="${myFreeJobsDTO}" var="myFreeJobs"> --%>
<%--                                 <option <c:if test="${myfreelancerDTO.job_id == myFreeJobs.job_id}">selected</c:if> value="${myFreeJobs.job_id}">${myFreeJobs.job_name}</option> --%>
<%--                             </c:forEach> --%>
<!--                         </select> -->
<!--                     </div> -->

<!--                     개발자 경력 -->
<!--                     <div class="col-md-6 my-5 p-4"> -->
<!--                         <h6>개발자 경력<span style="color: red;"> *</span></h6> -->
<%--                         <input type="number" name="dev_exp" class="bg-dark form-control" style="color: white; width: 200px;" min="0" step="1" value="${myfreelancerDTO.dev_exp}" required> 년 --%>
<!--                     </div> -->

<!--                     보유 스킬 선택 부분 -->
<!--                     <div class="col-md-6 my-5 p-4"> -->
<!--                         <h6>보유 스킬<span style="color: red;"> *</span></h6> -->
<!--                         <select id="skill" class="form-select bg-dark" style="color: white; width: 200px;" onchange="addSkill()"> -->
<!--                             <option value="" disabled>스킬 선택</option> -->
<%--                             <c:forEach items="${myFreelancerSkillList}" var="skill"> --%>
<%--                                 <option value="${skill.getSkill_id()}">${skill.getSkill_name()}</option> --%>
<%--                             </c:forEach> --%>
<!--                         </select> -->

<!--                         선택된 스킬을 보여주는 영역 -->
<!--                         <div id="selected_skill"> -->
<%--                             <c:forEach items="${myfreelancerDTO.skills}" var="selectedSkill"> --%>
<%--                                 <p class="badge rounded-pill mb-1 me-2" data-skill-id="${selectedSkill.getSkill_id()}">${selectedSkill.getSkill_name()}</p> --%>
<%--                             </c:forEach> --%>
<!--                         </div> -->

<!--                         선택된 스킬을 hidden input으로 담아서 서버에 전송 -->
<!--                         <input type="hidden" id="skills_hidden" name="skillList" required> -->
<!--                     </div> -->
<!--                 </div> -->

<!--                 상세 경력 -->
<!--                 <div class="row mx-4 my-4 py-5" style="border-bottom: 1px solid grey;"> -->
<!--                     <h5><b>3) 상세 경력을 입력해 주세요.</b></h5> -->

<!--                     상세 소개 -->
<!--                     <div class="col-md-12 my-5 p-4"> -->
<!--                         <h6>상세 소개</h6> -->
<%--                         <textarea class="form-control bg-dark" name="freelancer_introduction" style="color: white; height: 200px; width: 100%; resize: none;" rows="20" cols="20" maxlength="5000">${myfreelancerDTO.freelancer_introduction}</textarea> --%>
<!--                     </div> -->

<!--                     링크 -->
<!--                     <div class="col-md-8 my-5 p-4"> -->
<!--                         <h6>링크<span style="color: rgba(128, 128, 128, 0.5);">(깃헙, 포트폴리오, 노션 등)</span></h6> -->
<%--                         <input type="text" class="form-control bg-dark" name="freelancer_link" style="color: white;" placeholder="https://github.com/" value="${myfreelancerDTO.freelancer_link}"> --%>
<!--                     </div> -->
<!--                 </div> -->

<!--                 수정 버튼 -->
<!--                 <div class="container px-5 mb-5" style="height: 50px;"> -->
<!--  	                <button type="button" class="btn btn-primary btn-lg" id="free_update_cancel_btn" style="float: right; background-color:#666;">취소</button> -->
<!--                     <button type="button" class="btn btn-primary btn-lg" id="free_update_btn" style="float: right; margin-right: 10px;">수정</button> -->
<!--                 </div> -->
<!--             </form> -->
<!--         </div> -->
<!--     </div> -->

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var selectedSkills = []; // 선택된 스킬 ID를 저장할 배열
            var skillNames = {}; // 스킬 ID와 이름을 매핑하기 위한 객체

            // 페이지 로드 시 기존 스킬을 초기화
            var skillElements = document.querySelectorAll("#selected_skill .badge");
            skillElements.forEach(function(element) {
                var skillId = element.getAttribute("data-skill-id");
                var skillName = element.textContent.trim();
                selectedSkills.push(skillId);
                skillNames[skillId] = skillName;

                // 기존 스킬 배지에 클릭 이벤트 추가
                element.addEventListener("click", function() {
                    removeSkill(skillId);
                });
            });
            document.getElementById("skills_hidden").value = selectedSkills.join(",");

            // 스킬 추가 함수
            window.addSkill = function() {
                var skillSelect = document.getElementById("skill");
                var selectedSkillId = skillSelect.value;
                var selectedSkillName = skillSelect.options[skillSelect.selectedIndex].text;

                // 스킬 선택 시 중복 방지
                if (selectedSkillId && !selectedSkills.includes(selectedSkillId)) {
                    selectedSkills.push(selectedSkillId);
                    skillNames[selectedSkillId] = selectedSkillName;

                    // 선택된 스킬을 화면에 배지로 추가 표시
                    var selectedItemsDiv = document.getElementById("selected_skill");
                    var skillItem = document.createElement("p");
                    skillItem.className = "badge rounded-pill mb-1 me-2";
                    skillItem.setAttribute("data-skill-id", selectedSkillId);
                    skillItem.textContent = selectedSkillName;
                    skillItem.addEventListener("click", function() {
                        removeSkill(selectedSkillId);
                    });
                    selectedItemsDiv.appendChild(skillItem);

                    // 숨겨진 input 필드에 선택된 스킬들 저장
                    document.getElementById("skills_hidden").value = selectedSkills.join(",");

                    // 스킬 선택 초기화
                    skillSelect.selectedIndex = 0;
                }
            }

            // 스킬 제거 함수
            window.removeSkill = function(skillId) {
                // 스킬 ID와 이름 매핑에서 제거
                delete skillNames[skillId];

                // 스킬 ID 배열에서 제거
                selectedSkills = selectedSkills.filter(function(item) {
                    return item !== skillId;
                });

                // 숨겨진 input 스킬필드 업데이트
                document.getElementById("skills_hidden").value = selectedSkills.join(",");

                // 선택된 스킬 표시 업데이트
                var selectedItemsDiv = document.getElementById("selected_skill");
                var skillItems = selectedItemsDiv.querySelectorAll(".badge");
                skillItems.forEach(function(item) {
                    if (item.getAttribute("data-skill-id") === skillId) {
                        selectedItemsDiv.removeChild(item);
                    }
                });
            }
            
            window.free_update_btn = function() {
            	var salary = document.querySelector('input[name="freelancer_salary"]');
                var devExp = document.querySelector('input[name="dev_exp"]');
                var date = document.querySelector('input[name="freelancer_startdate"]');
                var intro = document.querySelector('textarea[name="freelancer_introduction"]');
                var link = document.querySelector('input[name="freelancer_link"]');

                // 유효성 검사 및 포커스 처리
                if (salary.value === '') {
                    salary.focus();
//                     alert("희망 월급을 입력하세요.");
                    return;
                }

                if (devExp.value === '') {
                    devExp.focus();
//                     alert("개발자 경력을 입력하세요.");
                    return;
                }
                
                if (date.value === '') {
                    date.focus();
//                     alert("프로젝트 시작 가능일을 입력하세요.");
                    return;
                }
                
                if (intro.value === '') {
                    intro.focus();
//                     alert("상세 소개를 입력하세요.");
                    return;
                } 
                
                if (link.value === '') {
                    link.focus();
//                     alert("링크를 입력하세요.");
                    return;
                }
                
                if (confirm("수정하시겠습니까?")) {
                    document.forms['fr'].submit();
                }
            };
            
            window.free_update_cancel_btn = function(){
            	if (confirm("취소하시겠습니까?")) {
            		window.location.href = "${pageContext.request.contextPath}/mypage";
                }
            };
            
            // 버튼 클릭 시 이벤트 핸들러 추가해야함
            document.getElementById("free_update_btn").addEventListener("click", free_update_btn);
            document.getElementById("free_update_cancel_btn").addEventListener("click", free_update_cancel_btn);
        });
        
       
        
        
    </script>

    <!-- Footer -->
    <jsp:include page="../include/footer.jsp" />

    <script src="${pageContext.request.contextPath}/resources/freelancer/freelancer_reg.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
