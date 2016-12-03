package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import dao.ktbgDao;
import dao.xslwDao;
import dao.xuantiDao;
import domain.PageBean;
import domain.Student;
import domain.xuanti;

public class xuanServlet extends HttpServlet {
	private xuantiDao xt=new xuantiDao();
	private ktbgDao bg=new ktbgDao();
	private xslwDao lw=new xslwDao();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Student stu=(Student) request.getSession().getAttribute("stu");
		String sid=stu.getSid();
		if(xt.findBySid(sid)){
			response.getWriter().print("msg");	
			return;
		}
		/*更新*/
		String lwid=request.getParameter("lwid");
		System.out.println(sid);
		xt.update(lwid,sid);
		xuanti xuan=xt.seach(lwid);
		String tname=xuan.getTname();
		bg.update1(sid,tname);
		xt.update1(sid,tname);
		PageBean<xuanti> pb2=xt.find();
		int total=pb2.getTr();
		List list=pb2.getBeanList();
		String rows=JSONArray.fromObject(list).toString();//转为json		
		JSONObject jo=new JSONObject();
		jo.put("total", total);
		jo.put("rows", rows);
	response.getWriter().print(jo);	
	}

}
