package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.jdbc.TxQueryRunner;
import domain.PageBean;
import domain.Student;
import domain.Teacher;

public class TeacherDao {
	private QueryRunner qr = new TxQueryRunner();
	/**
	 * 
	 * 查找老师
	 */
	public Teacher search(String tid) {
		try{
			String sql="select * from teacher where tid=?";
			return qr.query(sql, new BeanHandler<Teacher>(Teacher.class),tid);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 添加老师
	 */
	public void add(Teacher  s) {
		try {
			String sql = "insert into teacher values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params = {s.getTid(),s.getTname(),s.getTgender(),s.getTid(),s.getTdepart(),s.getTel(),s.getYx(),s.getTid(),"","","","",""};
			qr.update(sql, params);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 查找所有老师
	 */
	public PageBean<Teacher> findAll(String tid, String tname, int pc, int ps, String order, String sort) {
		try{
			PageBean<Teacher> pb = new PageBean<Teacher>();
			//设置pb的pc和ps
			pb.setPc(pc);
			pb.setPs(ps);
			String str=" ";//得到排序
			//1. 给出一个sql语句前半部
		StringBuilder cntSql = new StringBuilder("select count(*) from teacher");
		StringBuilder whereSql = new StringBuilder(" where 1=1");
		//创建一个ArrayList，用来装载参数值
		List<Object> params = new ArrayList<Object>();
		if(tid != null && !tid.trim().isEmpty()) {
			whereSql.append(" and tid like ?");
			params.add("%" +tid+ "%");
		}
		if(tname != null && !tname.trim().isEmpty()) {
			whereSql.append(" and tname like ?");
			params.add("%" +tname+ "%");
		}
		if(order!=null)str=" ORDER BY "+ sort+" "+order+" ";
		//得到总记录数tr			
			Number num =  (Number)qr.query(cntSql.append(whereSql).toString(), new ScalarHandler(),params.toArray());
			int tr = num.intValue();
			pb.setTr(tr);
			//得到beanList
			StringBuilder sql = new StringBuilder("select * from teacher");
			StringBuilder limitSql=new StringBuilder(str+"limit ?,?");
			params.add((pc-1)*ps);
			params.add(ps);
			 List<Teacher>beanList=qr.query(sql.append(whereSql).append(limitSql).toString(), new BeanListHandler<Teacher>(Teacher.class),params.toArray());
			 pb.setBeanList(beanList);
				return pb;
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}	
	}
	/**
	 * 删除老师
	 * @return 
	 *
	 */
	public int del(String ids) {
		try {
			String sql = "delete from teacher where tid in("+ids+")";
			qr.update(sql);
			return ids.split(",").length;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}		
	}
	/**
	 * 修改老师
	 * @return 
	 *
	 */
	public void edit(Teacher s) {
		try {
			String sql = "update teacher set tid=?,tname=?,tgender=?,tpass=?,tdepart=?,tel=? where tid=?";
			Object[] params = {s.getTid(),s.getTname(),s.getTgender(),s.getTid(),s.getTdepart(),s.getTel(),s.getId()};		
			qr.update(sql, params);

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}	
	}
	//改密码
	public void update2(String tid, String xmm) {
		try {
			String sql = "update teacher set tpass=? where tid=?";
			Object[] params = {xmm,tid};		
			qr.update(sql, params);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	//按名字查找老师
	public Teacher searchByName(String tname) {
		try{
			String sql="select * from teacher where tname=?";
			return qr.query(sql, new BeanHandler<Teacher>(Teacher.class),tname);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
