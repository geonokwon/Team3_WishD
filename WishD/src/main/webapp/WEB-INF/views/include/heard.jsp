<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">WishD</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/projectWrite">프로젝트 등록</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/freelancer_reg">프리랜서 등록</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/projectFind?pageNum=">프로젝트 찾기</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/freelancerFind?pageNum=">프리랜서 찾기</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/community">커뮤니티</a></li>
            </ul>
            <c:if test="${empty sessionScope.user_no}">
                <button class="btn btn-primary ms-3" type="button" onclick="location.href='${pageContext.request.contextPath}/login'">로그인 / 회원가입</button>
            </c:if>
            <c:if test="${! empty sessionScope.user_no}">
                <c:if test="${sessionScope.user_role eq 'user'}">
                    <button class="btn btn-primary ms-3" type="button" onclick="location.href='${pageContext.request.contextPath}/mypage'">마이페이지</button>
                    <button class="btn btn-primary ms-3" type="button" onclick="location.href='${pageContext.request.contextPath}/logout'">로그아웃</button>
                </c:if>
                <c:if test="${sessionScope.user_role eq 'admin'}">
                    <button class="btn btn-primary ms-3" type="button" onclick="location.href='${pageContext.request.contextPath}/manager/managerMain'">관리자 페이지</button>
                    <button class="btn btn-primary ms-3" type="button" onclick="location.href='${pageContext.request.contextPath}/logout'">로그아웃</button>
                </c:if>
            </c:if>
        </div>
    </div>
</nav>


