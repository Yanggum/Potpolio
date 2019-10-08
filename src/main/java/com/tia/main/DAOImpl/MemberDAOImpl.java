package com.tia.main.DAOImpl;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tia.main.dao.MemberDAO;
import com.tia.main.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSession session;
	

	@Override
	public int insertMember(MemberVO memInfo) throws SQLException {
		// TODO Auto-generated method stub
		
//		session.insert(statement, parameter)
		
		return 0;
	}

	@Override
	public int loginProc(MemberVO memInfo) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
