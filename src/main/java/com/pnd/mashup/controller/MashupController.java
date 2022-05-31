package com.pnd.mashup.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pnd.mashup.Library.service.impl.SpotfireServiceImpl;
import com.pnd.mashup.member.service.impl.MemberServiceImpl;
import com.pnd.mashup.model.Lib_items;
import com.pnd.mashup.model.Member;
import com.pnd.mashup.security.SecurityMember;

@Controller
@PreAuthorize("hasRole('ROLE_USER')")
public class MashupController {
	

	@Autowired
	MemberServiceImpl memberService;
	
	@Autowired
	SpotfireServiceImpl spotfireService;
	
// ���� ������//
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String goMain(Model model, Authentication authentication) {
		System.out.println("���� ��������");
		authenticationChk(authentication,model);
		
		
		
		
		return"main";
	}
	

// �α��� ������ //
	@RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
	public String goLogin(Model model, Authentication authentication) {
		System.out.println("�α��� ��������");
		authenticationChk(authentication,model);
		return"login";
	}

	
// ȸ������ ������ // 
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String goJoin(Model model, Authentication authentication) {
		System.out.println("�α��� ��������");
		authenticationChk(authentication,model);
		System.out.println("ȸ������ ��������");
		return "join";
	}
	
// ȸ������ ��� //
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String Join(Member member, Model model) {
		member.setPassword(new BCryptPasswordEncoder().encode(member.getPassword()));
		
		if(memberService.idChk(member)) { 
			//id �ߺ��˻� //
			model.addAttribute("msg", "idDup");
			
		}else {
			// ȸ������ //
			memberService.join(member);
			model.addAttribute("msg","joinSuc");
		}
		return "alert";
	}
	
// ȸ������ ��ȸ ������ //
	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String goUserInfo(Model model, Authentication authentication) {
		SecurityMember member = (SecurityMember)authentication.getPrincipal();
		
		model.addAttribute("username",member.getUsername());
		return "userInfo";
	}
// ȸ������ ��ȸ ���
	@RequestMapping(value = "/userInfo", method = RequestMethod.POST)
	public String userInfo(Member member, Authentication authentication, Model model, @RequestParam("newPassword")String newPw, @RequestParam("role")String role) {
		System.out.println("����");
		//DB ��������
		SecurityMember dbmember = (SecurityMember)authentication.getPrincipal();
		
		//Input OldPw
		String writeOldPW = member.getPassword();
		
		//encoder �ν��Ͻ� ����
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		//DB ��й�ȣ vs �Է��� ������й�ȣ
		
			if(encoder.matches(writeOldPW, dbmember.getPassword())) {
				//�Է��� ������й�ȣ vs ���ο� ��й�ȣ 
				if(writeOldPW.equals(newPw) ) {
					model.addAttribute("username",dbmember.getUsername());
					model.addAttribute("msg", "���� ��й�ȣ�� �̿��� �� �����ϴ�.");
					return "userInfo";
				}else {
					member.setPassword(new BCryptPasswordEncoder().encode(newPw));
					memberService.update(member);
					model.addAttribute("username",dbmember.getUsername());
					model.addAttribute("msg", "pwSuc");
					return "alert";
				}
			}else {
				model.addAttribute("msg", "���� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
				model.addAttribute("username",dbmember.getUsername());
			}
		
		return "userInfo";
	}
	// ���������� ������ model��ü�� �Ѱ��ִ� �޼���
	private void authenticationChk(Authentication authentication, Model model) {
		if(authentication != null) {
			SecurityMember member = (SecurityMember)authentication.getPrincipal();
			model.addAttribute("username", member.getUsername());
		}
	}
		
}
