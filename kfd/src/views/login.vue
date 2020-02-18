<template>
<!-- 登录 -->
   <div class="login">
       <div style="height:60px;"></div>
       <div class="login1">
           <div class="login2">
                <div :class="{active:dd}" class="shou" @click="qiehuan(0)">密码登录</div>
                <span>|</span>
                <div :class="{active:df}" class="shou" @click="qiehuan(1)">短信登录</div>
            </div>
            <div :class="{'yincan':df}">
                <div class="login3">
                    <input type="text" @focus="sjfocus" v-model="phone" maxlength="11" placeholder="手机号">
                    <err-tishi :errxx="isphone" v-show="sjshow"></err-tishi>
                </div>
                <div class="login3">
                    <input type="password" @focus="mmfocus" v-model="password" placeholder="密码">
                    <err-tishi :errxx="ispassword" v-show="passwordShow"></err-tishi>
                </div>
                <div class="butn shou" @click="login1">登 录</div>
            </div>
            <div :class="{'yincan':dd}">
                <div class="login3">
                    <input type="text" @focus="sjfocus" v-model="phone" maxlength="11" placeholder="手机号">
                    <err-tishi :errxx="isphone" v-show="sjshow"></err-tishi>
                </div>
                <div class="login5">
                    <input type="text" @focus="yzfocus" v-model="yanzhengma" placeholder="验证码">
                    <div class="shou ss1">获取验证码</div>
                    <err-tishi :errxx="isyanzhengma" v-show="yanzhengShow"></err-tishi>
                </div>
                <div class="butn shou" @click="login2">登 录</div>
            </div>
            <div class="login4">
                <div>没有账号?<router-link to="/register1">立即注册</router-link></div>
                <router-link to="javascript:;">忘记密码</router-link>
            </div>
       </div>
       <div style="height:60px;"></div>
   </div>
</template>
<script>
// 登陆组件
export default {
    data(){
        return{
            phone:"",
            password:"",
            yanzhengma:"",
            dd:true,
            df:false,
            isphone:"请输入手机号",
            ispassword:"请输入密码",
            isyanzhengma:"请输入验证码",
            sjshow:false,
            passwordShow:false,
            yanzhengShow:false,
        }
    },
    methods:{
        // 登录
        login1(){
          if($cookies.get("kyes1")==undefined){
            if(this.phone==""){
              this.sjshow=true;
              return;
            }else{
                if(this.password==""){
                    this.passwordShow=true;
                }
                this.axios.get("/login",{params:{phone:this.phone,fpwd:this.password}})
                .then(res=>{
                    if(res.data.code==1){
                        this.$message.success(`${res.data.msg}`);
                        $cookies.set("keys1",res.data.data[0].uid);
                        $cookies.set("fname",res.data.data[0].fname)
                        this.$router.go(-1)
                    }else{
                        this.$message.error(`${res.data.msg}`)
                    }
                })
            }
          }else{
              this.$message.error("您已登录");
              this.$router.go(-1);
          }
        },
        
        // 短信验证登录未完成
        login2(){
            if(this.phone==""){
              this.sjshow=true;
              return;
            }else{
                if(this.yanzhengma==""){
                    this.yanzhengShow=true;
                }
            }
        },
        // 监听键盘事件
        enter1(){
            let _this = this;
            document.onkeydown = function(e){
                let _key = window.event.keyCode;
                if(_key==13){
                    _this.login1();
                }
            }
        },
        sjfocus(){
            this.sjshow=false;
        },
        mmfocus(){
            this.passwordShow=false;
        },
        yzfocus(){
            this.yanzhengShow=false;
        },
        qiehuan(e){
            if(e=="0"){
                this.dd=true;
                this.df=false;
            }else{
                this.dd=false;
                this.df=true;
            }
        },
    },
    created(){
        this.enter1();
    },
    updated(){
        
    }
}
</script>
<style scoped>
.login{
    background: #e5e5e5;
    margin-top:60px; 
  }
.login1{
    width:740px;height: 480px;
    background:#efefef;
    margin:0 auto;
}
.butn{
    width: 298px;
    height: 38px;
    line-height: 40px;
    margin:40px auto 0;
    font-weight: 700;
    border-color: #348d5b;
    background-color: #44a870;
    color:#fff;
    font-size: 18px;
    border-radius: 2px;
}
.butn:hover,.ss1:hover{
    border-color: #348d5b;
    background-color: #348d5b;
}
.login2{
    color:#8b8b8b;
    font-weight: 700;
    font-size:24px;
    padding-top:30px;
    display: flex;
    justify-content: center;
}
/* 小手 */
.shou{
    cursor: pointer;
     text-align: center;
}
.login2>span{
    padding: 0 20px;
}
/* 字体变绿 */
.active{
    color:#44a870;
}
.login3{
    width: 268px;
    height: 40px;
    border-radius: 2px;
    border: 1px solid #dbdbdb;
    background-color: #fff;
    padding:0 15px;
    margin:25px auto 0; 
    position: relative;
}
.login3>input{
    width: 268px;
    height: 40px;
    border: 0px;
    outline: 0px;
}
.login4{
   width: 298px;
   margin:20px auto 0;
   display:flex;
   justify-content: space-between;
}
.login5{
     width: 283px;
    height: 40px;
    border-radius: 2px;
    border: 1px solid #dbdbdb;
    background-color: #fff;
    padding-left:15px;
    margin:25px auto 0; 
    display: flex;
    position: relative;
}
.login5>input{
    width: 183px;
    height: 40px;
    border: 0px;
    outline: 0px;
}
.ss1{
    width:100px;
    color:#fff;
    background: #44a870;
    line-height: 40px;
    border-radius: 0 2px 2px 0;
}
.ll{
    width:168px !important;
}
a{
    color:#44a870;
}
.yincan{
    display: none;
}
</style>