<template>
<!-- 商品详情 -->
   <div style="margin-top:60px;">
        <div class="top">
            <div>
                <img :src="`http://127.0.0.1:5050/${this.shop.simg}`"/>
            </div>
            <div class="top-right">
                <h1 style="color:#484848;">{{this.shop.product_name}}</h1>
                <div class="df">{{this.shop.shopfname}}</div>
                <div class="top-right-center">
                    <div>
                        <p style="font-size:20px;color:#484848;">{{this.shop.spec}}</p>
                        <p style="font-size:12px;">益购统一发售价</p>
                    </div>
                    <div class="ff">￥<span>{{this.shop.price}}</span></div>
                    <div class="sanjiao"></div>
                </div>
                 <div class="jishuqi">数量&nbsp;
                    <el-input-number v-model="num" :min="1" :max="50" size="small"></el-input-number>
                </div>
                <div class="top-right-bottom">
                    <h3>服务</h3>
                    <ul>
                        <li>无忧售后</li>
                        <li>满199包邮</li>
                    </ul>
                </div>
                 <div v-if="this.shop.counts==0" class="btn1">
                    <div class="btn2">已售完</div>
                </div>
                <div v-else class="btn1">
                    <div class="btn3" @click="goumai">立即购买</div>
                    <div class="btn4" @click="addcart">加入购物车</div>
                </div>
            </div> 
        </div>
        <div class="center">
            <h1>商品详情</h1>
            <ul>
                <li>{{this.shopgg.lname}}</li>
                <li>{{this.shopgg.os}}</li>
                <li>{{this.shopgg.memory}}</li>
                <li>{{this.shopgg.resolution}}</li>
                <li>{{this.shopgg.video_card}}</li>
                <li>{{this.shopgg.cpu}}</li>
                <li>{{this.shopgg.video_memory}}</li>
                <li>{{this.shopgg.category}}</li>
                <li>{{this.shopgg.disk}}</li>
                <li>{{this.shopgg.ssk}}</li>
            </ul>
        </div>
        <div class="bottom">
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img1}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img2}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img3}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img4}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img5}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img6}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img7}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img8}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img9}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img10}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img11}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img12}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img13}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img14}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img15}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img16}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img17}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img18}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img19}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img20}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img21}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img22}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img23}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img24}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img25}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img26}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img27}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img28}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img29}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img30}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img31}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img32}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img33}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img34}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img35}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img36}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img37}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img38}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img39}`"/>
            <img :src="`http://127.0.0.1:5050/${this.shopimgs.img40}`"/>
        </div>
   </div>
