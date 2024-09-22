package com.teamproject.controller;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.teamproject.domain.CommunityDTO;
import com.teamproject.domain.CommunityPageDTO;
import com.teamproject.domain.CommunityQnaDTO;
import com.teamproject.service.CommunityService;

@Controller
public class CommunityController {

	//BoardService 자동으로 객체 생성
	@Inject
	private CommunityService communityService;
	
	@GetMapping("community")
	public String notice(HttpServletRequest request, Model model) {
		
		String pageNum = request.getParameter("pageNum");
		
		//페이지 번호 없으면 1로 설정
		if(pageNum == null) {
		   pageNum = "1";
		}
		
		// pageNum => 정수형 변경
		int currentPage = Integer.parseInt(pageNum);
		// 한 화면에 보여줄 글 개수 설정 
		int pageSize = 8;
		
		//커뮤니티 DTO 생성
		CommunityPageDTO communityPageDTO = new CommunityPageDTO();
		
		//pageNum, currentPage, pageSize 값 저장
		communityPageDTO.setPageNum(pageNum);
		communityPageDTO.setCurrentPage(currentPage);
		communityPageDTO.setPageSize(pageSize);
		
		List<CommunityDTO> communityList = communityService.getCommunityList(communityPageDTO);
		
		//게시판 전체 글 개수 구하기
		int count = communityService.getCommunityCount(communityPageDTO);
		
		//한 화면에 보여 줄 페이지 개수
		int pageBlock = 5;
		
		//시작하는 페이지 번호
		int startPage = (currentPage-1) / pageBlock * pageBlock + 1;
		
		//끝나는 페이지 번호 구하기
		int endPage = startPage + pageBlock - 1;
		
		//전체 글 개수 구하기
		int pageCount = count / pageSize + (count % pageSize==0?0:1);
		
		// endPage 전체 글개수 비교 => endPage 크면 전체 글개수로 변경
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		//pageDTO에 넣어주기
		communityPageDTO.setCount(count);
		communityPageDTO.setPageBlock(pageBlock);
		communityPageDTO.setStartPage(startPage);
		communityPageDTO.setEndPage(endPage);
		communityPageDTO.setPageCount(pageCount);

		//model에 데이터 담아서 전달
		model.addAttribute("communityList", communityList);
        model.addAttribute("communityPageDTO", communityPageDTO);
	        
			
	        return "/community/notice";
		
		}
	
		//공지사항 글쓰기
		@GetMapping("/notice_write")
		public String noticeWrite(HttpSession session) {
			
		// 세션에서 관리자 확인
		//세션에서 로그인 정보 가져오기
		Long user_no = (Long) session.getAttribute("user_no");
		
		//관리자만 글쓸수있게
		if(user_no == null || user_no != 999){
			return "redirect:/login";
			} else {
			
		return "/community/notice_write";
			}
		}
		
		//공지사항 글쓰기 처리
		@PostMapping("/notice_writePro")
		public String noticeWritePro(CommunityDTO communityDTO, HttpSession session) {
			System.out.println("CommunityController notice_writePro()");
			System.out.println(communityDTO);
			

			communityDTO.setUser_no((Long)session.getAttribute("user_no"));
			
			communityService.insertCommunity(communityDTO);
			
			return "redirect:/community";
			}
		
		//공지사항 상세 페이지
		@GetMapping("/notice_detail")
		public String noticeDetail(@RequestParam("ncommunity_num") long ncommunity_num, Model model) {
			
			CommunityDTO communityDTO = communityService.getCommunityById(ncommunity_num);
		    model.addAttribute("communityDTO", communityDTO);
		    return "/community/notice_detail"; // JSP 경로
		}
	
	
	
		//공지사항 수정 페이지
		@GetMapping("/notice_update")
		public String noticeUpdate(@RequestParam("ncommunity_num") long ncommunity_num, Model model) {
			
			//id에 해당하는 질문 불러오기
			CommunityDTO communityDTO = communityService.getCommunityById(ncommunity_num);
			model.addAttribute("communityDTO", communityDTO);
			
			return "community/notice_update";
			
		}
		
