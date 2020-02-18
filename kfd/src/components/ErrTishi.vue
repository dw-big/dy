<template>
<!-- 错误提示框 -->
   <div class="errtishi">
       <div class="sanjiao"></div>
       <div class="sjerr">{{this.errxx}}</div>
   </div>
</template>
<script>
// 错误框
export default {
    props:["errxx"]
}
</script>script>
<style scoped>
.errtishi{
    width:300px;
    text-align: left;
    position: absolute;
    top:31px;
    left:0;
    z-index: 9;
}
.sanjiao{
    content: "";
    width: 0;
    height: 0;
    border: 8px solid transparent;
    border-bottom-color: #ff5a5e;
    margin-left: 50px;
}
.sjerr{
    padding: 0 15px;
    width: 270px;
    background-color: #ff5a5e;
    color: #fff;
    font-size: 14px;
    height: 40px;
    line-height: 40px;
    border-radius: 2px;
}
</style>