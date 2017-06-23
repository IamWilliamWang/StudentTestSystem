package com.testsystem.action.student;

import java.sql.ResultSet;

import com.opensymphony.xwork2.ActionSupport;
import com.testsystem.storage.JudgeResult;
import com.testsystem.table.UserTable;
import com.testsystem.util.MysqlDBConnectionUtil;
import com.testsystem.util.SqlExecuter;

/**
 * Created by william on 2017/5/22.
 */
public class StudentLoginAction extends ActionSupport {

	private UserTable user;
	private SqlExecuter executer = new SqlExecuter(MysqlDBConnectionUtil.getInstance().getConnection());

	public String execute() throws Exception {
		if (executer.hasThisStudentAccount(user)) {
			if (!executer.testHasBegun())
				return "login_rejection";
			
			clearScores();
			return SUCCESS;
		} else
			return ERROR;
	}

	private void clearScores() {
		JudgeResult.score = 0;
		JudgeResult.exerciseCount = 0;
	}
	
	// structs {get; set; }
	public UserTable getUser() {
		return user;
	}

	public void setUser(UserTable user) {
		this.user = user;
	}
}
