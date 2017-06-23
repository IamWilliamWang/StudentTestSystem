package com.testsystem.action.admin;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;
import com.testsystem.table.UserTable;
import com.testsystem.util.MysqlDBConnectionUtil;
import com.testsystem.util.SqlExecuter;

/**
 * Created by william on 2017/5/27.
 */
public class AdministratorLoginAction extends ActionSupport {

	private UserTable user;

	public String execute() {

		MysqlDBConnectionUtil myDB = new MysqlDBConnectionUtil();
		SqlExecuter executer = new SqlExecuter(myDB.getConnection());
		return executer.hasThisAdminAccount(user) ? SUCCESS : ERROR;
	}

	// structs {get; set; }
	public UserTable getUser() {
		return user;
	}

	public void setUser(UserTable user) {
		this.user = user;
	}
}
