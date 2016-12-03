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
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import dao.StudentDao;
import dao.ktbgDao;
import domain.PageBean;
import domain.Student;
import domain.ktbg;
import domain.xuanti;

public class czbgServlet extends BaseServlet {
	private ktbgDao kt = new ktbgDao();
	private StudentDao stu = new StudentDao();

	public void tg(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sid = request.getParameter("sid");
		kt.update(sid);
		String info = "恭喜你的开题报告通过了，可以开始写论文了";
		stu.update(sid, info);

		PageBean<ktbg> pb2 = kt.find();
		int total = pb2.getTr();
		List list = pb2.getBeanList();
		String rows = JSONArray.fromObject(list).toString();// 转为json
		JSONObject jo = new JSONObject();
		jo.put("total", total);
		jo.put("rows", rows);
		response.getWriter().print(jo);

	}

	public void btg(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sid = request.getParameter("sid");
		kt.delete(sid);
		String info = "你的开题报告没有通过，请好好修改一下，希望继续努力";
		stu.update(sid, info);
		PageBean<ktbg> pb2 = kt.find();
		int total = pb2.getTr();
		List list = pb2.getBeanList();
		String rows = JSONArray.fromObject(list).toString();// 转为json
		JSONObject jo = new JSONObject();
		jo.put("total", total);
		jo.put("rows", rows);
		response.getWriter().print(jo);
	}

}
