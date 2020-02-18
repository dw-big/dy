<template>
<!-- 购物车 -->
    <div class="shopping-cart">
        <div v-if="this.$store.getters.getSYcartlist.length<1" class="shopping-cart-top">
           <h1>你的购物车还是空的</h1>
           <h3>遇到喜欢的茶，要快下手哦</h3>
        </div>
        <div v-else>
            <!-- 步骤条 -->
           <my-buzhoutiao :ni="ni1"></my-buzhoutiao>
           <!-- 购物车商品 -->
           <div class="shopping-cart-center">
               <div class="shoppiing-cart-center1">
                   <div>商品名称</div>
                   <div>规格</div>
                   <div>数量</div>
                   <div>价格</div>
                   <div>操作</div>
               </div>
               <div class="shoppiing-cart-center2" v-for="(item,i) of this.$store.getters.getSYcartlist" :key="i">
                   <img :src="`http://127.0.0.1:5050/${item.shopp_img}`"/>
                   <div>{{item.shopp_title}}</div>
                   <div>{{item.spec}}</div>
                   <div @click="addrk(i)"><el-input-number v-model="item.shopp_count" :min="1" :max="50" size="small"></el-input-number></div>
                   <div>¥{{item.shopp_price.toFixed(2)}}</div>
                   <div @click="clear(i)">×</div>
               </div>
               <div class="shopping-cart-bottom">
                    <div class="fgh">
                        <span>商品小计:</span>
                        <span>¥{{this.$store.getters.getyuan.toFixed(2)}}</span>
                    </div>
                    <router-link to="/shoppingBalance/1" class="btn1">去下单</router-link>
               </div>
           </div>
        </div>
        <you-xihuan :cai="cai1"></you-xihuan>
    </div>
</template>
<script>
export default {
    data(){
        return{
            // 猜你喜欢
           cai1:[],
        //    步骤条显示位置
           ni1:1,
        // 数量
           num:1,
        // 修改时节流
           canclick:true,
        }
    },
    methods:{
     // 猜你喜欢
       xihuan(){
           let i=Math.ceil(Math.random()*26);
           this.axios.get("/cainixihu",{params:{id:i}})
           .then(res => {
              this.cai1=res.data.data;
           })
       },
    //    加入购物车库
       addrk(i){
           let obj=this.$store.getters.getSYcartlist[i];
            // 修改时节流
           if(this.canclick){
              this.canclick=false;
              setTimeout(()=>{
                        //    修改
                this.axios.get("/xgshoppingCart",{params:obj})
                .then(res => {
                    this.$message.success(`${res.data.msg}`);
                })
                .catch(err => {
                    console.error(err); 
                })
                this.canclick=true;
              },600)
           }
       },
    //    清除单条购物车数据
       clear(i){
            this.$confirm(`是否删除商品:${this.$store.getters.getSYcartlist[i].shopp_title}`, '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
            }).then(() => {
                let uid=this.$store.getters.getSYcartlist[i].uid;
                let shopp_id=this.$store.getters.getSYcartlist[i].shopp_id;
                this.$store.commit("deleteListOnce",i);
                this.axios.delete("/deleteshopp",{params:{uid,shopp_id}})
                .then(res => {
                    this.$message({
                        type: 'success',
                        message: '删除成功!'
                    });
                })
                .catch(err => {
                    console.error(err); 
                })
            }).catch(() => {
                this.$message({
                    type: 'info',
                    message: '已取消删除'
                });          
            });
        }
    },
    created() {
        // 猜你喜欢
        this.xihuan();
    },
}
</script>
<style scoped>
.shopping-cart{
    margin-top:60px;
    background-color:#e5e5e5; 
}
.shopping-cart-top{
    width:1200px;
    margin:0 auto 118px;
    padding-top:49px; 
    color:#767676;
}
/* 购物车商品 */
.shopping-cart-center{
    width:1200px;
    margin:0 auto;
    color:#767676;
    background-color: #fff;
    padding-bottom:125px;
    margin-bottom: 60px; 
}
.shoppiing-cart-center1{
    height:50px;
    line-height: 50px;
    text-align: center;
    background-color:#eaeaea;
    display: flex;
    justify-content: space-around;
}
.shoppiing-cart-center1>div:first-child{
    padding-right:420px;
}
/* 购物车详情 */
.shoppiing-cart-center2{
    display: flex;
    border-bottom:1px solid #ececec;
}
.shoppiing-cart-center2>div{
    width:150px;
    line-height:160px;
    text-align: center;
}
.shoppiing-cart-center2>img{
    width:130px;
    height:130px;
    margin:0 25px;
    padding:15px 0;
}
.shoppiing-cart-center2>div:nth-child(2){
    width:420px;
    text-align:left;
}
.shoppiing-cart-center2>div:nth-child(5){
    color:#44a870;
}
.shoppiing-cart-center2>div:last-child{
    cursor: pointer;
}
/*  */
.shopping-cart-bottom{
    width: 300px;
    margin:30px 30px 0 870px;
}
.fgh{
    height:64px;
    display: flex;
    justify-content:space-between;
}
.fgh>span:last-child{
    font-size:30px;
    color:#44a870;
}
/* 按钮 */
.btn1{
    height:50px;
    color:#fff;
    background-color: #44a870;
    display:block;
    border-radius:4px; 
    text-align: center;
    line-height: 50px;
}
</style>