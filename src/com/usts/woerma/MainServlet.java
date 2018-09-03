package com.usts.woerma;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lxh.smart.SmartUpload;

import com.usts.woerma.db.DBDao;
import com.usts.woerma.db.DBImpl;
import com.usts.woerma.entity.CustomerInfo;
import com.usts.woerma.entity.GoodsInfo;

public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletConfig config = null;

	public MainServlet() {
		super();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		this.config = config;
	}


	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * user/regedit.action taobao/user/login.action
		 */
		System.out.println(request.getServletPath());
		String path = request.getServletPath();
		String action = path.substring(path.lastIndexOf("/") + 1, path.lastIndexOf("."));
		System.out.println(action);
		if (action.equalsIgnoreCase("goodsAdd")) {
			goodsAdd(request, response);
			return;
		}
		if (action.equalsIgnoreCase("goodsModify")) {
			goodsModify(request, response);
			return;
		}
		if (action.equalsIgnoreCase("goodsDelete")) {
			goodsDelete(request, response);
			return;
		}
		// 1.定义编码
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		// 2.获取action
		// 3.得到输入
		// 4.业务处理
		// 5.输出
		switch (action) {
		case "register":
			register(request, response);
			break;

		case "login":
			login(request, response);
			break;

		case "search":
			search(request, response);
			break;

		case "buyInList":
			buyInList(request, response);
			break;

		case "deleteInShopCart":
			deleteInShopCart(request, response);
			break;

		case "pay":
			pay(request, response);
			break;

		case "order":
			order(request, response);
			break;

		case "pwdReset":
			pwdReset(request, response);
			break;
			
		case "logout":
			logout(request, response);
			break;

		/*
		 * case "showGoodlist": DBDao dao = new DBImpl(); showGoodlist(request,
		 * response); break;
		 */
		}
	}
	private void goodsDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int gId = Integer.parseInt(request.getParameter("goodsId"));
		DBDao dao = new DBImpl();
		if(dao.deleteManagerKey(gId)){response.sendRedirect("goodsManager.jsp");	}
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			cookie.setMaxAge(0);
			cookie.setPath("/WoermaDemo");
			response.addCookie(cookie);
		}
		response.sendRedirect("logout.jsp");
	}

	private void goodsModify(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 1. 定义编码格式
				request.setCharacterEncoding("GBK");
				response.setCharacterEncoding("GBK");
				// 1.创建smart对象，初始，上传，保存文件
				SmartUpload smart = new SmartUpload();
				try {
					smart.initialize(config, request, response);
					smart.upload();
					smart.save("img/new");
				} catch ( Exception e) {
					e.printStackTrace();
				} 
				// 2.从前台获取数据，由于上传文件，我们使用smart方式
				//  (前台所有数据打包为一个文件上传)，读取前台数据，
				//   需要使用smart对象接口getRequest.getParameter()
				GoodsInfo gi = new GoodsInfo();
				gi.setGoodsId(Integer.parseInt(smart.getRequest().getParameter("goodsId")));
				gi.setGoodsAmount(Integer.parseInt(smart.
					getRequest().getParameter("goodsAmount")));
				gi.setGoodsDate("");
				gi.setGoodsImgUrl("img/new/" 
					+ smart.getFiles().getFile(0).getFileName());
				gi.setGoodsIntroduction(smart.getRequest()
						.getParameter("goodsDisplay"));
				gi.setGoodsName(smart.getRequest()
						.getParameter("goodsName"));
				gi.setGoodsPrice(Double.parseDouble(
						smart.getRequest()
						.getParameter("goodsPrice")));
				gi.setGoodsType(smart.getRequest()
						.getParameter("goodsType"));
				//3.调用接口保存数据
				System.out.println(gi);
				if ( new DBImpl().goodsModify(gi) ){
					response.sendRedirect("goodsManager.jsp");
				}else{
					response.sendRedirect("failed.html");
				}
	}
	private void goodsAdd(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		// 1. 定义编码格式
		request.setCharacterEncoding("GBK");
		response.setCharacterEncoding("GBK");
		// 1.创建smart对象，初始，上传，保存文件
		SmartUpload smart = new SmartUpload();
		try {
			smart.initialize(config, request, response);
			smart.upload();
			smart.save("img/new");
		} catch ( Exception e) {
			e.printStackTrace();
		} 
		// 2.从前台获取数据，由于上传文件，我们使用smart方式
		//  (前台所有数据打包为一个文件上传)，读取前台数据，
		//   需要使用smart对象接口getRequest.getParameter()
		GoodsInfo gi = new GoodsInfo();
		gi.setGoodsAmount(
			Integer.parseInt(smart.
			getRequest().getParameter("goodsAmount")));
		gi.setGoodsDate("");
		gi.setGoodsImgUrl("img/new/" 
			+ smart.getFiles().getFile(0).getFileName());
		gi.setGoodsIntroduction(smart.getRequest()
				.getParameter("goodsDisplay"));
		gi.setGoodsName(smart.getRequest()
				.getParameter("goodsName"));
		gi.setGoodsPrice(Double.parseDouble(
				smart.getRequest()
				.getParameter("goodsPrice")));
		gi.setGoodsType(smart.getRequest()
				.getParameter("goodsType"));
		//3.调用接口保存数据
		System.out.println(gi);
		if ( new DBImpl().goodsAdd(gi) ){
			response.sendRedirect("goodsManager.jsp");
		}else{
			response.sendRedirect("failed.html");
		}
		
	}

	private void search(HttpServletRequest request, HttpServletResponse response) throws IOException {
		DBDao dao = new DBImpl();
		String name = request.getParameter("search");
		System.out.println(name);
		List<GoodsInfo> lst = dao.selectGoodsListByName(name);
		request.getSession().setAttribute("searchResult", lst);
		response.sendRedirect("search.jsp");
	}

	private void pwdReset(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String newName = request.getParameter("userName");
		String newPassword = request.getParameter("userPwd");
		String name = "";
		String password = "";
		DBDao dao = new DBImpl();
		if (dao.pwdReset(newName, newPassword)) {
			Cookie[] cookies = request.getCookies();
			for (Cookie cookie : cookies) {
				cookie.setMaxAge(0);
				cookie.setPath("/WoermaDemo");
				response.addCookie(cookie);
			}
			response.sendRedirect("login.jsp");
		}
	}

	private void order(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		DBDao dao = new DBImpl();
		List<Map<String, Object>> lst = dao.getOrderDetail(orderId);
		request.getSession().setAttribute("OrderDetail", lst);
		response.sendRedirect("orderDetail.jsp");
	}

	private void pay(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String uId = request.getParameter("userId");
		String allMoney = request.getParameter("allMoney");
		String receiveName = request.getParameter("receiveName");
		String receiveAddress = request.getParameter("receiveAddress");
		String receiveTele = request.getParameter("receiveTele");
		DBDao dao = new DBImpl();
		if (dao.payInShopCart(Integer.parseInt(uId), Double.parseDouble(allMoney), receiveName, receiveAddress,
				receiveTele)) {
			response.sendRedirect("buyOrder.jsp?userId=" + uId);
		}
	}

	private void deleteInShopCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		int gId = Integer.parseInt(request.getParameter("goodsId"));
		DBDao dao = new DBImpl();
		dao.deleteKey(gId);
		response.sendRedirect("buyCart.jsp");
	}

	/*
	 * private void showGoodlist(HttpServletRequest request, HttpServletResponse
	 * response) throws IOException { DBDao dao = new DBImpl(); String type =
	 * request.getParameter("type"); String dtype =
	 * URLDecoder.decode(URLDecoder.decode(type, "utf-8"),"utf-8");
	 * List<GoodsInfo> lst = dao.getGoodsListByType(dtype);
	 * //1.将list数据放到session中
	 * request.getSession().setAttribute("GoodsListByType",lst); //重定向
	 * response.sendRedirect("goodlist.jsp"); }
	 */

	private void login(HttpServletRequest request, HttpServletResponse response) throws IOException {
				// 1 getData
				String userCode = request.getParameter("userCode") ;
				String userPwd = request.getParameter("userPwd");
				System.out.println(userCode + ", " + userPwd);
				// jdbc
				CustomerInfo ci = new DBImpl().Login(userCode, userPwd);
				if ( ci != null){
					Cookie ck1 = new Cookie("name",ci.getName());
					Cookie ck2 = new Cookie("address",ci.getAddress());
					Cookie ck3 = new Cookie("callPhone",ci.getCallPhone());
					Cookie ck4 = new Cookie("userId",ci.getUserId()+"");
					ck1.setPath("/WoermaDemo");
					ck2.setPath("/WoermaDemo");
					ck3.setPath("/WoermaDemo");
					ck4.setPath("/WoermaDemo");
					response.addCookie(ck1);
					response.addCookie(ck2);
					response.addCookie(ck3);
					response.addCookie(ck4);
					response.sendRedirect("success.html");
				}else if ( ( ci= new DBImpl().LoginManager(userCode, userPwd))!=null ){
					// 管理员登陆
					Cookie ck1 = new Cookie("name",ci.getName());
					Cookie ck2 = new Cookie("userId",ci.getUserId()+"");
					Cookie ck3 = new Cookie("permitted",ci.getPermitted());
					ck1.setPath("/WoermaDemo");
					ck2.setPath("/WoermaDemo");
					ck3.setPath("/WoermaDemo");
					response.addCookie(ck1);
					response.addCookie(ck2);
					response.addCookie(ck3);
					response.sendRedirect("successManager.jsp");
				}
				else{
					response.sendRedirect("failed.html");
				}
	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String address = request.getParameter("province") + "  " + request.getParameter("city");
		String email = request.getParameter("email");
		String callPhone = request.getParameter("callPhone");
		DBDao dao = new DBImpl();
		boolean registerKey = dao.register(name, password, address, email, callPhone);
		if (registerKey) {
			response.sendRedirect("login.jsp");
		}
	}

	private void buyInList(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// 1. 获取商品ID的信息
		int goodsId = Integer.parseInt(request.getParameter("goodsId"));
		int next = Integer.parseInt(request.getParameter("next"));
		String ty = request.getParameter("type");
		// 2. 业务
		boolean result = new DBImpl().buyOneGood(goodsId);
		if (result == true) {
			// 3. 调用页面goodlist.jsp
			request.getRequestDispatcher("goodlist.jsp?type=" + ty + "&next=" + next).forward(request, response);
		}
	}
}
