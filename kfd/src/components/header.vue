<template>
<!-- 页面头部 -->
   <div>
        <div id="header">
    <!--下载app -->
          <div id="ay">
              <div id="diyihang">
                  <router-link to="/" class="dia">
                      <div v-on:click.stop="yincan(1)"><img src="../assets/header/1579860588(1).jpg" id="img1"/></div>
                      <div v-on:click.stop="yincan(1)">大益茶业集团自营电商平台</div>
                  </router-link>
                  <div id="ay2">
                      <router-link to="javascript:;">钻石专区</router-link>
                      <span>|</span>
                      <div id="ay4">下载app
                        <div>
                          <img src="../assets/header/1573894876.jpg" />
                        </div>
                      </div>
                  </div>
              </div>
          </div>
			<!--固定导航栏  -->
          <div id="gd">
              <div id="gd1">
                  <div id="gd2">
                      <ul type="none" id="gd3">
                          <router-link to="/"><img v-on:click.stop="yincan(1)" src="../assets/header/1574125293(1).jpg" alt="这是首页"></router-link>
                          <li @click="issele(0)"><router-link to="/" class="iscolor">首页</router-link></li>
                          <li @click="issele(1)"><router-link to="/commodity-list/熟茶">熟茶</router-link></li>
                          <li @click="issele(2)"><router-link to="/commodity-list/生茶">生茶</router-link></li>
                          <li @click="issele(3)"><router-link to="/commodity-list/茶器">茶器</router-link></li>
                          <li @click="issele(4)"><router-link to="/commodity-list/茶道">茶道</router-link></li>
                          <li @click="issele(5)"><router-link to="/commodity-list/茶庭">茶庭</router-link></li>
                          <li @click="issele(6)"><router-link to="/commodity-list/宝盒">宝盒</router-link></li>
                          <li @click="issele(7)"><router-link to="/commodity-list/食鲜">食鲜</router-link></li>
                      </ul>
                  </div>
                  <ul type="none">
                      <li>
                          <span @click="yincan(0)"></span>
                          <div id="hf" :class="{'hf1':dd}">
                              <div></div>
                              <input type="text" v-model="searchshop" placeholder="请输入商品名称" v-focus/>
                              <span v-on:click.stop="yincan(1)"></span>
                          </div>
                      </li>
                      <li id="li1">
                          <div id="ulx">
                              <div><router-link :to="this.uid==undefined?'/login':'/ucenter/ucenterRighta'">个人中心</router-link></div>
                              <div><router-link :to="this.uid==undefined?'/login':'/onents/0'">我的订单</router-link></div>
                              <div><router-link :to="this.uid==undefined?'/login':'/friends-service/message'">我的消息</router-link></div>
                              <div v-if="this.uid==undefined"><router-link to="/login">登录</router-link></div>
                              <div v-else @click="nologin" class="ulxa">退出登录</div>
                          </div>
                      </li>
                      <li id="li2">
                        <!-- 上标 -->
                          <el-badge v-if="this.$store.getters.getCount>0" :value="this.$store.getters.getCount" class="item"></el-badge>
                          <div id="ulx1">
                              <div class="shopping-cart-list1" v-if="this.uid==undefined">
                                <div>
                                  <router-link to="/login"><span style="color:#44a870">登录</span></router-link>后查看<br />
									没有账号?免费
                                  <router-link to="/register1"><span style="color:#44a870">注册</span></router-link>
                                </div>
                              </div>
                              <div class="shopping-cart-list1" v-else-if="this.$store.getters.getstcartlist<1">
                                <div>
                                  <span>你的购物车还是空的</span><br/>
                    遇到喜欢的茶，要快下手哦
                                </div>
                              </div>
                              <div class="shopping-cart-list2" v-else>
                                 <router-link v-for="(item,i) of this.$store.getters.getstcartlist" :to="item.href" :key="i">
                                   <img :src="`http://127.0.0.1:5050/${item.shopp_img}`"/>
                                   <div class="shopping-cart-list3">
                                     <span>	{{item.shopp_title}}</span>
                                     <span>{{item.spec}}</span>
                                   </div>
                                   <span class="refund-price">￥{{item.shopp_price}}&nbsp;x&nbsp;{{item.shopp_count}}</span>
                                 </router-link>
                              </div>
                              <div>
									共计{{this.$store.getters.getCount}}件商品
                              </div>
                              <router-link :to="this.uid==undefined?'/login':'/shopping-cart'"><button>查看我的购物车</button></router-link>
                          </div>
                      </li>
                  </ul>
              </div>
          </div>
      </div>
   </div>
