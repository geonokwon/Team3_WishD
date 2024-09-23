<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>WishD | 커뮤니티</title>
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
    <div class="second-section d-flex" style="height: 900px;">

        <div class="col-2 second-section-1 menutext-left">
            <a href="community" class="comnotice text-light text-decoration-none menu-up"><span class="color" style="color: rgb(119, 121, 169)">1_</span>Notice</a><br>
            
			<!-- 로그인한 사람만 질문하기 게시판 들어갈 수 있게 -->
            <c:if test="${(user_no != null)}">
            	<a href="qna" class="qna text-light text-decoration-none menu-up"><span class="color" style="color:rgb(119, 121, 169)">2_</span>Q&A</a><br>
            </c:if>
            
            <!-- 비회원이 질문하기 게시판 들어가려면 로그인 페이지로 -->
            <c:if test="${(user_no == null)}">
            	<a href="http://c1d2405t3.itwillbs.com/WishD/login" class="qna text-light text-decoration-none menu-up"><span class="color" style="color:rgb(119, 121, 169)">2_</span>Q&A</a><br>
            </c:if>
			
			<!-- 관리자면 write 버튼 뜨게. -->
			<c:if test="${(user_no == 999)}">
            <a href="notice_write" class="write text-light text-decoration-none menu-up"><span class="color" style="color:rgb(119, 121, 169)">3_</span>공지 작성</a>
        	</c:if>
        </div>

        <!-- 글 목록 -->
        <div class="col-8 container second-section-2">
			<c:forEach items="${communityList}" var="communityDTO">
	            <div class="row">
	                    <div class="col">
	                        <div class=""><a href="${pageContext.request.contextPath}/notice_detail?ncommunity_num=${communityDTO.ncommunity_num}" class="custom-title text-change-box text-decoration-none">${communityDTO.ncommunity_title}</a></div>
	                        <div class="custom-content">${communityDTO.ncommunity_content}</div>
	                    </div>
	                    <div class="col">
	                        <div class="custom-date">${communityDTO.ncommunity_date}</div>
	                        <div class="custom-writer">@manager</div>
	                    </div>
	                <div class="row-line"></div>
	            </div>
	        </c:forEach>
	            
<!-- 	            <div class="row"> -->
<!-- 	                    <div class="col"> -->
<!-- 	                        <div class="custom-title text-change-box">${communityDTO.ncommunity_title}</div> --%>
<!-- 	                        <div class="custom-content">안녕하세요. 금일 어쩌구저쩌구 사전점검할거예요...</div> -->
<!-- 	                    </div> -->
<!-- 	                    <div class="col"> -->
<!-- 	                        <div class="custom-date">2024 07 08</div> -->
<!-- 	                        <div class="custom-writer">@manager</div> -->
<!-- 	                    </div> -->
<!-- 	                <div class="row-line"></div> -->
<!-- 	            </div> -->

            
        </div> <!-- 글 목록 -->

    <div class="col-2 second-section-1 menutext-right">
<!--         <a href="" class="text-light text-decoration-none menu-up"><span class="color" style="color: rgb(119, 121, 169)">4_</span>Search</a><br> -->
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
                   href="${pageContext.request.contextPath}/community?pageNum=${communityPageDTO.startPage - 10}"></a>
            </li>
            </c:if>


            <c:forEach begin="${communityPageDTO.startPage}" end="${communityPageDTO.endPage}" var="page">
                <li class="page-item">
                    <a class="page-link"
                       href="${pageContext.request.contextPath}/community?pageNum=${page}">${page}</a>
                </li>
            </c:forEach>

            <!-- 10칸씩 앞으로 이동 -->
            <c:if test="${communityPageDTO.endPage < communityPageDTO.pageCount}">
                <li class="page-item">
                <a class="page-link"
                   href="${pageContext.request.contextPath}/community?pageNum=${communityPageDTO.endPage + 10}"></a>
            </li>
            </c:if>
        </ul>
    </nav>
  <div class = "last-line"></div> <!-- 하단선 -->

<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>
