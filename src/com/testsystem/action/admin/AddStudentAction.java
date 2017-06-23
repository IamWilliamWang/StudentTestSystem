package com.testsystem.action.admin;

import com.opensymphony.xwork2.ActionSupport;
import com.testsystem.table.UserTable;
import com.testsystem.util.MysqlDBConnectionUtil;
import com.testsystem.util.SqlExecuter;

public class AddStudentAction extends ActionSupport {

	private UserTable user;

	public String execute() throws Exception {

		MysqlDBConnectionUtil sqlConnection = new MysqlDBConnectionUtil();
		SqlExecuter executer = new SqlExecuter(sqlConnection.getConnection());

		return executer.addStudent(user) ? SUCCESS : ERROR;
	}

	public UserTable getUser() {
		return user;
	}

	public void setUser(UserTable user) {
		this.user = user;
	}

}
