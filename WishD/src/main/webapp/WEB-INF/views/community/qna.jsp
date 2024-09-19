<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>qna</title>
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
                <br><span class="color" style="margin-right: 24.5rem;">it doesn't steal my beer.</span>
            </p>
        </div>

        <div class="col-2 first-section-3 menutext-right">
            <p class="user-number"><span class="color" style="color: rgb(119, 121, 169);">developers</span><br>connected now</p>
        </div>
    </div>

    <!-- 섹션 2 -->
    <div class="second-section d-flex">

        <div class="col-2 second-section-1 menutext-left">
            <a href="community" class="text-light text-decoration-none menu-up"><span class="color" style="color: rgb(119, 121, 169)">1_</span>Notice</a><br>
            <a href="qna" class=" qna text-light text-decoration-none menu-up"><span class="color" style="color:rgb(119, 121, 169)">2_</span>Q & A</a><br>
            <a href="qna_write" class="write text-light text-decoration-none menu-up"><span class="color" style="color:rgb(119, 121, 169)">3_</span>Write</a>
        </div>

        <!-- 질문 목록 -->
        <div class="col-8 second-section-2">
			<c:forEach items="${communityQnaList}" var="communityQnaDTO">
	            <div class="row">
	                    <div class="col">
	                        <div class=""><a href="${pageContext.request.contextPath}/qna_detail?qcommunity_num=${communityQnaDTO.qcommunity_num}" class="custom-title text-change-box text-decoration-none">${communityQnaDTO.qcommunity_title}</a></div>
	                        <div class="custom-content">${communityQnaDTO.qcommunity_content}</div>
	                    </div>
	                    <div class="col">
	                        <div class="custom-date">${communityQnaDTO.qcommunity_date}</div>
	                        <div class="custom-writer">@${communityQnaDTO.user_name}</div>
	                    </div>
	                <div class="row-line"></div>
	            </div>
			</c:forEach>

        </div> <!-- 질문 목록 -->

    <div class="col-2 second-section-1 menutext-right">
        <a href="" class="text-light text-decoration-none menu-up"><span class="color" style="color: rgb(119, 121, 169)">4_</span>My Q&A</a><br>
    </div>

</div>
    <div class="last-line"></div> <!-- 하단선 -->

</div> <!-- 컨테이너 -->

  

<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>
