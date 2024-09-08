<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/">WishD</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/projectWrite">프로젝트 등록</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/freelancer/freelancer_reg">프리랜서 등록</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/projectFind?pageNum=">프로젝트 찾기</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">프리랜서 찾기</a></li>
                </ul>
                <button class="btn btn-primary ms-3" type="button" onclick="location.href='${pageContext.request.contextPath}/login'">로그인 / 회원가입</button>
            </div>
        </div>
    </nav>


