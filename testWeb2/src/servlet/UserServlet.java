package servlet;

import java.io.IOException;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.CreateMD5;
import util.RandomNumber;
import util.ValidateCode;
import dao.UserDao;
import entity.User;

public class UserServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			String type = request.getParameter("type");
			if (type == null || type.equals("showLogin")) {
				showLogin(request, response);
			} else if (type.equals("doLogin")) {
				doLogin(request, response);

			}else if(type.equals("zhuce")){
				zhuce(request,response);
				
			}
			else if(type.equals("sava")){
				sava(request,response);
				
			}
			else if(type.equals("randomImage")){
				randomImage(request,response);
				
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void sava(HttpServletRequest request, HttpServletResponse response) {
		try {
		String rand=request.getParameter("random");
		if(rand.equals(request.getSession().getAttribute("rand"))){
			String username=request.getParameter("name");
			String password=request.getParameter("password");
			//对password进行MD5加密;
			//password=CreateMD5.getMd5(password);
			User user=new User();
			user.setUsername(username);
			//user.setPassword(password);
			Date date=new Date();
			java.sql.Timestamp time=new java.sql.Timestamp(date.getTime());
			user.setTime(time);
			UserDao userDao=new UserDao();
			User u=userDao.sava(user);
			u=userDao.searchByName(u.getUsername());
			password=CreateMD5.getMd5(password,u.getTime().toString());
			u.setPassword(password);
			u=userDao.update(u);
			request.getSession().setAttribute("user", user);
			response.sendRedirect("user?type=showLogin");
		}else{
			request.setAttribute("mes", "验证码错误");
			request.getRequestDispatcher("WEB-INF/denglu/zhuce.jsp").forward(request, response);
			
		}
		
		
		
		
				
			
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

	private void zhuce(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.getRequestDispatcher("WEB-INF/denglu/zhuce.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public void showLogin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String name = "";
		Cookie[] cookies = request.getCookies();
		for (int i = 0; cookies != null && i < cookies.length; i++) {
			if (cookies[i].getName().equals("userName")) {
				name = cookies[i].getValue();
				break;
			}
		}
		request.setAttribute("name", name);
		request.getRequestDispatcher("WEB-INF/denglu/login.jsp").forward(request, response);

	}

	public void doLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String rand=request.getParameter("random");
		if(rand.equals(request.getSession().getAttribute("rand"))){
			UserDao userDao=new UserDao();
			String username=request.getParameter("name");
			String password=request.getParameter("password");
			User user=new User();
			user.setUsername(username);
			User u=userDao.searchByName(username);
			CreateMD5.getMd5(password+u.getPassword());
			user.setPassword(CreateMD5.getMd5(password+u.getTime()));
			
			
			userDao.searchByUserNameAndPassword(user);
			if(user!=null){
				request.getSession().setAttribute("user", user);
				//request.getRequestDispatcher("index").forward(request, response);
			response.sendRedirect("index");
			}
			else{
				
				request.setAttribute("abc", "账号或密码错误");
				
				request.getRequestDispatcher("WEB-INF/denglu/login.jsp").forward(request, response);
			}
			}else{
			request.setAttribute("mes", "验证码错误");
			request.getRequestDispatcher("WEB-INF/denglu/login.jsp").forward(request, response);
			
		}
			
		
	}
	public void randomImage(HttpServletRequest request,
			HttpServletResponse response) {

		RandomNumber rn = new RandomNumber();
		try {
			// 设置页面不缓存
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			
			ValidateCode vc = rn.generateImage();
			ServletOutputStream outStream = response.getOutputStream();
			// 输出图象到页面
			ImageIO.write(vc.getImage(), "JPEG", outStream);
			outStream.close();
			request.getSession().setAttribute("rand", vc.getRand());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		doGet(request, response);
	}
}
