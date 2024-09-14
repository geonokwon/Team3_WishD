<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>project_read</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/project/project.css">
    <title>chatting</title>
</head>
<body class="d-flex flex-column min-vh-100 justify-content">
<!-- Header -->
<jsp:include page="../include/heard.jsp"/>

<!-- Main Content -->
<div class="container my-4 mx-5 px-5 py-5">
    <!-- main -->
    <div class="container mt-5">
        <div class="container row align-items-start">
            <!-- project Read card -->
            <div class="card col-xl-7 bg-primary rounded-lg me-2 p-3 h-100">
                <div class="card-body project-details" style="height: 1000px">
                    <!-- 타이틀 -->
                    <p class="card-title fs-3" style="height: 90px">${projectDTO.getPboard_title()}</p>

                    <!-- 현재 상태 -->

                    <!-- 모집중 일때 -->
                    <c:if test="${projectDTO.getPboard_state() == '모집중'}">
                        <p class="badge rounded-pill fs-7">${projectDTO.getPboard_state()}</p>
                    </c:if>
                    <!-- 진행중 일때 -->
                    <c:if test="${projectDTO.getPboard_state() == '진행중'}">
                        <p class="badge rounded-pill bg-secondary fs-7">${projectDTO.getPboard_state()}</p>
                    </c:if>
                    <!-- 완료 일때 -->
                    <c:if test="${projectDTO.getPboard_state() == '완료'}">
                        <p class="badge rounded-pill bg-secondary fs-7">${projectDTO.getPboard_state()}</p>
                    </c:if>

                    <!-- 예상 금액 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/money.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">예상 금액</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0"><span class="money_min"><fmt:formatNumber value="${projectDTO.getPboard_money()}" pattern="###,###,###"/></span> 만원</p>
                        </div>
                    </div>

                    <!-- 시작 예정일 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/calendar.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">시작 예정일</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0">
                                <fmt:parseDate value="${projectDTO.getPboard_startDate()}" var="parsedDate" pattern="yyyy-MM-dd" />
                                <fmt:formatDate value="${parsedDate}" pattern="yyyy년 MM월 dd일" />
                            </p>
                        </div>
                    </div>

                    <!-- 예상 기간 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/date-range.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">예상 기간</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0"><span class="month_range">${projectDTO.getPboard_rangeMonth()}</span> 개월</p>
                        </div>
                    </div>

                    <!-- 직군 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/job-group.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">직군</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0">${projectDTO.getPboard_job()}</p>
                        </div>
                    </div>

                    <!-- 필요경력 -->
                    <div class="row mb-3">
                        <div class="col-6 d-flex align-items-center" style="width: 140px">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/job-history.svg" style="width: 20px; height: 20px" />
                            <p class="mb-0">경력</p>
                        </div>
                        <div class="col-6 d-flex align-items-center text-end-fixed">
                            <p class="mb-0">2 년차</p>
                        </div>
                    </div>

                    <!-- 필요스킬 -->
                    <!-- 포문으로 skill 전부 다가져오기 -->
                    <div class="mb-3">
                        <c:forEach items="${projectDTO.getSkills()}" var="skill">
                            <div class="badge rounded-pill me-2 mb-1 fs-7">${skill.getSkill_name()}</div>
                        </c:forEach>
                    </div>

                    <!-- 경계선 -->
                    <hr class="custom-hr" />

                    <!-- 프로젝트 세부 내용 -->
                    <div class="mb-3">
                        <div class="d-flex mb-2">
                            <img class="img-fluid me-2" src="${pageContext.request.contextPath}/resources/project/svg/content.svg" style="max-width: 30px; max-height: 30px" />
                            <p class="card-title fs-5">프로젝트 세부 내용</p>
                        </div>
                        <!-- 공백과 줄바꿈을 그대로 반영하는 pre 태그 사용 -->
                        <pre class="card-text">${projectDTO.getPboard_content()}</pre>
                    </div>

                    <!-- 끝단 -->
                </div>
            </div>

            <!-- side request-form card -->
            <div class="card col-xl-4 bg-primary rounded-lg me-2 p-3" id= chat" style="height: 1030px">
                <!-- 채팅내역 -->
                <div id="chat" class="d-flex flex-column">
                    <c:if test="${!empty chatHistory}">
                        <c:forEach items="${chatHistory}" var="chatting">
                            <div id="massageContainer" class="d-flex justify-content-${chatting.user_no == user_no ? 'start' : 'end'} mb-2">
                                <div class="badge fs-5 ${chatting.user_no == user_no ? 'bg-success' : ''}">
                                        ${chatting.chat_content}
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
                <input type="text" id="message" placeholder="Type your message here" />
                <button onclick="sendMessage()">Send</button>
            </div>
            <!-- side rquest-form end-->
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"
></script>
<script>
    let stompClient = null;
    let pboard_id = "${projectDTO.getPboard_id()}"/* 서버에서 pboard_id 값을 받아오도록 설정 */;
    let user_no = "${sessionScope.user_no}"/* 사용자 번호 */;

    function connect() {
        let socket = new SockJS('${pageContext.request.contextPath}/chat'); // 서버의 WebSocket 엔드포인트에 맞게 수정
        stompClient = Stomp.over(socket);

        stompClient.connect({}, (frame) => {
            console.log("Connected: " + frame);

            // 채팅방 구독
            stompClient.subscribe('/topic/board/' + pboard_id, (message) => {
                let chatMessage = JSON.parse(message.body);
                showMessage(chatMessage); // 서버로부터 수신된 메시지를 표시
            });
        }, (error) => {
            console.error("STOMP connect error : " + error);
        });
    }

    // 메시지 전송
    function sendMessage() {
        let messageContent = document.getElementById("message").value;
        if (messageContent && stompClient) {
            stompClient.send("/app/send/" + pboard_id, {}, JSON.stringify({
                chat_content: messageContent,
                user_no: user_no
            }));

            // 메시지 전송 후 입력창 비우기
            document.getElementById("message").value = '';
        }
    }
    // 메시지 표시 함수
    function showMessage(chatMessage) {
        console.log(chatMessage);
        let chat = document.getElementById("chat");
        // 메시지 컨테이너 생성
        let messageContainer = document.createElement('div');
        messageContainer.classList.add('d-flex', 'mb-2');
        messageContainer.classList.add(chatMessage.user_no == user_no ? 'justify-content-start' : 'justify-content-end');

        // 메시지 배지 생성
        let messageElement = document.createElement('div');
        messageElement.classList.add('badge', 'fs-5');
        if (chatMessage.user_no == user_no) {
            messageElement.classList.add('bg-success');
        }
        messageElement.textContent = chatMessage.chat_content;

        // 배지를 컨테이너에 추가하고, 컨테이너를 채팅창에 추가
        messageContainer.appendChild(messageElement);
        chat.appendChild(messageContainer);

        // 채팅창이 새 메시지로 스크롤되도록 설정
        chat.scrollTop = chat.scrollHeight;
    }

    // Enter 키로 메세지 전송
    document.getElementById("message").addEventListener("keypress", (event) => {
        if (event.key === "Enter") {
            event.preventDefault(); // 폼 제출 방지
            sendMessage();
        }
    });

    connect();
</script>

</body>
</html>