</template>
<script>
export default {
  // 导航栏
  data(){
      return{
        dd:true,
        // 登录状态
        uid:"",
        // 双向绑定   查询商品
        searchshop:"",
      }
  },
  methods: {
    // 显示隐藏
    yincan(e){
      e=="0"?this.dd=false:this.dd=true;
    },
    // 导航栏移动
    dh(){
        window.onscroll=function(){
            var scrllTop=document.documentElement.scrollTop||document.body.scrollTop
            if(scrllTop>=40){
                gd.style.transform="translateY(-40px)";
            }else{
                gd.style.transform="translateY(0)";
            }
        }
    },
    // 导航栏变色
    issele(e){
      let gd3=document.querySelectorAll("#gd3>li>a");
      for(var i of gd3){
        i.classList.remove("iscolor");
      }
      if(e>=0&&e<=7){
        gd3[e].classList.add("iscolor");
      } 
    },
    // 根据路由导航栏变色
    xuanran(){
      let gd3=document.querySelectorAll("#gd3>li>a");
      let router_path=this.$route.path;
      if(router_path=="/"){
         gd3[0].classList.add("iscolor");
      }else{
         gd3[0].classList.remove("iscolor");
      }
    },
      // 登录状态
    state(){
      this.uid=$cookies.get("keys1");
    },
    // 退出登录
    nologin(){
      this.uid=undefined;
      $cookies.remove("keys1");
      $cookies.remove("fname");
      // 退出登录后清空vuex数量数据
      this.$store.commit("clearCount");
      // 退出后清空vuex购物车数据
      this.$store.commit("clearcartlist");
      // 退出后清空vuex收货地址信息
      this.$store.commit("celarListSH");
      this.$router.push("/login");
    },
    // 搜索
    search1(){
      if(this.searchshop!=''){
        let _this = this;
        document.onkeydown = function(e){
          let _key = window.event.keyCode;
            if(_key==13){
            _this.$router.push(`/search/${_this.searchshop}`);
            }
        }
      }
    },
    // 购物车数据
    shoppCart(){
      if(this.uid!=undefined){
        this.axios.get("/Cartlist",{params:{uid:this.uid}})
        .then(res => {
          //  先清空vuex初始购物车数据
           this.$store.commit("clearcartlist");
           this.$store.commit("addcartlist",res.data.data);
        })
      }
    }
  },
  beforeCreate(){
  
  },
  created(){
    this.dh();
      // 创建时查询登录状态
      this.state();
      // 查询购物车
      this.shoppCart()
  },
  beforeMount(){
  },
  mounted(){
    this.xuanran();
  },
  beforeUpdate() {
   
  },
  updated() {
    
  },
  watch:{
    // 监听路由
    $route(to,from){
      this.xuanran();
       // 创建时查询登录状态
      this.state();
       // 查询购物车
     this.shoppCart()
      if(this.$route.name=="search"){
        this.yincan(1);
        this.searchshop="";
      }
    },
    searchshop(){
       // 查询
      this.search1();
    }
  },
  destroyed() {
 
  },
}
</script>
<style scoped>
*{margin:0;padding:0}

