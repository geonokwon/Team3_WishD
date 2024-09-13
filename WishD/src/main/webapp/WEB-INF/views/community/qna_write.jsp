<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>qna_write</title>
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
                <div class="col">
                    <div class="col-12 second-section-2"> 
                        <label for="notice_label" class="noticeLabelText">Notice </label>   
                        <div class="write-line"></div>
                        <label for="notice_title" class="noticeTitleText">Title </label>
                        <input type="text" class="custom-textbox no-border" placeholder="제목을 작성해주세요......">
                    </div>
                </div>

                <!-- Q&A 이메일란 -->
                <div class="col">
                    <div class="col-12 second-section-2">
                        <label for="" class="noticeLabelText">&nbsp;</label>
                        <div class="write-line"></div>
                        <label for="notice_title" class="noticeTitleText">Email </label>
                        <input type="text" class="custom-textbox no-border" placeholder="답변 받으실 이메일을 작성해주세요......">
                    </div>
                </div>

                <!-- 내용란 -->
                <div class="col-12 second-section-2">
                    <div class="col">
                        <div class="write-line"></div>
                        <label for="notice_title" class="noticeTitleText">Content </label>
                        <textarea class="custom-textbox1 input-box no-border" placeholder="내용을 작성해주세요......"></textarea>
                
                        <div class="write-line" style="margin-top: 1rem;"></div> <!-- 구분선 -->

                        <div class="d-flex justify-content-center" style="padding-top: 3%;">
                            <button type="button" class="btn btn-primary2">글쓰기 완료</button>
                        </div>
                    </div>
                </div>

            </div>
        </div> <!-- 섹션 2 - 2 종료 -->

        <!-- 섹션 2 - 3 -->
        <div class="col-2 second-section-3 menutext-right-1">
            <a href="community" class="text-light text-decoration-none menu-up"><span class="color" style="color: rgb(119, 121, 169)">1_</span>Notice</a><br>
            <a href="qna" class="qna text-light text-decoration-none menu-up"><span class="color" style="color:rgb(119, 121, 169)">2_</span>Q&A</a><br>
            <a href="" class="myqna text-light text-decoration-none menu-up"><span class="color" style="color:rgb(119, 121, 169)">3_</span>My Q&A</a>
        </div>

    </div> <!-- 섹션 2 종료 -->

    <div class="last-line"></div>

</div>    

<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>