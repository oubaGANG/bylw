package servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.ktbgDao;
import dao.xuantiDao;
import domain.Student;
import domain.Teacher;


public class UpyqServlet extends HttpServlet{
	private xuantiDao xt=new xuantiDao();
	 private static final String FILE_PATH = "F:" + File.separator + "file"
	             + File.separator + "yaoqiu" + File.separator;// �ļ��ϴ���·��
	
	     private static final String FILE_TEMP = "F:" + File.separator + "test"
	            + File.separator + "temp" + File.separator;;// �ļ�����·��
	            String fileName;
	            //��дservice����
	public void service(HttpServletRequest request,HttpServletResponse response)
	throws IOException{
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
						fileName = item.getName();//��ȡ�ļ���
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
		int sum=xt.getSum();
		sum++;
		String lwid="1000"+sum+"";
		Teacher tea=(Teacher) request.getSession().getAttribute("tea");
		String tid=tea.getTid();
		String tname=tea.getTname();
		String tel=tea.getTel();
		String tdepart=tea.getTdepart();
		String tyx=tea.getYx();
		String name=fileName.split("\\.")[0];
		xt.add(lwid,name,tname,tdepart,tyx,tel);
		request.getSession().setAttribute("msg", "恭喜论文上传成功");
		response.sendRedirect("teacher/msg.jsp");
	}
}	
	


		 
		 
		
