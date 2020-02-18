<template>
<!-- 首页 -->
  <div class="home">
    <!-- 轮播图 -->
     <div>
       <el-carousel trigger="click" height="600px">
        <el-carousel-item v-for="(item,i) of this.banner1" :key="i">
          <router-link :to="item.href"><img style="width:100%;height:100%" :src="`http://127.0.0.1:5050/${item.img}`"/></router-link>
        </el-carousel-item>
      </el-carousel>
     </div>
      <!-- 展示区 -->
     <div id="bodyer">
       <!-- 新品推荐 -->
        <xinpin :xinpin="xinpin1"></xinpin>
         <!-- 立冬饮茶 -->
        <index-product :xinpin="lidong" :xinpin1="lidong1"></index-product>
         <!-- 普洱熟茶 -->
        <index-product :xinpin="puer" :xinpin1="puers"></index-product>
         <!-- 普洱生茶 -->
        <index-product :xinpin="puer1" :xinpin1="puers1"></index-product>
         <!-- 大益茶庭 -->
        <index-product :xinpin="dayi" :xinpin1="dayi1"></index-product>
         <!-- 质美茶器 -->
        <index-product :xinpin="zhimei" :xinpin1="zhimei1"></index-product>
         <!-- 茶礼甄选 -->
        <index-product :xinpin="chali" :xinpin1="chali1"></index-product>
         <!-- 习茶有道 -->
        <index-product :xinpin="xicha" :xinpin1="xicha1"></index-product>
     </div>
  </div>
</template>

<script>
// 首页
import xinpin from '../components/xinpin.vue'
import indexProduct from '../components/indexProduct.vue'
export default {
  data(){
    return{
      // 保存轮播图数据
      banner1:[],
      //新品推荐
      xinpin1:[],
      // 立冬饮茶
      lidong:[],
      lidong1:{},
      // 普洱熟茶
      puer:[],
      puers:{},
      // 普洱生茶
      puer1:[],
      puers1:{},
      // 大益茶庭
      dayi:[],
      dayi1:{},
      // 质美茶器
      zhimei:[],
      zhimei1:{},
      // 茶礼甄选
      chali:[],
      chali1:{},
      // 习茶有道
      xicha:[],
      xicha1:{},
    }
  },
  // 注册组件
  components: {
    xinpin,
    indexProduct,
  },
  methods:{
    //获取轮播图
    banner(){
      this.axios.get("/banner")
      .then(res=>{
        this.banner1=res.data.data;
      })
    },// 获取首页新品数据
    xinpin(item){
         this.axios.get("/index",{params:{title:item}})
        .then(res=>{
          if(item=="新品推荐"){this.xinpin1=res.data.data}
          else if(item=="立冬饮茶"){
            this.lidong1=res.data.data[0];
            this.lidong=res.data.data.slice(1);
          }
          else if(item=="普洱熟茶"){
            this.puers=res.data.data[0];
            this.puer=res.data.data.slice(1);
          }
          else if(item=="普洱生茶"){
            this.puers1=res.data.data[0];
            this.puer1=res.data.data.slice(1);
          }
          else if(item=="大益茶庭"){
            this.dayi1=res.data.data[0];
            this.dayi=res.data.data.slice(1);
          }
          else if(item=="质美茶器"){
            this.zhimei1=res.data.data[0];
            this.zhimei=res.data.data.slice(1);
          }
          else if(item=="茶礼甄选"){
            this.chali1=res.data.data[0];
            this.chali=res.data.data.slice(1);
          }
          else{
            this.xicha1=res.data.data[0];
            this.xicha=res.data.data.slice(1);
          }
        })
    },
  },
  created(){
      // 创建时查询轮播图
      this.banner();
      // 查询首页商品
      this.xinpin("新品推荐");
      this.xinpin("立冬饮茶");
      this.xinpin("普洱熟茶");
      this.xinpin("普洱生茶");
      this.xinpin("大益茶庭");
      this.xinpin("质美茶器");
      this.xinpin("茶礼甄选");
      this.xinpin("习茶有道");
  }
}
</script>
<style scoped>
  .home{
    margin-top:60px;
  }
  #bodyer{
  background:#f2f2f2;
}
</style>
