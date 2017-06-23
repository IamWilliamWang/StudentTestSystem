package com.testsystem.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javassist.bytecode.Descriptor.Iterator;

import javax.transaction.Transaction;

import org.hibernate.Query;
import org.hibernate.Session;

import com.testsystem.storage.JudgeResult;
import com.testsystem.table.ExerciseTable;
import com.testsystem.table.SettingTable;
import com.testsystem.table.SubmitAnswerTable;
import com.testsystem.table.UserTable;

public class SqlExecuter {
	
	private Connection connection;

	public SqlExecuter(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean hasThisStudentAccount(UserTable user) {
		PreparedStatement ps = null;
		String mysql = "select count(*) from student_account where username=? and password=?";
		Query query = HibernateSessionFactory.getSession().createSQLQuery(mysql);
		query.setParameter(0, user.getUsername());
		query.setParameter(1, user.getPassword());
		java.util.List users = query.list();
		java.util.Iterator it = users.iterator();
		while(it.hasNext())
		{
			if(Integer.parseInt(it.next().toString()) == 1)
				return true;
		}
		return false;
		
		
//		String sql = "select count(*) from testsystemdb.student_account where username = ? and password = ?";
//		try {
//			ps = connection.prepareStatement(sql);
//			ps.setString(1, user.getUsername());
//			ps.setString(2, user.getPassword());
//
//			ResultSet queryResult = ps.executeQuery();
//			while (queryResult.next()) {
//				if (queryResult.getInt(1) == 1)
//					return true;
//			}
//			return false;
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return false;
//		}
	}

	public boolean hasThisAdminAccount(UserTable user) {
		PreparedStatement ps = null;
		String mysql = "select count(*) from admin_account where username=? and password=?";
		Query query = HibernateSessionFactory.getSession().createSQLQuery(mysql);
		query.setParameter(0, user.getUsername());
		query.setParameter(1, user.getPassword());
		java.util.List users = query.list();
		java.util.Iterator it = users.iterator();
		while(it.hasNext())
		{
			if(Integer.parseInt(it.next().toString()) == 1)
				return true;
		}
		return false;
		
		
//		try {
//			ps = connection.prepareStatement(sql);
//			ps.setString(1, user.getUsername());
//			ps.setString(2, user.getPassword());
//
//			ResultSet queryResult = ps.executeQuery();
//			while (queryResult.next()) {
//				if (queryResult.getInt(1) == 1)
//					return true;
//			}
//			return false;
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return false;
//		}

	}

	public boolean addExercise(ExerciseTable exercise) {
		PreparedStatement ps = null;
		String sql = "insert into "
				+ "testsystemdb.exercise(question,option_A,option_B,option_C,option_D,answer,is_choice_question,is_single_choice_question) "
				+ "values (?,?,?,?,?,?,?,?)";

		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, exercise.getQuestion());
			ps.setString(2, exercise.getOptionA());
			ps.setString(3, exercise.getOptionB());
			ps.setString(4, exercise.getOptionC());
			ps.setString(5, exercise.getOptionD());
			ps.setString(6, exercise.getAnswer());
			ps.setBoolean(7, exercise.is_choice_question());
			ps.setBoolean(8, exercise.is_single_choice_question());
			System.out.println(ps);
			if (ps.executeUpdate() == 1)
				return true;
			else
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean removeExercise(int exerciseId) {
		PreparedStatement ps = null;
		String sql = "delete from " + "testsystemdb.exercise " + "where question_id = ?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, exerciseId);
			System.out.println(ps);
			if (ps.executeUpdate() == 0)
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public ArrayList<ExerciseTable> getAllExercises() {
		ArrayList<ExerciseTable> allExercises = new ArrayList<>();

		PreparedStatement preparedStatement = null;
		String sql = "select question_id,question,option_A,option_B,option_C,option_D,answer,is_choice_question,is_single_choice_question from testsystemdb.exercise";
		try {
			preparedStatement = connection.prepareStatement(sql);

			ResultSet result = preparedStatement.executeQuery();
			while (result.next()) {
				ExerciseTable exerciseTable = new ExerciseTable();
				exerciseTable.setId(result.getInt(1));
				exerciseTable.setQuestion(result.getString(2));
				exerciseTable.setOptionA(result.getString(3));
				exerciseTable.setOptionB(result.getString(4));
				exerciseTable.setOptionC(result.getString(5));
				exerciseTable.setOptionD(result.getString(6));
				exerciseTable.setAnswer(result.getString(7));
				exerciseTable.setIs_choice_question(result.getBoolean(8));
				exerciseTable.setIs_single_choice_question(result.getBoolean(9));

				allExercises.add(exerciseTable);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return allExercises;
	}

	public ArrayList<UserTable> getAllUsers() {
		ArrayList<UserTable> users = new ArrayList<>();

		PreparedStatement preparedStatement = null;
		String sql = "select * from testsystemdb.student_account";
		try {
			preparedStatement = connection.prepareStatement(sql);

			ResultSet result = preparedStatement.executeQuery();
			while (result.next()) {
				UserTable user = new UserTable();
				user.setUsername(result.getString(1));
				user.setPassword(result.getString(2));

				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return users;
	}

	public ArrayList<ExerciseTable> getFewExercises(ExerciseType exerciseType, int exerciseCount) {
		ArrayList<ExerciseTable> allExercises = this.getAllExercises();
		ArrayList<ExerciseTable> caughtExercises = new ArrayList<>();

		Set<Integer> indexSet = new HashSet<Integer>();
		
		if (allExercises.isEmpty())
			System.err.println("没有添加试题错误！");

		while (caughtExercises.size() < exerciseCount) {
			int selectedIndex = (int) (Math.random() * allExercises.size());
			if(indexSet.contains(selectedIndex))
				continue;
			indexSet.add(selectedIndex);
			ExerciseTable caughtExercise = allExercises.get(selectedIndex);
			switch (exerciseType) {
			case SIMPLE_CHOICE_QUESTION:
				if (caughtExercise.is_choice_question() && caughtExercise.is_single_choice_question())
					caughtExercises.add(caughtExercise);
				JudgeResult.caught_simple_choice_exercises = caughtExercises;
				break;
			case MULTI_CHOICE_QUESTION:
				if (caughtExercise.is_choice_question() && !caughtExercise.is_single_choice_question())
					caughtExercises.add(caughtExercise);
				JudgeResult.caught_multi_choice_exercises = caughtExercises;
				break;
			case JUDGEMENT_QUESTION:
				if (!caughtExercise.is_choice_question())
					caughtExercises.add(caughtExercise);
				JudgeResult.caught_judgement_exercises = caughtExercises;
				break;
			}
		}

		return caughtExercises;
	}

	public boolean addStudent(UserTable user) {
		PreparedStatement ps = null;
		String sql = "insert into " + "testsystemdb.student_account(username,password) " + "values (?,?)";

		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			if (ps.executeUpdate() == 1)
				return true;
			else
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean removeStudent(UserTable user) {
		PreparedStatement ps = null;
		String sql = "delete from " + "testsystemdb.student_account " + "where username = ?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setString(1, user.getUsername());

			if (ps.executeUpdate() == 0)
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean setStarttimeAndTesttime(SettingTable settings) {

		PreparedStatement ps = null;
		String sql = "truncate table " + "testsystemdb.settings";
		try {
			ps = connection.prepareStatement(sql);
			ps.executeUpdate();

			sql = "insert into testsystemdb.settings(start_time,test_time) values(?,?)";
			ps = connection.prepareStatement(sql);
			ps.setString(1, settings.getStartTime());
			ps.setString(2, settings.getTestTime());

			if (ps.executeUpdate() == 0)
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	@SuppressWarnings("finally")
	public boolean executeJudge(SubmitAnswerTable submitAnswer, List<ExerciseTable> caughtExercises,
			ExerciseType judgeType) {
		int score = 0;

		String[] answers = null;

		if (JudgeResult.caught_judgement_exercises == null) {
			JudgeResult.caught_judgement_exercises = new ArrayList<>();
			JudgeResult.exerciseCount = 0;
			JudgeResult.score = 0;
		}

		if (judgeType != ExerciseType.JUDGEMENT_QUESTION)
			answers = submitAnswer.getAnswer().trim().toUpperCase().split(" ");
		else {
			answers = new String[JudgeResult.caught_judgement_exercises.size()];
			for (int i = 0; i < answers.length; i++)
				answers[i] = "F";

			if (submitAnswer != null)
				for (Object question_index : submitAnswer.getAnswers()) {
					try {
						answers[Integer.parseInt(question_index.toString())] = "T";
					} catch (IndexOutOfBoundsException e) {
						// 出现了位置的错误，丢失了抽取的题目
					}
				}
		}
		try {
			for (int i = 0; i < answers.length; i++) {
				if (caughtExercises.get(i) != null && answers[i].equals(caughtExercises.get(i).getAnswer()))
					score++;

			}
		} catch (IndexOutOfBoundsException e) {
			e.printStackTrace();
		} finally {
			JudgeResult.exerciseCount += caughtExercises.size();
			JudgeResult.score += score;
			return true;
		}
	}

	public static Date toDateTime(String dateTime_str) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			java.util.Date date_time = simpleDateFormat.parse(dateTime_str);
			return date_time;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public boolean testHasBegun() {
		String sql = "select start_time from testsystemdb.settings";
		String start_time_str = "";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				start_time_str = resultSet.getString(1).replace('T', ' ').replace("+08:00", "");
			}

			if (Calendar.getInstance().getTime().before(toDateTime(start_time_str)))
				return false;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
}
