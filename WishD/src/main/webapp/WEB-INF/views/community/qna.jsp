<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/notice.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style_temp.css">

</head>
<body class="text-light">
<!-- Header -->
<jsp:include page="../include/heard.jsp"/>

<!-- main content -->

<!-- 컨테이너 -->
<div class="container-fluid first-section d-flex">
    <div class="col-2 first-section-1 menutext-left">
    </div>
    <div class="col-8 first-section-2">
        <p class="headtext">
            Working on a computer is cool.
            <br>It doesn't fight with you, it remembers everything,
            <br><span class="color" style="margin-right: 24.5rem;">it doesn't steal my beer.</span>
        </p>
    </div>
    <div class="col-2 first-section-3 menutext-right">
        <p class="user-number"><span class="color" style="color: rgb(119, 121, 169);">developers</span><br>connected now</p>
    </div>
</div>
</div>
<div class="container">
    <!-- 섹션1 -->


    <!-- 섹션 2 -->
    <div class="second-section d-flex" style="height: 900px;">

        <div class="col-1 second-section-1 menutext-left">
            <a href="community" class="comnotice text-light text-decoration-none menu-up"><span class="color" style="color: rgb(119, 121, 169)">1_</span>Notice</a><br>
            <a href="qna" class="qna text-light text-decoration-none menu-up"><span class="color" style="color:rgb(119, 121, 169)">2_</span>Q&A</a><br>
            
			<!-- 관리자는 질문 작성란이 안 뜸 -->
            <c:if test="${user_no != 999}">
            	<a href="qna_write" class="write text-light text-decoration-none menu-up"><span class="color" style="color:rgb(119, 121, 169)">3_</span>질문 작성</a><br>
            	<a href="http://c1d2405t3.itwillbs.com/WishD/mypage" class="myQna text-light text-decoration-none menu-up"><span class="color" style="color: rgb(119, 121, 169)">4_</span>My Q&A</a><br>
        	</c:if>
        </div>

        <!-- 질문 목록 -->
        <div class="col-10 second-section-2">
          <form method="post" action="/qna">
			<c:forEach items="${communityQnaList}" var="communityQnaDTO">
	            <div class="row">
	                    <div class="col">
	                        <div class=""><a href="${pageContext.request.contextPath}/qna_detail?qcommunity_num=${communityQnaDTO.qcommunity_num}" class="custom-title text-change-box text-decoration-none">${communityQnaDTO.qcommunity_title}</a>
	                        	
								<!-- 관리자가 답변 완료 버튼 눌렀으면 답변 완료 표시 -->
	                        	<c:if test="${communityQnaDTO.qcommunity_answer == 'complete'}">
								    <button class="btn answer-btn" disabled>답변 완료</button>
								</c:if>
	                        </div>

							<!-- 본인이 작성한 질문이거나 관리자면 미리보기 보여 주기 -->
	                    	<c:if test="${(user_no == communityQnaDTO.user_no) || user_no == 999}">
							     <div class="custom-content">
							    <c:choose>
							        <c:when test="${fn:length(communityQnaDTO.qcommunity_content) > 40}">
							            ${fn:substring(communityQnaDTO.qcommunity_content, 0, 40)}...
							        </c:when>
							        <c:otherwise>
							            ${communityQnaDTO.qcommunity_content}
							        </c:otherwise>
							    </c:choose>
							</div>
							</c:if>
							<c:if test="${(user_no != communityQnaDTO.user_no) && user_no != 999}">
							    <div class="custom-content">비밀글입니다</div>
							</c:if>
	                    
	                    </div>
	                    <div class="col">
	                        <div class="custom-date">${communityQnaDTO.qcommunity_date}</div>
	                        <div class="custom-writer" id="username">@${communityQnaDTO.user_name}</div>
	                        
	                    </div>
	                <div class="row-line"></div>
	            </div>
			</c:forEach>
		  </form>
        </div> <!-- 질문 목록 -->

	    <div class="col-1">
	    </div>

	</div>

</div> <!-- 컨테이너 -->

<!-- 	페이지네이션 -->
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center" style="">
            <!-- 10칸씩 뒤로 이동 버튼 -->
            <c:if test="${communityPageDTO.startPage > communityPageDTO.pageBlock}">
                <li class="page-item">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/qna?pageNum=${communityPageDTO.startPage - 10}"></a>
            </li>
            </c:if>

            <c:forEach begin="${communityPageDTO.startPage}" end="${communityPageDTO.endPage}" var="page">
                <li class="page-item">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/qna?pageNum=${page}">${page}</a>
                </li>
            </c:forEach>

            <!-- 10칸씩 앞으로 이동 -->
            <c:if test="${communityPageDTO.endPage < communityPageDTO.pageCount}">
                <li class="page-item">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/qns?pageNum=${communityPageDTO.endPage + 10}"></a>
            </li>
            </c:if>
        </ul>
    </nav>


<div class = "last-line"></div> <!-- 하단선 -->  
<script>
//마스킹 처리
function maskUsername(username) {
	//유저 네임이 없거나 2자 이하라면
    if (!username || username.length < 3) {
    	//2자 이하면 끝자리 잘라내고, 비어있어나 없으면 그대로 반환
    	return username ? username.slice(0, -1) + '*' : username;
    }

    //사용자 이름의 길이를 변수 length에 저장
    const length = username.length;
  	//첫글자와 마지막 글자 2개를 빼고 저장
    const maskLength = length - 2;
  	//2개 뺀 나머지는 *로 치환
    const maskedPart = '*'.repeat(maskLength);

    return username.charAt(0) + maskedPart + username.charAt(length - 1);
}

document.querySelectorAll('.custom-writer').forEach(element => {
    const originalUsername = element.textContent.trim().substring(1); // '@' 제거
    const maskedUsername = maskUsername(originalUsername);
    element.textContent = '@' + maskedUsername; // '@' 추가
});


</script>


<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>