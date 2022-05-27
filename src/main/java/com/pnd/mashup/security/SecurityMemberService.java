package com.pnd.mashup.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.pnd.mashup.member.mapper.MemberMapper;

public class SecurityMemberService implements UserDetailsService{
	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		SecurityMember member = new SecurityMember(memberMapper.getMemberById(id));
		return member;
	}
	
}
