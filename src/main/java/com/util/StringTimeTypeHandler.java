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
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;

@MappedTypes(String.class)
@MappedJdbcTypes(JdbcType.DATE)
public class StringTimeTypeHandler extends BaseTypeHandler<String> {

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, String parameter, JdbcType jdbcType)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	//남은 시간 계산, 일,시,분 으로 리턴
	@Override
	public String getNullableResult(ResultSet rs, String columnName) throws SQLException {
		System.out.println("String 핸들러");
		Timestamp sqlTimestamp = rs.getTimestamp(columnName);
		Date date = new Date(sqlTimestamp.getTime());
		
		LocalDateTime local = LocalDateTime.ofInstant(date.toInstant() ,ZoneId.systemDefault());
		LocalDateTime currentDateTime = LocalDateTime.now();
		
		long sec = ChronoUnit.SECONDS.between(currentDateTime, local);
		
		long day = sec/(60*60*24);
		long hour = (sec - day * 60 * 60 * 24) / (60 * 60);
		long minute = (sec - day * 60 * 60 * 24 - hour * 3600) / 60;
		
		String remainingTime = "";
		
		if(day==0) {
			if(hour==0) {
				remainingTime = minute + "분";
			}else {
				remainingTime = hour + "시간 " + minute + "분";
			}
		}else {
			remainingTime = day + "일 " + hour + "시간 " + minute + "분";
		}
		return remainingTime;
	}

	@Override
	public String getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
