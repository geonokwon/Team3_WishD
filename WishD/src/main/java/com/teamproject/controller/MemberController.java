package com.teamproject.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.teamproject.domain.MemberDTO;
import com.teamproject.domain.SimpleUserDTO;
import com.teamproject.service.MemberService;


// 통합회원(일반+간편)
@Controller
public class MemberController {
	
	private String clientID_naver = "WXZHkF9aYxmGrNr8lKA8"; 
	private String clientSecret = "gnH5JfipoZ";
	
	@Inject
	private MemberService memberService;
	
	// 로그인 
	@GetMapping("/login")
	public String login(HttpSession session) {
		System.out.println("MemberController login()");
		//로그인 되어 있는 유저가 URL 로 접속시 막는 작업
		if (session.getAttribute("user_no") != null){
			return "redirect:/";
		}
		return "/member/login";
	}
	
	@PostMapping("/loginPro")
	public String loginPro(MemberDTO memberDTO, HttpSession session, HttpServletRequest request) {
		System.out.println("MemberController loginPro");
	
		MemberDTO memberDTO1 = memberService.userCheck(memberDTO);
		
		if(memberDTO1 != null) {
			session.setAttribute("user_no", memberDTO1.getUser_no());
			session.setAttribute("user_role", memberDTO1.getUser_Role());
			
			if(memberDTO1.isUser_yn()) {
				request.setAttribute("msg", "차단된 계정입니다.");
				session.invalidate();
				
				return "/manager/denyAlert";
			}
			
			return "redirect:/";
		}
		else {
			session.setAttribute("errorMessage", "아이디와 비밀번호를 다시 확인하세요.");
			return "redirect:/login";
		}	
	}
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원가입
	@GetMapping("/insert")
	public String insert() {
		System.out.println("MemberController insert()");
		return "/member/insert";
	}
	
	@PostMapping("/insertPro")
	public String insertPro(MemberDTO memberDTO) {
		System.out.println("MemberController insertPro");
		System.out.println(memberDTO);
		
		memberService.insertMember(memberDTO);
		// 로그인 주소변경 하면서 이동 
		return "redirect:/login";
		
	}
	
	// 아이디 중복체크
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println("아이디 중복 체크: " + id);
		
		// 아이디 중복 여부 확인
		String result = memberService.userIdCheck(id);
		
