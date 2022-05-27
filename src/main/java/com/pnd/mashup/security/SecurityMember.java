package com.pnd.mashup.security;


import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import com.pnd.mashup.model.Member;

public class SecurityMember extends User{
	public SecurityMember(Member member) {
		super(
			member.getId(),
			member.getPassword(),
			AuthorityUtils.createAuthorityList(member.getRole())
		);
	}

}