a:hover{
  text-decoration:none;
}
p{margin:0;}
/* 导航栏选择变色 */
.iscolor{
    color:#44a870 !important;
    border-bottom:2px solid #44a870;
}
/*下载app*/
.container{
  margin:0 0;
  padding:0 0;
  max-width:100%;
}
#header{
  width:100%;
  font-family:PingFangSC-Regular,Microsoft YaHei,
  Heiti SC,tahoma,arial,Hiragino Sans GB,
  \\\5B8B\4F53,"sans-serif";
  min-width:1200px;
  z-index:4564;
}
#ay{
  width:100%;height:40px;
  background:#333333;
}
#diyihang{
  width:1200px;
  margin:0 auto;
  color:#b0b0b0;
  font-size:12px;
  display:flex;
  justify-content:space-between;
}
.dia{
    width:170px;
    display: flex;
    justify-content: center;
    line-height: 40px;
}
#img1{
    width:25px;
    height:16px;
}
#ay1{
  width:202.563px;
  height:40px;
  color:#b0b0b0;
  display:flex;
}
#ay1>img{
  width:40px;height:40px;

}
#ay1>p{
  margin-top:12px;
}
#ay2{
  width:125.5px;height:28px;
  display:flex;
  justify-content:space-between;
  margin-top:12px;
  position:relative;
}
#ay2>a{color:#b0b0b0;}
#ay4{
   width:50px;height:40px;
   z-index:100;
   cursor:pointer;
}
#ay4>div{
  margin-top:9px;
  width:200px;
  height:0px;
  overflow:hidden;
  transition:height .5s linear;
}
#ay4:hover>div{ 
  height:220px;
}
/*固定导航栏*/
#gd{
  width:100%;height:60px;
  color:#7e7e7e;
  font-size:14px;
  background:#fff;
  box-shadow:2px 2px rgba(0,0,0,0.1);
  z-index:60;
  position: fixed;
}
#gd1{
  width:1200px;height:60px;
  margin:0 auto;
  display:flex;
  justify-content:space-between;
} 
#gd3{
  width:722px;height:60px;
  line-height:60px;
  display:flex;
  justify-content:space-between;
}
#gd3>li a{
  width:28px;height:58px;
  display:block;
  color:#7e7e7e;
}
#gd3>li a:hover{
   color:#44a870;
}
.xh{ 
  border-bottom:2px solid #44a870;
}
#gd1>ul{
  display:flex;
}
#gd1>ul>li{
  width:60px;height:60px;
  position:relative;
}
#gd1>ul>li:first-child span:first-child::before{
  content:"";
  display:block;
  width:57px;height:60px;
  background:url(../assets/header/1574125452.jpg) no-repeat 5px 5px;
}
#gd1>ul>li:first-child span:hover::before{
  background:url(../assets/header/1574158023.png) no-repeat;
}
#li1::before{
  content:"";
  display:block;
  width:57px;height:58px;
  background:url(../assets/header/1574125480.jpg) no-repeat 5px 5px;
}
#li1:hover::before{
  background:url(../assets/header/1574158034.png) no-repeat;
  border-bottom:2px solid #44a870;
  cursor:pointer;
}
#gd1>ul>li:nth-child(3)::before{
  content:"";
  display:block;
  width:57px;height:58px;
  background:url(../assets/header/1574125551.jpg) no-repeat 5px 5px;
}
#gd1>ul>li:nth-child(3):hover::before{
  background:url(../assets/header/1574158041.png) no-repeat;
  border-bottom:2px solid #44a870;
  cursor:pointer;
}
#hf{
  background:#fff;
  width:1200px;height:60px;
  text-align:center;  
  position:absolute;
  top:0px;
  left:-870px;
  z-index:20;
}
.hf1{
    display:none;
}
#hf>input{
  width:580px;height:56px;
  border:1px solid #fff;
  outline:0;
  float:left;
}
#hf>div::before{
  content:"";
  display:block;
  width:60px;height:60px;
  line-height:60px;
  background:url(../assets/header/1574125452.jpg) no-repeat;
  float:left;
}
#hf>span::after{
  content:"";
  display:block;
  width:60px;height:60px;
  background:url(../assets/header/1574149869.jpg) no-repeat 5px 15px;
  float:left;
}
#li1:hover #ulx{
  height:200px;
}
#ulx{
  width:300px;
  height:0px;
  margin-left:-50px;
  box-shadow:0 6px 6px 0 rgba(0,0,0,.05);
  overflow:hidden;
  background: #fff !important;
  transition:all .5s linear; 
}
#li1>#ulx>div>a,.ulxa{
  display:block;
  padding:14px 0 14px 10px;
  color:#767676;
  font-size:16px;
  border:1px solid #ececec;
  font-size: 16px;
  background:#fff;
}
#li1>#ulx>div:not(:last-child) a:hover{
  color:#000;
}
#li1>#ulx>div:last-child a,.ulxa{
  color:#44a870;
  cursor: pointer;
}
#li1>#ulx>div{
   width:300px;height:50px;
}
#li2{
  background:#fff;
}
/* 上标 */
.item{
  position: absolute;
  top:20px;
  left:42px;
}
#ulx1{
  width:350px;height:0px;
  background:#fff !important;
  margin-left:-150px;
  box-shadow:0 6px 13px rgba(0,0,0,.1);
  text-align:center;
  overflow:hidden;
  transition:all .5s linear;
}
/* 购物车 */
.shopping-cart-list1{
  height:300px;
  font-size:16px;
  padding-top:60px;
}
.shopping-cart-list2{
  height:360px;
}
.shopping-cart-list2>a>span{
  line-height:120px; 
}
.shopping-cart-list2>a{
  height: 120px;
  display: block;
  display: flex;
  justify-content: space-around;
}
.shopping-cart-list2>a:not(:first-child){
  border-top:1px solid #ececec;
}
.shopping-cart-list2>a>img{
  margin-top:15px;
  width:80px;
  height:80px;
}
.shopping-cart-list3>span{
  text-align: left;
   width:100%;
  height:22px;
}
.shopping-cart-list3{
   width:145px;
  display: flex;
  flex-flow: column;
  margin-top:30px;
}
#ulx1>div:nth-child(2){
  height:40px;
  line-height:40px;
  border-top:1px solid #ececec;
  border-bottom:1px solid #ececec;
}
#ulx1 button{
  width:320px;
  height:40px;
  line-height:40px;
  color:#fff;
  background:#44a870;
  border-radius:2px;
  border:0px;
  margin:21px 15px 0px;
  outline: 0;
  cursor: pointer;
}
#gd1>ul>li:nth-child(3):hover #ulx1{
  cursor:pointer;
  height:500px;
}
</style>