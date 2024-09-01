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


.freelancer_reg{
	
	border: 0px solid #141826;
	padding: 20px 0px 20px 20px;
	width : 1000px;
	height : 2000px;
	margin: 0px auto 100px auto;
	background-color: #141826;
	border-radius: 20px;
	
}

.temp{
	width : 980px;
	float:left; 
	padding: 20px;
	margin: 0px 0px 20px 0px;
	

}

.mini_temp1{
 	float:left; 
	padding: 20px 0px 0px 0px;
	margin-right: 40px;
	width : 460px;
}

.mini_temp2{
 	float:left; 
	padding: 20px 0px 0px 0px;
	
	width : 440px;
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
	<form action="${pageContext.request.contextPath}/member/freelancer_reg_Pro" method="post">
		<div class="freelancer_reg">
			<br>
			
			<!-- 첫번째 박스 -->
			<div class="temp">
				<h6 class="red"> *필수입력</h6>
				<h5><b>1)근무조건을 선택해 주세요.</b></h5>
				<div class="mini_temp1">
					<h6><b>희망 월급 <span class="red">*</span></b></h6>
					<input type = "number" min= "10" name = "freelancer_salary" step="10"  required> 만원
					
				</div>
				
				<div class="mini_temp2">
					<h6><b>프로젝트 시작 가능일 <span class="red">*</span></b></h6>
					<input type = "date" name = "freelancer_effective_date">
				</div>
			
			</div>
		
			<!-- 두번째 박스 -->
			<div class="temp">
				<h5><b>2)경력 및 보유 스킬을 입력해 주세요.</b></h5>

			
			</div>
			
			<!-- 세번째 박스 -->
			<div class="temp">
				<h5><b>3)상세경력을 입력해 주세요.</b></h5>
			
			
			</div>
			
		
		
		
		
		</div>
	</form>
	
	
	
	
	
	
	
	
	
	
	
	<!-- Footer -->
	<jsp:include page="../include/footer.jsp"/>

</body>
</html>
