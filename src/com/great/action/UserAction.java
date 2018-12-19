package com.great.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/user")
public class UserAction {

    private static final long serialVersionUID = 1L;
    
//    @Resource //@AutoWired setUserService()
//    private IUserService userService;
    
    //user/user_list.action
//    @RequestMapping("/user_list.action")
//    public ModelAndView user_list(User user,Integer pageIndex) {
//    	if(pageIndex==null) {
//    		pageIndex=1;
//    	}
//    	List<User> users = userService.queryAllUser(user,pageIndex,Page.NUMBER);
//    	Page page = new Page(users);
//    	ModelAndView mav = new ModelAndView();
//    	mav.setViewName("user_list");
//    	mav.addObject("users", users);
//    	mav.addObject("page", page);
//    	return mav;
//    }
//    //user/user_add.action
//    @RequestMapping("/user_add.action")
//    public ModelAndView user_add(User user) {
//    	ModelAndView mav = new ModelAndView();
//    	int result = userService.addUser(user);
////    	List<User> users = userService.queryAllUser(user);
//    	mav.setViewName("user_list");
////    	mav.addObject("users", users);
//    	return mav;
//    }
//   
//  //==========================================================================================  
//	// localhost:8080/ssm4/user/hello.action
//	@RequestMapping("/hello.action")
//	public ModelAndView hello() {
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("hello");
//		return mav;
//	}
//	
//	// localhost:8080/ssm4/user/userinfo.action
//	@RequestMapping(value = "/userinfo.action")
//	public ModelAndView userinfo(HttpServletRequest request,
//			@RequestParam(value = "username", required = true, defaultValue = "empty") String name, String password) {
//		System.out.println(name + ":" + password);
//		HttpSession session = request.getSession();
////		session.setAttribute("user", new User(name, password,"",""));
//		ModelAndView mav = new ModelAndView();
//		
//		//List<User> list = userService.queryAllUser();
//		//request.setAttribute("users",list);
//		//request.setAttribute("abc","hpp");
//		mav.addObject("abc", "hpp");
//		mav.getModel().put("abc", "hpp");
//		
//		mav.setViewName("list");
//		return mav;
//	}
//
//	// localhost:8080/ssm4/user/userinfo2.action
//	@RequestMapping(value = "/userinfo2.action")
//	public String userinfo2(HttpServletRequest request, User user) {
//		System.out.println(user);
//		HttpSession session = request.getSession();
//		session.setAttribute("user", user);
//		return "userinfo"; 
//	}

}