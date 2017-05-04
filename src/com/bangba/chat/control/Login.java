package com.bangba.chat.control;

import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bangba.chat.pojo.Notice;
import com.bangba.chat.pojo.Staff;
import com.bangba.chat.service.LoginService;
import com.bangba.chat.service.NoticeService;


@Controller
public class Login {
	@Autowired
	LoginService loginservice;
	
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/loginvalidate")
//	public String loginvalidate(@RequestParam("username") String username,@RequestParam("pic") String pic,@RequestParam("password") String pwd,HttpSession httpSession){
	public String loginvalidate(@RequestParam("username") String username,@RequestParam("password") String pwd,String rememberme,String autologin,HttpSession httpSession,HttpServletResponse response,
			ServletRequest servletRequest
			){
		String picode=(String) httpSession.getAttribute("rand");
//		if(!picode.equalsIgnoreCase(pic))
//			return "failcode";
		if(username==null)
			return "login";
		String realpwd=loginservice.getpwdbyname(username);
		if(realpwd!=null&&pwd.equals(realpwd))
		{
			long uid=loginservice.getUidbyname(username);
			Notice notice =  noticeService.find();
			httpSession.setAttribute("username", username);
			httpSession.setAttribute("uid", uid);
			//系统公告、通知
			httpSession.setAttribute("notice", notice.getNotice());
			httpSession.setAttribute("announcement", notice.getAnnouncement());
			
			//HttpServletResponse response = (HttpServletResponse)servletResponse;
			//记住密码,记录COOKIE信息
			if(rememberme !=null&&(!"null".equals(rememberme))){
	            Cookie userCookie = new Cookie("user", username+"-"+realpwd + "-" + autologin);
	            userCookie.setMaxAge(10*24*60*60);
	            userCookie.setPath("/");
	            
                response.addCookie(userCookie);
			}else{
				//移除COOKIE
				HttpServletRequest httpRequest = (HttpServletRequest)servletRequest;
				Cookie[] cookies=httpRequest.getCookies();
				for(Cookie newcookie:cookies){
					newcookie.setMaxAge(0);
					newcookie.setPath("/");
					response.addCookie(newcookie);
				}
			}
			return "chatroom";
		}else
			return "fail";
	}
	
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession httpSession){
		httpSession.removeAttribute("username");
		httpSession.removeAttribute("uid");
		return "login";
	}
	
	
	@RequestMapping("/regist")
	public String regist(@ModelAttribute("form") Staff staff,HttpSession httpSession){
		loginservice.regist(staff);
		httpSession.setAttribute("username",staff.getUsername());
		httpSession.setAttribute("uid", staff.getNameInfo());
		return "chatroom";
	}
	
	@RequestMapping("/findPassword") 
	public String findPassword(@RequestParam("findusername") String findusername,@RequestParam("findemail") String findemail,HttpServletRequest httpRequest){
		System.out.println("fdsfdsfdsf");
		boolean result =loginservice.findPassword( findusername, findemail);
		if(result){
			httpRequest.setAttribute("findPassword", "1");
		}
		else{
			httpRequest.setAttribute("findPassword", "0");
		}
		return "login";
	}
  }
