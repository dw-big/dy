<template>
<!-- 猜你喜欢 -->
     <div class="search-bottom">
       <h2>猜你喜欢</h2>
       <shop-list :shops="cai"></shop-list>
    </div>
</template>
<script>
export default {
    props:['cai'],
    dat(){
        return{

        }
    },
    methods:{
       
    },
    created(){
       
    }
}
</script>
<style scoped>
.search-bottom{
    width:1200px;
    margin: 0 auto;
}
</style>