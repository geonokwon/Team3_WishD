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
#main_context {
	text-align: center;

}

.red{
	color : red;

}

/* 등록 양식 스타일 */
.freelancer_reg{
	
	border: 0px solid #141826;
	padding: 20px;
	width : 100%;
	display: flex;
	flex-direction : column;
	margin: 0px auto 100px auto;
	background-color: #141826;
	border-radius: 20px;
	
}


.temp1{
	width : 960px;
	float:left; 
	padding: 20px 20px 80px 20px;
	border-bottom: 1px solid rgba(128,128,128,0.5);
}

/* 큰 화면에서 왼쪽 블럭 */
.mini_temp1{
 	float:left; 
	padding: 20px 0px 0px 0px;
	margin-right: 40px;
	width : 460px;
}

/* 큰 화면에서 오른쪽 블럭 */
.mini_temp2{
 	float:left; 
	padding: 20px 0px 0px 0px;
	
	width : 420px;
}

input, select{
	background-color : #0e1117;
	color : #fff;
}

/* 작은 화면에서는 한 줄에 하나씩 배치되도록 설정 */
@media (max-width: 768px) {
	.freelancer_reg {
		width: 100%;
	}

	.temp1 {
		width: 100%;
		padding: 20px 20px 80px 20px;

	}

	.mini_temp1,
	.mini_temp2 {
		min-width: 100%;
		padding: 20px 0px;
	}
}

</style>
    <style>
        #selected-items {
            margin-top: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            border-radius: 5px;
            min-height: 50px;
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .selected-item {
            background-color: #007bff;
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


</head>
<body class="text-light">

	<!-- Header -->
	<jsp:include page="../include/heard.jsp"/>
	
	<!-- Main Content -->
	<div class="container my-4 mx-5 px-5 py-5">
		<span id="main_context"><h1>프리랜서 등록</h1></span>
	

	
		<form action="${pageContext.request.contextPath}/freelancer/freelancer_regPro" class="appForm" method="post" name="fr">
			<div class="freelancer_reg">
				<br>
				
				<!-- 첫번째 박스 -->
				<div class="temp1">
					<h6 class="red"> *필수입력</h6>
					<h5><b>1)근무조건을 선택해 주세요.</b></h5>
					<div class="mini_temp1">
						<h6><b>희망 월급<span class="red">*</span></b></h6>
						<input type = "number" min= "10" name = "freelancer_salary" step="10"  required> 만원
						
					</div>
					
					<div class="mini_temp2">
						<h6><b>프로젝트 시작 가능일<span class="red">*</span></b></h6>
						<input type = "date" name = "freelancer_effective_date">
					</div>
				
				</div>
			
				<!-- 두번째 박스 -->
				<div class="temp1">
					<h5><b>2)경력 및 보유 스킬을 입력해 주세요.</b></h5>
					
					<div class="mini_temp1">
						<h6><b>프리랜서 경험<span class="red">*</span></b></h6>
							<input type = "radio" name = "freelancer_exp"  value = "yes" />있음
							<input type = "radio" name = "freelancer_exp"  value = "no" />없음
						
						<br><br><br>
						<h6><b>직무<span class="red">*</span></b></h6>
							  <select name="freelancer_job" >
							      <option value="">직무를 선택하세요</option>
							      <option value="front">프론트</option>
							      <option value="backend">백엔드</option>
							      <option value="app">앱 개발자</option>
							      <option value="web">웹 개발자</option>
							      <option value="data-science">데이터 사이언스</option>
							      <option value="detect">보안</option>
							  </select>
					</div>
					
					<div class="mini_temp2">
						<h6><b>개발자 경력<span class="red">*</span></b></h6>
							<input type = "number" min= "0" name = "dev_exp" step="1"  required> 년
						
						<h6><b>보유 스킬<span class="red">*</span></b></h6>
							<!-- 스킬을 선택할때마다 하단에 있는 영역에 스킬추가 -->
						    <select id="skill" name="skills" onchange="addSkill()">  
						        <option value="java">java</option>
						        <option value="python">python</option>
						        <option value="php">php</option>
						        <option value="javascript">javascript</option>
						        <option value="typescript">typescript</option>
						        <option value="spring">spring</option>
						        <option value="springboot">springboot</option>
						  	</select>
						  	
						  	<!-- 선택된 스킬을 보여주는 영역 -->
							<div id="selected-items"></div>
	
							<!-- 선택된 스킬을 hidden input으로 담아서 서버에 전송 -->
							<input type="hidden" id="skills-hidden" name="skills">
					</div>
				
								
				
				</div>
				
				<!-- 세번째 박스 -->
				<div class="temp1">
					<h5><b>3)상세경력을 입력해 주세요.</b></h5>
				
				
				</div>
				
	
			
			
			
                <div class="card">
                    <button type="button" class="btn btn-primary" id="registration_button">등록</button>
                </div>
			</div>
<!-- 				<a  href="javascript:document.fr.submit();"> -->
		</form>
	</div>
	
	<script>
	    var selectedSkills = [];  // 선택된 스킬을 저장할 배열
	
	    function addSkill() {
	        var skillSelect = document.getElementById("skill");
	        var selectedSkill = skillSelect.value;
	
	        // 중복 선택 방지
	        if (!selectedSkills.includes(selectedSkill)) {
	            selectedSkills.push(selectedSkill);
	            
	            // 선택된 스킬을 화면에 표시
	            var selectedItemsDiv = document.getElementById("selected-items");
	            var skillItem = document.createElement("div");
	            skillItem.className = "selected-item";
	            skillItem.innerHTML = selectedSkill + ' <span onclick="removeSkill(\'' + selectedSkill + '\')">x</span>';
	            selectedItemsDiv.appendChild(skillItem);
	
	            // 숨겨진 input 필드에 선택된 스킬들 저장
	            document.getElementById("skills-hidden").value = selectedSkills.join(",");
	        }
	    }
	
	    function removeSkill(skill) {
	        // 배열에서 스킬 제거
	        selectedSkills = selectedSkills.filter(function(item) {
	            return item !== skill;
	        });
	
	        // 숨겨진 input 필드 업데이트
	        document.getElementById("skills-hidden").value = selectedSkills.join(",");
	
	        // 선택된 스킬 표시 업데이트
	        var selectedItemsDiv = document.getElementById("selected-items");
	        selectedItemsDiv.innerHTML = '';
	        selectedSkills.forEach(function(item) {
	            var skillItem = document.createElement("div");
	            skillItem.className = "selected-item";
	            skillItem.innerHTML = item + ' <span onclick="removeSkill(\'' + item + '\')">x</span>';
	            selectedItemsDiv.appendChild(skillItem);
	        });
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
