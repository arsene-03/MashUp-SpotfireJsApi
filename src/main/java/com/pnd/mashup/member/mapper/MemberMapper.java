package com.pnd.mashup.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pnd.mashup.model.Member;

@Mapper
public interface MemberMapper{
	Member getMemberById (String id);
	void insertMember(Member member);
	void updateMember(Member member);
	List<Member> selectAllMember();
	void deleteMember(String id);
}