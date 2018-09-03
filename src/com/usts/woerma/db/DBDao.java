package com.usts.woerma.db;

import java.util.List;
import java.util.Map;

import com.usts.woerma.entity.CustomerInfo;
import com.usts.woerma.entity.GoodsInfo;
import com.usts.woerma.entity.ShopCart;

public interface DBDao {
	//�˿͵�½
	public CustomerInfo Login(String userCode,String userPwd);
	//��ȡ��Ʒ���
	public List<String> getGoodsType();
	//��ȡĳһ������Ʒ�б�
	public List<GoodsInfo> getGoodsListByType(String type,int next);
	//�����ȡĳһ��Ʒ���
	public List<GoodsInfo> getGoodType();
	//��ȡĳһ����Ʒ������Ϣ
	public GoodsInfo getGood(int gId);
	//����һ���������Ʒ
	public boolean buyOneGood(int gId);
	//��ȡ���ﳵ��ʵ����ķ�ʽ
	public List<ShopCart> getShopCart();
	//map�ķ�ʽ
	public List<Map<String, Object>> getShopCartEx();
	//ɾ��ǰ���ж��ܷ�ɾ��
	public boolean deleteKey(int gId);
	//ɾ���ҵĹ��ﳵ��������Ʒ��By��ƷId
	public boolean deleteInShopCart(int gId);
	//ɾ���ڹ��ﳵ�е�ĳ����Ʒ
	public boolean deleteGoodInShopCart(int gId);
	//֧��
	public boolean payInShopCart(int uId,double allMoney, String receiveName, String receiveAddress, String receiveTele);
	//��ȡ����,By�˿�Id
	public List<Map<String,Object>> getMyOrder(int userId);
	//��ȡ��������,By����Id
	public List<Map<String, Object>> getOrderDetail(int orderId);
	//��������
	public boolean pwdReset(String name,String password);
	//ע��
	public Boolean register(String name, String password, String address, String email, String callPhone);
	//����
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
