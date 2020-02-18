<template>
<!-- 页面底部 -->
   <div id="footer ">
          <!-- 二维码-->
          <div class="erwei">
              <img src="../assets/header/1574490152(1).png" alt=""/>
              <p>微信扫码下载益友会APP</p>
              <p id="pj">买茶，聊茶，交益友</p>
          </div>
          <!-- 购物指南-->
          <div class="w1">
              <div class="w2">
                 <div>
                     <h5>购物指南</h5>
                     <div><router-link to="/helper/0">售前 | 支付 | 配送</router-link></div>
                     <div><router-link to="/helper/1">退款 | 售后</router-link></div>
                     <div><router-link to="/helper/2">关于茶票</router-link></div>
                     <div><router-link to="/helper/3">发票相关</router-link></div>
                 </div>
                 <div>
                     <h5>特色服务</h5>
                     <div><router-link to="/helper/4">存茶服务</router-link></div>
                     <div><router-link to="/helper/5">尊享服务</router-link></div>
                 </div>
                 <div>
                     <h5>会员权益</h5>
                     <div><router-link to="/helper/6">等级权益</router-link></div>
                 </div>
                 <div>
                     <h5>关于我们</h5>
                     <div><router-link to="/helper/7">益友科技</router-link></div>
                 </div>
                 <div class="dh">
                     <h5>400-618-7572</h5>
                     <p id="pp">周一至周五 09:00-17:30</p>
                    <div id="kf" @click="kk">在线客服
                        <div id="kf1" :class="{'gk':ff}" v-drag>
                            <span id="cha" v-on:click.stop="kg">×</span>
                        </div>
                    </div>
                 </div>
              </div>
          </div>
          <!-- 版权-->
          <div class="bqj">
              <div> 
                  <img class="sizeImg" src="../assets/header/1574496063(1).jpg" alt=""/>
                  <div>
                      <p>© 2015－2018 yestae.com all rights reserved</p>
                      <p>
                          出版物经营许可证 160175号 | 食品流通许可证 SP1101081510242681(1-1) | 经营执照
                      </p>
                  </div>
              </div>
              <div>京 I CP备13032399号-1 | 京ICP证140639号 |</div>
          </div>
      </div>
</template>
<script>
export default {
  // 页尾
     data(){
       return{
         ff:true,
       }
     },
     methods:{
        //  客服显示
        kg(){
            this.ff=true;
        },
        kk(){
            // v-on:click.stop停止冒泡事件
            this.ff=false;
        },
     },
      directives: {
        //鼠标拖拽指令
        drag: {
            // 指令的定义
            bind:function (el) {
                let odiv = el;   //获取当前元素
                var canmove=false;
                var offsetX,offsetY;
                odiv.onmousedown=function(e){
                    canmove=true;
                    offsetX=e.offsetX;
                    offsetY=e.offsetY;
                }
                document.onmousemove=function(e){
                  if(canmove){
                      var x=e.clientX;
                      var y=e.clientY;
                      var left=x-offsetX;
                      var top=y-offsetY; 
                      if(left<0){left=0}else if(left>innerWidth-600){
                          left=innerWidth-600;
                      }
                      if(top<0){top=0}else if(top>innerHeight-600){
                          top=innerHeight-600;
                      }
                      odiv.style.left=left+"px";
                      odiv.style.top=top+"px";
                  }
                }
                odiv.onmouseup=function(){
                    canmove=false;
                }
            }
        }
    },
     created(){
        
     },
     watch:{

     },

}
</script>
<style scoped>
.erwei{
  height:170px;
  padding-top:50px;
  padding-bottom:48px;
  text-align:center;
  color:#8b8b8b;
  font-size:12px;
}
#pj{
  font-size:14px;
  margin-top:8px;
}
h5{
  font-size:18px;
  margin-bottom:12px;
}
/*购物指南*/
.w1{
  height:200px;
  padding-top:20px;
  padding-bottom:50px;
  border-top:2px solid #ececec;
  border-bottom:2px solid #ececec;
}
.w2{
  width:1200px;height:127px;
  margin:0 auto;
  display:flex;
  justify-content:space-around;
}
#pp{
  font-size:14px;
  color:#767676;
  margin-bottom:22px;
}
#kf{
  width:246px;height:48px;
  border:1px solid #44a870;
  text-align:center;
  color:#44a870;
  line-height:48px;
  font-size:18px;
  position: relative;
  cursor: pointer;
}
.gk{
 display: none;
}
#kf1{
  width:600px;height:600px;
  border-radius:10px ;
  position:fixed;
  bottom:12px;
  right:587px;
  cursor:Move;
  z-index:61;
  background:rosybrown;
}
#kf1>span{
  cursor:pointer;
}
#kf:hover{
  background:rgba(68,168,112,.2)
}
/*版权*/
.sizeImg{
  width:33px;
  height:29px;
}
.bqj{
  width:1200px;height:78px;
  margin:0 auto;
  font-size:12px;
  color:#8e8e8e;
  display:flex;
  justify-content: space-between;
}
.bqj>div:first-child{
  width:494px;height:51px;
  padding-top:15px;
  display:flex;
  justify-content: space-between;
}
.bqj>div:nth-child(2){
  line-height: 78px;
}
</style>