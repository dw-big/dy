<template>
    <div class="buzhoutiao">
        <!-- 步骤条 -->
        <el-steps class="buzhoutiao1" :space="'33%'" :active="ni" finish-status="success" align-center>
            <el-step title="购物车"></el-step>
            <el-step title="填写订单"></el-step>
            <el-step title="完成支付"></el-step>
        </el-steps>
    </div>
</template>
<script>
export default {
    props:["ni"],
}
</script>
<style scoped>
.buzhoutiao{
    width:1200px;
    height: 140px;
    margin: 0 auto;
}
.buzhoutiao1{
    padding-top:60px;
}
</style>