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
	public void join(Member member) { // ȸ������ ���
		memberMapper.insertMember(member);
	}


	@Override
	public boolean idChk(Member member) { // �ߺ� id üũ ���
		boolean DupIdChk = memberMapper.getMemberById(member.getId())!=null;
			System.out.println("�ߺ� ID");
		return DupIdChk;
	}

	@Override
	public void update(Member member) { // ȸ������ ���� ���
		memberMapper.updateMember(member);
		
	}


	@Override
	public List<Member> selectAllMember() { // ��ü ȸ����ȸ ���
		List<Member>memberList = memberMapper.selectAllMember();
		return memberList;
	}


	@Override
	public Member select(String id) { // Ư�� ȸ�� ��ȸ ���
		Member selectMember = memberMapper.getMemberById(id);
		return selectMember;
	}

	@Override
	public void delete(String id) { // Ư�� ȸ�� ���� ���
		memberMapper.deleteMember(id);
		
	}

	
}

