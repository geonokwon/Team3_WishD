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
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style_temp.css">


<style>
#top {
	text-align: center;

}

.red{
	color : red;

}

/* 등록 양식 스타일 */
.freelancer_reg{
	
	border: 0px solid #141826;
	padding: 20px;
	width : 1000px;
	display: flex;
	flex-direction : column;
	margin: 0px auto 100px auto;
	background-color: #141826;
	border-radius: 20px;
	
}


.temp{
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

	.temp {
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
	<br><br><br><br><br><br><br><br>
	
	
	<span id="top"><h1>프리랜서 등록</h1></span>
	
	<br><br><br><br>
	<form action="${pageContext.request.contextPath}/freelancer/freelancer_regPro" class="appForm" method="post" name="fr">
		<div class="freelancer_reg">
			<br>
			
			<!-- 첫번째 박스 -->
			<div class="temp">
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
			<div class="temp">
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
					    <select id="skills" onchange="addSkill()">  
					        <option value="java">java</option>
					        <option value="python">python</option>
					        <option value="php">php</option>
					        <option value="javascript">javascript</option>
					        <option value="typescript">typescript</option>
					        <option value="spring">spring</option>
					        <option value="springboot">springboot</option>
					  </select>
				</div>
			
							
			
			</div>
			
			<!-- 세번째 박스 -->
			<div class="temp">
				<h5><b>3)상세경력을 입력해 주세요.</b></h5>
			
			
			</div>
			

		
		
		
			<a href="javascript:document.fr.submit();">등록</a>
		</div>
			
	</form>

	<script>
// 		function addskill(){
// 		let skillValue = document.getElementById("skills");
// 		alert(skillValue);
// 		}
	
	</script>
	
	
	
	
	
	
	
		
	<!-- Footer -->
	<jsp:include page="../include/footer.jsp"/>

</body>
</html>
