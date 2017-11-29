package com.ese.controller.servicecenter.auth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AuthorizationController {

	@RequestMapping("/order/genCode.do")
	public ModelAndView generateQRCode(String userId) {
		return new ModelAndView("qrcodeview", "userId", userId);
	}
	
	@RequestMapping("/order/verify.do")
	@ResponseBody
	public String authorization(String userId, String phone) {
		
		return "ok";
	}
	
}
