<template>
     <!-- 首页其他商品-->
         <div class="xb">
             <!-- 因为数据初始时xinpin为空 会报属性未定义 但页面正常加载 用v-if="this.xinpin[0]"隐藏 -->
             <div v-if="this.xinpin1.title" class="ht">{{this.xinpin1.title}}</div>
             <div v-if="this.xinpin1.details" class="ht1">{{this.xinpin1.details}}</div>
             <router-link v-if="this.xinpin1.href" :to="this.xinpin1.href">
                 <img v-if="this.xinpin1.simg" :src="`http://127.0.0.1:5050/${this.xinpin1.simg}`"/>
             </router-link>
             <ul type="none">
                 <li v-for="(item,i) of this.xinpin" :key="i">
                     <router-link :to="item.href">
                         <img class="img1" :src="`http://127.0.0.1:5050/${item.simg}`"/>
                         <div class="ht3">
                             <p class="p4">{{item.product_name}}</p>
                             <p class="p6">{{item.spec}}</p>
                             <p class="p5">￥{{item.price}}</p>
                         </div>
                     </router-link>
                 </li>
             </ul>
         </div>
</template>
<script>
export default {
    props:["xinpin","xinpin1"],
    data(){
        return{
          
        }
    },
    methods:{
    },
    created(){
      
    },
    mounted(){

   },
}
</script>
<style scoped>
.xb{
  width:1200px;
  padding:16px 0 40px 0;
  margin:0 auto;
}
.xb>ul>li{
  width: 291px; 
  margin-top:12px;
  background: #fff;
  transition-duration:0.3s;
}
.xb>ul{
  display: flex;
  justify-content: space-between;
  width:1200px;
  flex-wrap: wrap;
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
.ht3{
  width:251px;
  height:96px;
  padding:0 20px 16px;
}
.p4{
  width:400px;height:27px;
  font-size:18px;
  color: #353535;
}
.p5{
  width:150px;height:27px;
  font-size:18px;
  color:#44a870;
  text-align:right;
}
.p6{
  height:21px;
  font-size:14px;
  color:#7a7a7a;
  margin-top:8px;
}
.p4,.p5,.p6{
  width:251px;
  text-align:center;
}
.img1{
  width:291px;height:291px;
}
a>img{
  width:1200px;
  height:373px;
}
</style>