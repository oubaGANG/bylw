package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import dao.TeacherDao;
import domain.PageBean;
import domain.Teacher;

public class dsglServlet extends HttpServlet{
	private TeacherDao ds=new TeacherDao ();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");//请求编码(POST)
		response.setContentType("application/json;charset=utf-8");//响应编码
		int pc=Integer.parseInt(request.getParameter("page"));//当前页面
		int ps=Integer.parseInt(request.getParameter("rows"));//每页记录数		
		String order=(String)request.getParameter("order");//获取要排序的方式
		String sort=(String)request.getParameter("sort");//获取要排序的元素
		/*按条件查询*/
		String tid=request.getParameter("tid");
		String tname=request.getParameter("tname");
		/*分页*/
		PageBean<Teacher> pb2=ds.findAll(tid,tname,pc, ps,order,sort);//获取每个记录
		int total=pb2.getTr();
		List list=pb2.getBeanList();
		String rows=JSONArray.fromObject(list).toString();//转为json		
		JSONObject jo=new JSONObject();
		jo.put("total", total);
		jo.put("rows", rows);
	    response.getWriter().print(jo);	
		
		
	}

}
