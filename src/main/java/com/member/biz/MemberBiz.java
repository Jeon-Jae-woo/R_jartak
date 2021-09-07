package com.member.biz;

import com.member.dto.MemberDto;
import com.member.dto.MemberRankDto;


public interface MemberBiz {
	 public MemberDto login(MemberDto reqMember);

	 public MemberDto selectOne(String email);
	 

	 public int insert(MemberDto dto);

	 public int updateInfo(MemberDto dto);
	 
	 public MemberRankDto rank(int rank_no);
	 
	 public int deleteInfo(String email);
<<<<<<< HEAD

=======
 
>>>>>>> d5a96583d3c5190101c177487d6d66adbfd1fc69
}
