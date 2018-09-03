package com.usts.woerma.db;

import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import com.sun.corba.se.spi.ior.ObjectKey;
import com.usts.woerma.entity.CustomerInfo;
import com.usts.woerma.entity.GoodsInfo;
import com.usts.woerma.entity.ShopCart;

import sun.print.resources.serviceui;

public class DBImpl implements DBDao {
	@Override
	public CustomerInfo Login(String userCode, String userPwd) {
		CustomerInfo ci = null;
		try {
			// select * from shop_customer where name='customer' and
			// password='123456';
			String sql = "select * from shop_customer "
					+ " where name='"+userCode+"' and password= '"+userPwd+"' ;";
			Connection ct = DBUtil.getConnect();
			PreparedStatement st = ct.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				ci = new CustomerInfo(rs.getInt("userId"),
						rs.getString("name"), rs.getString("email"),
						rs.getString("address"), rs.getString("callPhone"));
			}
			rs.close();
			st.close();
			ct.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ci;
	}
	
	@Override
	public CustomerInfo LoginManager(String userCode, String userPwd) {
		CustomerInfo ci = null;
		try {
			// select * from shop_manager where name='manager' and
			// password='123456';
			String sql = "select * from shop_manager "
					+ " where name='"+userCode+"' and password= '"+userPwd+"' ;";
			Connection ct = DBUtil.getConnect();
			PreparedStatement st = ct.prepareStatement(sql);
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				ci = new CustomerInfo(rs.getInt("userId"),
						rs.getString("name"), rs.getString("permitted"));
			}
			rs.close();
			st.close();
			ct.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ci;
	}
	
