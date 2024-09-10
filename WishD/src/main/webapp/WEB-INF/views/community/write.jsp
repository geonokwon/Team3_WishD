<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>temp</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/community/community.css">

</head>
<body class="text-light">
<!-- Header -->
<jsp:include page="../include/heard.jsp"/>

<!-- Main Content -->
    <div class="container">

          <div class="d-flex mt-custom">
            <p class="fs-2 mt-5 mx-5 fw-semibold mt-custom-6" style="color: #fff;">커뮤니티 게시판</p>
          </div>
         
        <hr style="border: solid 1px #6F40C8;">
        
        <div class="d-flex justify-content-center my-3">
            <!-- 메뉴리스트 -->
            <div class="col-2 text-start card bg-primary me-1" style="height: 850px;">
                <a href="notice.html" class="text-center text-light text-decoration-none mt-5 fs-5 lh-sm">공지사항</a>
                <a href="qna_page.html" class="text-center text-light text-decoration-none mt-5 fs-5 lh-sm">Q & A</a>
            </div>
        
            <!-- 글쓰기  -->
            <div class="col-8 card bg-primary">
                <p class="fs-6 mt-5 mx-4 fw-bold" style="color: #fff;">NO. : 1</p>
                <hr style="border: solid 1px #6F40C8;">
                    <div class="d-flex">
                        <label for="notice_title" class="title fw-bold fs-6 mt-3 mx-5">제목: </label>
                        <!-- 제목 텍스트 박스 -->
                        <input type="text" class="form-control2 card mt-2 shadow-effect no-border" id="Textarea1" placeholder="제목을 작성해주세요" style="width: 400px; height: 45px;">
                    </div>
                        
                    <label for="notice_title" class="title fw-bold fs-6 mt-4 mx-5">상세내용 </label>
                    <!-- 상세내용 텍스트 박스 -->
                    <div class="d-flex justify-content-center my-3">
                        <textarea class="form-control2 card mt-2 shadow-effect no-border textboxsize" id="Textarea2"></textarea>
                        <button type="button" class="btn btn-primary2 fs-6 justify-content: center; position-absolute" style="top: 745px;">글쓰기 완료</button>
                    </div>
                    
                </div>
        </div>
    </div>

<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>