</template>
<script>
// 商品详情组件
export default {
    data(){
        return{
            num:1,
             //商品内容
            shop:{},
            // 商品规格
            shopgg:{},
            // 商品详情图片
            shopimgs:{},
            // 节流
            canclick:true
        }
    },
    methods:{
      //商品内容
      shopneiro(){
          let $id=this.$route.params.id;
          this.axios.get("/commodityListId",{params:{id:$id}})
          .then(res => {
              this.shop=res.data.data[0];
              title.innerHTML=this.shop.product_name;
          })
          .catch(err => {
              console.error(err); 
          })
        },
        // 商品规格
        shopguige(){
            let $id=this.$route.params.id;
            this.axios.get("/dyLaptop",{params:{id:$id}})
            .then(res => {
                this.shopgg=res.data.data[0];
            })
            .catch(err => {
                console.error(err); 
            })
        },
        // 商品详情图片
        shopimg(){
            let $id=this.$route.params.id;
            this.axios.get("/dyLaptopImg",{params:{id:$id}})
            .then(res => {
                this.shopimgs=res.data.data[0];
            })
            .catch(err => {
                console.error(err); 
            })
        },
        // 立即购买
        goumai(){
            let ad={shopp_id:this.shop.nid,shopp_img:this.shop.simg,shopp_title:this.shop.product_name,shopp_price:this.shop.price,shopp_count:this.num,uid:$cookies.get("keys1"),spec:this.shop.spec};
            this.$store.commit("setGoumai",ad)
            this.$router.push("/shoppingBalance/2");
        },
        // 加入购物车
        jiarcart(){
            if($cookies.get("keys1")!=undefined){
                let shopp_id=this.shop.nid;
                let shopp_img=this.shop.simg;
                let shopp_title=this.shop.product_name;
                let shopp_price=this.shop.price;
                let spec=this.shop.spec;
                let href=this.shop.href;
                let uid=$cookies.get("keys1");
                let obj={shopp_id,shopp_img,shopp_title,shopp_count:this.num,shopp_price,spec,href,uid};
                this.axios.get("/shoppingCart", {params:obj})
                .then(res => {
                    if(res.data.code==-1){
                        this.$message.error(`${res.data.msg}`);
                        return;
                    }
                    if(res.data.code==2){
                        this.$message.success(`${res.data.msg}`);
                    }
                    if(res.data.code==1){
                        this.$message.success(`${res.data.msg}`);
                    }
                    // 在vuex添加新购物车数据
                    this.$store.commit("xincartlist",obj);
                    // 更新vuex商品数量
                    this.$store.commit("addmCount",this.num);
                })
            }else{
                this.$router.push("/login");
            }
        },
        // 加入购物车节流
        addcart(){
            if(this.canclick){
                this.canclick=false;
                setTimeout(()=>{
                    this.jiarcart();
                    this.canclick=true;
                },600)
            }
        }
    },
    created(){
        //  首次加载查询商品
        this. shopneiro();
        // 加载商品规格
        this.shopguige();
        // 商品详情图片
        this.shopimg();
    },
    watch: {
       $route(to,from){
          // 查询物品
            this.shopneiro();
            // 商品规格
            this.shopguige();
            // 商品详情图片
            this.shopimg();
        },
    },
}
</script>
<style scoped>
/* 上部 */
.top{
    width: 1200px;
    margin:0 auto; 
    display: flex;
}
.top img{
    width: 460px;
    height: 460px;
}
.top-right{
    overflow: hidden;
    margin-top: 40px;
    margin-left: 118px;
    width: 430px;
    color:#767676;
}
.df{
    font-size: 16px;
    margin-bottom:30px;
}
.top-right ul{
    display: flex;
    width:230px;
    justify-content: space-around;
    margin-top:10px;
}
.top-right-bottom{
    border-top: 1px solid #ececec;
    border-bottom: 1px solid #ececec;
    padding: 11px 0;
}
.top-right-center{
    width: 388px;
    height:46px;
    display: flex;
    justify-content: space-between;
    padding: 16px 20px;
    border: 1px solid #44a870;
    border-radius: 2px;
    margin-bottom: 10px;
    position: relative;
}
.sanjiao{
    position:absolute;
    border-bottom: 6px solid #44a870;
    border-right: 6px solid #44a870;
    border-top:6px solid #fff;
    border-left: 6px solid #fff;
    bottom:0;
    right:0;
}
.ff{
     line-height: 46px;
     color: #44a870;
     font-size:16px; 
}
.ff>span{
    font-size: 36px;
}
.jishuqi{
    padding:22px 0 24px;
}
.btn1{
    margin-top:30px;
    display: flex;
    justify-content: space-between; 
}
.btn2,.btn3,.btn4{
    width: 198px;
    height:48px;
    border:1px solid #44a870;
    color: #fff;
    text-align: center;
    background-color: #44a870;
    border-radius: 4px;
    line-height: 48px;
    font-size:16px; 
    cursor: pointer;
}
.btn2{
    background-color: #767676;
}
.btn3:hover{
    background-color: #058a4a;
}
.btn4{
    color: #44a870;
    background-color: #fff;
}
.btn4:hover{
    background: rgba(29, 136, 29,0.3)
}
/* 中部 */
.center{
     width: 1200px;
    margin:0 auto; 
}
.center>h1{
    color: #484848;
    font-size: 30px;
    padding-bottom:20px ;
    margin-bottom: 30px;
    border-bottom:1px solid #ececec;
}
.center>ul{
    height:160px;
     padding-bottom: 20px;
     margin-bottom: 40px;
     border-bottom:1px solid #ececec;
}
.center>ul li{
    width:590px;
    height:22px;
     margin-bottom: 10px;
     float: left;
}
/* 底部 */
.bottom{
    width:1200px;
    margin:0 auto;
}
.bottom>img{
    width:1200px;
    height:100%;
    display: block;
}
</style>