<template>
<!-- 注册 -->
   <div class="register">
       <div style="height:60px;"></div>
       <div class="register1">
          <div v-show="ff1">
                <div class="register2">注 册</div>
                <div class="register3">
                    <input @focus="da" type="text" v-model="phone" maxlength="11" placeholder="输入手机号">
                    <err-tishi :errxx="errxx" v-show="errshow"></err-tishi>
                </div>
                <div class="butn" @click="dd">下一步</div>
          </div>
          <div v-show="ff2">
                <div class="register2">验证</div>
                <div class="register4">
                    <input class="yz" type="text" v-model="yanzheng" maxlength="4" placeholder="不区分大小写">
                    <verification-code v-model="data1" @sendData="getcode"></verification-code>
                </div>
                <div class="butn" @click="yanzheng1">下一步</div>
          </div>
          <div v-show="ff3">
                <div class="register2">设置用户名、密码</div>
                <div class="register3">
                    <input @focus="da1" type="text" v-model="fname" maxlength="16" placeholder="用户名">
                    <err-tishi :errxx="errname" v-show="nameshow"></err-tishi>
                </div>     
                <div class="register3">
                    <input @focus="da2" type="password" maxlength="13" v-model="fpwd" placeholder="密码">
                    <err-tishi :errxx="errpwd" v-show="pwdshow"></err-tishi>
                </div>     
                <div class="butn" @click="next1">下一步</div>
          </div>
          <div v-show="ff5">
                <div class="register2">设置头像</div>
                <div>
                   <my-upate class="upate1" :ac="avatar" @sendImg="getimg"></my-upate>
                </div>        
                <div class="butn" @click="register(1)">注册</div>
                <div class="butn" @click="register(0)">跳过</div>
          </div>
          <div v-show="ff4">
              <div style="margin-top:20px;">点击注册，即表示同意<router-link tag="a" target="_blank" to="/protocol">益友科技服务协议</router-link></div>
              <div style="margin-top:120px;">已有账号?<router-link to="/login">点击登录</router-link></div>
          </div>
       </div>
       <div style="height:60px;"></div>
   </div>
</template>
<script>
// 注册组件
// 引入验证码组件
import verificationCode from '../components/verificationCode.vue'
export default {
    components: {
    verificationCode
   },
    data(){
        return{
           phone:"",
           fname:"",
           fpwd:"",
           yanzheng:"",
           errxx:"请输入手机号",
           errname:"请设置用户名",
           errpwd:"请设置密码",
           errshow:false,
           nameshow:false,
           pwdshow:false,
           ff1:true,  //true
           ff2:false,
        //    子组件传递的验证码
           data1:"",
           ff3:false,  //false
           ff4:true,  //true
           ff5:false,  //false
        //    头像图片
           avatar:"",
        }
    },
    methods:{
        // 电话验证
       dd(){
           if(this.phone==""){
               this.errshow=true;
           }else{
               if(/^[1][3-8]\d{9}$/.test(this.phone)){
                   try{
                      this.axios.get("/register1",{params:{phone:this.phone}})
                      .then(res=>{
                          if(res.data.code==1){
                              this.ff2=true;
                              this.ff1=false;
                          }else{
                             this.$message.error(`${res.data.msg}`);
                          }
                      })
                   }catch(err){
                       console.log(err)
                   }
               }else{
                   this.errxx="手机号码格式错误";
                   this.errshow=true;
               }
           }
       },
    //    验证码
       yanzheng1(){
        let reg=new RegExp(`^${this.data1}$`,"i");
        if(reg.test(this.yanzheng)){
            this.ff3=true;
            this.ff2=false;
            this.ff4=false;
        }else{
             this.$message.error("验证码错误");
        }
       },
    //    设置用户名,密码
       next1(){
           if(this.fname==""){
              this.nameshow=true;
           }else{
               if(this.fpwd==""){
                   this.pwdshow=true;
               }else{
                   if(/^([我w]|wo)\s*(cao|[草日操c])/i.test(this.fname)){
                       let arr=this.fname.match(/^([我w]|wo)\s*(cao|[草日操c])/i)
                       this.$message.error(`用户名包含敏感词:${arr['0']}`)
                       return;
                   }
                   if(/^[a-zA-Z0-9]{6,13}$/.test(this.fpwd)){
                        this.ff3=false;
                        this.ff5=true;
                    }else{
                        this.$message.error("密码必须是6~13位的字母和数字")
                    }
               }
           }
       },
    //    设置头像
    //   注册
       register(e){
           if(e=="1"){
              if(this.avatar==''){
                 this.$message.error("头像未设置")
                  return;
              }
           }
           let createTime=new Date().getTime();
           try{
               this.axios.post("/register2",{data:{createTime,fname:this.fname,fpwd:this.fpwd,phone:this.phone,avatar:this.avatar}})
               .then(res=>{
                    if(res.data.code==1){
                        this.$message.success(`${res.data.msg}`);
                        if($cookies.get("keys1")==undefined){
                            // 注册成功后自动登录
                            this.axios.get("/login",{params:{phone:this.phone,fpwd:this.fpwd}})
                            .then(res=>{
                                //  登陆成功后跳转首页
                                if(res.data.code==1){
                                    this.$message.success(`${res.data.msg}`);
                                    $cookies.set("keys1",res.data.data[0].uid);
                                    $cookies.set("fname",res.data.data[0].fname);
                                    this.$router.push("/")
                                }
                            })
                        }else{
                            this.$message.success("您已登录!");
                            this.$router.push("/");
                        }
                    }
               })
           }catch(err){console.log(err)}
       },
    //    获取验证码
       getcode(data){
         this.data1=data;
       },
    //    获取头像  base64码
       getimg(img){
          this.avatar=img
       },
    //   聚焦隐藏
       da(){
           this.errshow=false;
       },
       da1(){
           this.nameshow=false;
       },
       da2(){
           this.pwdshow=false;
       }
    },
    created(){
        // 创建时获取验证码
       this.getcode();
    }
} 
</script>
<style scoped>
.register2{
   color:#44a870;
    font-weight: 700;
    font-size:24px;
    padding-top:30px;
}
.register{
    background: #e5e5e5;
    margin-top:60px; 
  }
.register1{
    width:740px;height: 480px;
    background:#efefef;
    margin:0 auto;
    text-align: center;
}
a{
    color:#44a870;
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
    text-align: center;
    border-radius: 2px;
    cursor: pointer;
}
.butn:hover{
    border-color: #348d5b;
    background-color: #348d5b;
}
.register3,.register4{
    width: 268px;
    height: 40px;
    border-radius: 2px;
    border: 1px solid #dbdbdb;
    background-color: #fff;
    padding:0 15px;
    margin:25px auto 0; 
    position: relative;
}
.register4{
    width: 283px;
    display: flex;
    padding-right: 0;
    border-right: 0;
}
.register3>input{
    width: 268px;
    height: 40px;
    border: 0px;
    outline: 0px;
}
.register4>.yz{
    width:183px;
    height: 40px;
    border: 0px;
    outline: 0px;
}
/* 上传头像 */
.upate1{
  margin:0 auto;
}
</style>