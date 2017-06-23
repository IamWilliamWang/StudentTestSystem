package com.testsystem.storage;

import java.util.List;

import com.testsystem.table.ExerciseTable;
import com.testsystem.util.ExerciseType;

/**
 * 用于传值，从jsp来，到SqlExecuter去
 * 
 * @author william
 *
 */
public class JudgeResult {
	public static List<ExerciseTable> caught_simple_choice_exercises = null;
	public static List<ExerciseTable> caught_multi_choice_exercises = null;
	public static List<ExerciseTable> caught_judgement_exercises = null;
	// public static ExerciseType judgeType = null;
	public static int exerciseCount = 0;
	public static int score = 0;
}
