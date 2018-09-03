package com.usts.woerma.db;

import java.util.List;
import java.util.Map;

import com.usts.woerma.entity.CustomerInfo;
import com.usts.woerma.entity.GoodsInfo;
import com.usts.woerma.entity.ShopCart;

public interface DBDao {
	//顾客登陆
	public CustomerInfo Login(String userCode,String userPwd);
	//获取商品类别
	public List<String> getGoodsType();
	//获取某一类型商品列表
	public List<GoodsInfo> getGoodsListByType(String type,int next);
	//随机获取某一商品类别
	public List<GoodsInfo> getGoodType();
	//获取某一个商品具体信息
	public GoodsInfo getGood(int gId);
	//购买一个具体的商品
	public boolean buyOneGood(int gId);
	//获取购物车，实体类的方式
	public List<ShopCart> getShopCart();
	//map的方式
	public List<Map<String, Object>> getShopCartEx();
	//删除前先判断能否删除
	public boolean deleteKey(int gId);
	//删除我的购物车的任意商品，By商品Id
	public boolean deleteInShopCart(int gId);
	//删除在购物车中的某件商品
	public boolean deleteGoodInShopCart(int gId);
	//支付
	public boolean payInShopCart(int uId,double allMoney, String receiveName, String receiveAddress, String receiveTele);
	//获取订单,By顾客Id
	public List<Map<String,Object>> getMyOrder(int userId);
	//获取订单详情,By订单Id
	public List<Map<String, Object>> getOrderDetail(int orderId);
	//密码重置
	public boolean pwdReset(String name,String password);
	//注冊
	public Boolean register(String name, String password, String address, String email, String callPhone);
	//查找
	public List<GoodsInfo> selectGoodsListByName(String name);
	//
	public List<GoodsInfo> getGoodsList();
	//
	public GoodsInfo getGoodsDetailById(String goodsId);
	//
	public boolean goodsModify(GoodsInfo gi);
	//
	public boolean goodsAdd(GoodsInfo gi);
	//
	public CustomerInfo LoginManager(String userCode, String userPwd);
	//
	public boolean deleteManagerKey(int gId);
}
