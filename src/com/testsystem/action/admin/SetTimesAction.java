package com.testsystem.action.admin;

import com.opensymphony.xwork2.ActionSupport;
import com.testsystem.table.SettingTable;
import com.testsystem.util.MysqlDBConnectionUtil;
import com.testsystem.util.SqlExecuter;

public class SetTimesAction extends ActionSupport {

	private SettingTable settings;

	public String execute() {

		MysqlDBConnectionUtil myDB = new MysqlDBConnectionUtil();
		SqlExecuter executer = new SqlExecuter(myDB.getConnection());
		if (executer.setStarttimeAndTesttime(settings))
			return SUCCESS;
		else
			return ERROR;

	}

	public SettingTable getSettings() {
		return settings;
	}

	public void setSettings(SettingTable settings) {
		this.settings = settings;
	}

}
