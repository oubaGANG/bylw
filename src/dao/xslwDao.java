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
import domain.xslw;

public class xslwDao {
	private QueryRunner qr = new TxQueryRunner();
	double zongfen;
	public void add(String name, String sid, String sname,String sdepart, String stel, String tname) throws SQLException {
		String sql = "insert into xslw values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		Object[] params ={name,sid,sname,sdepart,stel,name,"no","no","","","","","","","",sid,"",tname,""};
				
					qr.update(sql, params);
			
		
	}
	public PageBean<xslw> findAll(String sid, String sname, String lwname,
			int pc, int ps, String order, String sort, String cz, String tname, String pyname) {
		try{
			String msg="tg='"+cz+"'";
			PageBean<xslw> pb = new PageBean<xslw>();
			//设置pb的pc和ps
			pb.setPc(pc);
			pb.setPs(ps);
			String str=" ";//得到排序
			//1. 给出一个sql语句前半部
		StringBuilder cntSql = new StringBuilder("select count(*) from xslw");
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
		if(tname != null && !tname.trim().isEmpty()) {
			whereSql.append(" and tname like ?");
			params.add("%" +tname+ "%");
		}
		if(lwname != null && !lwname.trim().isEmpty()) {
			whereSql.append(" and lwname like ?");
			params.add("%" + lwname + "%");
		}if(pyname != null && !pyname.trim().isEmpty()) {
			whereSql.append(" and pyname like ?");
			params.add("%" + pyname + "%");
		}
		if(order!=null)str=" ORDER BY "+ sort+" "+order+" ";
		//得到总记录数tr			
			Number num =  (Number)qr.query(cntSql.append(whereSql).toString(), new ScalarHandler(),params.toArray());
			int tr = num.intValue();
			pb.setTr(tr);
			//得到beanList
			StringBuilder sql = new StringBuilder("select * from xslw");
			StringBuilder limitSql=new StringBuilder(str+"limit ?,?");
			params.add((pc-1)*ps);
			params.add(ps);
			 List<xslw>beanList=qr.query(sql.append(whereSql).append(limitSql).toString(), new BeanListHandler<xslw>(xslw.class),params.toArray());		
			 pb.setBeanList(beanList);
				return pb;
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}	
	}
	public PageBean<xslw> find() {
		try {
			PageBean<xslw> pb = new PageBean<xslw>();
			String sql ="select count(*) from xslw";
			Number num = (Number)qr.query(sql, new ScalarHandler());
			int tr = num.intValue();
			pb.setTr(tr);
			 sql = "select * from xslw";
			 List<xslw>beanList= qr.query(sql, new BeanListHandler<xslw>(xslw.class));
			 pb.setBeanList(beanList);
				return pb;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public void delete(String sid) {
		try {
			String sql = "delete from xslw where sid=?";
			Object[] params = {sid};
			qr.update(sql, params);
			
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}	
		
		
	}
	public void update(String sid, String fen, String py) {
		zongfen+=Double.parseDouble(fen)*0.25;
		System.out.println(zongfen);
		try {
			String sql = "update xslw set fen1=?,py1=?,tg=? ,zf=? where sid=?";
			Object[] params = {fen,py,"yes",zongfen,sid};		
			qr.update(sql, params);

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}	
		
	}
	public void update2(String sid, String fen, String py) {
		zongfen+=Double.parseDouble(fen)*0.25;
		System.out.println(zongfen);
		try {
			String sql = "update xslw set fen2=?,py2=?,zf=? where sid=?";
			Object[] params = {fen,py,zongfen,sid};		
			qr.update(sql, params);

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	public void update3(String sid, String fen, String py) {
		zongfen+=Double.parseDouble(fen)*0.5;
		System.out.println(zongfen);
		try {
			String sql = "update xslw set fen3=?,py3=?,zf=? where sid=?";
			Object[] params = {fen,py,zongfen,sid};		
			qr.update(sql, params);

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	public xslw search(String sid) {
		try{
			String sql="select * from xslw where sid=?";
			return qr.query(sql, new BeanHandler<xslw>(xslw.class),sid);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public int del(String ids) {
		try {
			String sql = "delete from xslw where sid in("+ids+")";
			qr.update(sql);
			return ids.split(",").length;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public int update4(String ids) {
		try {
			String sql = "update xslw set zztg='yse' where sid in("+ids+")";
			qr.update(sql);
			return ids.split(",").length;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public xslw seacher(String sid) {
		try{
			String sql="select * from xslw where sid=?";
			return qr.query(sql, new BeanHandler<xslw>(xslw.class),sid);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public int update5(String ids, String pyname) {
		try {
			String sql = "update xslw set pyname=? where sid in("+ids+")";
			Object[] params = {pyname};		
			qr.update(sql, params);
			return ids.split(",").length;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}		
	}


}
