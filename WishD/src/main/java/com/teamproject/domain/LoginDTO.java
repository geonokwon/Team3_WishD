package com.teamproject.domain;

public class LoginDTO {
	
	//LoginDTO 클래스의 멤버변수
	// => 중요한 데이터를 담아서 전달하기 위해서 (외부에서 접근못하게) 설정
	// => 접근지정자 private 이용해서 클래스에서만 접근, 다른파일, 다른 폴더에서 접근못하게 설정.!!
	private String id; // 아이디
	private String pass; // 비밀번호
	private String passRetype; // 비밀번호 재확인
	private String name; // 이름 
	private String email; //이메일 주소
	private String emailCode; // 이메일 인증번호
	
	

}
