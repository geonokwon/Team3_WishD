<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>WishD | 커뮤니티 Q&A</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/write.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style_temp.css">

</head>
<body class="text-light">
<!-- Header -->
<jsp:include page="../include/heard.jsp"/>

<!-- main content -->

<!-- 컨테이너 -->
<div class="container-fluid">
    <!-- 섹션1 -->
    <div class="first-section d-flex">

        <div class="col-2 first-section-1 menutext-left">
        </div>

        <div class="col-8 first-section-2">
            <p class="headtext">
                Working on a computer is cool.
                <br>It doesn't fight with you, it remembers everything,
                <br><span class="" style="margin-right: 24.5rem;">it doesn't steal my beer.</span>
            </p>
        </div>

        <div class="col-2 first-section-3 menutext-right">
            <p class="user-number"><span class="color" style="color: rgb(119, 121, 169);">developers</span><br>connected now</p>
        </div>
    </div>

    <!-- 섹션 2 -->
    <div class="second-section d-flex">
        <!-- 섹션 2 - 1 --> 
        <div class="col-2 second-section-1 menutext-left">
           
            <!-- <div class="col">
                <a href="community" class="text-light text-decoration-none menu-up"><span class="color" style="color: rgb(119, 121, 169)">1_</span>Notice</a><br>
                <a href="qna" class="qna text-light text-decoration-none menu-up"><span class="color" style="color:rgb(119, 121, 169)">2_</span>Q&A</a><br>
                <a href="qna_write" class="write text-light text-decoration-none menu-up"><span class="color" style="color:rgb(119, 121, 169)">3_</span>Write</a><br>
            </div>
       -->
        </div>

        <!-- 섹션 2 - 2 글쓰기 -->
        <div class="col-8 second-section-2">

            <div class="row">

                <!-- Q&A 제목란 -->
                <div class="col" style="padding-left: 0;">
                    <div class="col-12 second-section-2"> 
                        <label for="notice_label" class="noticeLabelText">Q & A </label>   
                        <div class="write-line"></div>
                        <label for="notice_title" class="noticeTitleText">작성자: ${communityQnaDTO.user_no}</label>
<!--                         <input type="text" class="custom-textbox no-border" placeholder="제목을 작성해주세요......"> -->
						<div class="write-line" style="margin-top:0.6rem; margin-bottom: 0.6rem;"></div>
							<p class="customRead-textbox no-border readonly">${communityQnaDTO.qcommunity_title}</p>
                    </div>
                </div>

                <!-- Q&A 이메일란 -->
                <div class="col" style="padding-right: 0";>
                    <div class="col-12 second-section-2">
                        <label for="" class="noticeLabelText">&nbsp;</label>
                        <div class="write-line"></div>
                        <label for="notice_title" class="noticeTitleText">Email </label>
<!--                    <input type="text" class="custom-textbox no-border" placeholder="답변 받으실 이메일을 작성해주세요......"> -->
                   		<p class="custom-textbox no-border readonly">${communityQnaDTO.user_email}</p>
                    </div>
                </div>

                <!-- 내용란 -->
                <div class="col-12 second-section-2">
                    <div class="col">
                      <div class="d-flex justify-content-center">
                        <div class="write-line"></div>
                      </div>
<!--                         <label for="notice_title" class="noticeTitleText">Content </label> -->
<!--                         <textarea class="custom-textbox1 input-box no-border" placeholder="내용을 작성해주세요......"></textarea> -->
                	
                		<textarea class="custom-textbox1 input-box no-border readonly" id="dynamicTextarea">${communityQnaDTO.qcommunity_content}</textarea>
                    
                        <div class="write-line" style="margin-top: 1rem;"></div> <!-- 구분선 -->

                        <div class="d-flex justify-content-center" style="padding-top: 3%;">
                            <a href="qna" class="btn btn-primary2 text-light text-decoration-none">돌아가기</a>
							
							 <!-- 본인이 작성한 경우에만 수정하기 버튼 표시 -->
		        			<c:if test="${sessionScope.user_no == communityQnaDTO.user_no}">
		            			<div class="d-flex justify-content-center px-4">
		                			<a href="${pageContext.request.contextPath}/qna_update?qcommunity_num=${communityQnaDTO.qcommunity_num}" class="btn btn-primary2 text-light text-decoration-none">수정하기</a>
		           				</div>
		       				</c:if>
		       				
		       				<!-- 관리자인 경우에만 답변 완료 버튼 표시 -->
		        			<c:if test="${sessionScope.user_no == 999}">
		        			 	<form action="${pageContext.request.contextPath}/qna_answerPro" method="post">
		        			 	<input type="hidden" name="qcommunity_num" value="${communityQnaDTO.qcommunity_num}">
		        			  	<input type="hidden" name="qcommunity_answer" value="${communityQnaDTO.qcommunity_answer}">
		            				<div class="d-flex justify-content-center px-4">
		            					<button type="submit" class="btn btn-primary2 text-light text-decoration-none">[답변 완료]</button>
		           					</div>
		           					</form>
		       				</c:if>
		       				
		       				
		       			
							
		       				
                        </div>
                    </div>
                </div>

            </div>
        </div> <!-- 섹션 2 - 2 종료 -->

        <!-- 섹션 2 - 3 -->
        <div class="col-2 second-section-3 menutext-right-1">
             </div>

    </div> <!-- 섹션 2 종료 -->

    <div class="last-line"></div>

</div>    
<script>
    const textarea = document.getElementById('dynamicTextarea');

    // 초기 높이 조정
    textarea.style.height = 'auto'; // 기본 높이를 초기화
    textarea.style.height = textarea.scrollHeight + 'px'; // 내용에 맞게 높이 설정

    // 입력 이벤트가 발생할 때마다 높이 조정
    textarea.addEventListener('input', function () {
        this.style.height = 'auto'; // 초기화
        this.style.height = this.scrollHeight + 'px'; // 내용에 맞게 높이 설정
    });
</script>
<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>