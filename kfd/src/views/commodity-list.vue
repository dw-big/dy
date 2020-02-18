<template>
<!-- 商品列表 -->
   <div class="bodyer" style="margin-top:60px;">
       <img style="width:100%;" :src="`http://127.0.0.1:5050/${this.imgid1.img}`"/>
        <h1 style="color:#767676;width:1200px;margin:0 auto;padding:20px 0 10px;">{{this.imgid1.title}}</h1>
        <div class="mianbaoxie">
            <div :class="{active:this.showA[0].istrue}" @click="pxxz(0)">综合排序</div>
            <div :class="{active:this.showA[1].istrue}" @click="pxxz(1)">销量排序</div>
            <div :class="{active:this.showA[2].istrue}" @click="pxxz(2)">新品优先</div>
            <div class="last" :class="{active:this.showA[3].istrue}" @click="pxxz1(3)">
              价格排序
              <div class="">
                 <div class="iconfont iconeen" :class="this.upshow?'z':'l'"></div>
                <div class="iconfont icondown" :class="this.dowshow?'z':'l'"></div>
              </div>
            </div>     
        </div>
        <hr style="background-color:#d6d6d6;height:1px;border:none;">
        <shop-list :shops="shopping"></shop-list>
   </div>
</template>
<script>
// 商品列表组件
export default {
    data(){
        return{
          // 列表图片
           imgid1:{},
          //  面包屑导航栏变色
          showA:[
            {istrue:true},
            {istrue:false},
            {istrue:false},
            {istrue:false},
          ],
          n:0,
          upshow:false,
          dowshow:false,
          // 当前页标题
          ti:"",
          // 商品列表商品
          shopping:[]
        }
    },
    methods:{
    // 根据path查询   
      listImg(){
        this.ti=this.$route.params.title;
        // 设置标题
        let title=document.getElementById("title")
        title.innerHTML=this.ti;
        this.axios.get("/listImg",{params:{title:this.ti}})
        .then(res=>{
            this.imgid1=res.data.data[0];
        })
      },
      // 排序查询
      chaxun(e){
        this.axios.get("/commodityList",{params:{title:this.ti,id:e}})
        .then(res=>{
            this.shopping=res.data.data;
        })
      },
      // 排序
      pxxz(e){
         for(var item of this.showA){
               item.istrue=false;
         }
         this.showA[e].istrue=true;
         this.upshow=false;
         this.dowshow=false;
         this.n=0;
         this.chaxun(e);
      },
      pxxz1(e){
         for(var item of this.showA){
               item.istrue=false;
         }
         this.showA[e].istrue=true;
         this.n++;
         if(this.n==1){
           this.upshow=true;
           this.dowshow=false;
           this.chaxun(3);
         }else{
           this.upshow=false;
           this.dowshow=true;
           this.n=0;
           this.chaxun(4);
         }
      },
    },
    created(){
       this.listImg();
      //  首次加载查询商品
       this.chaxun(0);
    },
    watch:{
        // 监听路由
        $route(to,from){
           this.listImg();
           //  首次加载查询商品
           this.pxxz(0);
        }
    }
}
</script>
<style scoped>
 .bodyer{
  background:#f2f2f2;
}
.l{
  font-size:8px;
  color: #7a7a7a
  }
.z{
  font-size:8px;
  color:#44a870
  }
/* 面包屑 */
.mianbaoxie{
  width:1200px;
  font-size: 14px;
  color:#666666;
  margin: 0 auto;
  display: flex;
}
.mianbaoxie>div{
    margin-right: 35px;
    padding-bottom: 10px;
    border-bottom:2px solid #f2f2f2;
    cursor: pointer;
}
.last{
  display: flex;
}
.last>div{
  cursor: pointer;
  padding-left: 6px
}
/* 排序变色 */
.active{
    color: #44a870;
    border-bottom:2px solid #44a870 !important;
}

</style>>