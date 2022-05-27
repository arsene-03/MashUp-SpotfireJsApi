package com.pnd.mashup.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pnd.mashup.member.service.impl.MemberServiceImpl;
import com.pnd.mashup.model.Member;
import com.pnd.mashup.security.SecurityMember;



@Controller
@PreAuthorize("hasRole('ROLE_ADMIN')")
@RequestMapping("/admin")
public class Mashup_AdminController {
	@Autowired
	MemberServiceImpl memberService;
	// 전체 회원정보 조회 페이지 //
		@RequestMapping(value = "/selectAllMember", method = RequestMethod.GET)
		public String goAllMemberList (Model model, Authentication authentication) {
			authenticationChk(authentication,model);
			System.out.println("전체 회원정보 보기");
			List<Member> memberList = memberService.selectAllMember();
			model.addAttribute("memberList",memberList);
			
			return "admin/selectAllMember";
		}
	// 특정 회원정보 조회 페이지 //	
		@RequestMapping(value = "/selectMember", method = RequestMethod.GET )
		public String goMembers (Model model, @RequestParam("userid")String userId, Authentication authentication) {
			System.out.println("특정 유저정보 보기");
			authenticationChk(authentication,model);
			Member member = memberService.select(userId);
			model.addAttribute("username",member.getId());
			model.addAttribute("userrole",member.getRole());
			return "userInfo";
		}
	// 특정 회원정보 삭제 메서드 //	
		@RequestMapping(value = "/deleteMember", method = RequestMethod.GET )
		public String deleteMembers (Model model, @RequestParam("userid")String id, Authentication authentication) {
			System.out.println("특정 유저정보 보기");
			
			memberService.delete(id);
			model.addAttribute("msg","delMemberSuc");
			
			
			return "alert";
		}
		// 유저정보가 있으면 model객체로 넘겨주는 메서드
		private void authenticationChk(Authentication authentication, Model model) {
			if(authentication != null) {
				SecurityMember member = (SecurityMember)authentication.getPrincipal();
				model.addAttribute("username", member.getUsername());
			}
		}
	
}
