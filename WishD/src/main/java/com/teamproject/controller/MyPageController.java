package com.teamproject.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamproject.domain.CommunityPageDTO;
import com.teamproject.domain.FreelancerDTO;
import com.teamproject.domain.FreelancerPageDTO;
import com.teamproject.domain.JobDTO;
import com.teamproject.domain.MemberDTO;
import com.teamproject.domain.MyProjectDTO;
import com.teamproject.domain.MyProjectPageDTO;
import com.teamproject.service.MyPageService;
import com.teamproject.service.ProjectService;

@Controller
public class MyPageController {

	@Inject
	private MyPageService myPageService;
	@Inject
	private ProjectService projectService;

	@GetMapping("mypage")
	public String mypage(HttpSession session, Model model, HttpServletRequest request) {
//		session.setAttribute("user_no", 1);
//		session.setAttribute("access_Token", "dtDCDHVkTvo7oOsC1HsMAf6qu40Qurj8aYMMwmFV59GT5xjw9WBeDVreHGITSzU8");

		// ====== 회원 정보 가져오기 시작 =======
		// 세션에 저장된 값으로 체크
		MemberDTO myProfile = new MemberDTO();
		Long sessionCheck = (Long) session.getAttribute("user_no");
		if (sessionCheck == null || myProfile.isUser_yn()) {
			return "redirect:/login";
		}
		// 세션에 저장된 값으로 회원정보 가져오기 내부에서 간편, 일반 구분
		myProfile = myPageService.getLoginMember(sessionCheck);
		System.out.println(myProfile);

		model.addAttribute("myProfile", myProfile);
		System.out.println("myProfile : " + myProfile);
		// ======= 회원 정보 가져오기 끝 =======

		
		// ======= 내가 쓴 프리랜서 글 가져오기 시작 =====
		String requestProject = request.getParameter("requestProject");
		String search = request.getParameter("search");
		System.out.println("프로젝트 검색어 : " + search);
		String requestSearch = request.getParameter("search");
		
		String requestFree = request.getParameter("requestFreelancer");
		String freelancerSearch = request.getParameter("freelancerSearch");
		String freeRequestSearch = request.getParameter("freelancerSearch");
 
		if (requestFree == null || requestFree == "") {
			String freeLencerPageNum = request.getParameter("freeLencerPageNum");
			if (freeLencerPageNum == null) {
				freeLencerPageNum = "1";
			}

			int freeLencerPageNumToInt = Integer.parseInt(freeLencerPageNum);
			System.out.println("freeLencerPageNumToInt :" + freeLencerPageNumToInt);

			// 한 화면에 보여줄 글 개수 설정
			int freeLencerpageSize = 5;
			// 한 화면에 보여줄 페이지 개수 5 설정
			int freeLencerpageBlock = 5;

			// PageDTO 객체 생성
			FreelancerPageDTO myFreePageDTO = new FreelancerPageDTO();

			// 검색어 파라미터 넣기
			if (freelancerSearch != null) {
				myFreePageDTO.setSearch(freelancerSearch);
			}
			System.out.println("프리랜ㄴ서 검색어 : " + freelancerSearch);

			// 프리랜서 글상태 필터를 위해 글상태 저장
			String freelancerStatus = request.getParameter("freelancerStatus");
			System.out.println("파라미터로 넘어왔을때 freelancerStatus: " + freelancerStatus);
			if (freelancerStatus == "" || freelancerStatus == null) {
				freelancerStatus = "구직중";
				System.out.println("freelancerStatus : " + freelancerStatus);
			}
			myFreePageDTO.setFreelancerStatus(freelancerStatus);

			// 내프리랜서글 개수 가져오기
			// 검색어에 따른 프리랜서글 개수 가져오기 유저넘버랑 글넘버를 넘겨야함
			// getProjectCount에서 검색어를 안넘겨서 카운트가 비정상 작동
			myFreePageDTO.setUser_no(myProfile.getUser_no());
			myProfile.setSearch(freelancerSearch);
			myFreePageDTO.setFreelancerStatus(freelancerStatus); // 프로젝트 글상태 넣어줘야 카운트 계산
			// 프리랜서 글 상태도 넘겨야함
			myProfile.setFreelancerStatus(freelancerStatus); // 프로젝트 글상태 넣어줘야 카운트 계산
			myFreePageDTO.setCount(myPageService.getFreelancerCount(myProfile));
			System.out.println("myFreePageDTO Count : " + myFreePageDTO.getCount());
			myFreePageDTO.setCurrentPage(freeLencerPageNumToInt);
			myFreePageDTO.setPageSize(freeLencerpageSize);
			myFreePageDTO.setPageNum(freeLencerPageNumToInt + 1);

			// 시작하는 페이지 번호 구하기
			int freeLencerstartPage = ((freeLencerPageNumToInt - 1) / freeLencerpageBlock) * freeLencerpageBlock + 1;
			System.out.println("freeLencerstartPage : " + freeLencerstartPage);
			// 끝나는 페이지 번호 구하기
			int freeLencerendPage = freeLencerstartPage + freeLencerpageBlock - 1;
			System.out.println("freeLencerendPage : " + freeLencerendPage);

			// 페이지 카운트 구하기
			int freeLencerpageCount = myFreePageDTO.getCount() / freeLencerpageBlock
					+ (myFreePageDTO.getCount() % freeLencerpageBlock == 0 ? 0 : 1);
			if (freeLencerendPage > freeLencerpageCount) {
				freeLencerendPage = freeLencerpageCount;
			}
			System.out.println("freeLencerpageCount : " + freeLencerpageCount);

			// projectPageDTO 셋팅
			myFreePageDTO.setStartPage(freeLencerstartPage);
			myFreePageDTO.setEndPage(freeLencerendPage);
			myFreePageDTO.setPageCount(freeLencerpageCount);
			myFreePageDTO.setPageBlock(freeLencerpageBlock);
			System.out.println("freeLencerstartPage : " + freeLencerstartPage);
			System.out.println("freeLencerendPage : " + freeLencerendPage);

			// 시작하는 행 번호 구하기
			int freeLencerstartRow = (freeLencerPageNumToInt - 1) * freeLencerpageSize + 1;
			// 끝나는 행 번호 구하기
			int freeLencerendRow = freeLencerstartRow + freeLencerpageSize - 1;
			// DB에 Limit 시작하는 행 번호 - 1, 글 개수 설정
			System.out.println("freeLencerstartRow - 1 전 값 : " + freeLencerstartRow);
			myFreePageDTO.setStartRow(freeLencerstartRow - 1);
			myFreePageDTO.setEndRow(freeLencerendRow);
			System.out.println("freeLencerstartRow : " + freeLencerstartRow);
			System.out.println("freeLencerendRow : " + freeLencerendRow);

			myFreePageDTO.setUser_no(myProfile.getUser_no());
			// project_find page 글 개수 5개씩 가져옴
			model.addAttribute("myFreelancerPageDTO", myFreePageDTO);
			// getMyProject에서 스킬도 가져옴

			model.addAttribute("myFreelancerDTOList", myPageService.getMyFreelancer(myFreePageDTO));
			System.out.println("myProjectPageDTO size : " + myPageService.getMyFreelancer(myFreePageDTO).size());
		}
		// ======= 프리랜서 글 페이지네이션과 내가 쓴글가져오기 끝 ===========

		// === 프리랜서에 요청한 글 가져오기
		if (requestFree != null) {
			System.out.println("requestFree 보낸요청 파라미터 : " + requestFree);
			if (requestFree.equals("보낸요청")) {
				String freeRequestPageNum = request.getParameter("freelancerRequestPageNum");
				if (freeRequestPageNum == null) {
					freeRequestPageNum = "1";
				}

				int freeRequestPageNumToInt = Integer.parseInt(freeRequestPageNum);
				System.out.println("freeRequestPageNumToInt :" + freeRequestPageNumToInt);

				// 한 화면에 보여줄 글 개수 설정
				int freeRequestpageSize = 5;
				// 한 화면에 보여줄 페이지 개수 5 설정
				int freeRequestpageBlock = 5;

				// PageDTO 객체 생성
				FreelancerPageDTO myFreeRequestPageDTO = new FreelancerPageDTO();

				List<FreelancerDTO> myRequestFreeDTOList = myPageService
						.getRequestFreeListCount(myProfile.getUser_no());

				// 검색어 파라미터 넣기
				if (freeRequestSearch != null) {
					myFreeRequestPageDTO.setSearch(freeRequestSearch);
					System.out.println("requestsearch : " + freeRequestSearch);
				}
				myFreeRequestPageDTO.setUser_no(myProfile.getUser_no());
				myProfile.setSearch(freeRequestSearch);
//             	myProjectPageDTO.setProjectStatus(projectStatus); // 프로젝트 글상태 넣어줘야 카운트 계산
				// 프로젝트 글 상태도 넘겨야함
//             	myProfile.setProjectStatus(projectStatus); // 프로젝트 글상태 넣어줘야 카운트 계산
				System.out.println("myRequestFreeDTOList.size() : " + myRequestFreeDTOList.size());
				myFreeRequestPageDTO.setCount(myRequestFreeDTOList.size());
				System.out.println("myFreeRequestPageDTOgetCount : " + myFreeRequestPageDTO.getCount());
				myFreeRequestPageDTO.setCurrentPage(freeRequestPageNumToInt);
				myFreeRequestPageDTO.setPageSize(freeRequestpageSize);
				myFreeRequestPageDTO.setPageNum(freeRequestPageNumToInt + 1);

				// 시작하는 페이지 번호 구하기
				int freeRequestStartPage = ((freeRequestPageNumToInt - 1) / freeRequestpageBlock) * freeRequestpageBlock
						+ 1;
				System.out.println("freeRequestStartPage : " + freeRequestStartPage);
				// 끝나는 페이지 번호 구하기
				int freeRequestEndPage = freeRequestStartPage + freeRequestpageBlock - 1;
				System.out.println("freeRequestEndPage : " + freeRequestEndPage);

				// 페이지 카운트 구하기
				int freeRequestPageCount = myFreeRequestPageDTO.getCount() / freeRequestpageBlock
						+ (myFreeRequestPageDTO.getCount() % freeRequestpageBlock == 0 ? 0 : 1);
				if (freeRequestEndPage > freeRequestPageCount) {
					freeRequestEndPage = freeRequestPageCount;
				}
				System.out.println("freeRequestPageCount : " + freeRequestPageCount);

				// projectPageDTO 셋팅
				myFreeRequestPageDTO.setStartPage(freeRequestStartPage);
				myFreeRequestPageDTO.setEndPage(freeRequestEndPage);
				myFreeRequestPageDTO.setPageCount(freeRequestPageCount);
				myFreeRequestPageDTO.setPageBlock(freeRequestpageBlock);
				System.out.println("freeRequestStartPage : " + freeRequestStartPage);
				System.out.println("freeRequestEndPage : " + freeRequestEndPage);

				// 시작하는 행 번호 구하기
				int freeRequestStartRow = (freeRequestPageNumToInt - 1) * freeRequestpageSize + 1;
				// 끝나는 행 번호 구하기
				int freeRequestEndRow = freeRequestStartRow + freeRequestpageSize - 1;
				// DB에 Limit 시작하는 행 번호 - 1, 글 개수 설정
				System.out.println("freeRequestStartRow - 1 전 값 : " + freeRequestStartRow);
				myFreeRequestPageDTO.setStartRow(freeRequestStartRow - 1);
				myFreeRequestPageDTO.setEndRow(freeRequestEndRow);
				System.out.println("freeRequestStartRow : " + freeRequestStartRow);
				System.out.println("freeRequestEndRow : " + freeRequestEndRow);
				
				myFreeRequestPageDTO.setUser_no(myProfile.getUser_no());
				// project_find page 글 개수 5개씩 가져옴
				
				model.addAttribute("myFreeRequestDTOList", myPageService.getMyRequestFree(myFreeRequestPageDTO));
				System.out.println("myFreeRequestPageDTO getCount 사이즈 : " + myFreeRequestPageDTO.getCount());
				model.addAttribute("myFreeRequestPageDTO", myFreeRequestPageDTO);

			}
		}

		// ======= 프로젝트 글 페이지네이션과 내가 쓴글가져오기 시작 ========
		
		
		// 파라미터값 projectPageNum 없으면 => 1페이지로 설정
		if(requestProject == null || requestProject == "") {
		String projectPageNum = request.getParameter("projectPageNum");
		System.out.println("requestProject 널일때");
		if (projectPageNum == null) {
			projectPageNum = "1";
		}

		int pageNumToInt = Integer.parseInt(projectPageNum);
		System.out.println("pageNumToInt :" + pageNumToInt);

		// 한 화면에 보여줄 글 개수 설정
		int pageSize = 5;
		// 한 화면에 보여줄 페이지 개수 5 설정
		int pageBlock = 5;

		// PageDTO 객체 생성
		MyProjectPageDTO myProjectPageDTO = new MyProjectPageDTO();

		
		// 검색어 파라미터 넣기
		if (search != null) {
			myProjectPageDTO.setSearch(request.getParameter("search"));
			System.out.println("진짜 search : " + request.getAttribute("search"));
		}
		System.out.println("프로젝트 검색어 : " + search);

		// 프로젝트 글상태 필터를 위해 글상태 저장
		String projectStatus = request.getParameter("projectStatus");
		System.out.println("파라미터로 넘어왔을때 projectStatus: " + projectStatus);
		if (projectStatus == "" || projectStatus == null) {
			projectStatus = "모집중";
			System.out.println("projectStatus 파라미터가 공백일때 : " + projectStatus);
		} else if (projectStatus != null) { // 공백제거
			System.out.println("projectStatus 파라미터가 있을때 : " + projectStatus);
			myProjectPageDTO.setProjectStatus(projectStatus);
		}

		// 내프로젝트글 개수 가져오기
		// 검색어에 따른 프로젝트 개수 가져오기 유저넘버랑 글넘버를 넘겨야함
		// getProjectCount에서 검색어를 안넘겨서 카운트가 비정상 작동
		myProjectPageDTO.setUser_no(myProfile.getUser_no());
		myProfile.setSearch(search);
		myProjectPageDTO.setProjectStatus(projectStatus); // 프로젝트 글상태 넣어줘야 카운트 계산
		// 프로젝트 글 상태도 넘겨야함
		myProfile.setProjectStatus(projectStatus); // 프로젝트 글상태 넣어줘야 카운트 계산
		myProjectPageDTO.setCount(myPageService.getProjectCount(myProfile));
		System.out.println("getCount : " + myProjectPageDTO.getCount());
		myProjectPageDTO.setCurrentPage(pageNumToInt);
		myProjectPageDTO.setPageSize(pageSize);
		myProjectPageDTO.setPageNum(pageNumToInt + 1);

		// 시작하는 페이지 번호 구하기
		int startPage = ((pageNumToInt - 1) / pageBlock) * pageBlock + 1;
		System.out.println("startPage : " + startPage);
		// 끝나는 페이지 번호 구하기
		int endPage = startPage + pageBlock - 1;
		System.out.println("endPage : " + endPage);

		// 페이지 카운트 구하기
		int pageCount = myProjectPageDTO.getCount() / pageBlock
				+ (myProjectPageDTO.getCount() % pageBlock == 0 ? 0 : 1);
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		System.out.println("pageCount : " + pageCount);

		// projectPageDTO 셋팅
		myProjectPageDTO.setStartPage(startPage);
		myProjectPageDTO.setEndPage(endPage);
		myProjectPageDTO.setPageCount(pageCount);
		myProjectPageDTO.setPageBlock(pageBlock);
		System.out.println("startPage : " + startPage);
		System.out.println("endPage : " + endPage);

		// 시작하는 행 번호 구하기
		int startRow = (pageNumToInt - 1) * pageSize + 1;
		// 끝나는 행 번호 구하기
		int endRow = startRow + pageSize - 1;
		// DB에 Limit 시작하는 행 번호 - 1, 글 개수 설정
		System.out.println("startRow - 1 전 값 : " + startRow);
		myProjectPageDTO.setStartRow(startRow - 1);
		myProjectPageDTO.setEndRow(endRow);
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);

		myProjectPageDTO.setUser_no(myProfile.getUser_no());
		// project_find page 글 개수 5개씩 가져옴
		model.addAttribute("myProjectPageDTO", myProjectPageDTO);
		// getMyProject에서 스킬도 가져옴
		model.addAttribute("myProjectDTOList", myPageService.getMyProject(myProjectPageDTO));
		System.out.println("myProjectPageDTO size : " + myPageService.getMyProject(myProjectPageDTO).size());
		}
		// ======= 프로젝트 글 페이지네이션과 내가 쓴글가져오기 끝 ===========

