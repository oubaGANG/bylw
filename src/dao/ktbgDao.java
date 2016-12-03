package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.jdbc.TxQueryRunner;
import domain.PageBean;
import domain.Student;
import domain.ktbg;
import domain.xuanti;

public class ktbgDao {
	private QueryRunner qr = new TxQueryRunner();
	/**
	 * 添加开题报告
	 * @param name 
	 * @param sdepart 
	 * @throws SQLException 
	 */
	public void add(String name, String sid, String sname,String sdepart, String stel,String tname) throws SQLException{
		
			String sql = "insert into ktbg values(?,?,?,?,?,?,?,?,?)";
			Object[] params ={name,sid,sname,sdepart,stel,name,"no","no",tname};	
			
					qr.update(sql, params);	
		
	}
	public PageBean<ktbg> findAll(String sid, String sname, String lwname,
			 int pc, int ps, String order, String sort, String tname) {
		try{
			String msg="tg='no' and btg='no' and tname='"+tname+"'";
			PageBean<ktbg> pb = new PageBean<ktbg>();
			//设置pb的pc和ps
			pb.setPc(pc);
			pb.setPs(ps);
			String str=" ";//得到排序
			//1. 给出一个sql语句前半部
		StringBuilder cntSql = new StringBuilder("select count(*) from ktbg");
		StringBuilder whereSql = new StringBuilder(" where 1=1");
		whereSql.append(" and "+msg+"");
		//创建一个ArrayList，用来装载参数值
		List<Object> params = new ArrayList<Object>();
		if(sid != null && !sid.trim().isEmpty()) {
			whereSql.append(" and sid like ?");
			params.add("%" +sid+ "%");
		}
		if(sname != null && !sname.trim().isEmpty()) {
			whereSql.append(" and sname like ?");
			params.add("%" +sname+ "%");
		}
		if(lwname != null && !lwname.trim().isEmpty()) {
			whereSql.append(" and lwname like ?");
			params.add("%" + lwname + "%");
		}
		if(order!=null)str=" ORDER BY "+ sort+" "+order+" ";
		//得到总记录数tr			
			Number num =  (Number)qr.query(cntSql.append(whereSql).toString(), new ScalarHandler(),params.toArray());
			int tr = num.intValue();
			pb.setTr(tr);
			//得到beanList
			StringBuilder sql = new StringBuilder("select * from ktbg");
			StringBuilder limitSql=new StringBuilder(str+"limit ?,?");
			params.add((pc-1)*ps);
			params.add(ps);
			 List<ktbg>beanList=qr.query(sql.append(whereSql).append(limitSql).toString(), new BeanListHandler<ktbg>(ktbg.class),params.toArray());
			 pb.setBeanList(beanList);
				return pb;
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}	
	}
	public void update(String sid) {
		try {
			String sql = "update ktbg set tg=? where sid=?";
			Object[] params = {"yes",sid};		
			qr.update(sql, params);

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}	
		
	}
	public PageBean<ktbg> find() {
		try {
			PageBean<ktbg> pb = new PageBean<ktbg>();
			String sql ="select count(*) from ktbg";
			Number num = (Number)qr.query(sql, new ScalarHandler());
			int tr = num.intValue();
			pb.setTr(tr);
			 sql = "select * from ktbg";
			 List<ktbg>beanList= qr.query(sql, new BeanListHandler<ktbg>(ktbg.class));
			 pb.setBeanList(beanList);
				return pb;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public void delete(String sid) {
		try {
			String sql = "delete from ktbg where sid=?";
			Object[] params = {sid};
			qr.update(sql, params);
			
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}	
		
	}
	public void update1(String sid, String tname) {
		
		try {
			String sql = "update ktbg set tname=? where sid=?";
			Object[] params = {tname,sid};		
			qr.update(sql, params);

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}	
	}	
}
