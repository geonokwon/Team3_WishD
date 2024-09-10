<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>프로젝트 등록</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
	
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style_temp.css">


<style>
#selected_skill {
    margin-top: 10px;
    padding: 10px;
    
    
    border-radius: 5px;
    display: flex;
    flex-wrap: wrap; /* 여러 줄로 나누어 표시 */
    gap: 10px; /* 아이템 간의 간격 설정 */
    max-width: 100%; /* 부모 요소의 최대 크기를 지정 */
}

</style>
    <style>

    
        #selected-items {
            margin-top: 10px;
            padding: 10px;
            
            
            border-radius: 5px;
            min-height: 50px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
		.form-control{
			width:50%;
			display:inline;
		}
        .selected-item {
            background-color: #212529;
            color: white;
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 14px;
            display: flex;
            align-items: center;
        }

        .selected-item span {
            cursor: pointer;
            margin-left: 8px;
            font-weight: bold;
        }

        #item-input {
            margin-top: 10px;
        }
    </style>
    
<!--     임시 -->

</head>
<body class="text-light">

	<!-- Header -->
	<jsp:include page="../include/heard.jsp"/>
	
<!--     main content -->
	
	<div class="container px-5" style="margin-top:200px;" ><span><h1>프리랜서 등록</h1></span></div>
		
	
    <div class="container pt-4 mt-5">
    	
    		
    	
		<form action="${pageContext.request.contextPath}/freelancer_regPro" class="appForm" method="post" name="fr">
		
			<!-- 1) 근무조건 -->
	    	<div class="row mx-4 my-4 py-5" style="border-top: 1px solid grey; border-bottom: 1px solid grey;">
	    		<h6 style="color:red; margin-bottom:20px;"> *필수입력</h6>
	    		
	    		<h5><b>1)근무조건을 선택해 주세요.</b></h5>
	    		
	    		<!-- 1-1) 희망 월급 -->
	    		<div class="col-md-6 my-5 p-4">
						<h6><b>희망 월급<span style="color:red;"> *</span></b></h6>
						<span><input type = "number" name="freelancer_salary" class="bg-dark form-control" style="color:white;" min= "10" name = "freelancer_salary" step="10"  required> 만원</span>
	    		</div>
	    		<!-- 1-2) 프로젝트 시작 가능일 -->
	    		<div class="col-md-6 my-5 p-4">
	    				<div class="mini_temp2">
							<h6><b>프로젝트 시작 가능일<span style="color:red;"> *</span></b></h6>
							<input type = "date" id="date" name = "freelancer_startdate"class="form-control bg-dark" style="color:white;">
						</div>
	    		</div>
	    
	    	</div>
	    
	    
			<!-- 2) 경력 및 보유 스킬 -->
	        <div class="row mx-4 my-4 py-5" style="border-bottom: 1px solid grey;">
	    		<h5 style="margin-bottom:20px;"><b>2)경력 및 보유 스킬을 입력해 주세요.</b></h5>

				<!-- 2-1) 프리랜서 경험 -->
	    		<div class="col-md-6 my-5 p-4"> 
	    			<h6><b>프리랜서 경험<span style="color:red;"> *</span></b></h6>
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
					<h6><b>직무<span style="color:red;"> *</span></b></h6>
						<select name="freelancer_job" class="form-select bg-dark form-control" style="color:white;" >
							<option selected>직무를 선택하세요</option>
							<option value="front">프론트</option>
							<option value="backend">백엔드</option>
							<option value="app">앱 개발자</option>
							<option value="web">웹 개발자</option>
							<option value="data-science">데이터 사이언스</option>
							<option value="detect">보안</option>
						</select>    		
	    		</div>
	    		
				<!-- 2-3) 개발자 경력 -->
	    		<div class="col-md-6 my-5 p-4">
					<div class="mini_temp2">
						<h6><b>개발자 경력<span style="color:red;"> *</span></b></h6>
							<input type = "number" name = "dev_exp" class="bg-dark form-control" style="color:white;" min= "0" step="1"  required> 년
	    			</div>
	    		</div>
	    		
				<!-- 2-4) 보유 스킬 -->
	    		<div class="col-md-6 my-5 p-4">
					<h6><b>보유 스킬<span style="color:red;"> *</span></b></h6>
					<!-- 스킬을 선택할때마다 하단에 있는 영역에 스킬추가 -->
				    <select id="skill" class="form-select bg-dark" style="color:white; width:50%;" onchange="addSkill()" >
				    	<option value="">스킬을 선택하세요</option>
				        <option value="java">java</option>
				        <option value="python">python</option>
				        <option value="php">php</option>
				        <option value="javascript">javascript</option>
				        <option value="typescript">typescript</option>
				        <option value="spring">spring</option>
				        <option value="springboot">springboot</option>
				  	</select>
				  	
				  	<!-- 선택된 스킬을 보여주는 영역 -->
					<div id="selected_skill"></div>
	
					<!-- 선택된 스킬을 hidden input으로 담아서 서버에 전송 -->
					<input type="hidden" id="skills_hidden" name="skills">    			
	    		</div>
	    
	    	</div>
	    
			<!-- 3)상세 경력 -->
	        <div class="row mx-4 my-4 py-5" style="border-bottom: 1px solid grey;">
	    		<h5><b>3)상세경력을 입력해 주세요.</b></h5>
	    		
				<!-- 3-1) 상세 소개 -->
	    		<div class="col-md-12 my-5 p-4">
						<h6><b>상세 소개</b></h6>
						 <textarea class="form-control bg-dark" name="freelancer_introdution" style="color:white; height:200px; width:100%;" rows="20" cols="20" maxlength="5000"></textarea>
	    		</div>
	    		
				<!-- 3-2) 링크 -->
	    		<div class="col-md-12 my-5 p-4">
						<h6><b>링크<span style="color:rgba(128,128,128,0.5);">(깃헙, 포트폴리오, 노션 등)</span></b></h6>
						 <input type="text" class="form-control bg-dark" name="freelancer_link" style="color:white;" placeholder="sdsd">
	    		</div>
	    
	    	</div>
	    	
			<!-- 등록 버튼 -->
	    	<div class="container px-5 mb-5" style="height:50px;">
                <button type="button" class="btn btn-primary btn-lg" id="registration_button" style="float: right;" onclick="submitForm()">등록</button>
            </div>
	    	
	    </form>
		
    </div>
	
	<script>
	    var selectedSkills = [];  // 선택된 스킬을 저장할 배열
	
	    // 스킬 추가 함수
	    function addSkill() {
	        var skillSelect = document.getElementById("skill");
	        var selectedSkill = skillSelect.value;
	
	        // 스킬 선택 시 중복 방지
	        if (selectedSkill && !selectedSkills.includes(selectedSkill)) {
	            selectedSkills.push(selectedSkill);
	
	            // 선택된 스킬을 화면에 추가 표시
	            var selectedItemsDiv = document.getElementById("selected_skill");
	            var skillItem = document.createElement("div");
	            skillItem.className = "selected-item";
	            skillItem.innerHTML = selectedSkill + ' <span onclick="removeSkill(\'' + selectedSkill + '\')">x</span>';
	            selectedItemsDiv.appendChild(skillItem);
	
	            // 숨겨진 input 필드에 선택된 스킬들 저장
	            document.getElementById("skills_hidden").value = selectedSkills.join(",");
	        }
	    }
	    
		// 스킬 제거 함수
	    function removeSkill(skill) {
	        
	        selectedSkills = selectedSkills.filter(function(item) {
	            return item !== skill;
	        });
	
	        // 숨겨진 input 스킬필드 업데이트
	        document.getElementById("skills_hidden").value = selectedSkills.join(",");
	
	        // 선택된 스킬 표시 업데이트
	        var selectedItemsDiv = document.getElementById("selected_skill");
	        selectedItemsDiv.innerHTML = '';
	        selectedSkills.forEach(function(item) {
	            var skillItem = document.createElement("div");
	            skillItem.className = "selected-item";
	            
	            skillItem.innerHTML = item + ' <span onclick="removeSkill(\'' + item + '\')">x</span>';
	            selectedItemsDiv.appendChild(skillItem);
	        });
	    }
	
		
		//현재 날짜 구하기
		let currentDate = Date.now()
		let timeOff = new Date().getTimezoneOffset()*60000;
		let today = new Date(currentDate-timeOff).toISOString().split("T")[0];
		document.getElementById("date").setAttribute("min", today);
		
		//양식을 controller로 제출
		function submitForm() {
		    // 추가적인 유효성 검사 등을 할 수 있음
		    var form = document.forms['fr'];
		    
		    form.submit(); // 폼 제출
		}
	</script>
	
		
	<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

<script src="${pageContext.request.contextPath}/resources/project/project.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
></script>
</body>
</html>
