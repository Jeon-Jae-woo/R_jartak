package com.util;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.apache.ibatis.type.MappedTypes;



@MappedTypes(LocalDateTime.class)
@MappedJdbcTypes(JdbcType.DATE)
public class LocalDateTimeTypeHandler extends BaseTypeHandler<LocalDateTime> {

	@Override
	public void setNonNullParameter(PreparedStatement ps, int i, LocalDateTime parameter, JdbcType jdbcType)
			throws SQLException {
	}
	
	//LocalDateTime으로 변환하고 반환
	@Override
	public LocalDateTime getNullableResult(ResultSet rs, String columnName) throws SQLException {
		Timestamp sqlTimestamp = rs.getTimestamp(columnName);
		Date date = new Date(sqlTimestamp.getTime());
		
		LocalDateTime local = LocalDateTime.ofInstant(date.toInstant() ,ZoneId.systemDefault());
        return local;
	}

	@Override
	public LocalDateTime getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        return null;
	}

	@Override
	public LocalDateTime getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        return null;
	}
	
}
