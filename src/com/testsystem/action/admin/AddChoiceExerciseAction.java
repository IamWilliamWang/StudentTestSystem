package com.testsystem.action.admin;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;
import com.testsystem.table.ExerciseTable;
import com.testsystem.util.MysqlDBConnectionUtil;
import com.testsystem.util.SqlExecuter;

public class AddChoiceExerciseAction extends ActionSupport {

	private ExerciseTable exercise;
	
	public String execute() {

		MysqlDBConnectionUtil myDB = new MysqlDBConnectionUtil();
		SqlExecuter executer = new SqlExecuter(myDB.getConnection());
		
		return executer.addExercise(exercise) ? SUCCESS : ERROR;
	}
	
	// structs {get; set; }
	public ExerciseTable getExercise() {
		return exercise;
	}

	public void setExercise(ExerciseTable exercise) {
		this.exercise = exercise;
	}

}