		// === 프로젝트에 요청한 글 가져오기
		if (requestProject != null) {
			System.out.println("보낸요청 파라미터 : " + requestProject);
			if (requestProject.equals("보낸요청")) {
				System.out.println("보낸요청");
				String projectRequestPageNum = request.getParameter("projectRequestPageNum");
				if (projectRequestPageNum == null) {
					projectRequestPageNum = "1";
				}

				int requestPageNumToInt = Integer.parseInt(projectRequestPageNum);
				System.out.println("requestPageNumToInt :" + requestPageNumToInt);

				// 한 화면에 보여줄 글 개수 설정
				int projectRequestpageSize = 5;
				// 한 화면에 보여줄 페이지 개수 5 설정
				int projectRequestpageBlock = 5;

				// PageDTO 객체 생성
				MyProjectPageDTO myProjectRequestPageDTO = new MyProjectPageDTO();

				
				List<MyProjectDTO> myRequestProjectDTOList = myPageService.getRequestListCount(myProfile.getUser_no());

				// 검색어 파라미터 넣기

				if (requestSearch != null) {
					myProjectRequestPageDTO.setSearch(request.getParameter("search"));
					System.out.println("requestsearch : " + request.getAttribute("search"));
				}
				myProjectRequestPageDTO.setUser_no(myProfile.getUser_no());
				myProfile.setSearch(requestSearch);
//             	myProjectPageDTO.setProjectStatus(projectStatus); // 프로젝트 글상태 넣어줘야 카운트 계산
				// 프로젝트 글 상태도 넘겨야함
//             	myProfile.setProjectStatus(projectStatus); // 프로젝트 글상태 넣어줘야 카운트 계산
				myProjectRequestPageDTO.setCount(myRequestProjectDTOList.size());
				System.out.println("getCount : " + myProjectRequestPageDTO.getCount());
				myProjectRequestPageDTO.setCurrentPage(requestPageNumToInt);
				myProjectRequestPageDTO.setPageSize(projectRequestpageSize);
				myProjectRequestPageDTO.setPageNum(requestPageNumToInt + 1);

				// 시작하는 페이지 번호 구하기
				int requestStartPage = ((requestPageNumToInt - 1) / projectRequestpageBlock) * projectRequestpageBlock
						+ 1;
				System.out.println("requestStartPage : " + requestStartPage);
				// 끝나는 페이지 번호 구하기
				int requestEndPage = requestStartPage + projectRequestpageBlock - 1;
				System.out.println("requestEndPage : " + requestEndPage);

				// 페이지 카운트 구하기
				int requestPageCount = myProjectRequestPageDTO.getCount() / projectRequestpageBlock
						+ (myProjectRequestPageDTO.getCount() % projectRequestpageBlock == 0 ? 0 : 1);
				if (requestEndPage > requestPageCount) {
					requestEndPage = requestPageCount;
				}
				System.out.println("requestPageCount : " + requestPageCount);

				// projectPageDTO 셋팅
				myProjectRequestPageDTO.setStartPage(requestStartPage);
				myProjectRequestPageDTO.setEndPage(requestEndPage);
				myProjectRequestPageDTO.setPageCount(requestPageCount);
				myProjectRequestPageDTO.setPageBlock(projectRequestpageBlock);
				System.out.println("requestStartPage : " + requestStartPage);
				System.out.println("requestEndPage : " + requestEndPage);

				// 시작하는 행 번호 구하기
				int requestStartRow = (requestPageNumToInt - 1) * projectRequestpageSize + 1;
				// 끝나는 행 번호 구하기
				int requestEndRow = requestStartRow + projectRequestpageSize - 1;
				// DB에 Limit 시작하는 행 번호 - 1, 글 개수 설정
				System.out.println("requestStartRow - 1 전 값 : " + requestStartRow);
				myProjectRequestPageDTO.setStartRow(requestStartRow - 1);
				myProjectRequestPageDTO.setEndRow(requestEndRow);
				System.out.println("requestStartRow : " + requestStartRow);
				System.out.println("requestEndRow : " + requestEndRow);

				myProjectRequestPageDTO.setUser_no(myProfile.getUser_no());
				// project_find page 글 개수 5개씩 가져옴
				model.addAttribute("myProjectRequestDTOList",
						myPageService.getMyRequestProject(myProjectRequestPageDTO));

				model.addAttribute("myProjectRequestPageDTO", myProjectRequestPageDTO);

				// getMyProject에서 스킬도 가져옴
//              model.addAttribute("myProjectDTOList", myPageService.getMyProject(myProjectPageDTO));
//              System.out.println("myProjectPageDTO size : " + myPageService.getMyProject(myProjectPageDTO).size());

//         		model.addAttribute("myRequestProjectDTOList", myRequestProjectDTOList);
//         		System.out.println("내가 보낸 글 리스트 : " + myRequestProjectDTOList.size());
			}
		}

