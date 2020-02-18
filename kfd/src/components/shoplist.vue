<template>
<!-- 商品列表 -->
     <div class="xb">
            <ul type="none">
                <li v-for="(item,i) of this.shops" :key="i">
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
    props:["shops"],
    data(){
        return{

        }
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
  width: 291px; 
  margin-top:12px;
  margin-right: 9px;
  background: #fff;
  transition-duration:0.3s;
}
.xb>ul{
  display: flex;
  flex-wrap: wrap;
  justify-items: auto;
  width:1200px;
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
</style>