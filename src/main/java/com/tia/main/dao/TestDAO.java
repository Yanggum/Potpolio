package com.tia.main.dao;

import java.sql.SQLException;
import java.util.HashMap;

public interface TestDAO {
	public String selectNow() throws SQLException;
	public void insertWord(HashMap<String, Object> hashMap) throws SQLException;
	public String selectWord() throws SQLException;
}
