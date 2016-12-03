package servlet;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.ManagerDao;
import dao.ktbgDao;
import dao.xuantiDao;
import domain.Student;
import domain.xuanti;


public class UpbgServlet extends HttpServlet{
	private ktbgDao kt=new ktbgDao();
	private xuantiDao lw=new xuantiDao();
	private ManagerDao mg=new ManagerDao();
	 private static final String FILE_PATH = "F:" + File.separator + "file"
	             + File.separator + "baogao" + File.separator;// �ļ��ϴ���·��
	
	     private static final String FILE_TEMP = "F:" + File.separator + "test"
	            + File.separator + "temp" + File.separator;;// �ļ�����·��
	            String fileName;
	            //��дservice����
	public void service(HttpServletRequest request,HttpServletResponse response)
	throws IOException{
		String date1=mg.findDate();//获取数据库中保存的最终时间
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date2=sdf.format(date);//获取当前系统时间
		try {
			long f1 = sdf.parse(date1).getTime();
			long f2 =sdf.parse(date2).getTime();	
			//得到两者之差
			long c = f1 - f2;
		    if(c<0){
		    	request.getSession().setAttribute("msg", "已经超过报告最后提交日期，你不能提交开题报告！！！");
				response.sendRedirect("student/msg.jsp");
				return;
		    }
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setCharacterEncoding("utf-8");//���ñ����ʽ
		//�ж��ϴ������ı?�Ƿ�Ϊ�ϴ��?
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart){
			//����һ���ļ��ϴ��������
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			
			//�ж�ָ����Ŀ¼�Ƿ���ڣ������ھ��Զ�����һ��Ŀ¼
			   File fileTemp = new File(FILE_TEMP);
			      if (!fileTemp.exists()){
			         fileTemp.mkdirs();
			       }
			      File filePath1 = new File(FILE_PATH);
			      if (!filePath1.exists()) {
			       filePath1.mkdir();//�˴�������mkdir()��������Ϊǰ��Ĵ���ִ�к�testĿ¼һ������
			   }
			 //�����ļ��Ļ���·��
			  factory.setRepository(fileTemp);
			 // ��DiskFileItemFactory���󴫸�ServletFileUpload���췽��������ϴ���ServletFileUpload�Ķ���
			  ServletFileUpload sevletFileUpload = new ServletFileUpload(factory);
			//����һ�������
			Iterator items;
			try {
				//�������?���ύ�������ļ�����
				//���صı�����List���ͣ�ǿתΪ������
				items = upload.parseRequest(request).iterator();
				while(items.hasNext()){//�ж�Ԫ���Ƿ����
					FileItem item = (FileItem) items.next();//���ص�ǰԪ��
					//�жϲ���������ͨ�ı?���������ļ��ϴ�������Ǳ?������ͷ���true
					//������ļ��ϴ���ͷ���false
					if(!item.isFormField()){//������ļ��ϴ���ͷ���false��ȡ������true
						fileName= item.getName();//��ȡ�ļ���
						//��ȡcontext
						ServletContext context = getServletContext();
						long l = item.getSize();
						//�����ϴ��ļ���ָ����·��
						File filePath = new File(FILE_PATH+"\\"+fileName);
						String path = FILE_PATH;
						int id = 0;
						//���ϴ����ļ��洢���������У�����ϴ�����
						item.write(filePath);
						//����Ĵ�����Ϊ�˽��ϴ��ļ������  ��С��ӡ�ڽ�����
						
					}
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		Student stu=(Student) request.getSession().getAttribute("stu");
		String sid=stu.getSid();
		String sname=stu.getSname();
		String stel=stu.getStel();
		String sdepart=stu.getSdepart();
		 xuanti xt=lw.searchBySid(sid);
		 if(xt==null){
			 request.getSession().setAttribute("msg", "请先选题！！！");
			 response.sendRedirect("student/msg.jsp");
			 return;
		 }
		 String tname=xt.getTname();
	String name=fileName.split("\\.")[0];
		try {
			kt.add(name,sid,sname,sdepart,stel,tname);	
			request.getSession().setAttribute("msg", "恭喜开题报告提交成功!!!");
		} catch (SQLException e) {
			request.getSession().setAttribute("msg", "请不要重复提交开题报告");
		}
		response.sendRedirect("student/msg.jsp");
	}
}	
	


		 
		 
		
