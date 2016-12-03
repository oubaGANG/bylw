package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class xzbgServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String lwname=request.getParameter("lwname");
		byte[] b = lwname.getBytes("iso-8859-1");
		lwname = new String(b, "utf-8");
		response.setContentType("application/x-msdownload");
		String fileName=lwname+".doc";
		 response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(fileName, "utf-8")); 
		 OutputStream out = response.getOutputStream();
		String FileName = "F:\\file\\baogao\\"+lwname+".docx";				 
		 InputStream in = new FileInputStream(FileName);
		 byte [] buffer = new byte[1024];
		 int len = 0;
		 while((len = in.read(buffer))!=-1){
			 out.write(buffer,0,len);
		 }
		 in.close();

	}

}
