package com.teamproject.domain;

public class ChatMessageDTO {
    private Long chat_room_id;
    private Long pboard_id;
    private Long user_no;
    private String chat_content;
    private String chat_date;
    private String user_name;
    private Long f_request_id;
    private Boolean chat_isMatching;



    public Long getChat_room_id() {
        return chat_room_id;
    }

    public void setChat_room_id(Long id) {
        this.chat_room_id = id;
    }

    public Long getPboard_id() {
        return pboard_id;
    }

    public void setPboard_id(Long pboard_id) {
        this.pboard_id = pboard_id;
    }

    public Long getUser_no() {
        return user_no;
    }

    public void setUser_no(Long user_no) {
        this.user_no = user_no;
    }

    public String getChat_content() {
        return chat_content;
    }

    public void setChat_content(String chat_content) {
        this.chat_content = chat_content;
    }

    public String getChat_date() {
        return chat_date;
    }

    public void setChat_date(String chat_date) {
        this.chat_date = chat_date;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public Long getF_request_id() {
        return f_request_id;
    }

    public void setF_request_id(Long f_request_id) {
        this.f_request_id = f_request_id;
    }

    public Boolean getChat_isMatching() {
        return chat_isMatching;
    }

    public void setChat_isMatching(Boolean chat_isMatching) {
        this.chat_isMatching = chat_isMatching;
    }

    @Override
    public String toString() {
        return "ChatMessageDTO{" +
                "chat_room_id=" + chat_room_id +
                ", pboard_id=" + pboard_id +
                ", user_no=" + user_no +
                ", chat_content='" + chat_content + '\'' +
                ", chat_date='" + chat_date + '\'' +
                ", user_name='" + user_name + '\'' +
                ", f_request_id=" + f_request_id +
                '}';
    }
}