		if(result != null) {
			// 아이디 중복
			return "iddup"; 
			
		} else {
			// 아이디 사용 가능
			return "idok";
		}
		
	}
	
	// 이메일 중복체크
	@GetMapping("/emailCheck")
	@ResponseBody
	public String emailCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println("이메일 중복체크 : " + id);
		
		// 이메일 중복 여부 확인
		String result = memberService.userEmailCheck(id);
		
		if(result != null) {
			// 이메일 중복
			return "emailDup";
			
		} else {
			// 이메일 사용 가능
			return "emailOk";
		}
		
	}
	
	
	// 아이디 찾기
	@GetMapping("/idFind")
	public String idFind() {
		System.out.println("MemberController idFind()");
		return "/member/idFind";
	}
	

	@PostMapping("/idFindPro")
	public String idFindPro(MemberDTO memberDTO, Model model) {
		
		System.out.println("MemberController idFindPro()");
		memberDTO = memberService.idFind(memberDTO);
		
		if(memberDTO != null) { // 아이디가 있으면 model에 데이터 담아서 결과화면 이동
			model.addAttribute("memberDTO", memberDTO);
			return "/member/idResult";
		}
		else {
			// 아이디가 없으면 에러 메시지를 model에 담아서 전달
	        model.addAttribute("errorMessage", "일치하는 아이디가 없습니다.");
	        return "member/idFind";
		}
	}
	
	// 비밀번호 찾기
	@GetMapping("/passFind")
	public String passFind() {
		System.out.println("MemberController passFind()");
		return "/member/passFind";
		
	}
	
	@PostMapping("/passFindPro")
	public String passFindPro(MemberDTO memberDTO, Model model) {
		
		System.out.println("MemberController passFindPro()");
		memberDTO = memberService.passFind(memberDTO);
		
		if(memberDTO != null) { // 비밀번호가 있으면 model 데이터 담아서 결과화면으로 이동
			model.addAttribute("memberDTO", memberDTO);
			return "/member/passResult";
		}
		else {
			
			// 아이디가 없으면 에러 메시지를 model에 담아서 찾기화면
	        model.addAttribute("errorMessage", "일치하는 비밀번호가 없습니다.");
	        return "/member/passFind";
		}
		
	}
	
	//네이버 간편 로그인
	@GetMapping("/naver")
	public void simpleNaverLogin(HttpServletResponse response)throws IOException {
		String basicURL = "https://nid.naver.com/oauth2.0/authorize";
		String uri = UriComponentsBuilder
				.fromUriString(basicURL)
				.queryParam("response_type", "code")
				.queryParam("client_id", clientID_naver)
				.queryParam("redirect_uri", "http://c1d2405t3.itwillbs.com/WishD/naver-login")
				.queryParam("state", "11111")
				.build().toString();
		response.sendRedirect(uri);

	}

	@GetMapping("/naver-login")
	public String getNaverLogin (SimpleUserDTO simpleUserDTO,
			Model model, HttpSession session,
			HttpServletResponse response, HttpServletRequest request) throws IOException {

		System.out.println("code = " + simpleUserDTO.getCode());
		System.out.println("state = " + simpleUserDTO.getState());

		session.setAttribute("loginUser", simpleUserDTO);
		model.addAttribute("loggedIn", simpleUserDTO);


		if (simpleUserDTO == null) {
			response.sendRedirect("/login");
		}

		String json = getAccessToken(simpleUserDTO);
//		System.out.println("JSON: " + json);

		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode jsonNode = objectMapper.readTree(json);
		String access_token = jsonNode.get("access_token").textValue();

		// if 엑세스 토큰 한번 뒤지고 똑같은 값있으면 그값으로 로그인처리해주고 아니면 그냥 로그인 화면으로 가고
	

		System.out.println("토큰 : " + access_token);

        String header = "Bearer " + access_token; // Bearer 다음에 공백 추가

		String apiURL = "https://openapi.naver.com/v1/nid/me";

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("Authorization", header);
		String responseBody = get(apiURL,requestHeaders);
//		System.out.println(responseBody);

		ObjectMapper for_model = new ObjectMapper();
		JsonNode jsonNode1 = for_model.readTree(responseBody);
		JsonNode for_model_responseNode = jsonNode1.get("response");
//		System.out.println("email : " + for_model_responseNode.get("email").textValue());
//		System.out.println("name : " + for_model_responseNode.get("name").textValue());
		simpleUserDTO.setAccess_token(access_token);
		simpleUserDTO.setEmail(for_model_responseNode.get("email").textValue());
		simpleUserDTO.setUser_name(for_model_responseNode.get("name").textValue());
		simpleUserDTO.setUser_type("simple");

		SimpleUserDTO simpleUserDTO1 = memberService.checkToken(simpleUserDTO.getEmail());
		if (simpleUserDTO1 != null) {
			// 토큰 체크 => 있으면 user_no 로그인 처리 -> 메인으로 이동
			session.setAttribute("user_no", simpleUserDTO1.getUser_no());
			session.setAttribute("user_role", memberService.getMember(simpleUserDTO1.getUser_no()).getUser_Role());
			
			if(memberService.getMember(simpleUserDTO1.getUser_no()).isUser_yn()) {
				request.setAttribute("msg", "차단된 계정입니다.");
				session.invalidate();
				
				return "/manager/denyAlert";
			}
			
			return "redirect:/";
		}
		
		memberService.setSimpleUesr(simpleUserDTO);
		session.setAttribute("user_no", simpleUserDTO.getUser_no());
		session.setAttribute("user_role", memberService.getMember(simpleUserDTO.getUser_no()).getUser_Role());
		
		if(memberService.getMember(simpleUserDTO.getUser_no()).isUser_yn()) {
			request.setAttribute("msg", "차단된 계정입니다.");
			session.invalidate();
			
			return "/manager/denyAlert";
		}
		
		// 없으면 회원가입후(DB에 저장후) 메인화면
		return "redirect:/";
	}
	        	

	    private String getAccessToken(SimpleUserDTO simpleUserDTO){
	        String baseUrl = "https://nid.naver.com/oauth2.0/token";

	        UriComponents uriComponents = UriComponentsBuilder
	                .fromUriString(baseUrl)
	                .queryParam("grant_type", "authorization_code")
	                .queryParam("client_id", clientID_naver)
	                .queryParam("client_secret", clientSecret)
	                .queryParam("code", simpleUserDTO.getCode())
	                .queryParam("state", simpleUserDTO.getState())
	                .build();

	        try {
	            URL url = new URL(uriComponents.toString());
	            HttpURLConnection con = (HttpURLConnection) url.openConnection();
	            con.setRequestMethod("GET");

	            int responseCode = con.getResponseCode();
	            BufferedReader br;

	            if(responseCode == 200){
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            }
	            else
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));

	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null){
	                response.append(inputLine);
	            }
	            br.close();
	            return response.toString();
	        }
	        catch (Exception e){
	            e.printStackTrace();
	        }
	        return null;
	    }
		
		
		private static String get(String apiUrl, Map<String, String> requestHeaders){
			HttpURLConnection con = connect(apiUrl);
			try {
				con.setRequestMethod("GET");
				for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
					con.setRequestProperty(header.getKey(), header.getValue());
				}

				int responseCode = con.getResponseCode();
				if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
					return readBody(con.getInputStream());
				} else { // 에러 발생
					return readBody(con.getErrorStream());
				}
			} catch (IOException e) {
				throw new RuntimeException("API 요청과 응답 실패", e);
			} finally {
				con.disconnect();
			}
		}

		
		private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }
		
		private static String readBody(InputStream body){
			InputStreamReader streamReader = new InputStreamReader(body);

			try (BufferedReader lineReader = new BufferedReader(streamReader)) {
				StringBuilder responseBody = new StringBuilder();

				String line;
				while ((line = lineReader.readLine()) != null) {
					responseBody.append(line);
				}

				return responseBody.toString();
			} catch (IOException e) {
				throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
			}
		}
		
	}//클래스 
	
	
	
	
	
