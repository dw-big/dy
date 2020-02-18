//vue_server_000/app.js
//功能：服务器端程序
//1:下载四个模块
//  express			web服务器
//  mysql				mysql驱动
//  cors				处理跨域
//  express-session	会话session对象
//2:vue_server_000/进入命令行
//  npm i mysql express express-session cors
//3:加载四个第三方模块
const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
// const session = require("express-session");
const bodyParser=require("body-parser");

//4:配置数据库连接池:基本效率高保证
var pool = mysql.createPool({
   host:"127.0.0.1",
   user:"root", 
   password:"",
   database:"dy",
   port:3306,
   connectionLimit:15
})
//5:创建web服务器
var server = express();
//6:配置跨域  允许程序列表
//  http://127.0.0.1:8080
//  http://localhost:8080
server.use(cors({
   origin:["http://127.0.0.1:8080","http://localhost:8080"],
   credentials:true  //每次请求验证
}))
//7:配置session环境
// server.use(session({
//    secret:"128位安全字符串",
//    resave:true,         //请求更新数据 
//    saveUninitialized:true//保存初始数据
// }));
//8:配置静态目录 pubic
//8.1:创建public
server.use(express.static("public"))
//9:启动监听端口  5050
server.listen(5050);

// 功能一:查询号码是否存在
server.get("/register1",(req,res)=>{
   var $phone=req.query.phone;
   var sql="SELECT uid FROM dy_user WHERE phone=?";
   pool.query(sql,[$phone],(err,result)=>{
      if(err)throw err;
      if(result.length==0){
         res.send({code:1,msg:"手机号可以使用"});
      }else{
         res.send({code:-1,msg:"手机号已占用"});
      }
   })
})
//功能二:用户注册 
// bodyParser.json()
server.post("/register2",bodyParser.json(),(req,res)=>{
   let $createTime=req.body.data.createTime;
   let $phone=req.body.data.phone;
   let $fname=req.body.data.fname;
   let $fpwd=req.body.data.fpwd;
   let $avatar=req.body.data.avatar;
   let sql=`INSERT INTO dy_user VALUES(NULL,${$createTime},'${$fname}',md5(md5('${$fpwd}')),${$phone},NULL,'${$avatar}')`
   pool.query(sql,(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"注册成功"})
   })
})
//功能三:用户登录
server.get("/login",(req,res)=>{
 //1:获取参数uname/upwd
 //脚手架传数 
 // http://127.0.0.1:3000?uname=tom&upwd=123
 var phone = req.query.phone;
 var fpwd =  req.query.fpwd;
 //2:创建sql语句
 var sql = "SELECT uid,fname FROM dy_user WHERE phone=? AND fpwd=md5(md5(?))";
 //3:执行sql语句
 pool.query(sql,[phone,fpwd],(err,result)=>{
   //err 严重错误，程序停止
   if(err)throw err;
  //4:判断执行是否成功
   if(result.length==0){
     res.send({code:-1,msg:"用户名或密码有误"});
   }else{
        res.send({code:1,msg:"登录成功",data:result});
   }
  //5:将结果发送脚手架  
 })
})
// 功能四:获取轮播图
server.get("/banner",(req,res)=>{
   let sql="SELECT * FROM dy_index_carousel"
   pool.query(sql,(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"查询成功",data:result})
   })
})
// 功能五:查询首页商品
server.get("/index",(req,res)=>{
   let $title=req.query.title;
   let sql="SELECT * FROM dy_index_product WHERE title=?";
   pool.query(sql,[$title],(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"查询成功",data:result})
   })
})
// 功能六:查询商品列表图片
server.get("/listImg",(req,res)=>{
   let $title=req.query.title;
   let sql="SELECT * FROM dy_commodity_list_img WHERE title=?";
   pool.query(sql,[$title],(err,result)=>{
     if(err)throw err;
     res.send({code:1,msg:"查询成功",data:result})
   })
})
// 功能七:查询商品列表
server.get("/commodityList",(req,res)=>{
   let $title=req.query.title;
   let $e=req.query.id;
   if($e==0){
      // 综合排名
      var $sql="SELECT * FROM dy_commodity_list WHERE title=?";
   }else if($e==1){
      // 销量排名
      var $sql="SELECT * FROM dy_commodity_list WHERE title=? order by sold_count desc";
   }else if($e==2){
      // 新品
      var $sql="SELECT * FROM dy_commodity_list WHERE title=? order by shelf_time desc";
   }else if($e==3){
      // 价格升
      var $sql="SELECT * FROM dy_commodity_list WHERE title=? order by price";
   }else{
      // 价格降
      var $sql=" SELECT * FROM dy_commodity_list WHERE title=? order by price desc";
   }
   pool.query($sql,[$title],(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"查询成功",data:result})
   })
})
// 功能八:id查询商品列表
server.get("/commodityListId",(req,res)=>{
   let $nid=req.query.id;
   let $sql="SELECT * FROM dy_commodity_list WHERE nid=?";
   pool.query($sql,[$nid],(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"查询成功",data:result})
   })
})
// 功能九:请求商品规格
server.get("/dyLaptop",(req,res)=>{
    let $hid=req.query.id;
    let $sql="SELECT * FROM dy_laptop WHERE hid=?";
    pool.query($sql,[$hid],(err,result)=>{
       if(err)throw err;
       res.send({code:200,msg:"查询成功",data:result});
    })
})
// 功能十:请求商品详情图片
server.get("/dyLaptopImg",(req,res)=>{
   let $hid=req.query.id;
   let $sql="SELECT * FROM dy_laptop_img WHERE hid=?"
   pool.query($sql,[$hid],(err,result)=>{
      if(err)throw err;
      res.send({code:200,msg:"查询成功",data:result});
   })
})
// 功能十一:模糊查询
server.get("/productName",(req,res)=>{
   let $product_name=req.query.product_name;
   let $sql=`SELECT * FROM dy_commodity_list WHERE product_name LIKE '%${$product_name}%'`;
   pool.query($sql,(err,result)=>{
      if(err)throw err;
      if(result.length>0){
         res.send({code:1,msg:"查询成功",data:result})
      }else{
         res.send({code:0,msg:"查询物品不存在"})
      }
   })
})
// 功能十二:猜你喜欢   分页查询  收到客户端{pageNo:1,pagesize:10}
   //  sql语句如下：
   //  select * from table limit (1-1)*10, 10;
