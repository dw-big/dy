<template>
<!-- 个人中心 -->
    <div class="righta">
        <h2>{{$cookies.get("fname")}}</h2>
        <div class="righta-center1">

        </div>
        <h2>近期订单</h2>
        <div class='righta-bottom'>

        </div>
    </div>
</template>
<script>
export default {
    
}
</script>
<style scoped>
.righta{
    padding:25px 20px 0;
}
.righta-center1{
    line-height: 20px;
    margin-top: 20px;
    width: 910px;
    height: 177px;
    border: 1px solid #d2d2d2;
    padding: 24px 13px 0;
    margin-bottom: 20px;
    box-sizing: border-box;
} 
.righta-bottom{
    width: 100%;
    height: 140px;
    text-align: center;
    line-height: 140px;
    border: 1px solid #dedede;
    color: #8b8b8b;
    font-size: 14px;
}
</style>