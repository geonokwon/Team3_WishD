// 네비게이션 탭 
document.addEventListener('DOMContentLoaded', () => {
    const tabs = document.querySelectorAll('.nav1-link');

    const currentPath = window.location.pathname.split('/').pop();
    
    tabs.forEach(tab => {
        if (tab.getAttribute('href') === currentPath) {
            tab.classList.add('active');
        } else {
            tab.classList.remove('active');
        }
    });

    tabs.forEach(tab => {
        tab.addEventListener('click', (event) => {
            event.preventDefault();

            tabs.forEach(t => t.classList.remove('active'));

            tab.classList.add('active');

            window.location.href = tab.getAttribute('href');
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



}); 