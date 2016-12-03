package dao;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.StyledEditorKit.BoldAction;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.jdbc.TxQueryRunner;
import domain.PageBean;
import domain.Student;
import domain.xslw;
import domain.xuanti;
public class xuantiDao {
	private QueryRunner qr = new TxQueryRunner();
	/**
	 * 查询所有
	 * @param lwname 
	 * @param tname 
	 * @param lwid 
	 * @return
	 */
	public PageBean<xuanti> findAll(String tname, String lwname, int pc,int ps, String order, String sort){
		try {
			PageBean<xuanti> pb = new PageBean<xuanti>();
			//设置pb的pc和ps
			pb.setPc(pc);
			pb.setPs(ps);
			String str=" ";//得到排序
			//1. 给出一个sql语句前半部
		StringBuilder cntSql = new StringBuilder("select count(*) from lwxt");
		StringBuilder whereSql = new StringBuilder(" where 1=1");
		//创建一个ArrayList，用来装载参数值
		List<Object> params = new ArrayList<Object>();
		if(tname != null && !tname.trim().isEmpty()) {
			whereSql.append(" and tname like ?");
			params.add("%" +tname+ "%");
		}
		if(lwname != null && !lwname.trim().isEmpty()) {
			whereSql.append(" and lwname like ?");
			params.add("%" +lwname+ "%");
		}
		
		if(order!=null)str=" ORDER BY "+ sort+" "+order+" ";
		//得到总记录数tr
	
		Number num = (Number)qr.query(cntSql.append(whereSql).toString(), new ScalarHandler(),params.toArray());
		int tr = num.intValue();
		pb.setTr(tr);
		//得到beanList
		StringBuilder sql = new StringBuilder("select * from lwxt");
		StringBuilder limitSql=new StringBuilder(str+"limit ?,?");
		params.add((pc-1)*ps);
		params.add(ps);
		 List<xuanti>beanList=qr.query(sql.append(whereSql).append(limitSql).toString(), new BeanListHandler<xuanti>(xuanti.class),params.toArray());
		 pb.setBeanList(beanList);
			return pb;
		}  catch(SQLException e) {
			throw new RuntimeException(e);
		}		
	}
	//更新数据，把选中的题目中的属性是否选题改为是
	public void update(String lwid, String sid) {
		try {
			
			String sql = "update lwxt set sfxz='是',sid=? where lwid=?";		
			qr.update(sql,sid,lwid);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	public PageBean<xuanti> find() {
		try {
			PageBean<xuanti> pb = new PageBean<xuanti>();
			String sql ="select count(*) from lwxt";
			Number num = (Number)qr.query(sql, new ScalarHandler());
			int tr = num.intValue();
			pb.setTr(tr);
			 sql = "select * from lwxt";
			 List<xuanti>beanList= qr.query(sql, new BeanListHandler<xuanti>(xuanti.class));
			 pb.setBeanList(beanList);
				return pb;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	//zengjia 
	public void add(String lwid, String name, String tname, String tdepart, String tyx,String tel) {
			try {
				String sql = "insert into lwxt values(?,?,?,?,?,?,?,?,?,?)";
				Object[] params ={lwid,lwid,name,tname,tel,tdepart,tyx,"否",name,""};
				qr.update(sql, params);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}
	//获取总数量
	public int getSum() {
		int sum=0;
		try {
			String sql="select count(*) from lwxt";
			Number num = (Number)qr.query(sql, new ScalarHandler());
			sum = num.intValue();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sum;
	}
	//判断学生是否已经选过论题
	public boolean findBySid(String sid) {
		boolean flag=false;
		try {
			String sql = "select * from lwxt where sid="+sid+"";
			List<xuanti>list=qr.query(sql, new BeanListHandler<xuanti>(xuanti.class));
			if(list.size()>0) flag=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	public int del(String ids) {
		try {
			String sql = "delete from lwxt where lwid in("+ids+")";
			qr.update(sql);
			return ids.split(",").length;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public xuanti search(String lwid) {
		try{
			String sql="select * from lwxt where lwid=?";
			return qr.query(sql, new BeanHandler<xuanti>(xuanti.class),lwid);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public void add(xuanti x) {
		try {
			String sql = "insert into lwxt values(?,?,?,?,?,?,?,?,?,?)";
			Object[] params = {x.getLwid(),x.getLwid(),x.getLwname(),x.getTname(),x.getTel(),x.getTdepart(),x.getTyx(),"",x.getLwname(),""};
			qr.update(sql, params);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	public void edit(xuanti x) {
		try {
			String sql = "update lwxt set lwid=?,lwname=?,tname=?,tel=?,tdepart=?,tyx=? where lwid=?";
			Object[] params = {x.getLwid(),x.getLwname(),x.getTname(),x.getTel(),x.getTdepart(),x.getTyx(),x.getLwid()};		
			qr.update(sql, params);

		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	public xuanti searchBySid(String sid) {
		try{
			String sql="select * from lwxt where sid=?";
			return qr.query(sql, new BeanHandler<xuanti>(xuanti.class),sid);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public xuanti seach(String lwid) {
		try{
			String sql="select * from lwxt where lwid=?";
			return qr.query(sql, new BeanHandler<xuanti>(xuanti.class),lwid);
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public void update1(String sid, String tname) {
	try {
			
			String sql = "update xslw set tname=? where sid=?";		
			qr.update(sql,tname,sid);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
	}

	
	
}
