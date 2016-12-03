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
import dao.xslwDao;
import domain.PageBean;
import domain.Student;
import domain.xslw;
public class czlwServlet extends BaseServlet {
	private xslwDao lw = new xslwDao();
	private StudentDao stu = new StudentDao();
	
//导师给予通过
	public void tg(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fen=request.getParameter("fen");
		String py=request.getParameter("pingy");
		String sid = request.getParameter("sid");
		String sf=(String) request.getSession().getAttribute("sf");
		if(sf.equals("teacher")){lw.update(sid,fen,py);stu.update4(sid,fen,py);}
		else if(sf.equals("pyls")){lw.update2(sid,fen,py);stu.update5(sid,fen,py);}
		else if(sf.equals("psls")){lw.update3(sid,fen,py);stu.update6(sid,fen,py);}
		Student xs=stu.search(sid);
		request.getSession().setAttribute("xs", xs);
		PageBean<xslw> pb2 = lw.find();
		int total = pb2.getTr();
		List list = pb2.getBeanList();
		String rows = JSONArray.fromObject(list).toString();// 转为json
		JSONObject jo = new JSONObject();
		jo.put("total", total);
		jo.put("rows", rows);
		response.getWriter().print(jo);

	}
	//导师不给予通过
	public void btg(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sid = request.getParameter("sid");	
		lw.delete(sid);
		String info = "你的开题报告没有通过，请好好修改一下，希望继续努力";
		stu.update(sid, info);
		PageBean<xslw> pb2 = lw.find();
		int total = pb2.getTr();
		List list = pb2.getBeanList();
		String rows = JSONArray.fromObject(list).toString();// 转为json
		JSONObject jo = new JSONObject();
		jo.put("total", total);
		jo.put("rows", rows);
		response.getWriter().print(jo);
	}
//管理员给予通过
	public void ok(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ids=request.getParameter("ids");
		String info = "恭喜你的论文已经通过！！！";
		stu.update(ids, info);
		int n=lw.update4(ids);
		response.getWriter().print(n);
	}
	//管理员不给予通过
		public void no(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			String ids=request.getParameter("ids");
			String info = "很遗憾你的论文没有通过，请继续努力！！！";
			stu.update(ids, info);
			int n=lw.del(ids);
			response.getWriter().print(n);
		}
		
		public void fplw(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			String ids=request.getParameter("ids");
			String pyname=request.getParameter("pyname");
			int n=lw.update5(ids,pyname);
			response.getWriter().print(n);
		}
}
