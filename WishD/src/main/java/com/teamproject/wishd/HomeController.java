package com.teamproject.wishd;

import com.teamproject.domain.FreelancerDTO;
import com.teamproject.domain.ProjectDTO;
import com.teamproject.service.FreelancerService;
import com.teamproject.service.ManagerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import java.util.List;
import java.util.Locale;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Inject
	private ManagerService managerService;
	@Inject
	private FreelancerService freelancerService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		List<ProjectDTO> mainProList = managerService.getMainProList();

		model.addAttribute("mainProList", mainProList);

		List<FreelancerDTO> mainFreeList = managerService.getMainFreeList();

		model.addAttribute("mainFreeList", mainFreeList);

		return "main/main";
	}

}
