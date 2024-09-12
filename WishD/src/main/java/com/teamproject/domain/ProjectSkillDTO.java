package com.teamproject.domain;

public class ProjectSkillDTO {
    private int skill_id;
    private String skill_name;

    private int pboard_id;

    public int getPboard_id() {
        return pboard_id;
    }

    public void setPboard_id(int pboard_id) {
        this.pboard_id = pboard_id;
    }

    public int getProjectSkill_id() {
        return projectSkill_id;
    }

    public void setProjectSkill_id(int projectSkill_id) {
        this.projectSkill_id = projectSkill_id;
    }

    private int projectSkill_id;

    public int getSkill_id() {
        return skill_id;
    }

    public void setSkill_id(int skill_id) {
        this.skill_id = skill_id;
    }

    public String getSkill_name() {
        return skill_name;
    }

    public void setSkill_name(String skill_name) {
        this.skill_name = skill_name;
    }

    @Override
    public String toString() {
        return "ProjectSkillDTO{" +
                "skill_id=" + skill_id +
                ", skill_name='" + skill_name + '\'' +
                ", pboard_id=" + pboard_id +
                ", projectSkill_id=" + projectSkill_id +
                '}';
    }
}
