package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import util.Pagination;
import dao.BanJiDao;
import dao.BjAndSubDao;
import dao.SubjectDao;
import entity.BanJi;
import entity.Subject;

public class BanJiServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) {

		String type = request.getParameter("type");
		if (type == null) {
			search(request, response);
		} else if (type.equals("showAdd")) {
			showAdd(request, response);
		} else if (type.equals("add")) {
			add(request, response);
		} else if (type.equals("showModify")) {
			showModify(request, response);
		} else if (type.equals("modify")) {
			modify(request, response);

		} else if (type.equals("delete")) {
			delete(request, response);

		} else if (type.equals("search")) {
			search(request, response);

		} else if (type.equals("manageSub")) {
			manageSub(request, response);

		} 
		else if (type.equals("manageSub2")) {
			manageSub2(request, response);

		}
		else if (type.equals("addSub")) {
			addSub(request, response);

		}else if (type.equals("deleteSub")) {
			deleteSub(request, response);

		}else if (type.equals("searchSub")) {
			searchSub(request, response);

		}


	}

	private void manageSub2(HttpServletRequest request,
			HttpServletResponse response) {
		BanJiDao bjDao = new BanJiDao();
		SubjectDao subDao = new SubjectDao();
		List<BanJi> bjs=bjDao.searchAll();
		int bjId=0;
		if(request.getParameter("selectId")==null){
			bjId=bjs.get(0).getId();
			
		}else{
			bjId = Integer.parseInt(request.getParameter("selectId"));
		}
		
	
		BanJi bj = bjDao.searchBjAndSubById(bjId);
		
		List<Subject> noSubs = subDao.searchNoSubByBjId(bjId);
		try {
			request.setAttribute("bj", bj);
			request.setAttribute("noSubs", noSubs);	
			request.setAttribute("bjs", bjs);
			request.getRequestDispatcher("WEB-INF/banji/manageSub2.jsp")
					.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void deleteSub(HttpServletRequest request,
			HttpServletResponse response) {
		int bjId = Integer.parseInt(request.getParameter("bjId"));
		String[] subIds = request.getParameter("subIds").split(",");
		BjAndSubDao bsDao = new BjAndSubDao();
		boolean flag = bsDao.deleteAll(bjId, subIds);
		try {
			PrintWriter out = response.getWriter();
			BanJiDao bjDao = new BanJiDao();
			BanJi bj = bjDao.searchBjAndSubById(bjId);
			SubjectDao subDao = new SubjectDao();
			List<Subject> noSubs = subDao.searchNoSubByBjId(bjId);
			String str = JSONArray.fromObject(bj.getSubs()).toString();
			str += "-|-" + JSONArray.fromObject(noSubs).toString();
			out.print(str);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void addSub(HttpServletRequest request, HttpServletResponse response) {
		int bjId = Integer.parseInt(request.getParameter("bjId"));
		String[] subIds = request.getParameter("subIds").split(",");
		BjAndSubDao bsDao = new BjAndSubDao();
		boolean flag = bsDao.addAll(bjId, subIds);
		try {
			PrintWriter out = response.getWriter();
			BanJiDao bjDao = new BanJiDao();
			BanJi bj = bjDao.searchBjAndSubById(bjId);
			SubjectDao subDao = new SubjectDao();
			List<Subject> noSubs = subDao.searchNoSubByBjId(bjId);
			String str = JSONArray.fromObject(bj.getSubs()).toString();
			str += "-|-" + JSONArray.fromObject(noSubs).toString();
			out.print(str);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	private void searchSub(HttpServletRequest request, HttpServletResponse response) {
		int bjId = Integer.parseInt(request.getParameter("bjId"));
		BjAndSubDao bsDao = new BjAndSubDao();
		try {
			PrintWriter out = response.getWriter();
			BanJiDao bjDao = new BanJiDao();
			BanJi bj = bjDao.searchBjAndSubById(bjId);
			SubjectDao subDao = new SubjectDao();
			List<Subject> noSubs = subDao.searchNoSubByBjId(bjId);
			String str = JSONArray.fromObject(bj.getSubs()).toString();
			str += "-|-" + JSONArray.fromObject(noSubs).toString();
			out.print(str);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	

	private void manageSub(HttpServletRequest request,
			HttpServletResponse response) {
		BanJiDao bjDao = new BanJiDao();
		SubjectDao subDao = new SubjectDao();
		List<BanJi> bjs=bjDao.searchAll();
		int bjId=0;
		if(request.getParameter("selectId")==null){
			bjId=bjs.get(0).getId();
			
		}else{
			bjId = Integer.parseInt(request.getParameter("selectId"));
		}
		
	
		BanJi bj = bjDao.searchBjAndSubById(bjId);
		
		List<Subject> noSubs = subDao.searchNoSubByBjId(bjId);
		try {
			request.setAttribute("bj", bj);
			request.setAttribute("noSubs", noSubs);	
			request.setAttribute("bjs", bjs);
			request.getRequestDispatcher("WEB-INF/banji/manageSub.jsp")
					.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void search(HttpServletRequest request, HttpServletResponse response) {
		BanJiDao bjDao = new BanJiDao();

		BanJi condition = new BanJi();
		String name = request.getParameter("name");
		if (!"".equals(name)) {
			condition.setName(name);
		}

		if (null == request.getParameter("stuNums")
				|| "".equals(request.getParameter("stuNums"))) {
			condition.setStuNums(-1);
		} else {
			int stuNums = Integer.parseInt(request.getParameter("stuNums"));
			condition.setStuNums(stuNums);
		}

		int ye = 1;
		if (request.getParameter("ye") != null) {
			ye = Integer.parseInt(request.getParameter("ye"));
		}
		int max = bjDao.searchCount(condition);
		int pageNum = 2;
		int yeMa = 5;
		Pagination pagination = new Pagination(ye, max, pageNum, yeMa);
		ye = pagination.getYe();
		int begin = (ye - 1) * pageNum;

		List<BanJi> list = bjDao.searchByCondition(condition, begin, pageNum);

		request.setAttribute("p", pagination);
		request.setAttribute("condition", condition);

		request.setAttribute("bjs", list);
		try {
			request.getRequestDispatcher("WEB-INF/banji/list.jsp").forward(
					request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("selectId"));
		BanJi bj = new BanJi();
		bj.getId();
		BanJiDao bjDao = new BanJiDao();
		boolean flag = bjDao.delete(id);
		if (flag) {
			try {
				response.sendRedirect("bj");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	private void modify(HttpServletRequest request, HttpServletResponse response) {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");

			BanJi bj = new BanJi();
			bj.setId(id);
			bj.setName(name);

			BanJiDao bjDao = new BanJiDao();
			boolean flag = bjDao.modify(bj);
			if (flag) {

				response.sendRedirect("bj");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void showModify(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			int id = Integer.parseInt(request.getParameter("selectId"));
			BanJiDao bjDao = new BanJiDao();
			BanJi bj = bjDao.searchById(id);
			request.setAttribute("bj", bj);
			request.getRequestDispatcher("WEB-INF/banji/modify.jsp").forward(
					request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void add(HttpServletRequest request, HttpServletResponse response) {
		try {
			String name = request.getParameter("name");

			BanJi bj = new BanJi();
			bj.setName(name);

			BanJiDao bjDao = new BanJiDao();
			boolean flag = bjDao.add(bj);
			if (flag) {

				response.sendRedirect("bj");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void showAdd(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			request.getRequestDispatcher("WEB-INF/banji/add.jsp").forward(
					request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// private void show(HttpServletRequest request, HttpServletResponse
	// response) {
	// try {
	// BanJiDao bjDao = new BanJiDao();

	// int ye = 1;
	// if (request.getParameter("ye") != null) {
	// ye = Integer.parseInt(request.getParameter("ye"));
	// }
	// int max = bjDao.searchCount();
	// int pageNum = 2;
	// int yeMa = 5;
	// Pagination pagination = new Pagination(ye, max, pageNum, yeMa);
	// ye = pagination.getYe();
	// int begin = (ye - 1) * pageNum;
	// List<BanJi> list = bjDao.searchByBegin(begin, pageNum);
	// request.setAttribute("bjs", list);
	// request.setAttribute("p", pagination);
	//
	// request.getRequestDispatcher("WEB-INF/BanJi/list.jsp").forward(
	// request, response);
	// } catch (ServletException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// } catch (IOException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	// }

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		doGet(request, response);
	}
}
