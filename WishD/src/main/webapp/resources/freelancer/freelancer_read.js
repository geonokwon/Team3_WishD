/*주석주석주석주석

if(${freelancerRequestDTO != null }){
    $("#sideCardBody_background").css("height", "1000px");
    $("#matching_Title").hide();
    $("#requestForm").show();
    $("#matching_button").hide();
    $("#agree_button").show();

    //프로젝트 등록한 사람은 전부 disabled 처리 하고 버튼 승인 대기중 변경
    let requestForm = $("#freelancerReadForm");
    requestForm.find('a').on('click', (e) => {
        e.preventDefault();
    })
    requestForm.find('input, select').prop('disabled', true);
    // form.find('select').prop('disabled', true);
    requestForm.find('input[type="checkbox"], input[type=radio], input[type=file]').prop('disabled', true);
    //배지에 class 에 "disabled" 추가해서 클릭이벤트시 막게 한다
    $('#badge_container .badge').addClass('disabled');

    let agree_button = $('#agree_button');
    agree_button.prop('disabled', true);
    agree_button.text("승인 대기중");
    //승인 요청 완료 후 프로젝트 등록한 사람은 request_freelancer 에 등록한 사람의 승인 완료시

    //freelancerRequestDTO
    let sessionUserNo = parseInt("${sessionScope.user_no}");
    console.log("sessionUserNo : " + sessionUserNo);
    let freelancerUserNo = parseInt("${freelancerDTO.getUser_no()}")
    console.log("freelancerUserNo : " + freelancerUserNo);
    let requestUserNo = parseInt("${freelancerRequestDTO.getUser_no()}");
    console.log("requestUserNo : " +requestUserNo);
    let isAgree = "${freelancerRequestDTO.getF_request_isAgree()}";

    if (sessionUserNo === requestUserNo || ((sessionUserNo === freelancerUserNo) && isAgree === "true")){
        $("#formFile").hide();
        $("#requestFile").show();
        //한줄 자기 소개
        $("#request_title").val("${freelancerRequestDTO.getF_request_title()}");

        //직군
        $("#request_jobGroup").val(${freelancerRequestDTO.getJob_id()});

        //경력
        $("#request_job_history").val(${freelancerRequestDTO.getF_request_history()});

        //프리랜서 경험 ( true , false ) 값을 반환하고 radio 박스이므로 checked 처리함
        let experience = "${freelancerRequestDTO.getF_request_exp()}";
        if (experience === "true") {
            $("#experience_true").prop("checked", true);
        } else {
            $("#experience_false").prop("checked", true);
        }

        //희망금액
        $("#money").val(${freelancerRequestDTO.getF_request_money()});

        //진행가능 날짜 형식 맞춤
        let date = "${freelancerRequestDTO.getF_request_startDate()}".split(" ")[0];
        $("#request_startDate").val(date);

        //각종동의
        $("#agree_1").prop("checked", true);
        $("#agree_2").prop("checked", true);


        if(sessionUserNo === freelancerUserNo && isAgree === "true"){
            //버튼 비활성화
            agree_button.hide();
            //다운로드 a태그 활성화
            requestForm.find('a').off('click');
            // 버튼을 동적으로 추가할 HTML 문자열
            let matchButtonHtml = '<button type="button" class="btn btn-primary mb-2" id="match_button">매칭</button>';
            let cancelButtonHtml = '<button type="button" class="btn btn-secondary" id="cancel_button">취소</button>';

            // 버튼을 추가할 div 선택
            let buttonContainer = $('#btn-container');

            // 버튼들을 추가
            buttonContainer.append(matchButtonHtml);
            buttonContainer.append(cancelButtonHtml);

            // 버튼 클릭 이벤트 처리
            $('#match_button').click(function() {
                console.log('매칭 버튼 클릭됨');
            });

            $('#cancel_button').click(function() {
                console.log('취소 버튼 클릭됨');
            });
        }
    }
}

 $(document).ready(function() {
        $('#freelancerReadForm').on('submit', function(event) {
            $('#agree_button').prop('disabled', true);
            event.preventDefault(); // 폼의 기본 제출 동작을 방지
            const form = $(this);

            //formData 형식으로 반환
            const formData = new FormData(this);
            console.log(formData);

            //비동기 ajax 처리
            $.ajax({
                url: '${pageContext.request.contextPath}/freelancerReadReq/${freelancerDTO.getFreelancer_id()}',
                type: 'POST', //post 방식
                data: formData,
                contentType: false, // jQuery가 자동으로 설정한 컨텐츠 타입을 사용하지 않음
                processData: false, // jQuery가 자동으로 데이터를 처리하지 않음
                success: function(response) {
                    if (response) {
                        // 성공적으로 데이터가 제출되었을 때의 처리
                        let trueModal = new bootstrap.Modal(document.getElementById('inputAlert_true'), {
                            keyboard: false
                        });
                        trueModal.show();
                        //현재 성공적으로 제출되었을때 승인 대기중이므로 disabled 처리
                        form.find('input, select').prop('disabled', true);
                        // form.find('select').prop('disabled', true);
                        form.find('input[type="checkbox"], input[type=radio], input[type=file]').prop('disabled', true);
                        //배지에 class 에 "disabled" 추가해서 클릭이벤트시 막게 한다
                        $('#badge_container .badge').addClass('disabled');

                        //버튼 비활성화
                        let agree_button = $('#agree_button');
                        agree_button.prop('disabled', true);
                        agree_button.text("승인 대기중");
                    }
                },
                error: function(xhr, status, error) {
                    // 오류 발생 시 처리
                    let falseModal = new bootstrap.Modal(document.getElementById('inputAlert_false'), {
                        keyboard: false
                    });
                    falseModal.show();
                    $('#agree_button').prop('disabled', false);
                }
            });
        });
    });
    
//input text 타입을 -> 숫자만 입력받을수 있는 함수
function onlyNumber (event){
    if (!/\d/.test(event.key)){
        event.preventDefault();
    }
}

//project_read > requestForm 부분
const inputJob_History = document.getElementById("request_job_history");
if (inputJob_History) {  // 요소가 존재하는지 확인
    inputJob_History.addEventListener("keypress", (event) => {
        onlyNumber(event);
    })
}
    */