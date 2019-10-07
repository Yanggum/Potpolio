package com.tia.main.service;

import java.sql.SQLException;
import java.util.List;

import com.tia.main.dao.MemberDAO;

public interface MemberService {
	public int insertMember(MemberDAO memInfo) throws SQLException;
	public int loginProc(MemberDAO memInfo) throws SQLException;	
}
