document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const userId = document.getElementById('userId').value;
    const password = document.getElementById('password').value;

    // 예시 아이디와 비밀번호 (테스트용)
    const correctId = 'testUser';
    const correctPassword = 'testPassword';

    if (userId !== correctId || password !== correctPassword) {
        document.getElementById('errorMsg').style.display = 'block';
    } else {
        document.getElementById('errorMsg').style.display = 'none';
        alert('로그인 성공!');
        // 실제 환경에서는 form.submit()으로 로그인 처리
        // this.submit();
    }
});

function createStarInsideImage() {
    const star = document.createElement('div');
    star.classList.add('star');
    star.style.left = `${Math.random() * 100}%`;
    star.style.top = `${Math.random() * 100}%`;
    star.style.animationDuration = `${Math.random() * 2 + 1}s`;
    document.querySelector('.stars').appendChild(star);
}

for (let i = 0; i < 50; i++) {
    createStarInsideImage();
}