		// ======= QnA 글 페이지네이션 시작 ========
		String qnaPageNum = request.getParameter("qnaPageNum");
		if (qnaPageNum == null) {
			qnaPageNum = "1";
		}
		int qnaPageNumToInt = Integer.parseInt(qnaPageNum);
		System.out.println("====== qnaPageNum : " + qnaPageNum);

		CommunityPageDTO myQnaPageDTO = new CommunityPageDTO();
		myQnaPageDTO.setUser_no(myProfile.getUser_no());

		int qnaPageSize = 5;
		int qnaPageBlock = 5;
		// 시작하는 페이지 번호 구하기
		int qnaStartPage = ((qnaPageNumToInt - 1) / qnaPageBlock) * qnaPageBlock + 1;
		System.out.println("qnaPageSize : " + qnaPageSize);
		// 끝나는 페이지 번호 구하기
		int qnaEndPage = qnaStartPage + qnaPageBlock - 1;
		System.out.println("qnaEndPage : " + qnaEndPage);

		// 내가 쓴 qna 개수 가져오고 pageDTO에 넣어주기
		myQnaPageDTO.setCount(myPageService.getMyQnaCount(myProfile.getUser_no()));
		System.out.println("qna 글개수 : " + myQnaPageDTO.getCount());

		// 페이지 카운트 구하기
		int qnaPageCount = myQnaPageDTO.getCount() / qnaPageBlock
				+ (myQnaPageDTO.getCount() % qnaPageBlock == 0 ? 0 : 1);
		if (qnaEndPage > qnaPageCount) {
			qnaEndPage = qnaPageCount;
		}
		System.out.println("qnaPageCount : " + qnaPageCount);

