//버튼 이동 관련
const disagree_btn = document.getElementById("disagree_btn");
if (disagree_btn){
    disagree_btn.addEventListener("click", () => {
        location.href = `${basePath}/projectFind`;
    })
}
//버튼 이동 관련 end



//input text 타입을 -> 숫자만 입력받을수 있는 함수
function onlyNumber (event){
    if (!/\d/.test(event.key)){
        event.preventDefault();
    }
}



//로그인 되고 나서 매칭시 버튼 클릭시 폼 보여주기
const matching_button = document.getElementById("matching_button");
if (matching_button){
    matching_button.addEventListener("click", () => {
        document.querySelector("#sideCardBody_background").style.height = "1200px";
        document.querySelector("#matching_Title").style.display = "none";
        document.querySelector("#requestForm").style.display = "block";
        document.querySelector("#matching_button").style.display = "none";
        document.querySelector("#agree_button").style.display = "block";
    });
}
//request_freelancer end




let managerPhone = document.getElementById("pboard_manager_phone");
if (managerPhone) {
    managerPhone.addEventListener("input",(e) => {
        let input = e.target.value.replace(/\D/g, ""); // 숫자가 아닌 문자는 제거
        let formattedNumber = "";

        if (input.length <= 3) {
            // 첫 3자리까지만 입력
            formattedNumber = input;
        } else if (input.length <= 7) {
            // 3자리 이후 4자리
            formattedNumber = input.slice(0, 3) + "-" + input.slice(3);
        } else {
            // 3-4-4 형식으로 나눔
            formattedNumber = input.slice(0, 3) + "-" + input.slice(3, 7) + "-" + input.slice(7, 11);
        }
        e.target.value = formattedNumber; // 입력 필드에 다시 포맷된 값을 넣음
    });
}



//projectRequestDTO 파일관련
