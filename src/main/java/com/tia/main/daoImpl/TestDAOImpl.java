package com.tia.main.daoImpl;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tia.main.dao.TestDAO;

@Repository
public class TestDAOImpl implements TestDAO {

	@Autowired
	private SqlSession query;
	
	@Override
	public String selectNow() throws SQLException {
		// TODO Auto-generated method stub
		return query.selectOne("query.selectNow");
	}

}
