package dao;

import java.sql.SQLException;

import org.junit.Test;

import cn.itcast.commons.CommonUtils;
import domain.Student;
import domain.xuanti;

public class test {
	@Test
public void fun1(){
		StudentDao studentDao = new StudentDao();
		//studentDao.update("5001130013", "老虎");
	//Student stu=studentDao.search("5001130016");
	//System.out.println(stu.getSname()+stu.getSpass());
}
	@Test
	public void fun2() {
		StudentDao xs=new StudentDao();
		Student s=new Student();
		s.setQq("12323213");
		s.setMz("汉族");
		xs.update2(s, "5001130001");
	/*	for(int i = 01; i <= 20; i++) {
			Student s = new Student ();			
			s.setSid("50011300"+i);
			s.setSname("张" + i);
			s.setSdepart("信息工程");
			s.setSgender(i%2==0?"男":"女");
			s.setStel("139132001" + i);
			s.setSyx("cstm_" + i + "@163.com");						
			xs.add(s);
		}*/
	}
	@Test
	public void fun3(){
		ktbgDao kt=new ktbgDao();
	/*	try {
			//kt.add("qwe", "123", "hu","xingong", "123231");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}
	@Test
	public void fun4(){
		xslwDao xs=new xslwDao();
		//xs.add("qwe", "123", "hu","xingong", "123231");
		int n=xs.update4("5001130001,5001130002");
		System.out.println(n);
	}
	@Test
	public void fun5(){
		xuantiDao xt=new xuantiDao();
		 xuanti xt1=xt.searchBySid("5001130016");
		 if(xt1==null){
			 System.out.println("as");
			 return;
		 }
		 String tname=xt1.getTname();
		System.out.println(tname);
		//xt.update("10000003", "5001130001");
		/*boolean b=xt.findBySid("5001130002");
		System.out.println(b);*/
		
		//xt.add("123", "嘻嘻", "双节", "信工", "123456654");
	}
	@Test
	public void fun6(){
		//xslwDao xs=new xslwDao();
		StudentDao s=new StudentDao();
		s.update4("5001130016", "98", "aaaa");
		s.update5("5001130016", "88", "aaaa");
		s.update6("5001130016", "66", "aaaa");
	}
	@Test
	public void fun7(){
		xslwDao xs=new xslwDao();
		xs.update3("5001130003", "80", "aaaa");
		
		xs.update("5001130003", "88", "aaaa");
		xs.update2("5001130003", "60", "aaaa");
		
	}
}
