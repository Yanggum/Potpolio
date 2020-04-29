package com.tia.main.dao;

import java.sql.SQLException;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestServiceImpl implements TestDAO {

	@Autowired
	private SqlSession query;
	
	@Override
	public String selectNow() throws SQLException {
		// TODO Auto-generated method stub
		return query.selectOne("common.selectNow");
	}


	@Override
	public String selectWord() throws SQLException {
		// TODO Auto-generated method stub
		return query.selectOne("common.R_getRandWord");
	}


	@Override
	public void insertWord(HashMap<String, Object> hashMap) throws SQLException {
		// TODO Auto-generated method stub
		query.insert("common.C_addRandWord", hashMap);		
	}

}
