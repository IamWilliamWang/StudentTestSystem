package com.testsystem.action.admin;

import com.opensymphony.xwork2.ActionSupport;
import com.testsystem.table.ExerciseTable;
import com.testsystem.util.MysqlDBConnectionUtil;
import com.testsystem.util.SqlExecuter;

public class RemoveChoiceExerciseAction extends ActionSupport {

	private ExerciseTable exercise;

	public String execute() {

		MysqlDBConnectionUtil myDB = new MysqlDBConnectionUtil();
		SqlExecuter executer = new SqlExecuter(myDB.getConnection());

		return executer.removeExercise(exercise.getId()) ? SUCCESS : ERROR;
	}

	public ExerciseTable getExercise() {
		return exercise;
	}

	public void setExercise(ExerciseTable exercise) {
		this.exercise = exercise;
	}

}
