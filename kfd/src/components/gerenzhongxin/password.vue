<template>
<!-- 登录密码 -->
    <div class="password">
        <h2>登录密码</h2>
        <el-input class="pr1" v-model="pass" type="password"></el-input>
        <el-button>更改</el-button>
    </div>
</template>
<script>
export default {
    data(){
        return{
            pass:"1234567",
        }
    }
}
</script>
<style scoped>
.password{
    padding: 22px 20px;
}
.pr1{
    width:210px;
}
</style>