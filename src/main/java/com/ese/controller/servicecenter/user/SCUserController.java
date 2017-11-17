package com.ese.controller.servicecenter.user;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ese.common.encrypt.Sha256;
import com.ese.service.servicecenter.ServicecenterService;
import com.ese.vo.User;
import com.ese.vo.forms.Userform;

@Controller
public class SCUserController {
	
	@Autowired
	ServicecenterService centerService;

	
	@RequestMapping("/user/registe.do")
	public String registe(Model model) {
		model.addAttribute("userform", new Userform());
		return "servicecenter/user/registe";
	}
	
	@RequestMapping(value="/user/login.do", method=RequestMethod.GET)
	public String login() {
		
		return "servicecenter/user/login";
	}
	
	@RequestMapping(value="/user/login.do", method=RequestMethod.POST)
	public String loginProcess(@RequestParam("id") String id,
							@RequestParam("pwd") String pwd,
							HttpSession session) {
		
		User user = centerService.getUserDetail(id);
		
		if(user == null) {
			return "redirect:/user/login.do?error=fail";
		}
		String encryptPwd = Sha256.encrypt(pwd);
		if(!user.getPw().equals(encryptPwd)) {
			return "redirect:/user/login.do?error=fail";
		}
		session.setAttribute("loginUser", user);
		
		return "redirect:/home.do";
	}
	
	@RequestMapping("/user/add.do")
	public String addUser(@Valid Userform userform, BindingResult errors)  {
		
		if(centerService.getUserDetail(userform.getId()) != null) {
			errors.rejectValue("id", null, "이미 사용중인 아이디 입니다.");
			return "servicecenter/user/registe";
		}
		if(errors.hasErrors()) {
			return "servicecenter/user/registe";
		}
		
		User user = new User();
	
		BeanUtils.copyProperties(userform, user);
		
		String encryptPassword = Sha256.encrypt(user.getPw());
		user.setPw(encryptPassword);
		
		centerService.addNewUser(user);
		
		return "redirect:/home.do";
	}
	
	@RequestMapping(value="/user/userMyPage.do",method=RequestMethod.GET)
	public String userInfoUpdate(Model model,HttpSession session) {
		
		User user = (User)session.getAttribute("loginUser");
		model.addAttribute("user",user);
		
		return "/servicecenter/user/myPage";
	}
	
	@RequestMapping(value="/user/userMyPage.do",method=RequestMethod.POST)
	public String userInfoUpdate(Userform userForm) {
		if(userForm.getPw().equals(userForm.getPwdCheck())) {
			String id = userForm.getId();
			String newPw = DigestUtils.md5DigestAsHex(userForm.getPw().getBytes());
			String phone = userForm.getPhone();
			String email = userForm.getEmail();
			User user = new User();
			user = centerService.getUserById(id);
			user.setPw(newPw);
			user.setPhone(phone);
			user.setEmail(email);

			centerService.updateInfo(user);
			return "/servicecenter/user/myPage";
		}
		
		return "redirect:servicecenter/home";
	}
}
