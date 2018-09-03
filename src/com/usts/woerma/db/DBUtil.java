package com.usts.woerma.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
	private static String url = "jdbc:mysql://183.245.149.135:3306/sq_yyerm273110";
	private static String user = "sq_yyerm273110";
	private static String password = "123456";
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Connection getConnect() throws SQLException {
		return DriverManager.getConnection(url, user, password);
	}
}
