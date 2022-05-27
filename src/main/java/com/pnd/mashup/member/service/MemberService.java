package com.pnd.mashup.member.service;

import java.util.List;

import com.pnd.mashup.model.Member;

public interface MemberService {
	boolean idChk (Member member);
	void join (Member member);
	void update(Member member);
	List<Member> selectAllMember();
	Member select (String id);
	void delete(String id);
}
