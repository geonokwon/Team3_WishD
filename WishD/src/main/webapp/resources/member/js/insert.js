function checkUsername() {
  const username = document.getElementById("username").value.trim();
  const existingUsernames = JSON.parse(localStorage.getItem("usernames")) || [];

  if (existingUsernames.includes(username)) {
    document.getElementById("username-check-result").innerText =
      "이미 존재하는 아이디입니다.";
  } else {
    document.getElementById("username-check-result").innerText =
      "사용 가능한 아이디입니다.";
  }
}


function checkEmail() {
  const email = document.getElementById("email").value.trim();
  const existingEmails = JSON.parse(localStorage.getItem("emails")) || [];

  if (existingEmails.includes(email)) {
    document.getElementById("email-check-result").innerText =
      "이미 존재하는 이메일입니다.";
  } else {
    document.getElementById("email-check-result").innerText =
      "사용 가능한 이메일입니다.";
  }
}

function verifyEmailCode() {
  const verificationCode = document
    .getElementById("email-verification")
    .value.trim();
  const validCode = "123456"; // 예시를 위한 코드

  if (verificationCode === validCode) {
    document.getElementById("email-verification-result").innerText =
      "인증 코드가 확인되었습니다.";
  } else {
    document.getElementById("email-verification-result").innerText =
      "잘못된 인증 코드입니다.";
  }
}

document
  .getElementById("signup-form")
  .addEventListener("submit", function (event) {
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirm-password").value;
    const termsChecked = document.getElementById("agree-terms").checked;

    if (password !== confirmPassword) {
      event.preventDefault();
      document.getElementById("password-check-result").innerText =
        "비밀번호가 일치하지 않습니다.";
    } else {
      document.getElementById("password-check-result").innerText = "";
    }

    if (!termsChecked) {
      event.preventDefault();
      document.getElementById("terms-check-result").innerText =
        "개인정보 처리방침에 동의해야 합니다.";
    } else {
      document.getElementById("terms-check-result").innerText = "";
    }
  });
