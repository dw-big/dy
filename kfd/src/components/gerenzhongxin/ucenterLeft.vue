<template>
     <div class="ucenter-left">
        <el-menu :default-active="$route.path" router :collapse="isCollapse" active-text-color="#fff">
            <el-menu-item index="/ucenter/ucenterRighta" class="f1">
                <span>个人中心</span>
            </el-menu-item>
            <div class="daohanglan1">我的订单</div>
            <el-menu-item index="/onents/1" class="daohanglan">
                <span class="iconfont icondaifukuan">待付款</span>
            </el-menu-item>
            <el-menu-item index="/onents/2"  class="daohanglan">
                <span class="iconfont icondaifahuo">待发货</span>
            </el-menu-item>
            <el-menu-item index="/onents/3" class="daohanglan">
                <span class="iconfont iconyifahuo">已发货</span>
            </el-menu-item>
            <el-menu-item index="/onents/4" class="daohanglan">
                <span class="iconfont icondingdandefuben">售后单</span>
            </el-menu-item>
            <el-menu-item index="/onents/0" class="daohanglan">
                <span class="iconfont iconquanbudingdan">全部订单</span>
            </el-menu-item>
            <div class="daohanglan1">账号相关</div>
            <el-menu-item index="/account-related/personal" class="daohanglan">
                <span class="iconfont icongerenxinxi">个人信息</span>
            </el-menu-item>
            <el-menu-item index="/account-related/mobile" class="daohanglan">
                <span class="iconfont iconanquanrenzheng_shouji-">手机认证</span>
            </el-menu-item>
            <el-menu-item index="/account-related/password" class="daohanglan">
                <span class="iconfont iconmima">登录密码</span>
            </el-menu-item>
            <div class="daohanglan1">购物相关</div>
            <el-menu-item index="/shopping-related/coupon" class="daohanglan">
                <span class="iconfont iconpiao">茶票</span>
            </el-menu-item>
            <el-menu-item index="/shopping-related/wallet" class="daohanglan">
                <span class="iconfont iconqianbao">钱包</span>
            </el-menu-item>
            <el-menu-item index="/shopping-related/delivery" class="daohanglan">
                <span class="iconfont iconshouhuoxinxi">收货信息</span>
            </el-menu-item>
            <el-menu-item index="/shopping-related/invoice" class="daohanglan">
                <span class="iconfont iconkaipiaoxinxi">开票信息</span>
            </el-menu-item>
            <div class="daohanglan1">益友服务</div>
            <el-menu-item index="/javascript" class="daohanglan">
                <span class="iconfont iconzunxiangfuwu_normal">尊享服务</span>
            </el-menu-item>
            <el-menu-item index="/javascript" class="daohanglan">
                <span class="iconfont iconhuiyuan">金卡会员</span>
            </el-menu-item>
            <el-menu-item index="/commodity-list/宝盒" class="daohanglan">
                <span class="iconfont iconheziwenjiangongzuocaidanmianxing">大益宝盒</span>
            </el-menu-item>
            <el-menu-item index="/friends-service/savetea" class="daohanglan">
                <span class="iconfont iconfuwu">存茶服务</span>
            </el-menu-item>
            <el-menu-item index="/friends-service/message" class="daohanglan">
                <span class="iconfont iconxiaoxi">站内消息</span>
            </el-menu-item>
        </el-menu>    
    </div>
</template>
<script>
export default {
    data() {
        return {
            isCollapse:false,
        }
    },
}
</script>
<style scoped>
.ucenter-left{
    width:240px;
    background: #ffffff;
    padding-bottom: 20px;
}
.f1{
    font-size:18px;
}
.el-menu-item{color:#767676;}
.el-menu-item:hover{
    color: #ffffff;
    background-color: #44a870;
}
.is-active{
    color: #ffffff;
    background-color: #44a870;
}
.daohanglan1{
    padding-left:20px;
    height:32px; 
    color:#484848;
    line-height: 32px;
}
</style>