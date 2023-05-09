package com.wan.nss.biz.member;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public boolean insert(MemberVO vo) {
		// 비밀번호 암호화
		String encodedPw = bcryptPasswordEncoder.encode(vo.getUserPw());
		vo.setUserPw(encodedPw);
		return memberDAO.insert(vo);
	}

	@Override
	public boolean update(MemberVO vo) {
		// 비밀번호 암호화
		System.out.println("서비스 업데이트 ");
		
		if(vo.getUserPw() == null) {
			// 일반 업데이트
			return memberDAO.update(vo);
		}
		String encodedPw = bcryptPasswordEncoder.encode(vo.getUserPw());
		vo.setUserPw(encodedPw);
		return memberDAO.update(vo);
	}

	@Override
	public boolean delete(MemberVO vo) {
		return memberDAO.delete(vo);
	}

	@Override
	public MemberVO selectOne(MemberVO vo) {
		if (vo.getUserPw() != null) {
			// 로그인. 비밀번호 암호화
			MemberVO data = selectOnePw(vo);
			if(data == null) {
				// 아이디가 없으면
				return null;
			}
			String encodedPw = selectOnePw(vo).getUserPw();
			if(bcryptPasswordEncoder.matches(vo.getUserPw(), encodedPw)) {
				// 사용자가 입력한 비밀번호와 암호화된 비밀번호가 같다면
				// 비밀번호를 해당 비밀번호로 세팅
				vo.setUserPw(encodedPw);
			}
		}
		return memberDAO.selectOne(vo);
	}

	@Override
	public ArrayList<MemberVO> selectAll(MemberVO vo) {
		return memberDAO.selectAll(vo);
	}

	public MemberVO selectOnePw(MemberVO vo) {
		return memberDAO.selectOnePw(vo);
	}
}
