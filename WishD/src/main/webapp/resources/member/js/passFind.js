// 네비게이션 탭 
document.addEventListener('DOMContentLoaded', () => {
    const tabs = document.querySelectorAll('.nav1-link');

    // Set active class based on current URL
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

            // Remove 'active' class from all tabs
            tabs.forEach(t => t.classList.remove('active'));

            // Add 'active' class to the clicked tab
            tab.classList.add('active');

            // Redirect to the href of the clicked tab
            window.location.href = tab.getAttribute('href');
        });
    });
    
    
    // 비밀번호 찾기 로직 아래추가 예정!! 
    document.addEventListener('DOMContentLoaded', () => {
    	const findIdButton = document.getElementById('find-id-btn');
   	 	const errorMessage = document.getElementById('error-message');
    	const idResultContainer = document.getElementById('id-result-container');
    	const findIdForm = document.getElementById('find-id-form');
    	const resultText = document.getElementById('result-text');

    findIdButton.addEventListener('click', (event) => {
        event.preventDefault(); // 버튼 클릭 시 폼 제출 방지

        const name = document.getElementById('name-id').value;
        const email = document.getElementById('email-id').value;

        // 입력 값 확인
        if (name === "" || email === "") {
            errorMessage.textContent = "이름과 이메일을 입력해 주세요.";
            errorMessage.classList.remove('hidden');
            return;
        }

        // 아이디 찾기 결과 화면 표시
        findIdForm.classList.add('hidden');
        idResultContainer.classList.remove('hidden');

        // 결과 텍스트 설정 (여기서는 예시로 "홍길동"을 표시)
        resultText.textContent = "아이디: 홍길동"; // 실제로는 서버에서 반환된 값을 사용할 수 있습니다.
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
	 
    