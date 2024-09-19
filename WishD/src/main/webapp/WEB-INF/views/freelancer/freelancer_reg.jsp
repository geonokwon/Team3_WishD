<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>프리랜서 등록</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style_temp.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/freelancer/freelancer.css">




</head>
<body class="text-light">
<!-- <body class="d-flex flex-column min-vh-100 justify-content"> -->

	<!-- Header -->
	<jsp:include page="../include/heard.jsp"/>
	
	<!-- main content -->
	
    <div class="container pt-4 mt-5" style="width: 1040px"><span><h1>프리랜서 등록</h1></span></div>
		
	
    <div class="container pt-4 mt-5" style="width: 1040px">
    	
    	<div class="card p-2 mt-2">
    	
			<form action="${pageContext.request.contextPath}/freelancer_regPro" class="appForm" method="post" name="fr">
			
				<!-- 1) 근무조건 -->
		    	<div class="row mx-4 my-4 py-5" style="border-bottom: 1px solid grey;">
		    		<h6 style="color:red; margin-bottom:20px;"> *필수입력</h6>
		    		
		    		<h5><b>1)근무조건을 선택해 주세요.</b></h5>
		    		
		    		<!-- 1-1) 희망 월급 -->
		    		<div class="col-md-6 my-5 p-4">
							<h6>희망 월급<span style="color:red;"> *</span></h6>
							<span><input type = "number"
										 name="freelancer_salary" 
										 class="bg-dark form-control" 
										 style="color:white; display:inline; width:150px;" 
										 min= "10" 
										 name = "freelancer_salary" 
										 step="10"  required> 만원</span>
		    		</div>
		    		
		    		<!-- 1-2) 프로젝트 시작 가능일 -->
		    		<div class="col-md-6 my-5 p-4">
							<h6>프로젝트 시작 가능일<span style="color:red;"> *</span></h6>
							<input type = "date" 
								   id="date" 
								   name = "freelancer_startdate"
								   class="form-control bg-dark" 
								   style="color:white; width:200px;"
								   onclick="this.showPicker()">
	    			</div>
		    
		    	</div>
		    
		    
				<!-- 2) 경력 및 보유 스킬 -->
		        <div class="row mx-4 my-4 py-5" style="border-bottom: 1px solid grey;">
		    		<h5 style="margin-bottom:20px;"><b>2)경력 및 보유 스킬을 입력해 주세요.</b></h5>
	
					<!-- 2-1) 프리랜서 경험 -->
		    		<div class="col-md-6 my-5 p-4"> 
		    			<h6>프리랜서 경험<span style="color:red;"> *</span></h6>
			    		<span class="form-check">
							<input type="radio" class="form-check-input" id="radio1" name="freelancer_exp" value="true">
							<label class="form-check-label" for="radio1">있음</label>
						</span>
						<span class="form-check">
							<input type="radio" class="form-check-input" id="radio2" name="freelancer_exp" value="false">
							<label class="form-check-label" for="radio2">없음</label>
						</span>	    			
		    		</div>
		    		
		    		<!-- 2-2) 직무 -->
		    		<div class="col-md-6 my-5 p-4">
						<h6>직무<span style="color:red;"> *</span></h6>
							<select name="freelancer_job" class="form-select bg-dark form-control" style="color:white; width:200px;">
		                       		<option value="" disabled selected>직무를 선택하세요</option>
		                        	<c:forEach items="${jobList}" var="job">
		                        		<option value="${job.getJob_id()}">${job.getJob_name()}</option>
		                        	</c:forEach>
	                    	</select>
		    		</div>
		    		
					<!-- 2-3) 개발자 경력 -->
		    		<div class="col-md-6 my-5 p-4">
						<div class="mini_temp2">
							<h6>개발자 경력<span style="color:red;"> *</span></h6>
								<input type = "number" 
										name = "dev_exp" 
										class="bg-dark form-control" 
										style="color:white; display:inline; width:200px;" 
										min= "0" 
										step="1"  
										required> 년
		    			</div>
		    		</div>
		    		
					<!-- 2-4) 보유 스킬 -->
		    		<div class="col-md-6 my-5 p-4">
						<h6>보유 스킬<span style="color:red;"> *</span></h6>
						<!-- 스킬을 선택할때마다 하단에 있는 영역에 스킬추가 -->
					  	<select id="skill" class="form-select bg-dark" style="color:white; width:200px;" onchange="addSkill()">
	                        <option value="" disabled selected>스킬선택</option>
	                        <c:forEach items="${freelancerSkillList}" var="skill">
	                        <option value="${skill.getSkill_id()}">${skill.getSkill_name()}</option>
	                        </c:forEach>
                    	</select>
                    	
					  	<!-- 선택된 스킬을 보여주는 영역 -->
						<div id="selected_skill_container"></div>
		
						<!-- 선택된 스킬을 hidden input으로 담아서 서버에 전송 -->
						<input type="hidden" id="skills_hidden" name="skillIdList" required>    			
		    		</div>
		    
		    	</div>
		    
				<!-- 3)상세 경력 -->
		        <div class="row mx-4 my-4 py-5" style="border-bottom: 1px solid grey;">
		    		<h5><b>3)상세경력을 입력해 주세요.</b></h5>
		    		
					<!-- 3-1) 상세 소개 -->
		    		<div class="col-md-12 my-5 p-4">
							<h6>상세 소개</h6>
							 <textarea class="form-control bg-dark" 
								 name="freelancer_introduction" 
								 style="color:white; height:200px; width:100%; resize:none;" 
								 rows="20" 
								 cols="20" 
								 maxlength="5000"></textarea>
		    		</div>
	
					<!-- 3-2) 링크 -->
		    		<div class="col-md-8 my-5 p-4">
							<h6>링크<span style="color:rgba(128,128,128,0.5);">(깃헙, 포트폴리오, 노션 등)</span></h6>
							 <input type="text" 
							 		class="form-control bg-dark" 
							 		name="freelancer_link" 
							 		style="color:white;" 
							 		placeholder="https://github.com/"
							 		onclick="this.placeholder='';" 
       								onblur="this.placeholder='https://github.com/';">
		    		</div>
		    
		    	</div>
		    	        <!-- 숨겨진 필드로 세션에 저장된 user_no 전달 ${sessionScope.user_no} -->
        <input type="hidden" name="user_no" value="3">
        
				<!-- 등록 버튼 -->
		    	<div class="container px-5 mb-5" style="height:50px;">
	                <button type="button" 
	                		class="btn btn-primary btn-lg" 
	                		id="registration_button" 
	                		style="float: right;" 
	                		onclick="submitForm()">등록</button>
	            </div>
		    	
		    </form>
		</div>
    </div>
	

	
		
	<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

<script src="${pageContext.request.contextPath}/resources/freelancer/freelancer_reg.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
></script>
</body>
</html>
