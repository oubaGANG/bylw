package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.TeacherDao;
import domain.Teacher;

public class ckServlet extends HttpServlet {
	private TeacherDao te=new TeacherDao(); 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tname=request.getParameter("tname");
		Teacher tea=te.searchByName(tname);
		request.getSession().setAttribute("teacher", tea);
	}

}
