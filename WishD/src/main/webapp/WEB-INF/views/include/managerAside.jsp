<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 관리자 메뉴 -->
  <div class="flex-shrink-0 p-3" style="width: 280px;">
    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-body-emphasis text-decoration-none border-bottom">
      <svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
      <span class="fs-5 fw-semibold">관리자 메뉴</span>
    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
          프로젝트/프리랜서 관리
        </button>
        <div class="collapse show" id="home-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${pageContext.request.contextPath}/manager/managerApProject" class="link-body-emphasis d-inline-flex text-decoration-none rounded">프로젝트 승인</a></li>
            <li><a href="${pageContext.request.contextPath}/manager/managerApFreelancer" class="link-body-emphasis d-inline-flex text-decoration-none rounded">프리랜서 승인</a></li>
            <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">비공개 프로젝트 관리</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
          게시판 관리
        </button>
        <div class="collapse" id="dashboard-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">QnA 게시판</a></li>
            <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">공지사항</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
          회원 관리
        </button>
        <div class="collapse" id="orders-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">전체 회원</a></li>
            <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">블랙리스트</a></li>
          </ul>
        </div>
      </li>
<!--       <li class="border-top my-3"></li> -->
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
          통계
        </button>
<!--         <div class="collapse" id="account-collapse"> -->
<!--           <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small"> -->
<!--             <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">New...</a></li> -->
<!--             <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Profile</a></li> -->
<!--             <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Settings</a></li> -->
<!--             <li><a href="#" class="link-body-emphasis d-inline-flex text-decoration-none rounded">Sign out</a></li> -->
<!--           </ul> -->
<!--         </div> -->
      </li>
    </ul>
  </div>