<template>
<!-- 我的订单 -->
    <div class="order">
        <h2>我的订单</h2>
        <el-tabs v-model="istrue" @tab-click="xz">
            <el-tab-pane label="全部订单" name="/onents/0"></el-tab-pane>
            <el-tab-pane label="待付款" name="/onents/1"></el-tab-pane>
            <el-tab-pane label="待发货" name="/onents/2"></el-tab-pane>
            <el-tab-pane label="已发货" name="/onents/3"></el-tab-pane>
            <el-tab-pane label="售后单" name="/onents/4"></el-tab-pane>
        </el-tabs>
        <div>
            <div class="order1">暂无相关订单</div>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            istrue:"/onents/1",
        }
    },
    methods: {
        xz(tab){
            this.$router.push(tab.name)
        }
    },
    created() {
        this.istrue=this.$route.path;
    },
    watch: {
        $route(to,from){
            this.istrue=this.$route.path;
        }
    },
}
</script>
<style scoped>
.order{
    padding: 22px 20px;
}
.order1{
    width: 100%;
    height: 140px;
    text-align: center;
    line-height: 140px;
    border: 1px solid #dedede;
    color: #8b8b8b;
    font-size: 14px;
}
</style>