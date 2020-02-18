<template>
    <div class="shopping-pay">
         <!-- 步骤条 -->
        <my-buzhoutiao :ni="ni1"></my-buzhoutiao>
        <div class="shopping-pay-center">
            <div>实际支付金额
                <span style="color:#44a870">￥{{this.$store.getters.getfkyuan.toFixed(2)}}</span>
            </div>
            <div class="btn" @click="zf">确认支付</div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return{
            // 步骤条
            ni1:3,
        }
    },
    methods: {
        // 支付
        zf(){
            let obj=this.$store.getters.getmaidan
            for(let item of obj){
                 this.axios.get("/updateOrder",{params:{user_id:item.user_id,order_time:item.order_time}})
                .then(res => {
                   this.$message.success(res.data.msg)
                })
            }
             // 支付成功后清除vuex中的购买商品和金额;
            this.$store.commit("clearmaidan")
            this.$store.commit("clearfkyuan")
             // 支付后返回首页
            this.$router.push("/");
        }
    },
}
</script>
<style scoped>
.shopping-pay{
    margin-top:60px;
    background-color:#e5e5e5; 
    padding-bottom: 25px;
}
.shopping-pay-center{
    width:1200px;
    background-color: #fff;
    margin:0 auto;
}
.btn{
    width:180px;
    height:50px;
    background-color: #44a870;
    color:#fff;
    text-align: center;
    line-height: 50px;
    border: 1px solid #44a870;
    margin-top:30px;
    border-radius:4px;
    cursor: pointer;
}
</style>