		//공지사항 수정 처리
		@PostMapping("/notice_updatePro")
		public String noticeUpdatePro(@RequestParam("ncommunity_num")long ncommunity_num,
									  @RequestParam("ncommunity_title")String ncommunity_title,
								      @RequestParam("ncommunity_content")String ncommunity_content) {
			
			// DTO에 수정된 데이터 담기
		    CommunityDTO communityDTO = new CommunityDTO();
		    
		    communityDTO.setNcommunity_num(ncommunity_num);
		    communityDTO.setNcommunity_title(ncommunity_title);
		    communityDTO.setNcommunity_content(ncommunity_content);

		    // 서비스 호출해서 수정된 내용으로 업데이트
		    communityService.updateCommunity(communityDTO);

		    // 수정 후 수정된 페이지로 리다이렉트
		    return "redirect:/notice_detail?ncommunity_num=" + ncommunity_num;
			}
		
		//공지사항 삭제 처리
		@PostMapping("/notice_deletePro")
		public String noticeDeletePro(@RequestParam("ncommunity_num") long ncommunity_num) {
			
			//서비스 호출해서 삭제
			communityService.deleteCommunity(ncommunity_num);
			
			//삭제 후 공지사항 페이지로 리다이렉트
		    return "redirect:/community";
		}
	    

	
		//qna 페이지
		@GetMapping("qna")
		public String qna(HttpServletRequest request, Model model) {
			
			String pageNum = request.getParameter("pageNum");
			
				//페이지 번호 없으면 1로 설정
				if(pageNum == null) {
				   pageNum = "1";
				}
				
				// pageNum => 정수형 변경
				int currentPage = Integer.parseInt(pageNum);
				// 한 화면에 보여줄 글 개수 설정 
				int pageSize = 8;
				
				//커뮤니티 DTO 생성
				CommunityPageDTO communityPageDTO = new CommunityPageDTO();
				
				//pageNum, currentPage, pageSize 값 저장
				communityPageDTO.setPageNum(pageNum);
				communityPageDTO.setCurrentPage(currentPage);
				communityPageDTO.setPageSize(pageSize);
				
				List<CommunityQnaDTO> communityQnaList = communityService.getCommunityQnaList(communityPageDTO);
				
				//게시판 전체 글 개수 구하기
				int count = communityService.getCommunityCount(communityPageDTO);
				
				//한 화면에 보여 줄 페이지 개수
				int pageBlock = 5;
				
				//시작하는 페이지 번호
				int startPage = (currentPage-1) / pageBlock * pageBlock + 1;
				
				//끝나는 페이지 번호 구하기
				int endPage = startPage + pageBlock - 1;
				
				//전체 글 개수 구하기
				int pageCount = count / pageSize + (count % pageSize==0?0:1);
				
				// endPage 전체 글개수 비교 => endPage 크면 전체 글개수로 변경
				if(endPage > pageCount) {
					endPage = pageCount;
				}
				
				//pageDTO에 넣어주기
				communityPageDTO.setCount(count);
				communityPageDTO.setPageBlock(pageBlock);
				communityPageDTO.setStartPage(startPage);
				communityPageDTO.setEndPage(endPage);
				communityPageDTO.setPageCount(pageCount);

				//model에 데이터 담아서 전달
				model.addAttribute("communityQnaList", communityQnaList);
		        model.addAttribute("communityPageDTO", communityPageDTO);
		        
		        return "/community/qna";
			
			}
	
	//질문 쓰기
	@GetMapping("qna_write")
	public String qnaWrite(HttpSession session) {
		
		 //세션에서 로그인 정보 가져오기
		 Long user_no = (Long) session.getAttribute("user_no");
		 
		 //만약에 로그인 안 했으면 로그인 화면 띄워주기
		 if(user_no == null) {
			 return "redirect:/login";
		 }
		
		return "community/qna_write";
		
	}
	
