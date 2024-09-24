//버튼 이동 관련
const disagree_btn = document.getElementById("disagree_btn");
if (disagree_btn){
    disagree_btn.addEventListener("click", () => {
        location.href = `${basePath}/projectFind`;
    })
}
//버튼 이동 관련 end

//모아보기 토글
function toggleState() {
    // 현재 체크 상태에 따라 state 값을 변경
    let isChecked = document.getElementById('projectBoardState').checked;
    let newState = isChecked ? 0 : 1;
    // 페이지 이동, state 값에 따라 URL 변경
    console.log("isChecked : " + isChecked);
    console.log("newState : " + newState);

    location.href = `${basePath}/projectFind?state=` + newState;
}

//모아보기 토글 end

//스킬 추가 관련
const selectElement =  document.getElementById("skill");
const badgeContainer = document.getElementById("badge_container");

if (selectElement){
    selectElement.addEventListener("change", function () {
        //현재 선택된 값
        const selectText = this.options[this.selectedIndex].text;
        const selectValue = this.value;

        //이미 선택된 배지인지 확인
        const existingBadges = Array.from(badgeContainer.getElementsByClassName("badge"));
        const existingBadge = existingBadges.find((badge) => badge.dataset.skillId === this.value);
        if (existingBadge) {
            existingBadge.remove();
        } else {
            const badge = document.createElement("p");
            badge.className = "badge rounded-pill mb-1 me-2";
            badge.id = "skillSelectBadge";
            badge.textContent = selectText;
            badge.dataset.skillId = selectValue;

            // 배지 클릭 시 삭제 기능 추가
            badge.addEventListener("click", () => {
                if (!badge.classList.contains('disabled')){
                    badge.remove();
                    updateHiddenInput();
                }
            });

            badgeContainer.appendChild(badge);
        }
        // 숨겨진 입력 필드 업데이트
        updateHiddenInput();
        // 선택 초기화 (다시 처음 상태로)
        selectElement.selectedIndex = 0;
    });
}
//나중에 어떻게 보낼지 생각해봐야함!
//현재는 배열에 저장하고 있음
function updateHiddenInput() {
    const badges = Array.from(badgeContainer.getElementsByClassName("badge"));
    const selectedSkills = badges.map((badge) => badge.dataset.skillId);
    let skillList = selectedSkills.join(",")
    document.getElementById("skillList").value = skillList;

    console.log(selectedSkills);
    console.log(skillList);

    // skillList에 대한 유효성 검사
    if (skillList === ""){
        document.getElementById("skill").style.border = "1px solid #ff0000ad";
    }
    const hiddenSkillList = document.getElementById("skillList");
    if (hiddenSkillList) {
        selectElement.addEventListener("blur",  () => {
            if(hiddenSkillList.value !== ""){
                document.getElementById("skill").style.border = "";
            }
        });
    }

}
//스킬 추가 관련 end


//드롭다운 클래스를 가진 애들이 클릭시 이벤트 추가
document.querySelectorAll(".dropdown-item").forEach(function (item) {
    item.addEventListener("click", skillSelect);
});

function skillSelect() {
    // this.textContent = .dropdown-item 클래스의 클릭된 요소 가져오기;
    // 클릭된 요소를 가져와 버튼 안의 값으로 변경
    document.querySelector("#skillMenuButton").innerText = this.textContent;
}





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
//request_project end




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
