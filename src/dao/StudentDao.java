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
import domain.xuanti;

public class StudentDao {
	private QueryRunner qr = new TxQueryRunner();
	double zongfen;
	/**
	 * 添加学生
	 */
	public void add(Student s) {
		try {
			String sql = "insert into student values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params = {s.getSid(),s.getSname(),s.getSgender(),s.getSid(),s.getSdepart(),s.getStel(),s.getSyx(),"",s.getSid(),"","","","","","","","","",""};
			qr.update(sql, params);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 查找所有学生
	 */
	public PageBean<Student> findAll(String sid, String sname, String syx, int pc, int ps, String order, String sort) {
		try{
			PageBean<Student> pb = new PageBean<Student>();
			//设置pb的pc和ps
			pb.setPc(pc);
			pb.setPs(ps);
			String str=" ";//得到排序
			//1. 给出一个sql语句前半部
		StringBuilder cntSql = new StringBuilder("select count(*) from student");
		StringBuilder whereSql = new StringBuilder(" where 1=1");
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
		if(syx != null && !syx.trim().isEmpty()) {
			whereSql.append(" and syx like ?");
			params.add("%" + syx + "%");
		}
		if(order!=null)str=" ORDER BY "+ sort+" "+order+" ";
		//得到总记录数tr			
			Number num =  (Number)qr.query(cntSql.append(whereSql).toString(), new ScalarHandler(),params.toArray());
			int tr = num.intValue();
			pb.setTr(tr);
			//得到beanList
			StringBuilder sql = new StringBuilder("select * from student");
			StringBuilder limitSql=new StringBuilder(str+"limit ?,?");
			params.add((pc-1)*ps);
			params.add(ps);
			 List<Student>beanList=qr.query(sql.append(whereSql).append(limitSql).toString(), new BeanListHandler<Student>(Student.class),params.toArray());
			 pb.setBeanList(beanList);
				return pb;
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}	
	}
	/**
	 * 删除学生
	 * @return 
	 *
	 */
	public int del(String ids) {
		try {
			String sql = "delete from student where sid in("+ids+")";
			qr.update(sql);
			return ids.split(",").length;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}		
	}
	/**
	 * 修改学生
	 * @return 
	 *
	 */
	public void edit(Student s) {
		try {
			String sql = "update student set sid=?,sname=?,sgender=?,spass=?,sdepart=?,stel=? where sid=?";
			Object[] params = {s.getSid(),s.getSname(),s.getSgender(),s.getSid(),s.getSdepart(),s.getStel(),s.getId()};		
			qr.update(sql, params);

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}	
	}
	
	/**
	 * 查找学生
	 */
	public Student search(String sid) {
		try{
			String sql="select * from student where sid=?";
			return qr.query(sql, new BeanHandler<Student>(Student.class),sid);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public void update(String ids, String info) {
		try {
			String sql = "update student set info=? where sid in("+ids+")";
			Object[] params = {info};		
			qr.update(sql, params);

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	public void update2(Student s, String sid) {
		try {
			String sql = "update student set sgender=?,sdepart=?,stel=?,syx=?,qq=?,mz=?,birth=? where sid=?";
			Object[] params = {s.getSgender(),s.getSdepart(),s.getStel(),s.getSyx(),s.getQq(),s.getMz(),s.getBirth(),sid};		
			qr.update(sql, params);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//改密码
	public void update3(String sid, String xmm) {
		try {
			String sql = "update student set spass=? where sid=?";
			Object[] params = {xmm,sid};		
			qr.update(sql, params);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	public void update4(String sid, String fen, String py) {
		zongfen+=Double.parseDouble(fen)*0.25;
		try {
			String sql = "update student set fen1=?,py1=?,zf=? where sid=?";
			Object[] params = {fen,py,zongfen,sid};		
			qr.update(sql, params);

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	public void update5(String sid, String fen, String py) {
		zongfen+=Double.parseDouble(fen)*0.25;
		try {
			String sql = "update student set fen2=?,py2=?,zf=? where sid=?";
			Object[] params = {fen,py,zongfen,sid};		
			qr.update(sql, params);

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	public void update6(String sid, String fen, String py) {
		zongfen+=Double.parseDouble(fen)*0.5;
		try {
			String sql = "update student set fen3=?,py3=?,zf=? where sid=?";
			Object[] params = {fen,py,zongfen,sid};		
			qr.update(sql, params);

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
