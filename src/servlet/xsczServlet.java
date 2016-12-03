package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import dao.StudentDao;
import domain.Student;

public class xsczServlet extends BaseServlet {
	private StudentDao xs=new StudentDao ();
	//删除
	public void del(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ids=request.getParameter("ids");
		int n=xs.del(ids);
		response.getWriter().print(n);
	}
	//增加
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Student s=CommonUtils.toBean(request.getParameterMap(), Student.class);
		Student stu=xs.search(s.getSid());
		if(stu!=null){
			response.getWriter().print("error");
			
			return;
		}
		xs.add(s);	
		response.getWriter().print("1");
	}
	//修改
	public void edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Student s=CommonUtils.toBean(request.getParameterMap(), Student.class);
		xs.edit(s);		
		response.getWriter().print("1");
	}
	//修改信息
		public void update(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			Student s=CommonUtils.toBean(request.getParameterMap(), Student.class);
			Student st=(Student) request.getSession().getAttribute("stu");
			String sid=st.getSid();
			xs.update2(s,sid);
		}
		//修改密码
				public void update2(HttpServletRequest request, HttpServletResponse response)
						throws ServletException, IOException {		
					Student st=(Student) request.getSession().getAttribute("stu");
					String sid=st.getSid();
					String ymm=request.getParameter("ymm");
					Student s=xs.search(sid);
					 if(!s.getSpass().trim().equals(ymm)){
						response.getWriter().print("原密码输入不正确！！！");		
						return;
					}else{
						String xmm=request.getParameter("xmm");
						xs.update3(sid,xmm);
					}
					
					
				}
}
