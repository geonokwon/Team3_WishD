package com.teamproject.domain;

public class ChatMessageDTO {
    private Long chat_room_id;
    private Long pboard_id;
    private Long user_no;
    private String chat_content;
    private String chat_date;



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

    @Override
    public String toString() {
        return "ChatMessageDTO{" +
                "chat_room_id=" + chat_room_id +
                ", pboard_id=" + pboard_id +
                ", user_no=" + user_no +
                ", chat_content='" + chat_content + '\'' +
                ", chat_date='" + chat_date + '\'' +
                '}';
    }
}
