document.addEventListener('DOMContentLoaded', function() {
    // 이메일 중복 확인 처리
    const emailInput = document.getElementById('email');
    const emailCheckBtn = document.getElementById('email-check');
    const sendCodeBtn = document.getElementById('send-code');
    const verificationCodeGroup = document.getElementById('verification-code-group');
    const emailActionsGroup = document.getElementById('email-actions');

    emailCheckBtn.addEventListener('click', function() {
        // 이메일 중복 확인 처리
        emailInput.disabled = true;
        emailCheckBtn.style.display = 'none';
        sendCodeBtn.style.display = 'inline-block'; // 전송하기 버튼을 보이게 함
        verificationCodeGroup.style.display = 'block'; // 인증 코드 입력란을 보이게 함
    });

    sendCodeBtn.addEventListener('click', function() {
        // 인증 코드 전송 처리
        sendCodeBtn.textContent = '인증하기';
        sendCodeBtn.id = 'verification-code-check';
    });

    document.getElementById('verification-code-check').addEventListener('click', function() {
        // 인증 코드 확인 처리
    });
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


