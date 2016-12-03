package dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.itcast.jdbc.TxQueryRunner;
import domain.Pyls;
import domain.Teacher;

public class PylsDao {
	private QueryRunner qr = new TxQueryRunner();
	public Pyls search(String id) {
		try{
			String sql="select * from pyls where pyid=?";
			return qr.query(sql, new BeanHandler<Pyls>(Pyls.class),id);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
