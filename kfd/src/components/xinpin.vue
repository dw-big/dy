<template>
     <!-- 新品推荐-->
         <div class="xb">
           <!-- 因为数据初始时xinpin为空 会报属性未定义 但页面正常加载 用v-if="this.xinpin[0]"隐藏 -->
             <div v-if="this.xinpin[0]" class="ht">{{this.xinpin[0].title}}</div>
             <div v-if="this.xinpin[0]" class="ht1">{{this.xinpin[0].details}}</div>
             <ul type="none">
                 <li v-for="(item,i) of this.xinpin" :key="i">
                     <router-link :to="item.href">
                         <img :src="`http://127.0.0.1:5050/${item.simg}`" alt=""/>
                         <div class="ht2">
                             <p class="p1">{{item.product_name}}</p>
                             <p class="p2">￥{{item.price}}</p>
                             <p class="p3">{{item.spec}}</p>
                         </div>
                     </router-link>
                 </li>
             </ul>
         </div>
</template>
<script>
export default {
    props:["xinpin"],
    data(){
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
.xb{
  width:1200px;
  padding:16px 0 40px 0;
  margin:0 auto;
}
.xb>ul>li{
  background: #fff;
  transition-duration:0.3s;
}
.xb>ul{
  display: flex;
  justify-content: space-between;
}
.xb>ul>li:hover{
     box-shadow:0 6px 10px rgba(0,0,0,.1);
     transform:translateY(-5px);
}
.ht{
  height:36px;
  font-size:26px;
  color:#484848;
}
.ht1{
  height:21px;
  font-size:14px;
  color: #888888;
  margin:9px 0;
}
.ht2{
  width:554px;
  height:53px;
  padding:20px;
  display:flex;
  flex-wrap: wrap;
}
.p1{
  width:400px;height:27px;
  font-size:18px;
  color: #353535;
}
.p2{
  width:150px;height:27px;
  font-size:18px;
  color:#44a870;
  text-align:right;
}
.p3{
  height:21px;
  font-size:14px;
  color:#7a7a7a;
  margin-top:8px;
}
</style>