package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import dao.TeacherDao;
import domain.Student;
import domain.Teacher;

public class dsczServlet extends BaseServlet{
	private TeacherDao ds=new TeacherDao ();
	//删除
	public void del(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ids=request.getParameter("ids");
		int n=ds.del(ids);
		response.getWriter().print(n);
	}
	//增加
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Teacher t=CommonUtils.toBean(request.getParameterMap(), Teacher.class);
		Teacher tea=ds.search(t.getTid());
		if(tea!=null){
			response.getWriter().print("error");
			
			return;
		}
		ds.add(t);	
		response.getWriter().print("1");
	}
	//修改
	public void edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Teacher t=CommonUtils.toBean(request.getParameterMap(), Teacher.class);
		ds.edit(t);		
		response.getWriter().print("1");
	}
	//修改密码
	public void update2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		Teacher te=(Teacher) request.getSession().getAttribute("tea");
		String tid=te.getTid();
		String ymm=request.getParameter("ymm");
		Teacher t=ds.search(tid);
		 if(!t.getTpass().trim().equals(ymm)){
			response.getWriter().print("原密码输入不正确！！！");		
			return;
		}else{
			String xmm=request.getParameter("xmm");
			ds.update2(tid,xmm);
		}
		
		
	}
}
