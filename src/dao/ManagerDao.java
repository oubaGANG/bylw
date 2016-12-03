package dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.jdbc.TxQueryRunner;
import domain.Manager;
import domain.Pyls;

public class ManagerDao {
	private QueryRunner qr = new TxQueryRunner();
	public Manager search(String id) {
		try{
			String sql="select * from manager where mid=?";
			return qr.query(sql, new BeanHandler<Manager>(Manager.class),id);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public void updateDate(String date) {
		try {
			String sql = "update manager set date=?";
			Object[] params = {date};		
			qr.update(sql, params);

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	public String findDate() {
		try{
			String sql="select date from manager limit 0,1";
			return (String) qr.query(sql,new ScalarHandler());
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
