// 쿠키를 설정하는 함수
function setCookie(name, value, days) {
    const expires = new Date(Date.now() + days * 24 * 60 * 60 * 1000).toUTCString();
    document.cookie = `${name}=${value}; expires=${expires}; path=/`;
}

// 쿠키를 가져오는 함수
function getCookie(name) {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) return parts.pop().split(';').shift();
}

// 페이지 로드 시 실행
document.addEventListener("DOMContentLoaded", function() {
    // 쿠키에서 아이디 불러오기
    const savedId = getCookie("user_Id");
    if (savedId) {
        document.getElementById("user_Id").value = savedId; // 아이디 입력란의 ID가 "user_Id"라고 가정
        document.getElementById("rememberMe").checked = true; // 체크박스 체크
    }

    // 아이디 기억하기 체크박스 상태에 따라 쿠키 설정
    document.getElementById("rememberMe").addEventListener("change", function() {
    if (this.checked) {
        console.log("체크됨: ", document.getElementById("user_Id").value); // 체크된 경우 아이디 로그
        setCookie("user_Id", document.getElementById("user_Id").value, 1); // 하루 동안 유지
    } else {
        console.log("체크 해제됨"); // 체크 해제된 경우 로그
        setCookie("user_Id", "", -1); // 쿠키 삭제
    }
});

    // 별 배경 및 메테오 초기화
    initStarsAndMeteors();
});

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
