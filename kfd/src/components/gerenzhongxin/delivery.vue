<template>
<!-- 收货信息 -->
    <div class="delivery">
        <h2>收货地址</h2>
        <div class="delivery1">
            <div v-if="this.$store.getters.getList.length>=0" class="flex_x">
                <div v-for="(item,i) of this.$store.getters.getList" class="delivery2" :class="{luse:item.is_default}" :key="i" v-on:click.stop="chuancan(item.aid,i)">
                   <!-- 三角形 -->
                   <div class="ss" :class="{sanjiao:item.is_default}"></div>
                   <p>{{item.receiver}}</p>
                   <p>{{item.cellphone}}</p>
                   <p>{{item.province}}{{item.address}}</p>
                   <div class="xuigai">
                       <span v-if="item.is_default==true">默认</span>
                       <span v-if="item.is_default==false" @click="setonce(i)">设置默认</span>
                       <div>
                           <span @click="updateonce(i)">编辑</span>&nbsp;|
                           <span @click="deletelistonce(item.aid,item.user_id,item.receiver,i)">删除</span>
                       </div>
                   </div>
                </div>
            </div>
            <div v-if="yc==true" class="btn iconfont iconshouhuoxinxi" @click="changeYc">新增收货地址</div>
            <div v-if="yc1==true" class="delivery3">
                <el-form ref="form" status-icon :model="form" label-width="50px" :rules="rules">
                    <el-form-item prop="receiver">
                        <el-input placeholder="输入收货人姓名" v-model="form.receiver" size="medium" class="ff1"></el-input>
                    </el-form-item>
                    <el-form-item prop="cellphone">
                        <el-input placeholder="输入收货人电话" v-model="form.cellphone" size="medium" class="ff"></el-input>
                    </el-form-item>
                    <el-form-item prop="province">
                        <el-cascader
                        size="large"
                        :options="options"
                        v-model="selectedOptions"
                        @change="addressChange" class="ff1">
                        </el-cascader>
                        <el-input
                        v-model="form.province"
                         class="ff">
                        </el-input>
                    </el-form-item>
                    <el-form-item prop="address">
                        <el-input
                        type="textarea"
                        placeholder="请输入详细地址"
                        v-model="form.address"
                        maxlength="50"
                        show-word-limit
                        >
                        </el-input>
                    </el-form-item>
                    <el-form-item>
                        <el-checkbox v-model="form.is_default">设为默认地址</el-checkbox>
                    </el-form-item>
                    <el-form-item>
                        <el-button @click="submitForm('form')" size="medium" type="success">确认</el-button>
                        <el-button @click="quxiao" size="medium" type="warning">取消</el-button>
                    </el-form-item>
                </el-form>
            </div>
        </div>
    </div>