server.get("/cainixihu",(req,res)=>{
    let i=req.query.id;
   //  每页显示
    let pagesize=4;
   //  当前页数减一乘每页显示个数
    let pageNo=(i-1)*pagesize;
    let sql="SELECT * FROM dy_commodity_list limit ?,?";
    pool.query(sql,[pageNo,pagesize],(err,result)=>{
       if(err)throw err;
       res.send({code:1,msg:"查询成功",data:result});
    })
})
// 功能十三:加入购物车
server.get("/shoppingCart",(req,res)=>{
   let $shopp_id=req.query.shopp_id;
   let $shopp_img=req.query.shopp_img;
   let $shopp_count=req.query.shopp_count;
   let $shopp_title=req.query.shopp_title;
   let $shopp_price=req.query.shopp_price;
   let $spec=req.query.spec;
   let $href=req.query.href;
   let $uid=req.query.uid;
   let $sql1="SELECT shopp_count FROM dy_shopping_cart WHERE shopp_id=? and uid=?";
   let $sql2="UPDATE dy_shopping_cart SET shopp_count=? WHERE shopp_id=? and uid=?"
   let $sql3=`INSERT INTO dy_shopping_cart VALUES(NULL,${$shopp_id},'${$shopp_img}','${$shopp_title}','${$shopp_price}',${$shopp_count},'${$spec}','${$href}','${$uid}')`;
   pool.query($sql1,[$shopp_id,$uid],(err,result)=>{
      if(err)throw err;
      if(result.length>0){
         $shopp_count=parseInt($shopp_count)+parseInt(result[0].shopp_count);
         if($shopp_count>50.5){
            res.send({code:-1,msg:"已达单品购买上限"});
            return;
         }
         pool.query($sql2,[$shopp_count,$shopp_id,$uid],(req,result)=>{
            if(err)throw err;
            res.send({code:1,msg:"修改成功"})
         })
      }else{
         pool.query($sql3,(req,result)=>{
            if(err)throw err;
            res.send({code:2,msg:"添加成功"})
         })
      } 
   })
})
//功能十四:查询购物车
server.get("/Cartlist",(req,res)=>{
   let $uid=req.query.uid;
   let $sql="SELECT * FROM dy_shopping_cart WHERE uid=?";
   pool.query($sql,[$uid],(err,result)=>{
       if(err)throw err;
       res.send({code:1,msg:"查询成功",data:result})
   })
})
//功能十五:修改购物车单品数量
server.get("/xgshoppingCart",(req,res)=>{
   let $shopp_id=req.query.shopp_id;
   let $shopp_count=req.query.shopp_count;
   let $uid=req.query.uid;
   let $sql="UPDATE dy_shopping_cart SET shopp_count=? WHERE shopp_id=? and uid=?";
   pool.query($sql,[$shopp_count,$shopp_id,$uid],(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"修改成功"})
   })
})
// 功能十六:删除购物车单品
server.delete("/deleteshopp",(req,res)=>{
   let $shopp_id=req.query.shopp_id;
   let $uid=req.query.uid;
   let $sql="DELETE FROM dy_shopping_cart WHERE shopp_id=? and uid=?";
   pool.query($sql,[$shopp_id,$uid],(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"删除成功"})
   })
})
//功能十七:个人中心获取用户信息
server.get("/userxx",(req,res)=>{
   let $uid=req.query.uid;
   let $sql="SELECT fname,gender,avatar FROM dy_user WHERE uid=?";
   pool.query($sql,[$uid],(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"查询成功",data:result});
   })
})
// 功能十八:修改用户信息
server.post("/updateUser",bodyParser.json(),(req,res)=>{
    let $uid=req.body.data.uid;
    let $fname=req.body.data.fname;
    let $gender=req.body.data.gender;
    let $avatar=req.body.data.avatar;
    let $sql1="UPDATE dy_user SET fname=?,gender=?,avatar=? WHERE uid=?";
    if($gender=="3"){
      pool.query($sql1,[$fname,,$avatar,$uid],(err,result)=>{
         if(err)throw err;
         res.send({code:2,msg:"修改成功"});
      })
    }else{
      pool.query($sql1,[$fname,$gender,$avatar,$uid],(err,result)=>{
         if(err)throw err;
         res.send({code:1,msg:"修改成功"});
      })
   }
})
// 功能十九:添加收货地址信息
server.get("/address",(req,res)=>{
   let $aid=req.query.aid;
   let $user_id=req.query.user_id;
   let $receiver=req.query.receiver;
   let $province=req.query.province;
   let $address=req.query.address;
   let $cellphone=req.query.cellphone;
   let $is_default=req.query.is_default;
   if($is_default=='true'){
      $is_default=1;
   }else{
      $is_default=0;
   }
   let $sql=`INSERT INTO dy_receiver_address VALUES(NULL,${$user_id},'${$receiver}','${$province}','${$address}',${$cellphone},${$is_default})`;
   let $sql1="UPDATE dy_receiver_address SET receiver=?,province=?,address=?,cellphone=?,is_default=? WHERE aid=? and user_id=?"
   if($aid=="-1"){
      pool.query($sql,(err,result)=>{
         if(err)throw err;
         res.send({code:1,msg:"添加成功"});
      })
   }else{
      pool.query($sql1,[$receiver,$province,$address,$cellphone,$is_default,$aid,$user_id],(err,result)=>{
         if(err)throw err;
         res.send({code:1,msg:"修改成功"});
      })
   }
})
// 功能二十:查询收货地址信息
server.get("/address1",(req,res)=>{
   let $user_id=req.query.uid;
   let $sql="SELECT * FROM dy_receiver_address WHERE user_id=? order by is_default desc";
   pool.query($sql,[$user_id],(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"查询成功",data:result});
   })
})
// 功能二十一:修改默认状态
server.get("/updateAddress",(req,res)=>{
   let $user_id=req.query.user_id;
   let $aid=req.query.aid;
   let $is_default=req.query.is_default;
   if($is_default=='true'){
      $is_default=1;
   }else{
      $is_default=0;
   }
   let $sql="UPDATE dy_receiver_address SET is_default=? WHERE user_id=? and aid=?";
   pool.query($sql,[$is_default,$user_id,$aid],(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"修改成功"});
   })
})
// 功能二十二:删除一个收货地址信息
server.delete("/deleteAddress",(req,res)=>{
   let $user_id=req.query.user_id;
   let $aid=req.query.aid;
   let $sql="DELETE FROM dy_receiver_address WHERE user_id=? and aid=?";
   pool.query($sql,[$user_id,$aid],(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"删除成功"})
   })
})
//功能二十三: 未付款我的订单
server.get("/orderi",(req,res)=>{
   let $user_id=req.query.user_id;
   let $address_id=req.query.address_id;
   let $user_idshop_id=req.query.user_idshop_id;
   let $count=req.query.count;
   let $price=req.query.price;
   let $status=req.query.status;
   let $order_time=req.query.order_time;
   let $bz=req.query.bz;
   let $sql1=`INSERT INTO dy_order VALUES(NULL,${$user_id},${$address_id},${$user_idshop_id},${$count},${$price},${$status},${$order_time},NULL,NULL,NULL,NULL)`;
   let $sql2=`INSERT INTO dy_order VALUES(NULL,${$user_id},${$address_id},${$user_idshop_id},${$count},${$price},${$status},${$order_time},NULL,NULL,NULL,'${$bz}')`;
   if($bz==""){
      pool.query($sql1,(err,result)=>{
         if(err)throw err;
         res.send({code:1,msg:"未付款"})
      })
   }else{
      pool.query($sql2,(err,result)=>{
         if(err)throw err;
         res.send({code:1,msg:"未付款"})
      })
   }
})
// 功能二十四:删除购物车数据
server.delete("/deleteshopp1",(req,res)=>{
   let $uid=req.query.uid;
   let $sql="DELETE FROM dy_shopping_cart WHERE uid=?";
   pool.query($sql,[$uid],(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"删除成功"})
   })
})
// 功能二十五:修改支付状态
server.get("/updateOrder",(req,res)=>{
   let $user_id=req.query.user_id;
   let $order_time=req.query.order_time;
   let $status=2;
   console.log($order_time)
   let $sql="UPDATE dy_order SET status=? WHERE user_id=? and order_time=?";
   pool.query($sql,[$status,$user_id,$order_time],(err,result)=>{
      if(err)throw err;
      res.send({code:1,msg:"支付成功"})
   })
})