	//질문 쓰기 처리
	@PostMapping("/qna_writePro")
	public String qnaWritePro(HttpSession session, CommunityQnaDTO communityQnaDTO, Model model) {
		System.out.println("CommunityController qna_writePro()");
		System.out.println(communityQnaDTO);

		//커뮤니티 qna DTO의 user_no에 세션에서 가져온 user_no을 저장하기
		communityQnaDTO.setUser_no((Long) session.getAttribute("user_no"));
	    
	    // 서비스 호출하여 DB에 저장
	    communityService.insertCommunityQna(communityQnaDTO);
	    model.addAttribute("communityQnaDTO", communityQnaDTO);
	    
			return "redirect:/qna";
		}
	
	//질문 상세 페이지
	@GetMapping("/qna_detail")
	public String qnaDetail(@RequestParam("qcommunity_num") long qcommunity_num, HttpSession session, Model model) {
				
		CommunityQnaDTO communityQnaDTO = communityService.getCommunityQnaById(qcommunity_num);
		
		
		//세션에서 로그인 정보 가져오기
		 Long user_no = (Long) session.getAttribute("user_no");
		 
		 //만약에 본인이나 관리자가 아니라면 다시 qna 페이지로
		 if((user_no != communityQnaDTO.getUser_no()) && user_no != 999) {
			 model.addAttribute("fail", true);
			 
			 return "redirect:/qna";
		 }
		model.addAttribute("communityQnaDTO", communityQnaDTO);
		
		return "/community/qna_detail"; // JSP 경로
	}	
	
	//질문 수정 페이지
	@GetMapping("/qna_update")
	public String qnaUpdate(@RequestParam("qcommunity_num") long qcommunity_num, Model model) {
		
		//id에 해당하는 질문 불러오기
		CommunityQnaDTO communityQnaDTO = communityService.getCommunityQnaById(qcommunity_num);
		model.addAttribute("communityQnaDTO", communityQnaDTO);
		
		return "community/qna_update";
		
	}


	//질문 수정 처리
	@PostMapping("/qna_updatePro")
	public String qnaUpdatePro(@RequestParam("qcommunity_num")long qcommunity_num,
							   @RequestParam("qcommunity_title")String qcommunity_title,
							   @RequestParam("user_email") String user_email,
							   @RequestParam("qcommunity_content")String qcommunity_content) {
		
		// DTO에 수정된 데이터 담기
	    CommunityQnaDTO communityQnaDTO = new CommunityQnaDTO();
	    
	    communityQnaDTO.setQcommunity_num(qcommunity_num);
	    communityQnaDTO.setQcommunity_title(qcommunity_title);
	    communityQnaDTO.setUser_email(user_email);
	    communityQnaDTO.setQcommunity_content(qcommunity_content);

	    // 서비스 호출해서 수정된 내용으로 업데이트
	    communityService.updateCommunityQna(communityQnaDTO);

	    // 수정 후 수정된 페이지로 리다이렉트
	    return "redirect:/qna_detail?qcommunity_num=" + qcommunity_num;
		}
	
		//질문 삭제 처리
		@PostMapping("/qna_deletePro")
		public String qnaDeletePro(@RequestParam("qcommunity_num") long qcommunity_num) {
			
			//서비스 호출해서 삭제
			communityService.deleteCommunityQna(qcommunity_num);
			
			//삭제 후 qna 페이지로 리다이렉트
		    return "redirect:/qna";
		}
		
	
	//답변 완료 처리
	@PostMapping("/qna_answerPro")
	public String qnaAnswerPro(@RequestParam("qcommunity_num") long qcommunity_num) {
		communityService.qnaAnswer(qcommunity_num);
			
		return "redirect:/qna";
	}

}
