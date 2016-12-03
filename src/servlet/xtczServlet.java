package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import dao.*;
import domain.*;

public class xtczServlet extends BaseServlet {
	private xuantiDao xt = new xuantiDao();

	// 删除
	public void del(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ids = request.getParameter("ids");
		int n = xt.del(ids);
		response.getWriter().print(n);
	}

	// 增加
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		xuanti x = CommonUtils
				.toBean(request.getParameterMap(), xuanti.class);
		xuanti xu = xt.search(x.getLwid());
		if (xu != null) {
			response.getWriter().print("error");

			return;
		}
		xt.add(x);
		response.getWriter().print("1");
	}

	// 修改
	public void edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		xuanti x = CommonUtils
				.toBean(request.getParameterMap(), xuanti.class);
		xt.edit(x);
		response.getWriter().print("1");
	}

}
