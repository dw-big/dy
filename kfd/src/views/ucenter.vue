<template>
<!-- 个人中心 -->
    <div class="ucenter">
        <div class="ucenter1">
            <ucenter-left></ucenter-left>
            <div class="ucenter-right">
                <router-view></router-view>
            </div>
        </div>
    </div>
</template>
<script>
// 注册左侧组件
import ucenterLeft from '../components/gerenzhongxin/ucenterLeft.vue'
export default {
    data(){
        return{

        }
    },
    components:{
        ucenterLeft
    },
}
</script>
<style scoped>
.ucenter{
    margin-top:60px;
    background-color:#e5e5e5; 
}
.ucenter1{
    width:1200px;
    margin:0 auto;
    padding-bottom: 20px;
    padding-top:50px; 
    color:#767676;
    display: flex;
    justify-content: space-between;
}
.ucenter-right{
    width: 950px;
    background-color: #fff;
}
</style>