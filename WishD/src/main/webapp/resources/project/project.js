
const selectElement = document.getElementById("req_skill") || document.getElementById("skill");
const badgeContainer = document.getElementById("badge_container");
const hiddenInput = document.getElementById("selected-skills");


if (selectElement){
    selectElement.addEventListener("change", function () {
        //현재 선택된 값
        const selectValue = this.value;

        //이미 선택된 배지인지 확인
        const existingBadges = Array.from(badgeContainer.getElementsByClassName("badge"));
        const existingBadge = existingBadges.find((badge) => badge.textContent === this.value);
        if (existingBadge) {
            existingBadge.remove();
        } else {
            const badge = document.createElement("p");
            badge.className = "badge rounded-pill mb-1 me-2";
            badge.textContent = selectValue;
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
    const selectedSkills = badges.map((badge) => badge.textContent);
    let result_skill = selectedSkills.join(",")

    console.log(selectedSkills);
    console.log(result_skill);
    //나중에 넘겨줄 값은 result_skill String 값으로 hidden 으로 넘겨주고 java 단에서 ',' 로 나눠서 배열에 담고 배열 갯수만큼 스킬 저장
}



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






//project_read 페이지 관련 처리
//숫자만 입력할수 있는 (input text 타입)
// document.getElementById("request_job_history").addEventListener("keypress", function (event) {
//     //숫자가 아닐 경우
//     if (!/\d/.test(event.key)) {
//         // 입력을 방지
//         event.preventDefault();
//     }
// });

const inputElement = document.getElementById("request_job_history");
if (inputElement) {  // 요소가 존재하는지 확인
    inputElement.addEventListener("keypress", function (event) {
        // 숫자가 아닐 경우 입력 방지
        if (!/\d/.test(event.key)) {
            event.preventDefault();
        }
    });
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

