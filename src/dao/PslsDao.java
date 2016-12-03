package dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import cn.itcast.jdbc.TxQueryRunner;
import domain.Psls;
import domain.Pyls;

public class PslsDao {
	private QueryRunner qr = new TxQueryRunner();
	public Psls search(String id) {
		try{
			String sql="select * from psls where psid=?";
			return qr.query(sql, new BeanHandler<Psls>(Psls.class),id);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
