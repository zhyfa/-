package com.great.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/menu")
public class MenuAction {
	// 进入角色权限分配JSP页面
	@RequestMapping("/updateMenu.action")
	public ModelAndView tojsp() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manage/role");
		return mav;
	}
}
