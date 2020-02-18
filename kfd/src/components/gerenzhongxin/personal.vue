<template>
<!-- 个人信息 -->
    <div class="personal">
        <h2>个人信息</h2>
        <el-form ref="form" :model="form" label-width="50px" label-position="top" :rules="rules">
            <el-form-item label="用户名" prop="fname"  class="pr1">
                <el-input v-model="form.fname"></el-input>
            </el-form-item>
            <el-form-item label="性别" prop="gender">
                <el-radio v-model="form.gender" :label="1" border>男</el-radio>
                <el-radio v-model="form.gender" :label="0" border>女</el-radio>
                <el-radio v-model="form.gender" :label="3" border>保密</el-radio>
            </el-form-item>
            <el-form-item label="头像照片" prop="avatar">
                <my-upate :ac="form.avatar" @sendImg="getimg"></my-upate>
            </el-form-item>
            <el-form-item>
                <el-button @click="xiugai" type="success">提交</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>
<script>
export default {
    data(){
        // 验证用户名
        let reg=/^([我w]|wo)\s*(cao|[草日操c])/i;
        let username= (rule, value, callback) => {
            if (!value) {
                return callback(new Error('用户名不能为空'))
            }
            if(value.length<3||value.length>16){
                return callback(new Error('用户名长度3~16位'))
            }
            if(/^([我w]|wo)\s*(cao|[草日操c])/i.test(value)){
                let arr=value.match(/^([我w]|wo)\s*(cao|[草日操c])/i)
                return callback(new Error(`用户名包含敏感词:${arr['0']}`))
            }
        }
        return {
            // form表单
            form:{
                fname:"",
                gender:"1",
                avatar:"",
            },
            rules: {
                fname:[
                    { required: true,validator:username, trigger: 'blur'}
                ],
            },
        }
    },
    methods:{
        // 上传图片组件传递的图片
        getimg(img){
          this.form.avatar=img
       },
       //    查询用户信息
       userxx(){
           this.axios.get("/userxx",{params:{uid:$cookies.get("keys1")}})
           .then((res)=>{
               this.form=res.data.data[0];
               if(res.data.data[0].gender===null){
                   this.form.gender=3;
               }
           })
       },
    //    修改用户信息
       xiugai(){
    
          this.axios.post("/updateUser",{data:{fname:this.form.fname,gender:this.form.gender,avatar:this.form.avatar,uid:$cookies.get("keys1")}})
          .then(res => {
              this.$message.success(res.data.msg)
          })
          .catch(err => {
              console.error(err); 
          })
       }
    },
    created() {
        //    查询用户信息
       this.userxx();
    },
}
</script>
<style scoped>
.personal{
    padding: 22px 20px;
}
.pr1{
    width:120px;
}
</style>