</template>
<script>
// 下载地址数据    npm install element-china-area-data -S
// 引入地址数据
import { regionData,CodeToText } from 'element-china-area-data'
export default {
      data(){
        let phoneReg=/^[1][3,4,5,7,8][0-9]{9}$/
        let validatePhone=(rule,value,callback)=>{
            if(!value){
                return callback(new Error('号码不能为空!!'))
            }
            if(!phoneReg.test(value)){
                callback(new Error('格式有误'))
            }else{
                callback()
            }
        }
        return{
            // center显示
            yc:true,
            // bottom显示
            yc1:false,
            // 填表
            form:{
                // 收货地址id
                aid:'-1',
                // 用户id
                user_id:$cookies.get("keys1"),
                // 收件人
                receiver:'',
                 // 地址汉字
                province:'',
                // 详细地址
                address:'',
                // 电话
                cellphone:'',
                // 设置默认地址
                is_default:false,
            },
            // 错误提示
            rules:{
                receiver: [{required: true, message: '请输入收件人',trigger: 'blur'}],
                cellphone:[{required:true,validator:validatePhone,trigger: 'blur'}],
                province: [{required: true, message: '地址不能为空',trigger: 'blur'}],
                address: [{required: true, message: '详细地址不能为空',trigger: 'blur'}]
            },
            // 地址列表
            options:regionData,
            // 地址数字代码
            selectedOptions:[],
        }
    },
    methods:{
    //    修改隐藏状态
       changeYc(){
           this.yc=false;
           this.yc1=true;
       },
    //    查询收货地址列表
       chaxunList(){
           this.axios.get("/address1",{params:{uid:$cookies.get("keys1")}})
           .then(res => {
               let obj=res.data.data;
               for(let item of obj){
                   if(item.is_default==1){
                       item.is_default=true;
                   }else{
                       item.is_default=false;
                   }
               }
               this.$store.commit("setList",obj);
           })
           .catch(err => {
               console.error(err); 
           })
       },
    //    设置默认
       setonce(i){
          this.$store.commit("updateList1",i);
          for(let item of this.$store.getters.getList){
            this.axios.get("/updateAddress",{params:item})
            .then(res => {

            })
         }
       },
    //    编辑修改地址
       updateonce(i){
           this.yc=false;
           this.yc1=true;
        //    得到选择的收货信息
           this.form=this.$store.getters.getList[i];
        // 清空数字地址
           this.selectedOptions=[];
       },
    //    确认
       submitForm(formName) {
            this.$refs[formName].validate((valid) => {
            if (valid) {
                if(this.form.aid=="-1"){
                    // 添加
                    this.$store.commit("updateList2",this.form);
                }
                if(this.form.is_default==true){
                    // 修改vuex默认数据
                    this.$store.commit("updateList3",this.form);
                    for(let item of this.$store.getters.getList){     
                        this.axios.get("/address",{params:item})
                        .then(res => {
                            // 执行完成时  执行取消函数恢复初始状态
                            this.quxiao();
                        })
                    }
                    return;
                }
                this.axios.get("/address",{params:this.form})
                .then(res => {
                    this.$message.success(res.data.msg);
                    // 执行完成时  执行取消函数恢复初始状态
                    this.quxiao();
                })
            } else {
                this.$message.warning("请认真填写收货人信息")
                return false;
            }
        });
      },
    //    取消
       quxiao(){
          this.yc=true;
          this.yc1=false;
          this.form={aid:'-1',user_id:$cookies.get("keys1"),is_default:false,}
       },
    //    数字地址转汉字地址
        addressChange(arr) {
            this.form.province="";
            for(let i=0;i<arr.length;i++){
                this.form.province+=CodeToText[arr[i]]
            }
        },
        // 子传父
        chuancan(n,i){
            // 切换选中状态
            let de=document.querySelectorAll(".delivery2");
            for(let item of de){
                item.classList.remove("luse");
            }
            de[i].classList.add("luse");
            // 三角形
            let ss=document.querySelectorAll(".ss");
            for(let item of ss){
                item.classList.remove("sanjiao");
            }
            ss[i].classList.add("sanjiao");
            // 传参给父组件
            this.$emit("dizhiID",n)
        },
        // 删除一个收货地址信息
        deletelistonce(aid,user_id,receiver,i){
            this.$confirm(`是否删除收件人为'${receiver}'的地址信息`, '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
            }).then(() => {
                // 删除vuex一条收货地址数据
                this.$store.commit("deleteListSH",i)
               this.axios.delete("/deleteAddress",{params:{aid,user_id}})
               .then(res => {
                  this.$message.success(res.data.msg)
               })
            }).catch(() => {
                this.$message({
                    type: 'info',
                    message: '已取消删除'
                });          
            });
        }
    },
    created(){
        // 查询收货信息地址
        this.chaxunList();
    }
}
</script>
<style scoped>
.delivery{
    padding:22px 20px;
}
.delivery1{
    padding:40px 0;
}
/* 收货地址列表 */
.flex_x{
    display: flex;
    flex-wrap: wrap;
}
.delivery2{
    width: 270px;
    height:140px;
    margin-right: 10px;
    margin-bottom: 20px;
    border-radius: 2px;
    padding:10px;
    border: 1px solid #dbdbdb;
    cursor: pointer;
    position: relative;
}
.delivery2:hover{border-color:#44a870!important}
.delivery2>p{
    margin-bottom:15px;
}
.xuigai{
    display:flex;
    justify-content: space-between;
    color: #44a870;
}
.luse{border-color:#44a870!important}
.btn{
    width: 290px;
    height: 60px;
    background-color: transparent;
    border-radius: 2px;
    border: 1px solid #dbdbdb;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    text-align: center;
    color: #44a870;
    font-size: 16px;
    line-height: 60px;
    cursor: pointer;
}
/* 填表 */
.delivery3{
    width:590px;
}
.ff1{width:255px;margin-right:30px;}
.ff{
    width:255px;
}
/* 三角形 */
.sanjiao{
    position:absolute;
    border-bottom: 6px solid #44a870;
    border-right: 6px solid #44a870;
    border-top:6px solid #fff;
    border-left: 6px solid #fff;
    bottom:0;
    right:0;
} 
</style>