		// 페이지 dto에 넣어주기
		myQnaPageDTO.setStartPage(qnaStartPage);
		myQnaPageDTO.setEndPage(qnaEndPage);
		myQnaPageDTO.setPageCount(qnaPageCount);
		myQnaPageDTO.setPageBlock(qnaPageBlock);
		System.out.println("qnaStartPage : " + qnaStartPage);
		System.out.println("qnaEndPage : " + qnaEndPage);

		// 시작하는 행 번호 구하기
		int qnaStartRow = (qnaPageNumToInt - 1) * qnaPageSize + 1;
		// 끝나는 행 번호 구하기
		int qnaEndRow = qnaStartRow + qnaPageSize - 1;
		// DB에 Limit 시작하는 행 번호 - 1, 글 개수 설정
		myQnaPageDTO.setStartRow(qnaStartRow - 1);
		myQnaPageDTO.setEndRow(qnaEndRow);
		System.out.println("qnaStartRow : " + qnaStartRow);
		System.out.println("qnaEndRow : " + qnaEndRow);

		model.addAttribute("myQnaPageDTO", myQnaPageDTO);
		model.addAttribute("myQnaDTOList", myPageService.getMyQnaList(myQnaPageDTO));
		// ======= QnA 글 페이지네이션 끝 ========

