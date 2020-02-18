
<template>
    <div class="shopping-balance">
         <!-- 步骤条 -->
        <my-buzhoutiao :ni="ni1"></my-buzhoutiao>
        <div class="shdizhi">
            <!-- 收货地址组件 -->
            <my-delivery @dizhiID="getdizhiID"></my-delivery>
        </div>
        <div class="shopping-balance-center">
            <div class="shoppiing-cart-center1">
                <div class="p1">商品名称</div>
                <div class="p2"></div>
                <div class="p3">规格</div>
                <div class="p1">数量</div>
                <div class="p1">价格</div>
            </div>
            <div class="shoppiing-cart-center2" v-for="(item,i) of maidan" :key="i">
                <img :src="`http://127.0.0.1:5050/${item.shopp_img}`"/>
                <div class="p2">{{item.shopp_title}}</div>
                <div class="p3">{{item.spec}}</div>
                <div class="p1">{{item.shopp_count}}</div>
                <div class="p1 sd">¥{{item.shopp_price.toFixed(2)}}</div>
            </div>
            <el-collapse>
                <el-collapse-item class="el-header" title="茶票优惠" name="1">
                    <my-coupon></my-coupon>
                </el-collapse-item>
                <el-collapse-item class="el-header" title="开票信息" name="2">
                    <my-invoice></my-invoice>
                </el-collapse-item>
                <el-collapse-item class="el-header" title="备注信息" name="3">
                    <div class="el-textarea">
                         <el-input
                        type="textarea"
                        v-model="beizhu"
                        maxlength="100"
                        show-word-limit
                        >
                        </el-input>
                    </div>
                </el-collapse-item>
            </el-collapse>
            <div class="shop-bottom">
                <div class="shop-bottom1">
                    <div class="gh">
                        <span>商品总金额</span>
                        <span>￥{{this.$store.getters.getfkyuan.toFixed(2)}}</span>
                    </div>
                    <div class="gh">
                        <span>优惠金额</span>
                        <span>￥0.00</span>
                    </div>
                    <div class="gh hd">
                        <span>运费(免运费)</span>
                        <span>￥0.00</span>
                    </div>
                    <div class="gh hj">
                        <span>应付总额：</span>
                        <span class="sd">￥{{this.$store.getters.getfkyuan.toFixed(2)}}</span>
                    </div>
                    <div class="btn1" @click="pay">去付款</div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
// 引入收货地址组件
import delivery from "../components/gerenzhongxin/delivery"
// 引入开票信息组件
import invoice from "../components/gerenzhongxin/invoice"
// 引入茶票组件
import coupon from "../components/gerenzhongxin/coupon"
export default {
    data(){
        return{
            ni1:2,
        //    备注信息
            beizhu:"",
            // 买单商品
            maidan:[],
            // 收货id
            address_id:0
        }
    },
    components:{
        'my-delivery':delivery,
        'my-invoice':invoice,
        'my-coupon':coupon
    },
    methods: {
        // 选中的收货地址
        getdizhiID(id){
            this.address_id=id;
        },
        // 去支付
        pay(){
            // 如果未选中收货地址,则使用默认地址
            if(this.address_id==0){
                for(let item of this.$store.getters.getList){
                    if(item.is_default==1){
                        this.address_id=item.aid;
                    }
                }
            };
            // 加入我的订单
            for(let item of this.maidan){
                let order_time=new Date().getTime();
                let obj={user_id:item.uid,address_id:this.address_id,user_idshop_id:item.shopp_id,count:item.shopp_count,price:item.shopp_price,status:1,order_time,bz:this.beizhu}
                this.axios.get("/orderi",{params:obj})
                .then(res => {
                     // 设置vuex买单商品
                    this.$store.commit("setmaidan",obj)
                })
            };
             // this.$route.params.id==1是购物车来来源的位置
            if(this.$route.params.id==1){
                 // 加入订单成功后,清除购物车的数据 
                this.axios.delete("/deleteshopp1",{params:{uid:$cookies.get("keys1")}})
                .then(res => {
                    
                }) 
                 // 清空vuex的购物车表
                this.$store.commit('clearcartlist');
                // 清空vuex购物车总数
                this.$store.commit("clearCount");
            }
            this.$router.push('/shoppingPay')
        },
        // 获取买单信息
        maidan1(){
            if(this.$route.params.id=="1"){
                this.maidan=this.$store.getters.getSYcartlist;
            }else{
                this.maidan.push(this.$store.getters.getGoumai)
            }
            // 付款金额
            let rmb=0;
            for(let i of this.maidan){
                rmb+=i.shopp_count*i.shopp_price;
            }
            this.$store.commit("setfkyuan",rmb)
        }
    },
    created(){
        // 获取买单商品
        this. maidan1();
    }
}
</script>
<style scoped>
.shopping-balance{
    margin-top:60px;
    background-color:#e5e5e5; 
    padding-bottom: 25px;
}
.shdizhi,.shopping-balance-center{
    width: 1200px;
    margin: 0 auto;
    background-color:#fff;
    margin-bottom:20px;
}
.shoppiing-cart-center1{
    display:flex;
    background-color: #eaeaea;
    height: 50px;
    line-height: 50px;
    font-size: 16px;
    color: #767676;
    font-weight:bold;
}
.p1{
    width: 180px;
    text-align: center;
}
.p2{width: 420px;}
.p3{width: 240px;text-align: center;}
.shoppiing-cart-center2{
    display: flex;
    line-height: 160px;
    border-bottom:1px solid #ececec;
    color:#767676;
}
.shoppiing-cart-center2>img{
    width:130px;
    height:130px;
    margin:15px 25px;
}
.sd{color:#44a870}
.el-header{
    font-size:18px;
    font-weight:bold;
}
.el-textarea{
    width:500px;
    height:108px;
}
.shop-bottom{
    display:flex;
    justify-content: flex-end;
}
.shop-bottom1{
    width:315px;
    height:253px;
    margin-right:10px;
}
.btn1{
    width:315px;
    height:48px;
    background-color: #44a870;
    color:#fff;
    border:1px solid #44a870;
    border-radius:3px;
    text-align: center;
    line-height: 48px;
    cursor: pointer;
}
.gh{
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
}
.hd{border-bottom:1px solid #e5e5e5}
.hj{height:50px;line-height:50px;}
</style>