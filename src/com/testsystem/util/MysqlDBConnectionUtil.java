package com.testsystem.util;

import java.sql.*;

public class MysqlDBConnectionUtil {

	private Statement statement; // SQL执行器
	private Connection connection; // SQL连接

	private static MysqlDBConnectionUtil mysqlDBConnection = new MysqlDBConnectionUtil();
	/**
	 * Use MysqlDBConnectionUtil.getInstance() instead.
	 */
	@Deprecated
	public MysqlDBConnectionUtil() {
		try {
			Class.forName("com.mysql.jdbc.Driver");// 加载注册JDBC驱动
			connection = DriverManager.getConnection(
					"jdbc:mysql://127.0.0.1:3306/testsystemdb?user=root&password=524685&useUnicode=true&characterEncoding=UTF8");// jdbc:mysql://主机名称：连接端口/数据库的名称?参数=值
			statement = connection.createStatement();

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ResultSet executeQuery(String sql) throws SQLException {
		ResultSet resultSet = null;
		resultSet = statement.executeQuery(sql);
		return resultSet;
	}

	public int executeUpdate(String sql) throws SQLException {
		int updateElementCount = statement.executeUpdate(sql);
		return updateElementCount;
	}

	public boolean executeUpdate(PreparedStatement preparedStatement) {
		try {
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}

	public void closeStatement() {
		try {
			statement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void closeConnection() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		return connection;
	}
	
	public static MysqlDBConnectionUtil getInstance() {
		return mysqlDBConnection;
	}
}
