document.addEventListener('DOMContentLoaded', () => {
    // 아이디 중복 확인
    document.querySelector('#username-check').addEventListener('click', () => {
        const username = document.querySelector('#username').value;
        const usernameError = document.querySelector('#username-error');
        if (username) {
            // 서버 검증 또는 로컬 검증 로직
            usernameError.textContent = '아이디 사용 가능합니다.';
        } else {
            usernameError.textContent = '아이디를 입력하세요.';
        }
    });

    // 이메일 중복 확인
    document.querySelector('#email-check').addEventListener('click', () => {
        const email = document.querySelector('#email').value;
        const emailError = document.querySelector('#email-error');
        if (email) {
            // 서버 검증 또는 로컬 검증 로직
            emailError.textContent = '이메일 사용 가능합니다.';
        } else {
            emailError.textContent = '이메일을 입력하세요.';
        }
    });

    // 인증 코드 확인
    document.querySelector('#verification-code-check').addEventListener('click', () => {
        const verificationCode = document.querySelector('#verification-code').value;
        const verificationCodeError = document.querySelector('#verification-code-error');
        if (verificationCode) {
            // 서버 검증 또는 로컬 검증 로직
            verificationCodeError.textContent = '인증 코드가 확인되었습니다.';
        } else {
            verificationCodeError.textContent = '인증 코드를 입력하세요.';
        }
    });

    // 비밀번호 재입력 확인
    document.querySelector('#password-confirm').addEventListener('input', () => {
        const password = document.querySelector('#password').value;
        const passwordConfirm = document.querySelector('#password-confirm').value;
        const passwordConfirmError = document.querySelector('#password-confirm-error');
        if (password !== passwordConfirm) {
            passwordConfirmError.textContent = '비밀번호가 일치하지 않습니다.';
        } else {
            passwordConfirmError.textContent = '';
        }
    });

    // 폼 제출 처리
    document.querySelector('#signup-form').addEventListener('submit', (event) => {
        event.preventDefault(); // 기본 제출 동작 방지

        const username = document.querySelector('#username').value;
        const password = document.querySelector('#password').value;
        const passwordConfirm = document.querySelector('#password-confirm').value;
        const name = document.querySelector('#name').value;
        const email = document.querySelector('#email').value;
        const verificationCode = document.querySelector('#verification-code').value;
        const phone = document.querySelector('#phone').value;
        const dob = document.querySelector('#dob').value;
        const privacyPolicy = document.querySelector('#privacy-policy').checked;

        let valid = true;

        // 유효성 검사
        if (!username) {
            document.querySelector('#username-error').textContent = '아이디를 입력하세요.';
            valid = false;
        }
        if (!password) {
            document.querySelector('#password-error').textContent = '비밀번호를 입력하세요.';
            valid = false;
        }
        if (password !== passwordConfirm) {
            document.querySelector('#password-confirm-error').textContent = '비밀번호가 일치하지 않습니다.';
            valid = false;
        }
        if (!name) {
            document.querySelector('#name-error').textContent = '이름을 입력하세요.';
            valid = false;
        }
        if (!email) {
            document.querySelector('#email-error').textContent = '이메일을 입력하세요.';
            valid = false;
        }
        if (!verificationCode) {
            document.querySelector('#verification-code-error').textContent = '인증 코드를 입력하세요.';
            valid = false;
        }
        if (!phone) {
            document.querySelector('#phone-error').textContent = '전화번호를 입력하세요.';
            valid = false;
        }
        if (!dob) {
            document.querySelector('#dob-error').textContent = '생년월일을 입력하세요.';
            valid = false;
        }
        if (!privacyPolicy) {
            document.querySelector('#privacy-policy-error').textContent = '개인정보 수집에 동의해야 합니다.';
            valid = false;
        }

        if (valid) {
            document.querySelector('#success-msg').textContent = '회원가입이 완료되었습니다.';
            // 여기에 서버로의 폼 데이터 전송 로직 추가
        }
    });
});
