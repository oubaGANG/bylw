package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import dao.ManagerDao;
import dao.PslsDao;
import dao.PylsDao;
import dao.StudentDao;
import dao.TeacherDao;
import domain.Manager;
import domain.Psls;
import domain.Pyls;
import domain.Student;
import domain.Teacher;

public class loginServlet extends HttpServlet {
	private StudentDao std=new StudentDao();
	private TeacherDao te=new TeacherDao();  
	private PylsDao py=new PylsDao();
	private PslsDao ps=new PslsDao();
	private ManagerDao ma=new ManagerDao();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String sf=request.getParameter("sf");
		request.getSession().setAttribute("sf", sf);
		String id=request.getParameter("sid");
		String pass=request.getParameter("spass");
		//学生
		if(sf.equals("student")){
		Student stu=std.search(id);
		if(stu==null){
			response.getWriter().print("用户名不存在");	
			return;
		}
		else if(!stu.getSpass().trim().equals(pass)){
			response.getWriter().print("密码不正确");		
			return;
		}
		request.getSession().setAttribute("stu", stu);
		return;
		}
		//老师
		else if(sf.equals("teacher")){
			Teacher tea=te.search(id);
			if(tea==null){
				response.getWriter().print("用户名不存在");	
				return;
			}
			else if(!tea.getTpass().trim().equals(pass)){
				response.getWriter().print("密码不正确");		
				return;
			}
			request.getSession().setAttribute("tea", tea);
			return;
		}
		//评阅老师
		else if(sf.equals("pyls")){			
		Pyls p=py.search(id);
	
	if(p==null){
		response.getWriter().print("用户名不正确！");	
		return;
	}
	else if(!p.getPypass().trim().equals(pass)){
		response.getWriter().print("密码不正确！");		
		return;
	}	
	request.getSession().setAttribute("py", p);
	return;
}
		//评审老师
	else if(sf.equals("psls")){
	Psls p=ps.search(id);
	if(p==null){
		response.getWriter().print("用户名不正确！");	
		return;
	}
	else if(!p.getPspass().trim().equals(pass)){
		response.getWriter().print("密码不正确！");		
		return;
	}
	return;
}
		//管理员
	else if(sf.equals("manager")){
	Manager m=ma.search(id);
	if(m==null){
		response.getWriter().print("用户名不正确！");	
		return;
	}
	else if(!m.getMpass().trim().equals(pass)){
		response.getWriter().print("密码不正确！");		
		return;
	}
	return;
}

		
			
	}

}
