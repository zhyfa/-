package com.great.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.great.aop.Log;
import com.great.bean.Admin;
import com.great.service.AdminService;
@Controller
@RequestMapping("/admin")
//hah 
public class AdminLoginAction {
	@Resource // @AutoWired setUserService()
	private AdminService adminService;
	@Log(thing = "用户登录")
	@RequestMapping(value = "/login.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	public @ResponseBody String login(HttpServletRequest request,Admin admin,String code) {
		String imageCode = (String) request.getSession().getAttribute("imageCode");
		if (!imageCode.equals(code)) {
			return "2";
		}

		Admin result = adminService.adminLogin(admin);
		if (result != null) {
			request.getSession().setAttribute("admin", result);
			return "1";
		} else if(result.getAdmin_state()==3){
			return "4";
		}else {

			return "3";
		}
	}
	@RequestMapping(value = "/toHomepage.action",method=RequestMethod.GET,produces="application/json;charset=utf-8")
	 public ModelAndView toHomepage(HttpSession session) {
		session.invalidate();
  	ModelAndView mav = new ModelAndView();
  	mav.setViewName("main");
		return mav;
  	
  }
	//登录用户退出
	
	@RequestMapping(value = "/exit.action",method=RequestMethod.GET,produces="application/json;charset=utf-8")
	 public void exit(HttpSession session,HttpServletResponse response,HttpServletRequest request) throws Exception{
		session.invalidate();
		response.sendRedirect(request.getContextPath()+"/index.jsp");
   	
   }
	//登录用户修改密码
	@RequestMapping(value = "/toAlterPwd.action",method=RequestMethod.GET,produces="application/json;charset=utf-8")
	 public ModelAndView toAlterPwd(HttpSession session) {
  	ModelAndView mav = new ModelAndView();
  	mav.setViewName("admin/alterPwd");
		return mav;
  }
	
	//登录用户
	@RequestMapping(value = "/toMyInfo.action",method=RequestMethod.GET,produces="application/json;charset=utf-8")
	 public ModelAndView toMyInfo(HttpSession session) {
 	ModelAndView mav = new ModelAndView();
 	mav.setViewName("admin/myInfo");
		return mav;
 }
	//校验原密码正确与否
	@RequestMapping(value = "/checkPwd.action",method=RequestMethod.POST,produces="application/json;charset=utf-8")
	 public @ResponseBody String checkPwd(HttpServletRequest request,HttpSession session,String mPwdOld) {
 	
	Admin admin = (Admin) request.getSession().getAttribute("admin");
	String password = admin.getAdmin_pwd();
	if(mPwdOld.equals(password)) {
		return "1";
	}else {
		return "2";
	}
 }
	//登录用户修改密码
	@Log(thing = "用户修改密码")
	@RequestMapping("/alterPwd.action")
	public ModelAndView login(HttpServletRequest request, HttpSession session, String admin_pwd) {
		ModelAndView mav = new ModelAndView();
		Admin loginAdmin = (Admin) request.getSession().getAttribute("admin");
		int adminId=loginAdmin.getAdmin_id();
		Admin admin = new Admin();
		admin.setAdmin_id(adminId);
		admin.setAdmin_pwd(admin_pwd);
		int result = adminService.alterPwd(admin);
		if(result>0) {
//			session.invalidate();
			mav.setViewName("admin/success");
		}
		else {
			mav.setViewName("admin/alterPwd");
		}
		return mav;
	}
}
