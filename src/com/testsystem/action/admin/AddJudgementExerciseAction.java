package com.testsystem.action.admin;

import com.testsystem.table.ExerciseTable;
import com.testsystem.util.MysqlDBConnectionUtil;
import com.testsystem.util.SqlExecuter;

public class AddJudgementExerciseAction extends AddChoiceExerciseAction {

	private ExerciseTable exercise;

	public String execute() {

		MysqlDBConnectionUtil myDB = new MysqlDBConnectionUtil();
		SqlExecuter executer = new SqlExecuter(myDB.getConnection());
		exercise.setIs_single_choice_question(false);
		exercise.setIs_choice_question(false);

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
