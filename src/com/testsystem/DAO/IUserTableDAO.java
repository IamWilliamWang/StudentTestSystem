package com.testsystem.DAO;

import com.testsystem.table.UserTable;

public interface IUserTableDAO {
	public UserTable validateUser(String username,String password,String tableName);
}
