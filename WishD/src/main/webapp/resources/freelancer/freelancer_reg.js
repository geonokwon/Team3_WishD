var selectedSkills = [];  // 선택된 스킬을 저장할 배열

// 스킬 추가 함수
function addSkill() {
    var skillSelect = document.getElementById("skill");
    var selectedSkillId = skillSelect.value;  // 선택된 스킬의 ID
    var selectedSkillName = skillSelect.options[skillSelect.selectedIndex].text;  // 선택된 스킬의 이름

    // 스킬 선택 시 중복 방지
    if (selectedSkillId && !selectedSkills.includes(selectedSkillId)) {
        selectedSkills.push(selectedSkillId);

        // 선택된 스킬을 화면에 추가 표시
        var selectedItemsDiv = document.getElementById("selected_skill_container");
        var skillItem = document.createElement("div");
        skillItem.className = "selected-item";
        skillItem.innerHTML = selectedSkillName + ' <span onclick="removeSkill(\'' + selectedSkillId + '\')">x</span>';
        selectedItemsDiv.appendChild(skillItem);

        // 숨겨진 input 필드에 선택된 스킬들의 id 저장 
        document.getElementById("skills_hidden").value = selectedSkills.join(",");
    }
}

// 스킬 제거 함수
function removeSkill(skill) {
    
    selectedSkills = selectedSkills.filter(function(item) {
        return item !== skill;
    });

    // 숨겨진 input 스킬필드 업데이트
    document.getElementById("skills_hidden").value = selectedSkills.join(",");

    // 선택된 스킬 표시 업데이트
    var selectedItemsDiv = document.getElementById("selected_skill_container");
    selectedItemsDiv.innerHTML = '';
    selectedSkills.forEach(function(item) {
        var skillItem = document.createElement("div");
        skillItem.className = "selected-item";
        
        skillItem.innerHTML = item + ' <span onclick="removeSkill(\'' + item + '\')">x</span>';
        selectedItemsDiv.appendChild(skillItem);
    });
}


//현재 날짜 구하기
let currentDate = Date.now()
let timeOff = new Date().getTimezoneOffset()*60000;
let today = new Date(currentDate-timeOff).toISOString().split("T")[0];
document.getElementById("date").setAttribute("min", today);

//양식을 controller로 제출
function submitForm() {
    // 추가적인 유효성 검사 등을 할 수 있음
    var form = document.forms['fr'];
    
    form.submit(); // 폼 제출
}