package com.member.biz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.member.dao.AdminMemberDao;
import com.member.dto.MemberDto;
import com.util.pagingDto;

@Service
@Transactional
public class AdminMemberBizImpl implements AdminMemberBiz {

	@Autowired
	private AdminMemberDao admindao;
	
	@Autowired
	private pagingDto paging;
	
	//회원 목록
	@Override
	public List<MemberDto> memberList(int pageNum) {
		List<MemberDto> userlist = new ArrayList<MemberDto>();
		userlist = admindao.memberList(pageNum);
		return userlist;
	}
	//회원 목록 페이징
	@Override
	public pagingDto memberListPaging(int pageNum) {
		paging.setPageNum(pageNum);
		int size = 0;
		size = admindao.memberListCount();
		paging.setTotalCount(size);
		paging.pagination();
		return paging;
	}

}
