<template>
<!-- 模糊查询 -->
  <div class="search">
    <div class="search-top">
       <img style="width:100%;" src="http://127.0.0.1:5050/img/search/01.png"/>
       <div class=xianshi>
            <div>
                <h3>搜索"{{this.title}}"的结果</h3>
                <p>共{{this.shopping.length}}件商品</p>
            </div>
       </div>
    </div>
    <div class="search-center">
       <div v-if="this.shopping.length==0">
           <p class="p1">没有搜索到与"{{this.title}}"有关的结果</p>
           <p class="p2">请仔细检查所输入的字词是否正确无误。</p>
           <img src="http://127.0.0.1:5050/img/search/02.jpg"/>
       </div>
       <!-- 商品列表标签 -->
       <shop-list v-else :shops="shopping"></shop-list>
    </div>
    <you-xihuan :cai="cai1"></you-xihuan>
  </div>
</template>
<script>
export default {
    data(){
        return{
          title:"",
        //   查询关键字
          shopping:[],
        //   猜你喜欢
          cai1:[]
        }
    },
    methods:{
        // 查询物品
        shopname2(){
            this.title=this.$route.params.title;
            this.shopping=[];
            this.axios.get("/productName",{params:{product_name:this.title}})
            .then(res => {
                if(res.data.code==1){
                    this.shopping=res.data.data;
                }
            })
        },
               // 猜你喜欢
       xihuan(){
           let i=Math.ceil(Math.random()*26);
           this.axios.get("/cainixihu",{params:{id:i}})
           .then(res => {
              this.cai1=res.data.data;
           })
       }
    },
    created(){
       // 查询物品
       this.shopname2();
        this.xihuan();
    },
    watch:{
        $route(to,from){
          // 查询物品
            this.shopname2();
        },
    },
}
</script>
<style scoped>
.search{
    margin-top:60px;
    background:#f2f2f2;
}
.search-top{
    position: relative;
}
.xianshi{
    width:100%;
    position: absolute;
    bottom:93px;
    color: #fff;
    font-size: 36px; 
    text-align: center;
}
.xianshi>div>p{ 
    font-size:16px;
}
.search-center{
    width:1200px;
    margin: 0 auto;
}
.search-center>div{
    text-align: center;
}
.search-center>div>img{
    width:70px;
    height:70px;
}
.p1{
    font-size: 24px;
    padding: 30px 0 10px;
    color: #10181f;
}
.p2{
    color: #333;
    padding-bottom: 20px;
    font-size: 14px;
}
</style>>