	@Override
	public boolean goodsAdd(GoodsInfo gi) {
		boolean bRet = false;
		// TODO Auto-generated method stub
		// insert into tableName (field) values ('')
		try{
			Connection ct = DBUtil.getConnect();
			String sql = "insert into shop_goods ("
					+ "goodsName,goodsType,goodsPrice,"
					+ "goodsDate,goodsAmount,goodsImgUrl,"
					+ "goodsIntroduction) "
					+ "values(?,?,?,?,?,?,?)";
			PreparedStatement pt = ct.prepareStatement(sql);
			pt.setString(1, gi.getGoodsName());
			pt.setString(2, gi.getGoodsType());
			pt.setDouble(3, gi.getGoodsPrice());
			new Date();
			// pt.setString(4, new java.sql.Date(new java.util.Date().getTime()).toString());
			pt.setDate(4, new java.sql.Date(
							new java.util.Date().getTime()));
			pt.setInt(5,gi.getGoodsAmount());
			pt.setString(6, gi.getGoodsImgUrl());
			pt.setString(7, gi.getGoodsIntroduction());
			
			pt.execute();
			bRet = true;
			pt.close();
			ct.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return bRet;
	}

	public boolean deleteManagerKey(int gId){
		boolean bRet = false;
		try {
				Connection ct  = DBUtil.getConnect();
				String sql = "delete from shop_goods where goodsId = "+gId+";";
				PreparedStatement pt = ct.prepareStatement(sql);
				pt.execute();
				bRet = true;
				pt.close();
				ct.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bRet;
	}
	
	public boolean goodsModify(GoodsInfo gi) {
		boolean bRet = false;
		try{
			Connection ct = DBUtil.getConnect();
			String sql = "update shop_goods "
					+ "set goodsName=?,"
					+ "goodsType=?,"
					+ "goodsPrice=?,"
					+ "goodsDate=?,"
					+ "goodsAmount=?,"
					+ "goodsImgUrl=?,"
					+ "goodsIntroduction=? "
					+ "where goodsId = ?";
			PreparedStatement pt = ct.prepareStatement(sql);
			pt.setString(1, gi.getGoodsName());
			pt.setString(2, gi.getGoodsType());
			pt.setDouble(3, gi.getGoodsPrice());
			new Date();
			// pt.setString(4, new java.sql.Date(new java.util.Date().getTime()).toString());
			pt.setDate(4, new java.sql.Date(
							new java.util.Date().getTime()));
			pt.setInt(5,gi.getGoodsAmount());
			pt.setString(6, gi.getGoodsImgUrl());
			pt.setString(7, gi.getGoodsIntroduction());
			pt.setInt(8,gi.getGoodsId());
			
			pt.execute();
			bRet = true;
			pt.close();
			ct.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return bRet;
	}
	
	@Override
	public GoodsInfo getGoodsDetailById(String goodsId) {
		GoodsInfo gi = null;
		try {
			// select * from shop_goods where goodsId=1;
			String sql = "select * from shop_goods " + "where goodsId = ? ";
			Connection ct = DBUtil.getConnect();
			PreparedStatement st = ct.prepareStatement(sql);
			st.setString(1, goodsId);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				gi = new GoodsInfo(rs.getInt("goodsId"),
						rs.getString("goodsName"), rs.getString("goodsType"),
						rs.getDouble("goodsPrice"), rs.getString("goodsDate"),
						rs.getInt("goodsAmount"), rs.getString("goodsImgUrl"),
						rs.getString("goodsIntroduction"));
			}
			rs.close();
			st.close();
			ct.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return gi;
	}
	
	@Override
	public List<GoodsInfo> getGoodsList() {
		List<GoodsInfo> lst = new ArrayList<>();
		try{
			Connection ct = DBUtil.getConnect();
			Statement st = ct.createStatement();
			String sql = "select * from shop_goods";
			ResultSet rs = st.executeQuery(sql);
			while (  rs.next() ){
				lst.add(new GoodsInfo(rs.getInt("goodsId"),
						rs.getString("goodsName"),
						rs.getString("goodsType"),
						rs.getDouble("goodsPrice"),
						rs.getString("goodsDate"),
						rs.getInt("goodsAmount"),
						rs.getString("goodsImgUrl"),
						rs.getString("goodsIntroduction")));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return lst;
	}

	@Override
	public List<String> getGoodsType() {
		List<String> lst = new ArrayList<>();
		try {
			Connection ct = DBUtil.getConnect();
			Statement st = ct.createStatement();
			// String sql = "select goodsType from shop_goods group by
			// goodsType";
			String sql = "select distinct goodsType from shop_goods order by rand()";
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				lst.add(rs.getString("goodsType"));
			}
			rs.close();
			st.close();
			ct.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}

	@Override
	public List<GoodsInfo> getGoodsListByType(String type, int next) {
		List<GoodsInfo> lst = new ArrayList<>();
		try {
			String sql = "select * from shop_goods where goodsType=? limit ?,2";
			Connection ct = DBUtil.getConnect();
			PreparedStatement st = ct.prepareStatement(sql);
			st.setString(1, type);
			st.setInt(2, next);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				lst.add(new GoodsInfo(rs.getInt("goodsId"), rs.getString("goodsName"), rs.getString("goodsType"),
						rs.getDouble("goodsPrice"), rs.getString("goodsDate"), rs.getInt("goodsAmount"),
						rs.getString("goodsImgUrl"), rs.getString("goodsIntroduction")));
			}
			rs.close();
			st.close();
			ct.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}

	@Override
	public List<GoodsInfo> getGoodType() {
		List<GoodsInfo> lst = new ArrayList<>();
		try {
			Connection ct = DBUtil.getConnect();
			Statement st = ct.createStatement();
			// String sql = "select goodsType from shop_goods group by
			// goodsType";
			String sql = "select * from shop_goods where goodsType = (select distinct goodsType from shop_goods order by rand() limit 1)";
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				lst.add(new GoodsInfo(rs.getInt("goodsId"), rs.getString("goodsName"), rs.getString("goodsType"),
						rs.getDouble("goodsPrice"), rs.getString("goodsDate"), rs.getInt("goodsAmount"),
						rs.getString("goodsImgUrl"), rs.getString("goodsIntroduction")));
			}
			rs.close();
			st.close();
			ct.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}

	@Override
	public GoodsInfo getGood(int gId) {
		GoodsInfo goodsInfo = new GoodsInfo();
		try {
			Connection ct = DBUtil.getConnect();
			String sql = "select * from shop_goods where goodsId = '" + gId + "' ";
			PreparedStatement st = ct.prepareStatement(sql);
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				goodsInfo = new GoodsInfo(rs.getInt("goodsId"), rs.getString("goodsName"), rs.getString("goodsType"),
						rs.getDouble("goodsPrice"), rs.getString("goodsDate"), rs.getInt("goodsAmount"),
						rs.getString("goodsImgUrl"), rs.getString("goodsIntroduction"));
			}
			rs.close();
			st.close();
			ct.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return goodsInfo;
	}

	@Override
	public boolean buyOneGood(int gId) {
		// 1. 该商品库存-1
				// 2. 我的购物车如果存在这个商品，update 商品数量+1
				//  		不存在，insert into记录，商品数量=1
				boolean bRet = false;
				try {
					Connection ct  = DBUtil.getConnect();
					Statement st  = ct.createStatement();
					ct.setAutoCommit(false);
					// 1 ....
					String sql = "update shop_goods "
							+ "set goodsAmount=goodsAmount-1 "
							+ "where goodsId="+gId;
					st.executeUpdate(sql);
					// 2. 
					sql = "update shop_cart "
							+ " set orderAmount=orderAmount+1 "
							+ " where goodsId="+gId;
					int change = st.executeUpdate(sql);
					if ( change == 0 ){
						// insert into
						//insert into shop_cart(goodsId,orderAmount,buyTime) values(1,1,"2018-07-12");
						String s = new SimpleDateFormat("yyyy-MM-dd")
								.format(new Date());
					
						sql = "insert into shop_cart "
							+ "(goodsId,orderAmount,buyTime) "
							+ " values ("
							+ gId
							+ ",1,'"
							+ s
							+ "')";
						
						st.execute(sql);
					}
					ct.commit();
					bRet = true;
					st.close();
					ct.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return bRet;
	}

	@Override
	public List<ShopCart> getShopCart() {
		List<ShopCart> lst = new ArrayList<>();
		try {
			Connection ct = DBUtil.getConnect();
			Statement st = ct.createStatement();
			String sql = "select c.goodsId,c.orderAmount,c.buyTime,"
					+ "g.goodsPrice,g.goodsType,g.goodsName"
					+ " from shop_cart c , shop_goods g "
					+ "where c.goodsId=g.goodsId;";
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				lst.add(new ShopCart(rs.getInt("goodsId"), rs.getString("goodsName"), rs.getString("goodsType"),
						rs.getDouble("goodsPrice"), rs.getString("buyTime"), rs.getInt("orderAmount")));
			}
			rs.close();
			st.close();
			ct.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}

	@Override
	public List<Map<String, Object>> getShopCartEx() {
		List<Map<String, Object>> lst = new ArrayList<>();
		try {
			Connection ct = DBUtil.getConnect();
			Statement st = ct.createStatement();
			String sql = "select c.goodsId,c.orderAmount,c.buyTime,"
					+ "g.goodsPrice,g.goodsType,g.goodsName"
					+ " from shop_cart c , shop_goods g "
					+ "where c.goodsId=g.goodsId;";
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				Map<String,Object> map =new HashMap<>();
			    map.put("goodsId",rs.getInt("goodsId"));
			    map.put("goodsName",rs.getString("goodsName"));
			    map.put("goodsType",rs.getString("goodsType"));
			    map.put("goodsPrice",rs.getDouble("goodsPrice"));
			    map.put("buyTime",rs.getString("buyTime"));
			    map.put("orderAmount",rs.getInt("orderAmount"));
				lst.add(map);
			}
			rs.close();
			st.close();
			ct.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}

	@Override
	public boolean deleteInShopCart(int gId) {
		boolean bRet = false;
		try {
				Connection ct  = DBUtil.getConnect();
				Statement st  = ct.createStatement();
				ct.setAutoCommit(false);
				// 1.
				String sql = "update shop_goods "
						+ "set goodsAmount=goodsAmount+1 "
						+ "where goodsId="+gId;
				st.executeUpdate(sql);
				// 2. 
				sql = "update shop_cart "
						+ " set orderAmount=orderAmount-1 "
						+ " where goodsId="+gId;
				st.executeUpdate(sql);
				ct.commit();
				bRet = true;
				st.close();
				ct.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bRet;
	}

	@Override
	public boolean deleteKey(int gId) {
		boolean delKey = false;
		try {
			Connection ct = DBUtil.getConnect();
			Statement st = ct.createStatement();
			String sql="select orderAmount from shop_cart where goodsId="+gId;
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				 if(rs.getInt("orderAmount")>1){
					 deleteInShopCart(gId);
					 delKey = true;
				 }else{
					 deleteInShopCart(gId);
					 deleteGoodInShopCart(gId);
					 delKey = true;
				 }
			}
			rs.close();
			st.close();
			ct.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return delKey;
	}

	@Override
	public boolean deleteGoodInShopCart(int gId) {
		boolean delKey = false;
		try {
			Connection ct = DBUtil.getConnect();
			Statement st = ct.createStatement();
			String sql="delete from shop_cart where goodsId="+gId;
			st.execute(sql);
			st.close();
			ct.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return delKey;
	}

	@Override
	public boolean payInShopCart(int uId, double allMoney, String receiveName, String receiveAddress,
			String receiveTele) {
		boolean payKey = false;
		try {
			Connection ct = DBUtil.getConnect();
			ct.setAutoCommit(false);
			String s = new SimpleDateFormat("yyyy-MM-dd")
					.format(new Date());
			//1
			String sql = "insert into shop_orderlist "
					+ "(userId,receiveName,receiveAddress,receiveTele,allMoney,status,buyTime) "
					+ "values ("
					+ uId
					+ ",'" +receiveName  + "','" +receiveAddress  + "','" +receiveTele  + "',"
					+ allMoney
					+ ",'已支付','"+s+"');";
			PreparedStatement st = ct.prepareStatement(sql);
			st.executeUpdate(sql);
			//2
			sql = "insert into shop_orderdetail (goodsId,buyAmount,orderId) select goodsId,orderAmount,(select @@identity) from shop_cart;";
			st = ct.prepareStatement(sql);
			st.executeUpdate(sql);
			//3
			sql="delete from shop_cart;";
			st.execute(sql);
			payKey = true;
			ct.commit();
			st.close();
			ct.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return payKey;
	}

	@Override
	public List<Map<String, Object>> getMyOrder(int userId) {
		List<Map<String, Object>> lst = new ArrayList<>();
		try {
			Connection ct = DBUtil.getConnect();
			ct.setAutoCommit(false);
			String sql = "select orderId,receiveName,receiveAddress,"
					+ "receiveTele,allMoney,status,buyTime"
					+ " from  shop_orderList"
					+ " where userId="+userId+";";
			PreparedStatement ps =ct.prepareStatement(sql);
			ResultSet rs = ps.executeQuery(sql);
			while (rs.next()) {
				Map<String,Object> map =new HashMap<>();
			    map.put("orderId",rs.getInt("orderId"));
			    map.put("userId",userId);
			    map.put("receiveName",rs.getString("receiveName"));
			    map.put("receiveAddress",rs.getString("receiveAddress"));
			    map.put("receiveTele",rs.getString("receiveTele"));
			    map.put("allMoney",rs.getDouble("allMoney"));
			    map.put("status",rs.getString("status"));
			    map.put("buyTime",rs.getString("buyTime"));
				lst.add(map);
			}
			rs.close();
			ct.commit();
			ps.close();
			ct.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}

	public List<Map<String, Object>> getOrderDetail(int orderId) {
		List<Map<String, Object>> lst = new ArrayList<>();
		try {
			Connection ct = DBUtil.getConnect();
			ct.setAutoCommit(false);
			String sql = "select o.id,o.orderId,o.goodsId,o.buyAmount,"
					+ "g.goodsName,g.goodsType,g.goodsPrice,g.goodsDate,g.goodsImgUrl"
					+ " from  shop_orderDetail o ,  shop_goods g"
					+ " where o.goodsId=g.goodsId and o.orderId="+orderId+";";
			PreparedStatement ps =ct.prepareStatement(sql);
			ResultSet rs = ps.executeQuery(sql);
			while (rs.next()) {
				Map<String,Object> map =new HashMap<>();
				map.put("id",rs.getInt("id"));
			    map.put("orderId",orderId);
			    map.put("goodsId",rs.getInt("goodsId"));
			    map.put("buyAmount",rs.getInt("buyAmount"));
			    map.put("goodsName",rs.getString("goodsName"));
			    map.put("goodsType",rs.getString("goodsType"));
			    map.put("goodsPrice",rs.getDouble("goodsPrice"));
			    map.put("goodsDate",rs.getDate("goodsDate"));
			    map.put("goodsImgUrl",rs.getString("goodsImgUrl"));
				lst.add(map);
			}
			rs.close();
			ct.commit();
			ps.close();
			ct.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}

	@Override
	public boolean pwdReset(String name,String password) {
		boolean resetKey = false;
		try {
			Connection ct = DBUtil.getConnect();
			ct.setAutoCommit(false);
			String sql="update shop_customer set password = '"+password +"' where name = '"+name+"';";
			PreparedStatement ps = ct.prepareStatement(sql);
			int change = ps.executeUpdate(sql);
			if(change==1){ resetKey = true; }
			ct.commit();
			ps.close();
			ct.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resetKey;
	}

	@Override
	public Boolean register(String name, String password, String address, String email, String callPhone) {
		boolean registerKey = false;
		try {
			Connection ct = DBUtil.getConnect();
			ct.setAutoCommit(false);
			String sql=" insert into shop_customer(name,password,address,email,callPhone) values ("
					+ "'"+name+"','"+password+"','"+address+"','"+email+"','"+callPhone+"'); ";
			PreparedStatement ps = ct.prepareStatement(sql);
			System.out.println(sql);
			int change = ps.executeUpdate(sql);
			System.out.println(change);
			if(change==1){ registerKey = true; }
			ct.commit();
			ps.close();
			ct.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return registerKey;
	}

	public List<GoodsInfo> selectGoodsListByName(String name) {
		List<GoodsInfo> lst = new ArrayList<>();
		try {
			String sql = "select * from shop_goods where goodsName like '%"+name+"%';";
			Connection ct = DBUtil.getConnect();
			PreparedStatement st = ct.prepareStatement(sql);
			System.out.println(sql);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				lst.add(new GoodsInfo(rs.getInt("goodsId"), rs.getString("goodsName"), rs.getString("goodsType"),
						rs.getDouble("goodsPrice"), rs.getString("goodsDate"), rs.getInt("goodsAmount"),
						rs.getString("goodsImgUrl"), rs.getString("goodsIntroduction")));
			}
			rs.close();
			st.close();
			ct.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lst;
	}
}
