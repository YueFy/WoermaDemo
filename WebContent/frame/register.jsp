<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body style="background-image: url(../img/backg.jpg)">
	<script type="text/javascript">
		//定义了城市的二维数组，里面的顺序跟省份的顺序是相同的。通过selectedIndex获得省份的下标值来得到相应的城市数组
		 var city=[
	["北京","天津","上海","重庆","香港","澳门"],
     ["石家庄","唐山","秦皇岛","邯郸","邢台","保定","张家口","承德","沧州","廊坊","衡水"],
     ["太原","大同","阳泉","长治","晋城","朔州","晋中","运城","忻州","临汾","吕梁"],
     ["呼和浩特","包头","乌海","赤峰","通辽","鄂尔多斯","呼伦贝尔","巴彦淖尔","乌兰察布","兴安","锡林郭勒","阿拉善"],
     ["沈阳","大连","鞍山","抚顺","本溪","丹东","锦州","营口","阜新","辽阳","盘锦","铁岭","朝阳","葫芦岛"],
     ["长春","吉林","四平","辽源","通化","白山","松原","白城","延边"],
     ["哈尔滨","齐齐哈尔","鸡西","鹤岗","双鸭山","大庆","伊春","佳木斯","七台河","牡丹江","黑河","绥化","大兴安岭"],
     ["南京","苏州","扬州","无锡","徐州","常州","南通","连云港","淮安","盐城","镇江","泰州","宿迁"],
     ["杭州","宁波","温州","嘉兴","湖州","绍兴","金华","衢州","舟山","台州","丽水"],
     ["合肥","芜湖","蚌埠","淮南","马鞍山","淮北","铜陵","安庆","黄山","滁州","阜阳","宿州","巢湖","六安","亳州","池州","宣城"],
     ["福州","宁德","南平","厦门","莆田","三明","泉州","漳州"],
     ["南昌","上饶","萍乡","九江","景德镇","新余","鹰潭","赣州","吉安","宜春","抚州"],
     ["济南","青岛","淄博","枣庄","东营","烟台","潍坊","威海","济宁","泰安","日照","莱芜","临沂","德州","聊城","滨州","菏泽"],
     ["郑州","开封","洛阳","平顶山","焦作","鹤壁","新乡","安阳","濮阳","漯河","许昌","三门峡","南阳","商丘","信阳","周口","驻马店"],
     ["武汉","十堰","襄樊","鄂州","黄石","荆州","宜昌","荆门","孝感","黄冈","咸宁","随州","恩施"],
     ["长沙","株洲","湘潭","岳阳","邵阳","常德","衡阳","张家界","益阳","郴州","永州","怀化","娄底","湘西"],
     ["广州","清远","潮州","东莞","珠海","深圳","汕头","韶关","佛山","江门","湛江","茂名","肇庆","惠州","梅州","汕尾","阳江","河源","中山","揭阳","云浮"],
     ["南宁","柳州","桂林","梧州","北海","防城港","钦州","贵港","玉林","百色","贺州","河池","来宾","崇左"],
     ["海口","三亚"],
     ["成都","自贡","攀枝花","泸州","德阳","绵阳","广元","遂宁","内江","乐山","南充","宜宾","广安","达州","眉山","雅安","巴中","资阳","阿坝","甘孜","凉山"],
     ["贵阳","六盘水","遵义","安顺","铜仁","毕节","黔西南","黔东南","黔南"],
     ["昆明","曲靖","玉溪","保山","昭通","丽江","普洱","临沧","文山","红河","西双版纳","楚雄","大理","德宏","怒江","迪庆"],
     ["拉萨","昌都","山南","日喀则","那曲","阿里","林芝"],
     ["西安","铜川","宝鸡","咸阳","渭南","延安","汉中","榆林","安康","商洛"],
     ["兰州","白银","定西","敦煌","嘉峪关","金昌","天水","武威","张掖","平凉","酒泉","庆阳","临夏","陇南","甘南"],
     ["西宁","海东","海北","黄南","海南","果洛","玉树","海西"],
     ["银川","石嘴山","吴忠","固原","中卫"],
     ["乌鲁木齐","克拉玛依","吐鲁番","哈密","和田","阿克苏","喀什","克孜勒苏柯尔克孜","巴音郭楞蒙古","昌吉","博尔塔拉蒙古","伊犁哈萨克","阿勒泰"],
     ["台北","高雄","基隆","台中","台南","新竹","嘉义"]
     ];

		function getCity() {
			//获得省份下拉框的对象
			var sltProvince = document.frmRegister.province;
			//获得城市下拉框的对象
			var sltCity = document.frmRegister.city;
			//得到对应省份的城市数组
			var provinceCity = city[sltProvince.selectedIndex - 1];

			//清空城市下拉框，仅留提示选项
			sltCity.length = 1;

			//将城市数组中的值填充到城市下拉框中
			for (var i = 0; i < provinceCity.length; i++) {
				sltCity[i + 1] = new Option(provinceCity[i], provinceCity[i]);
			}
		}
		function checkName(){
			var name = document.getElementById("name").value;
			if (name.trim().length == 0) {
				document.getElementById("idUserNameTip").innerHTML = "用户名不能为空";
                document.getElementById("submit").disabled = true;
				return false;
			}else{
				document.getElementById("idUserNameTip").innerHTML ="";
				return true;
			}
		}
		function checkPwd() {
			var password = document.getElementById("password").value;
			var pwdtwice = document.getElementById("pwdtwice").value;
			if (password == pwdtwice) {
				document.getElementById("idTwicePwdTip").innerHTML=("✔");
                document.getElementById("submit").disabled = false;
				return true;
			} else {
				document.getElementById("idTwicePwdTip").innerHTML=("×");
                document.getElementById("submit").disabled = true;
				return false;
			}
		}
	</script>
	<form action="register.action" name="frmRegister" >
		<center>
			<h3>注册页面</h3>
			<table border="1" width="97%">
				<tr>
					<td align="right" width="27%">用户名：</td>
					<td width="40%"><input name="name" type="text" id="name"
						style="width: 95%"  onkeydown="return checkName()" onkeyup="return checkName()"></td>
					<td align="left" width="30%"><span id="idUserNameTip"></span></td>
				</tr>
				<tr>
					<td align="right" width="27%">密码：</td>
					<td width="40%"><input name="password" type="password" id="password"
						style="width: 95%"></td>
					<td align="left" width="30%"><span id="idUserPwdTip" ></span></td>
				</tr>
				<tr>
					<td align="right" width="27%">再输一次密码：</td>
					<td width="40%"><input name="twicePwd" type="password" id="pwdtwice"
						style="width: 95%" onkeyup="return checkPwd()"></td>
					<td align="left" width="30%"><span id="idTwicePwdTip"></span></td>
				</tr>
				<tr>
					<td align="right" width="27%">住宅地址：</td>
					<td width="40%">
						<select name="province" onChange="getCity()">
							 <option value="null" selected="selected">请选择</option>
       						 <option value="直辖市">直辖市</option>
       						 <option value="河北">河北</option>
        					<option value="山西">山西</option>
       					  	 <option value="内蒙古">内蒙古</option>
     					     <option value="辽宁">辽宁</option>
          					<option value="吉林">吉林</option>
         					 <option value="黑龙江">黑龙江</option>
         					 <option value="江苏">江苏</option>
         					 <option value="浙江">浙江</option>
         					 <option value="安徽">安徽 </option>
       						 <option value="福建">福建 </option>
         					 <option value="江西">江西</option>
         					 <option value="山东">山东</option>
         					 <option value="河南">河南</option>
         					 <option value="湖北">湖北</option>
          					<option value="湖南">湖南</option>
          					<option value="广东">广东</option> 
         					 <option value="广西">广西</option>
            				<option value="海南">海南</option>
         					 <option value="四川">四川</option>
          					<option value="贵州">贵州</option>
         					 <option value="云南">云南</option>
          					<option value="西藏">西藏</option>
          					<option value="陕西">陕西 </option>
        					<option value="甘肃">甘肃 </option>
          					<option value="青海">青海</option>
            				<option value="宁夏">宁夏</option>
          					<option value="新疆">新疆</option>
         					 <option value="台湾">台湾</option>   
        				 </select>
						<select name="city">
							<option value="0">请选择所在城市</option>
						</select>
						</td>
					<td align="left" width="30%"><span id="idAddressTip"></span></td>
				</tr>
				<tr>
					<td align="right" width="27%">邮箱地址：</td>
					<td width="40%"><input name="email" type="text"
						style="width: 95%"></td>
					<td align="left" width="30%"><span id="idEmailTip"></span></td>
				</tr>
				<tr>
					<td align="right" width="27%">联系电话：</td>
					<td width="40%"><input name="callPhone" type="text"
						style="width: 95%"></td>
					<td align="left" width="30%"><span id="idUserPwdTip"></span></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="submit"
						value="注&nbsp;册"></td>
				</tr>
			</table>
		</center>
	</form>
</body>
</html>