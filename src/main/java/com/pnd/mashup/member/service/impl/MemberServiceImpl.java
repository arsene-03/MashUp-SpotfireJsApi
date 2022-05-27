package com.pnd.mashup.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pnd.mashup.member.mapper.MemberMapper;
import com.pnd.mashup.member.service.MemberService;
import com.pnd.mashup.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	
	
	@Override
	public void join(Member member) { // 회원가입 기능
		memberMapper.insertMember(member);
	}


	@Override
	public boolean idChk(Member member) { // 중복 id 체크 기능
		boolean DupIdChk = memberMapper.getMemberById(member.getId())!=null;
			System.out.println("중복 ID");
		return DupIdChk;
	}

	@Override
	public void update(Member member) { // 회원정보 수정 기능
		memberMapper.updateMember(member);
		
	}


	@Override
	public List<Member> selectAllMember() { // 전체 회원조회 기능
		List<Member>memberList = memberMapper.selectAllMember();
		return memberList;
	}


	@Override
	public Member select(String id) { // 특정 회원 조회 기능
		Member selectMember = memberMapper.getMemberById(id);
		return selectMember;
	}

	@Override
	public void delete(String id) { // 특정 회원 삭제 기능
		memberMapper.deleteMember(id);
		
	}

	
}

