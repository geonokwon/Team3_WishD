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


//배경 별 + 메테오 js
function init() {
    let style = ["style1", "style2", "style3", "style4"];
    let tam = ["tam1", "tam1", "tam1", "tam2", "tam3"];

    function getRandomArbitrary(min, max) {
        return Math.floor(Math.random() * (max - min)) + min;
    }

    let estrela = "";
    let qtdeEstrelas = 250;
    let noite = document.querySelector(".constelacao");
    let widthWindow = window.innerWidth;
    let heightWindow = window.innerHeight;

    for (let i = 0; i < qtdeEstrelas; i++) {
        let topPosition = getRandomArbitrary(0, heightWindow);
        let starOpacity = 1 - topPosition / heightWindow; // 투명도 조절

        estrela +=
            "<span class='estrela " +
            style[getRandomArbitrary(0, 4)] +
            " " +
            tam[getRandomArbitrary(0, 5)] +
            "' style='animation-delay: ." +
            getRandomArbitrary(0, 9) +
            "s; left: " +
            getRandomArbitrary(0, widthWindow) +
            "px; top: " +
            topPosition +
            "px; opacity: " +
            starOpacity +
            ";'></span>";
    }

    noite.innerHTML = estrela;

    function carregarMeteoro() {
        let meteoro = "<div class='meteoro " + style[getRandomArbitrary(0, 4)] + "'></div>";
        let chuvaMeteoro = document.getElementsByClassName("chuvaMeteoro")[0];
        chuvaMeteoro.innerHTML = meteoro;
        setTimeout(() => (chuvaMeteoro.innerHTML = ""), 1000);

        setTimeout(carregarMeteoro, getRandomArbitrary(5000, 10000));
    }

    setTimeout(carregarMeteoro, getRandomArbitrary(5000, 10000));
}
window.onload = init;

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

//project_write 부분
const inputMoney = document.getElementById("money");
const inputRange_month = document.getElementById("range_month");
if (inputMoney){
    inputMoney.addEventListener("keypress", onlyNumber);
}
if (inputRange_month){
    inputRange_month.addEventListener("keypress", onlyNumber);

}



//로그인 되고 나서 매칭시 버튼 클릭시 폼 보여주기
const matching_button = document.getElementById("matching_button");
if (matching_button){
    matching_button.addEventListener("click", () => {
        document.querySelector("#sideCardBody_background").style.height = "1000px";
        document.querySelector("#matching_Title").style.display = "none";
        document.querySelector("#requestForm").style.display = "block";
        document.querySelector("#matching_button").style.display = "none";
        document.querySelector("#agree_button").style.display = "block";
    });
}
//request_project end


//project_write 부분 (유효성 검사부분)
const projectWrite = document.getElementById("projectWrite");
const projectRead = document.getElementById("projectReadForm");
if (projectWrite || projectRead) {
    // 스킬 선택은 제외한 모든 input, textarea, select 요소 선택 (select#skill 제외)
    let elements = document.querySelectorAll("input, textarea, select");

    elements.forEach(element => {
        element.addEventListener("blur", () => {
            const isEmpty = element.value.trim() === "";

            // 빨간 테두리 적용 여부 처리
            element.style.border = isEmpty ? "1px solid #ff0000ad" : "";
        });
    });
}


//projectRequestDTO 파일관련