		return "mypage/mypage";
	}

	// 비밀번호 업데이트
	@PostMapping("mypage/mypageUpdatePro")
	public String mypageUpdatePro(HttpSession session, MemberDTO memberDTO) {
		System.out.println("비밀번호 업데이트 넘어 왔을때 mypageUpdatePro : " + memberDTO);
		memberDTO.setUser_no((Long) session.getAttribute("user_no"));
		myPageService.updateMember(memberDTO);
		return "redirect:/mypage";
	}

	@PostMapping("mypage/myuserDeletePro")
	@Transactional
	public String myuserDeletePro(MemberDTO memberDTO, HttpSession session) {
		memberDTO.setUser_no((Long) session.getAttribute("user_no"));

		System.out.println("MyPageController - myuserDeletePro : " + memberDTO);
	    // 사용자가 존재하는지 확인
	    MemberDTO result = myPageService.deleteCheck(memberDTO);
	    System.out.println("존재 체크 : " + result);
	    
	    // 사용자가 존재하고 비밀번호가 일치하는 경우
	    if (result != null) {
	        if (result.getUser_pass().equals(memberDTO.getAccess_Token())) { // 현재비번은 액세스토큰에 담김
	            // 삭제 수행
	            myPageService.deleteMember(memberDTO);
	            // 세션 무효화
	            session.invalidate();
	            return "redirect:/"; 
	        } else {
	            // 비밀번호가 일치하지 않는 경우
//	            session.setAttribute("errorMessage", "비밀번호가 틀렸습니다.");
	            return "redirect:/mypage";
	        }
	    }
	    return "redirect:/mypage";
	}

	@GetMapping("mypage/myprojectupdate")
	public String myProjectUpdate(HttpServletRequest request, Model model) {
//		System.out.println("myProjectUpdate request.getParameter("projectPageNum") : " + request.getParameter("projectPageNum"));
		System.out.println("myprojectupdate - myprojectupdate");

		// 직무 가져오기
		List<JobDTO> jobsDTO = myPageService.getJobsList();
		model.addAttribute("myProjectJobsDTO", jobsDTO);

		// 프로젝트 내용 가져오기
		MyProjectDTO myProjectDTO = myPageService
				.getProjectForUpdate(Integer.parseInt(request.getParameter("projectPageNum")));
		System.out.println("스킬도 들어오는지 myProjectDTO : " + myProjectDTO);

		// 직무테이블 리스트

		// 스킬테이블리스트
		model.addAttribute("myProjectSkillList", projectService.getSkillList());
		model.addAttribute("myProjectDTO", myProjectDTO);
		return "mypage/project_update";
	}

	@PostMapping("mypage/myprojectupdatePro")
	public String myprojectupdatePro(MyProjectDTO myProjectDTO, Model model, HttpServletRequest request) {
		System.out.println("myprojectupdate - myprojectupdatePro");
		System.out.println(request.getParameter("skillList"));
		System.out.println("프로젝트 업데이트 넘어왔을때 값 : " + myProjectDTO);
		// 프로젝트 내용 업데이트
		myPageService.updateMyProject(myProjectDTO);

		return "redirect:/mypage";
	}

	// 프리랜서글 수정 시작
	@GetMapping("mypage/myfreelancerupdate")
	public String myFreelancerUpdate(HttpServletRequest request, Model model) {
		System.out.println("myFreelancerUpdate 매핑 확인");

		List<JobDTO> jobsDTO = myPageService.getJobsList();
		System.out.println("직무리스트 : " + jobsDTO);
		model.addAttribute("myFreeJobsDTO", jobsDTO);

		FreelancerDTO myfreelancerDTO = myPageService
				.getMyFreelancerForUpdate(Long.parseLong(request.getParameter("freelancerPageNum")));
		model.addAttribute("myfreelancerDTO", myfreelancerDTO);
		model.addAttribute("myFreelancerSkillList", projectService.getSkillList());

		return "mypage/freelancer_update";
	}

	@PostMapping("mypage/myFreelancerUpdatePro")
	public String myFreelancerUpdatePro(FreelancerDTO freelancerDTO) {
		System.out.println("freelancerDTO 업데이트 넘어왔을때 : " + freelancerDTO);

		myPageService.updateMyFreelancer(freelancerDTO);

		return "redirect:/mypage";
	}

	// 아이디 중복 체크
	@GetMapping("mypage/idCheck")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println("아이디 중복 체크 : " + id);

		// 아이디 중복 여부 확인
		String result = myPageService.userIdCheck(id);

		if (result != null) {
			// 아이디 중복
			return "iddup";
		} else {
			// 아이디 사용 가능
			return "idok";
		}
	}

}
