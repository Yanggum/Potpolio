package com.tia.main.dao;

import java.sql.SQLException;
import java.util.List;

import com.tia.main.vo.MemberVO;

public interface MemberDAO {
	public int insertMember(MemberVO memInfo) throws SQLException;
	public int loginProc(MemberVO memInfo) throws SQLException;	
}
