// 쿠키에서 값 가져오기 함수
function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
}

// 별 배경 및 메테오 초기화 함수
function initStarsAndMeteors() {
    let style = ["style1", "style2", "style3", "style4"];
    let tam = ["tam1", "tam1", "tam1", "tam2", "tam3"];
    let estrela = "";
    let qtdeEstrelas = 250;
    let noite = document.querySelector(".constelacao");
    let widthWindow = window.innerWidth;
    let heightWindow = window.innerHeight;

    function getRandomArbitrary(min, max) {
        return Math.floor(Math.random() * (max - min)) + min;
    }

    for (let i = 0; i < qtdeEstrelas; i++) {
        let topPosition = getRandomArbitrary(0, heightWindow);
        let starOpacity = 1 - topPosition / heightWindow;

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
        let chuvaMeteoro = document.querySelector(".chuvaMeteoro");
        if (chuvaMeteoro) {
            chuvaMeteoro.innerHTML = meteoro;
            setTimeout(() => (chuvaMeteoro.innerHTML = ""), 1000);
            setTimeout(carregarMeteoro, getRandomArbitrary(5000, 10000));
        }
    }

    setTimeout(carregarMeteoro, getRandomArbitrary(5000, 10000));
}

// 페이지 로드 시 실행
document.addEventListener("DOMContentLoaded", function() {
    // 쿠키에서 아이디 불러오기
    const savedId = getCookie("userId");
    if (savedId) {
        let userIdField = document.getElementById("userId");
        if (userIdField) {
            userIdField.value = savedId;
        }
        let rememberMeCheckbox = document.getElementById("rememberMe");
        if (rememberMeCheckbox) {
            rememberMeCheckbox.checked = true;
        }
    }

    // 별 배경 및 메테오 초기화
    initStarsAndMeteors();
});
