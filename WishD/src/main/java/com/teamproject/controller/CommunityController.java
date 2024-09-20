package com.teamproject.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.cj.Session;
import com.teamproject.domain.CommunityDTO;
import com.teamproject.domain.CommunityPageDTO;
import com.teamproject.domain.CommunityQnaDTO;
import com.teamproject.domain.MemberDTO;
import com.teamproject.service.CommunityService;

@Controller
public class CommunityController {

	//BoardService 자동으로 객체 생성
	@Inject
	private CommunityService communityService;
	
	@GetMapping("community")
	public String notice(HttpServletRequest request, Model model) {
		
		CommunityPageDTO communityPageDTO = new CommunityPageDTO();
		
		//notice 페이지네이션
		String noticePageNum = request.getParameter("noticePageNum");
		
			//페이지 번호 없으면 1로 설정
			if(noticePageNum == null) {
				noticePageNum = "1";
			}
			
			communityPageDTO.setPageNum(noticePageNum);
			
			int noticeCurrentPage = Integer.parseInt(noticePageNum);
			
			communityPageDTO.setCurrentPage(noticeCurrentPage);
			
			System.out.println("===== noticePageNum :" + noticePageNum);

			
			//한 페이지에 보여 줄 게시글 수
			int noticePageSize = 8;
			
			//한 화면에 보여 줄 페이지 개수
			int noticePageBlock = 10;
			
			//dto에 넣어 주기
			communityPageDTO.setCurrentPage(noticeCurrentPage);
			communityPageDTO.setPageSize(noticePageSize);
			communityPageDTO.setPageNum(noticePageNum + 1);

			// 시작하는 페이지 번호 구하기
			int noticeStartPage = ((noticeCurrentPage-1) / noticePageBlock) * noticePageBlock + 1;
			System.out.println("noticePageSize: " + noticePageSize);
			
			// 끝나는 페이지 번호 구하기
			int noticeEndPage = noticeStartPage + noticePageBlock - 1;
			System.out.println("noticeEndPage: " + noticeEndPage);
			
			
			// 전체 글개수 구하기  50/10 => 5 , 55/10 => 5 나머지 5 1페이지 증가
			int noticePageCount = communityPageDTO.getCount() / noticePageBlock + (communityPageDTO.getCount() % noticePageBlock==0?0:1);
			// endPage 전체 글개수 비교 => endPage 크면 전체 글개수로 변경
				if(noticeEndPage > noticePageCount) {
				   noticeEndPage = noticePageCount;
			}
				
			System.out.println("noticePageCount: " + noticePageCount);
			
			// 페이지 dto에 넣어주기
			communityPageDTO.setStartPage(noticeStartPage);
			communityPageDTO.setEndPage(noticeEndPage);
			communityPageDTO.setPageCount(noticePageCount);
			communityPageDTO.setPageBlock(noticePageBlock);
	        System.out.println("noticeStartPage : " + noticeStartPage);
	        System.out.println("noticeEndPage : " + noticeEndPage);
	        
	        // 시작하는 행 계산
	        int noticeStartRow = (noticeCurrentPage - 1) * noticePageSize + 1;
	        
	        // 끝나는 행 계산
	        int noticeEndRow = noticeStartRow + noticePageSize - 1;
	     
	        
	        // DB에 시작하는 행 번호 - 1, 글 개수 설정
	        communityPageDTO.setStartRow(noticeStartRow - 1);
	        communityPageDTO.setEndRow(noticeEndRow);
	        System.out.println("noticeStartRow : " + noticeStartRow);
	        System.out.println("noticeEndRow : " + noticeEndRow);
	        
	        model.addAttribute("communityPageDTO", communityPageDTO);
	        model.addAttribute("communityList", communityService.getCommunityList(communityPageDTO));
	        
			
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
	
	
	
	//공지사항 수정
	// 글 수정 페이지로 이동
	    @GetMapping("/notice_update")
	    public String noticeUpdate() {
	    
	    	
	        return "community/notice_update";  // 수정할 글 데이터를 담아 수정 페이지로 이동
	    }
	    
//		//공지사항 수정
//		// 글 수정 페이지로 이동
//		    @GetMapping("/notice_updatePro")
//		    public String noticeUpdatePro(@RequestParam("ncommunity_num") long ncommunity_num, Model model, HttpSession session) {
////		        // 세션에서 관리자 확인
////		        Long adminId = (Long) session.getAttribute("admin_id");
//	//
////		        // 관리자 권한 체크
////		        if (adminId == null) {
////		            return "redirect:/login";  // 관리자 로그인이 안된 경우 로그인 페이지로 리다이렉트
////		        }
//	//
//		        // 글 정보 가져오기
//		        CommunityDTO communityDTO = communityService.getCommunityById(ncommunity_num);
//		        
//		        // 글 정보를 모델에 담아서 수정 페이지로 전달
//		        model.addAttribute("communityDTO", communityDTO);
//
//		        return "community/update";  // 수정할 글 데이터를 담아 수정 페이지로 이동
//		    }
	    
	    
	    
	    

	    // 글 수정 처리 (Post 방식)
//	    @PostMapping("/community/update")
//	    public String update(@ModelAttribute("communityDTO") CommunityDTO communityDTO, HttpSession session) {
	        // 세션에서 관리자 확인
//	        Long adminId = (Long) session.getAttribute("admin_id");
//
//	        // 관리자 권한 체크
//	        if (adminId == null) {
//	            return "redirect:/login";  // 관리자 로그인이 안된 경우 로그인 페이지로 리다이렉트
//	        }
//
//	        // 서비스 계층을 통해 글 업데이트
//	        communityService.updateCommunity(communityDTO);
//
//	        return "redirect:/community";  // 수정이 완료되면 목록 페이지로 리다이렉트
//	    }
//	}
	
	
	
	
	
	
	
	
	
	
	
	
		@GetMapping("qna")
		public String qna(HttpServletRequest request, Model model) {
			
			CommunityPageDTO communityPageDTO = new CommunityPageDTO();
			
			
			
			//notice 페이지네이션
			String qnaPageNum = request.getParameter("qnaPageNum");
			
				//페이지 번호 없으면 1로 설정
				if(qnaPageNum == null) {
					qnaPageNum = "1";
				}
				
				communityPageDTO.setPageNum(qnaPageNum);
				
				int qnaCurrentPage = Integer.parseInt(qnaPageNum);
				
				communityPageDTO.setCurrentPage(qnaCurrentPage);
				
				System.out.println("===== qnaPageNum :" + qnaPageNum);

				
				//한 페이지에 보여 줄 게시글 수
				int qnaPageSize = 8;
				
				//한 화면에 보여 줄 페이지 개수
				int qnaPageBlock = 10;
				
				//dto에 넣어 주기
				communityPageDTO.setCurrentPage(qnaCurrentPage);
				communityPageDTO.setPageSize(qnaPageSize);
				communityPageDTO.setPageNum(qnaPageNum + 1);

				// 시작하는 페이지 번호 구하기
				int qnaStartPage = ((qnaCurrentPage-1) / qnaPageBlock) * qnaPageBlock + 1;
				System.out.println("qnaPageSize: " + qnaPageSize);
				
				// 끝나는 페이지 번호 구하기
				int qnaEndPage = qnaStartPage + qnaPageBlock - 1;
				System.out.println("qnaEndPage: " + qnaEndPage);
				
				
				// 전체 글개수 구하기  50/10 => 5 , 55/10 => 5 나머지 5 1페이지 증가
				int qnaPageCount = communityPageDTO.getCount() / qnaPageBlock + (communityPageDTO.getCount() % qnaPageBlock==0?0:1);
				// endPage 전체 글개수 비교 => endPage 크면 전체 글개수로 변경
					if(qnaEndPage > qnaPageCount) {
					   qnaEndPage = qnaPageCount;
				}
					
				System.out.println("qnaPageCount: " + qnaPageCount);
				
				// 페이지 dto에 넣어주기
				communityPageDTO.setStartPage(qnaStartPage);
				communityPageDTO.setEndPage(qnaEndPage);
				communityPageDTO.setPageCount(qnaPageCount);
				communityPageDTO.setPageBlock(qnaPageBlock);
		        System.out.println("qnaStartPage : " + qnaStartPage);
		        System.out.println("qnaEndPage : " + qnaEndPage);
		        
		        // 시작하는 행 계산
		        int qnaStartRow = (qnaCurrentPage - 1) * qnaPageSize + 1;
		        
		        // 끝나는 행 계산
		        int qnaEndRow = qnaStartRow + qnaPageSize - 1;
		     
		        
		        // DB에 시작하는 행 번호 - 1, 글 개수 설정
		        communityPageDTO.setStartRow(qnaStartRow - 1);
		        communityPageDTO.setEndRow(qnaEndRow);
		        System.out.println("qnaStartRow : " + qnaStartRow);
		        System.out.println("qnaEndRow : " + qnaEndRow);
		        
		        model.addAttribute("communityPageDTO", communityPageDTO);
		        model.addAttribute("communityQnaList", communityService.getCommunityQnaList(communityPageDTO));
		        
				
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
		 
		 //만약에 로그인 안 했으면 로그인 화면 띄워주기
		 if(user_no != communityQnaDTO.getUser_no()) {
			 model.addAttribute("fail", false);
			 
			 return "redirect:/qna";
		 }
		model.addAttribute("communityQnaDTO", communityQnaDTO);
		
		return "/community/qna_detail"; // JSP 경로
	}	
	
	//질문 수정
	@GetMapping("/qna_update")
	public String qnaUpdate() {
		
		return "community/qna_update";
	}

}

