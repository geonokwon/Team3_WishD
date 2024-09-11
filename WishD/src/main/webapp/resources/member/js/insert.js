document.addEventListener('DOMContentLoaded', () => {
    const emailCheckBtn = document.getElementById('email-check');
    const sendCodeBtn = document.getElementById('send-code');
    const verificationCodeGroup = document.getElementById('verification-code-group');
    const emailInput = document.getElementById('email');
    const verificationCodeInput = document.getElementById('verification-code');

    emailCheckBtn.addEventListener('click', () => {
        emailInput.disabled = true; // 이메일 입력란 비활성화
        emailCheckBtn.style.display = 'none'; // 이메일 중복 확인 버튼 숨기기
        sendCodeBtn.style.display = 'block'; // 전송하기 버튼 표시
    });

    sendCodeBtn.addEventListener('click', () => {
        verificationCodeGroup.style.display = 'flex'; // 인증 코드 입력란 및 인증하기 버튼 표시
        sendCodeBtn.style.display = 'none'; // 전송하기 버튼 숨기기
    });

    document.getElementById('verification-code-check').addEventListener('click', () => {
        // 인증 코드 확인 로직
        // 예: 확인 후 메시지 표시
        console.log('인증 코드 확인');
    });

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


});
