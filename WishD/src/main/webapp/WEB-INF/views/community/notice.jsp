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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/project.css">

</head>
<body class="text-light">
<!-- Header -->
<jsp:include page="../include/heard.jsp"/>

<!-- Main Content -->
    
     <div class="container">
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="d-flex">
          <p class="fs-2 mt-5 mx-5 fw-semibold" style="color: #fff;">커뮤니티 게시판</p>
          
            <button type="button" class="btn btn-primary fs-6 position-absolute" style="right: 310px; top: 187px;">글쓰기</button>
          </div>
         
        <hr style="border: solid 1px #6F40C8;">
        
        <div class="d-flex justify-content-center my-3">
            <!-- 메뉴리스트 -->
            <div class="col-2 text-start card bg-primary me-1" style="height: 1200px;">
                <a href="notice.jsp" class="text-center text-light text-decoration-none mt-5 fs-5 lh-sm">공지사항</a>
                <a href="QnA_page.jsp" class="text-center text-light text-decoration-none mt-5 fs-5 lh-sm">Q & A</a>
            </div>
            <!-- 공지사항 게시판  -->
            <div class="col-8 text-center card bg-primary">
                <table class="table">
                  <thead>
                     <tr>
                      <p class="text-start my-4 mx-4 fs-5 fw-bold lh-1" style="color: #fff;">공지사항 게시판</p>
                        <th scope="col fw-bold">No.</th>
                        <th scope="col fw-bold">제목</th>
                        <th scope="col fw-bold">작성일자</th>
                      </tr>
                    </thead>
                    <tr>
                        <th scope="row" class="align-middle" style="height: 80px;">1</th>
                        <td class="align-middle">2024년 02월 21 ~ 2024년 03월 31일 까지 페이지 점검</td>
                        <td class="align-middle">2024-02-06</td>
                    
                    </tr>
                    <tr>
                        <th scope="row" class="align-middle" style="height: 80px;">2</th>
                        <td class="align-middle">2024년 02월 21 ~ 2024년 03월 31일 까지 페이지 점검</td>
                        <td class="align-middle">2024-02-06</td>
                    
                    </tr>
                    <tr>
                        <th scope="row" class="align-middle" style="height: 80px;">3</th>
                        <td class="align-middle">2024년 02월 21 ~ 2024년 03월 31일 까지 페이지 점검</td>
                        <td class="align-middle">2024-02-06</td>
                    
                    </tr>
                    <tr>
                        <th scope="row" class="align-middle" style="height: 80px;">4</th>
                        <td class="align-middle">2024년 02월 21 ~ 2024년 03월 31일 까지 페이지 점검</td>
                        <td class="align-middle">2024-02-06</td>
                    
                    </tr>
                    <tr>
                        <th scope="row" class="align-middle" style="height: 80px;">5</th>
                        <td class="align-middle">2024년 02월 21 ~ 2024년 03월 31일 까지 페이지 점검</td>
                        <td class="align-middle">2024-02-06</td>
                    
                    </tr>
                    <tr>
                        <th scope="row" class="align-middle" style="height: 80px;">6</th>
                        <td class="align-middle">2024년 02월 21 ~ 2024년 03월 31일 까지 페이지 점검</td>
                        <td class="align-middle">2024-02-06</td>
                    
                    </tr>
                    <tr>
                        <th scope="row" class="align-middle" style="height: 80px;">7</th>
                        <td class="align-middle">2024년 02월 21 ~ 2024년 03월 31일 까지 페이지 점검</td>
                        <td class="align-middle">2024-02-06</td>
                    
                    </tr>
                    <tr>
                        <th scope="row" class="align-middle" style="height: 80px;">8</th>
                        <td class="align-middle">2024년 02월 21 ~ 2024년 03월 31일 까지 페이지 점검</td>
                        <td class="align-middle">2024-02-06</td>
                    </tr>
                  </table>
                  <!--페이지-->
                  
                  <nav aria-label="Page navigation example">
                    <ul class="pagination position-absolute bottom-0 start-50 translate-middle-x mb-3">
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                        </a>
                      </li>
                      <li class="page-item"><a class="page-link" href="#">1</a></li>
                      <li class="page-item"><a class="page-link" href="#">2</a></li>
                      <li class="page-item"><a class="page-link" href="#">3</a></li>
                      <li class="page-item"><a class="page-link" href="#">4</a></li>
                      <li class="page-item"><a class="page-link" href="#">5</a></li>
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                        </a>
                      </li>
                    </ul>
                  </nav>
                 
            </div>
        </div>

     </div>

<!-- Footer -->
<jsp:include page="../include/footer.jsp"/>

</body>
</html>