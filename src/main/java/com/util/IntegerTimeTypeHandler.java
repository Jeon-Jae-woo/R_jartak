package com.util;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

public class IntegerTimeTypeHandler extends BaseTypeHandler<Integer> {

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, Integer parameter, JdbcType jdbcType)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	//2,147,483,647초를 넘지 않아 형변환 문제 X
	//초로 변환하고 리턴
	@Override
	public Integer getNullableResult(ResultSet rs, String columnName) throws SQLException {
		Timestamp sqlTimestamp = rs.getTimestamp(columnName);
		Date date = new Date(sqlTimestamp.getTime());
		
		LocalDateTime local = LocalDateTime.ofInstant(date.toInstant() ,ZoneId.systemDefault());
		LocalDateTime currentDateTime = LocalDateTime.now();
		
		long sec = ChronoUnit.SECONDS.between(currentDateTime, local);
		
		System.out.println("sec : " + sec);
		
		return (int)(long)sec;
	}

	@Override
	public Integer getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
