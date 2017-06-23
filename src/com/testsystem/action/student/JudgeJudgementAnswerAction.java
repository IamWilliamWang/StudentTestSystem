package com.testsystem.action.student;

import com.opensymphony.xwork2.ActionSupport;
import com.testsystem.storage.JudgeResult;
import com.testsystem.table.SubmitAnswerTable;
import com.testsystem.util.ExerciseType;
import com.testsystem.util.MysqlDBConnectionUtil;
import com.testsystem.util.SqlExecuter;

public class JudgeJudgementAnswerAction extends ActionSupport {
	
	private SubmitAnswerTable submitAnswer;

	public String execute() {
		MysqlDBConnectionUtil sqlConnection = MysqlDBConnectionUtil.getInstance();
		SqlExecuter executer = new SqlExecuter(sqlConnection.getConnection());

		return executer.executeJudge(submitAnswer, JudgeResult.caught_judgement_exercises,
				ExerciseType.JUDGEMENT_QUESTION) ? SUCCESS : ERROR;
	}

	public SubmitAnswerTable getSubmitAnswer() {
		return submitAnswer;
	}

	public void setSubmitAnswer(SubmitAnswerTable submitAnswer) {
		this.submitAnswer = submitAnswer;
	}
}
