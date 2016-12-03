package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ManagerDao;
import dao.ktbgDao;
import dao.xslwDao;

public class endTimeServlet extends HttpServlet {
ManagerDao m=new ManagerDao();
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String date=request.getParameter("date");
		m.updateDate(date);
		response.getWriter().print("ok");
	}

}
