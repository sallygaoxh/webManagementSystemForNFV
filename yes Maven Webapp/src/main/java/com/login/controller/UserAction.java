package com.login.controller;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.HttpClient;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



import com.login.model.User;
import com.login.service.IUserService;
import com.main.model.ONU;
import com.main.service.HttpService;
import com.main.service.ONUService;

@Controller
@RequestMapping("/user")
public class UserAction {

	@Resource(name="userServiceImpl")
	private IUserService userservice;
	@Resource
	HttpService httpService;
	
//	@Resource
//	ONUService onuService;

	@RequestMapping(value = "/log.do", method = RequestMethod.POST)
	public String Login(User user,ModelMap mp,HttpServletRequest request){	
		
//		List<ONU> onushow=onuService.selectAll();
//		System.out.println(onushow);
		HttpSession session=request.getSession();
		
		User us=userservice.user(user);
		if(us!=null){
			mp.addAttribute("username", user.getUname());
			if (user.getRank().equals("hiadmin")){
				mp.addAttribute("rank", "基础运营商");
				session.setAttribute("rank", "基础运营商");
				session.setAttribute("rank1", "1");
				//System.out.println("基础运营商");
			}else if(user.getRank().equals("admin")){
				mp.addAttribute("rank", "虚拟运营商");
				session.setAttribute("rank", "虚拟运营商");
				session.setAttribute("rank1", "2");
				session.setAttribute("vlanid",us.getVlan());
				System.out.println(us.getVlan());
			}
			
//			request.setAttribute("onushow", onushow);
			session.setAttribute("username",user.getUname());
			//session.setAttribute("rank", user.getRank());
			System.out.println("进入控制器1");
			httpService.manulSet("getAll");
			return "/main3";
		}else{
			mp.addAttribute("alarm", "登录失败！请重新登录");
			//httpService.manulSet("getAll");
			return "/login";
		} 
	}

}
