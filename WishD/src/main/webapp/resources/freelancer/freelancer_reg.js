let selectedSkills = [];  // 선택된 스킬을 저장할 배열

// 스킬 추가 함수
function addSkill() {
    let skillSelect = document.getElementById("skill");
    let selectedSkillId = skillSelect.value;  // 선택된 스킬의 ID
    let selectedSkillName = skillSelect.options[skillSelect.selectedIndex].text;  // 선택된 스킬의 이름

    // 스킬 선택 시 중복 방지
    if (selectedSkillId && !selectedSkills.some(skill => skill.id === selectedSkillId)) {
        selectedSkills.push({ id: selectedSkillId, name: selectedSkillName });

        // 선택된 스킬을 화면에 추가 표시
        let selectedItemsDiv = document.getElementById("selected_skill_container");
        let skillItem = document.createElement("div");
        skillItem.className = "selected-item";
        skillItem.innerHTML = selectedSkillName + ' <span onclick="removeSkill(\'' + selectedSkillId + '\')">x</span>';
        selectedItemsDiv.appendChild(skillItem);

        // 숨겨진 input 필드에 선택된 스킬들의 id 저장 
        document.getElementById("skills_hidden").value = selectedSkills.map(skill => skill.id).join(",");
    }
}

// 스킬 제거 함수
function removeSkill(skillId) {
    selectedSkills = selectedSkills.filter(function(skill) {
        return skill.id !== skillId;
    });

    // 숨겨진 input 스킬필드 업데이트
    document.getElementById("skills_hidden").value = selectedSkills.map(skill => skill.id).join(",");

    // 선택된 스킬 표시 업데이트
    let selectedItemsDiv = document.getElementById("selected_skill_container");
    selectedItemsDiv.innerHTML = '';
    selectedSkills.forEach(function(skill) {
        let skillItem = document.createElement("div");
        skillItem.className = "selected-item";
        
        skillItem.innerHTML = skill.name + ' <span onclick="removeSkill(\'' + skill.id + '\')">x</span>';
        selectedItemsDiv.appendChild(skillItem);
    });
}


//현재 날짜 구하기
let currentDate = Date.now()
let timeOff = new Date().getTimezoneOffset()*60000;
let today = new Date(currentDate-timeOff).toISOString().split("T")[0];
document.getElementById("date").setAttribute("min", today);




// 희망 월급 유효성 검사
function validateSalary() {
    const salary = document.forms["fr"]["freelancer_salary"].value;
    if (salary == "" || salary < 10) {
        document.getElementById("salary_error").innerHTML = "희망 월급을 10 이상 입력해주세요.";
    } else {
        document.getElementById("salary_error").innerHTML = "";
    }
}

// 프로젝트 시작 가능일 유효성 검사
function validateStartDate() {
    const startDate = document.forms["fr"]["freelancer_startdate"].value;
    const today = new Date().toISOString().split("T")[0]; // 오늘 날짜 구하기

    if (startDate == "" || startDate < today) {
        document.getElementById("startdate_error").innerHTML = "프로젝트 시작 가능일을 올바르게 입력해주세요.";
    } else {
        document.getElementById("startdate_error").innerHTML = "";
    }
}

// 프리랜서 경험 유효성 검사
function validateExperience() {
    const exp = document.querySelector('input[name="freelancer_exp"]:checked');
    if (exp == null) {
        document.getElementById("exp_error").innerHTML = "프리랜서 경험 여부를 선택해주세요.";
    } else {
        document.getElementById("exp_error").innerHTML = "";
    }
}

// 직무 유효성 검사
function validateJob() {
    const jobId = document.forms["fr"]["job_id"].value;
    if (jobId == "") {
        document.getElementById("job_error").innerHTML = "직무를 선택해주세요.";
    } else {
        document.getElementById("job_error").innerHTML = "";
    }
}

// 개발자 경력 유효성 검사
function validateDevExp() {
    const devExp = document.forms["fr"]["dev_exp"].value;
    if (devExp == "" || devExp < 0) {
        document.getElementById("devexp_error").innerHTML = "개발자 경력을 올바르게 입력해주세요.";
    } else {
        document.getElementById("devexp_error").innerHTML = "";
    }
}

// 보유 스킬 유효성 검사
function validateSkill() {
    const skillList = document.forms["fr"]["skillIdList"].value;
    if (skillList == "") {
        document.getElementById("skill_error").innerHTML = "보유 스킬을 최소 한 개 이상 선택해주세요.";
    } else {
        document.getElementById("skill_error").innerHTML = "";
    }
}

//양식을 controller로 제출
function submitForm() {
    let isValid = true;
    let firstInvalidField = null;

    // 희망 월급 확인
    const salary = document.forms["fr"]["freelancer_salary"].value;
    if (salary == "" || salary < 10) {
        document.getElementById("salary_error").innerHTML = "희망 월급을 10 이상 입력해주세요.";
        if (!firstInvalidField) firstInvalidField = document.forms["fr"]["freelancer_salary"];
        isValid = false;
    }

    // 프로젝트 시작 가능일 확인
    const startDate = document.forms["fr"]["freelancer_startdate"].value;
    if (startDate == "") {
        document.getElementById("startdate_error").innerHTML = "프로젝트 시작 가능일을 입력해주세요.";
        if (!firstInvalidField) firstInvalidField = document.forms["fr"]["freelancer_startdate"];
        isValid = false;
    }

    // 프리랜서 경험 확인
    const expChecked = document.querySelector('input[name="freelancer_exp"]:checked');
    if (!expChecked) {
        document.getElementById("exp_error").innerHTML = "프리랜서 경험을 선택해주세요.";
        if (!firstInvalidField) firstInvalidField = document.forms["fr"]["freelancer_exp"][0];
        isValid = false;
    }

    // 직무 확인
    const jobId = document.forms["fr"]["job_id"].value;
    if (jobId == "") {
        document.getElementById("job_error").innerHTML = "직무를 선택해주세요.";
        if (!firstInvalidField) firstInvalidField = document.forms["fr"]["job_id"];
        isValid = false;
    }

    // 개발자 경력 확인
    const devExp = document.forms["fr"]["dev_exp"].value;
    if (devExp == "" || devExp < 0) {
        document.getElementById("devexp_error").innerHTML = "개발자 경력을 입력해주세요.";
        if (!firstInvalidField) firstInvalidField = document.forms["fr"]["dev_exp"];
        isValid = false;
    }

    // 보유 스킬 확인
    const skills = document.getElementById("skills_hidden").value;
    if (skills == "") {
        document.getElementById("skill_error").innerHTML = "보유 스킬을 선택해주세요.";
        if (!firstInvalidField) firstInvalidField = document.getElementById("skill");
        isValid = false;
    }

    // 유효하지 않다면 첫 번째로 비어있는 필드로 포커스 이동
    if (!isValid) {
        if (firstInvalidField) firstInvalidField.focus();
        return false; // 폼 제출 중단
    }
    
    // 등록 버튼 비활성화(중복 등록 방지)
    document.getElementById("registration_button").disabled = true;
    // 유효성 검사를 통과하면 폼 제출
    document.forms["fr"].submit();
}







