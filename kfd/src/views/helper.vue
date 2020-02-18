<template>
<!-- 购物指南 -->
   <div class="helper">
       <div style="height:60px;"></div>
       <div class="helper1">
           <div class="helpper-left">
               <ul type="none" style="padding-top:30px;">
                   <li :class="{active:this.act[0].istrue}" @click="cc(0)">售前支付配送</li>
                   <li :class="{active:this.act[1].istrue}" @click="cc(1)">退款售后</li>
                   <li :class="{active:this.act[2].istrue}" @click="cc(2)">关于茶票</li>
                   <li :class="{active:this.act[3].istrue}" @click="cc(3)">发票相关</li>
                   <li :class="{active:this.act[4].istrue}" @click="cc(4)">存茶服务</li>
                   <li :class="{active:this.act[5].istrue}" @click="cc(5)">尊享服务</li>
                   <li :class="{active:this.act[6].istrue}" @click="cc(6)">等级权益</li>
                   <li :class="{active:this.act[7].istrue}" @click="cc(7)">关于我们</li>
               </ul>
           </div>
           <div class="helpper-right">
              <div :class="{yincan:this.act1[0].istrue}">
                  <p class="p1">大益商城和大益天猫旗舰店有什么区别？</p>
                  <p class="p2">两者都是大益集团自营，但部分重磅商品仅在大益商城发售，并可为重磅茶品提供存茶服务。</p>
                  <p class="p1">为什么有些大益产品没有在大益商城上线？</p>
                  <p class="p2">大益商城以经营大益集团电商产品为主，传统产品您仍需要在传统分销门店购买。</p>
                  <p class="p1">为什么购物车中显示有货，结算时无货?</p>
                  <p class="p2">商品进入结算环节才会锁定库存，建议您将商品添加到购物车后及时付款。</p>
                  <p class="p1">为什么加入购物车后，去结算时价格发生变化？</p>
                  <p class="p2">商品在促销时可能优惠力度比较大，造成抢购到限购数量结束，或促销结束时间到了，所以可能会出现结算时价格变高或变低。</p>
                  <p class="p1">签收时发现商品包装破损，该如何处理?</p>
                  <p class="p2">一旦商品包装出现破损，建议您直接拒收商品，后续问题请联系客服为您处理。</p>
                  <p class="p1">购买过程中的不当行为</p>
                  <p class="p2">
                       用户通过益友会账户操作的各种行为应符合法律法规规定、平台规则规定及注册协议约定，当出现（包含但不限于） 以下行为时，视为用户自愿同意接受大益商城进行权益降级，扣除积分，冻结或关闭益友会账户，取消订单，不再提供服务等操作，且同意大益商城不进行任何赔偿或补偿。<br>
                        <br>
                        如给大益商城或相关方造成损失，用户愿意承担相应责任：<br>
                        1.注册资料内容含虚假信息；<br>
                        2.虚假交易、虚假好评，发布无根据的恶意评价；<br>
                        3.购买正品商品，退货时退回非大益商城平台对应订单中销售的商品、以次充好、以假乱真等行为；<br>
                        4.无故、无正常理由拒收签收订单货物的行为；<br>
                        5.符合非正常订单中的行为。<br>
                  </p>
              </div>
              <div :class="{yincan:this.act1[1].istrue}">
                  <p class="p1">什么情况下可以要求退换货？</p>
                  <p class="p2">大益商城承诺符合以下情况，自客户收到商品之日起7日内可以退货，15日内可以换货，客户可在线提交退货申请办理退换货   事宜。具体退换货标准如下：<br>
                    1. 国家法律所规定的功能性故障或商品质量问题（经由生产厂家指定或特约售后服务中心检测确认，并出具检测报告或经大益商城售后确认属于商品质量问题），7天内可退货，15天内可换货，不收返回运费。<br>
                    2. 到货物流损、漏发或商品描述与网站不符等大益商城原因 (物流损指在运输过程中造成的包装破损、茶叶破碎、包裹被雨水打温、丟件，经售后人员核查情况属实。漏发指商品缺失），7天内可退货，15天内可换货，不收返回运 费（商城审核期间可能需要快递人员证明或要求您提供实物照片等，以便售后人员快速做出判断并及时处理）。<br>
                    3. 以上两种原因之外，如个人原因导致的退换货，在商品完好不影响二次销售的前提下，7天内退货，由您承担商品返回大益商城的运费。
                    * 大益宝盒和会员活动茶品不支持退货退款。</p>
                  <p class="p1">为什么我的订单页面为何无法申请售后?</p>
                  <p class="p2">订单无法申请售后服务可能有以下几种情况：<br>
                    1. 商品在配送途中无法申请售后，您可尝试取消订单；<br>
                    2. 网络或系统问题，建议您刷新页面或稍后再申请；<br>
                    3. 订单已超出售后申请时间。</p>
                  <p class="p1">办理退换货需要多长时间？</p>
                  <p class="p2">一般情况下，退货处理周期（不包含检测时间）如下：<br>
                    退货：自接收到问题商品日期起7日之内处理完成。<br>
                    换货：自接收到问题商品之日起15日之内处理完成。<br>
                    该周期的起始时间以售后登记到货品之日起算的，需要检测的商品时间会相应延长7-15天。国家法定节假日顺延。</p>
              </div>
              <div :class="{yincan:this.act1[2].istrue}">
                  <p class="p1">什么是茶票？</p>
                  <p class="p2">
                     茶票是大益商城推出的商品/服务消费优惠券。已有会员可使用茶票来优惠认购相关商品、使用服务。
                  </p>
                  <p class="p1">为什么部分商品不能使用茶票？</p>
                  <p class="p2">
                      1. 请检查您的茶票是否过期；<br>
                        2. 不同类型茶票对应不同的商品，部分商品不支持使用茶票购买，请留意对应茶票的使用须知。<br>
                  </p>
                  <p class="p1">茶票获取途径</p>
                  <p class="p2">
                    站内：通过活动赠送、客服补偿等获得；<br>
                        站外：通过外部合作渠道获得茶票兑换码，在“个人中心-茶票”进行添加，输入兑换码即可兑换（请在有效期内兑换)。<br>
                  </p>
              </div>
              <div :class="{yincan:this.act1[3].istrue}">
                  <p class="p1">发票的类型有哪些？</p>
                  <p class="p2">
                      目前可以开具：电子增值税普通发票、增值税专用发票。
                  </p>
                  <p class="p1">发票内容可以开什么？</p>
                  <p class="p2">
                        根据订单商品，开具对应明细内容。
                  </p>
                  <p class="p1">为什么我的订单不支持开发票？</p>
                  <p class="p2">
                        当你的订单金额为0元或者该订单完全使用礼品卡支付的时候，或特殊渠道下单时不支持开发票。
                  </p>
                  <p class="p1">什么是电子发票？</p>
                  <p class="p2">
                        电子发票是指在购销商品、提供或者接受服务以及从事其他经营活动中，开具、收取的以电子方式存储的收付款凭证。<br>
                        大益商城开具的发票均为真实有效的合法发票，与传统纸质发票具有同等法律效力。电子发票可以用于财务报销、保修和维权。<br>
                  </p>
                  <p class="p1">电子发票在那里下载？</p>
                  <p class="p2">
                        您可在“个人主页-我的订单”里找到对应的商品订单，点击进入商品详情，点击发票。输入电子邮箱，电子发票即会发送至您的邮箱，请前往查收下载。
                  </p>
              </div>
              <div :class="{yincan:this.act1[4].istrue}">
                  <p class="p1">什么是存茶服务？</p>
                  <p class="p2">北京益友会科技有限公司提供的一项专业茶品仓储托管服务，旨在解决广大益友茶叶的仓储问题。</p>
                  <p class="p1">哪些茶可以存？</p>
                  <p class="p2">大益商城自营的收藏级茶品可使用存茶服务。非收藏级茶品、用户自存茶叶都不在当前存茶服务范围内。</p>
                  <p class="p1">已经发货了，还能选择存茶么？</p>
                  <p class="p2">您只能在支付成功1小时内选择存茶服务，超时将无法使用存茶服务。</p>
                  <p class="p1">普通会员可以存茶么？</p>
                  <p class="p2">目前只有金卡会员可以享受存茶服务。</p>
                  <p class="p1">存茶收费么？</p>
                  <p class="p2">目前存茶服务免费，如有收费，后续将另行通知。</p>
                  <p class="p1">存茶多久可以取？</p>
                  <p class="p2">您使用存茶服务满90天，可选择提取。</p>
                  <p class="p1">提取需要费用么？</p>
                  <p class="p2">提取存茶不需要单独付费。</p>
                  <p class="p1">什么时候开具发票？</p>
                  <p class="p2">如您选择存茶服务，认购茶品发票及存茶服务发票将于提取时统一开具。</p>
              </div>
              <div :class="{yincan:this.act1[5].istrue}">
                  <p class="p1">什么是尊享服务？</p>
                  <p class="p2">
                        北京益友会科技为向益友提供更全面的茶周边服务，特别推出尊享服务，全方位提升和丰富您的茶生活权益。
                  </p>
                  <p class="p1">如何开通尊享服务？</p>
                  <p class="p2">
                        登录大益商城pc端、大益商城小程序、益友会app，访问尊享服务介绍页，完成支付后即可开通。
                  </p>
                  <p class="p1">尊享服务有效期为多久？</p>
                  <p class="p2">
                        尊享服务采⽤年费制，会员可购买一年期尊享服务资格，使用期限为自然年一年。 （例如：2019年3月1日-2020年3月1日）。<br>
                        *尊享服务开通后，您在已开通的服务期内中途主动取消服务或终止资格的，将不获得为开通本服务而支付费用的退还。
                  </p>
                  <p class="p1">尊享服务的权益有哪些？</p>
                  <p class="p2">
                    大益商城权益：大益商城购物享折扣 / 重磅商品申购权益 / 免费存茶服务<br>
                    大益茶庭权益：大益茶庭店面消费折扣 / 茶庭专属茶管家服务 / 茶庭线下茶会尊享通道；<br>
                    *具体折扣以线上实际价格为准；<br>
                    *大益商城重磅商品、宝盒商品等部分不参与折扣；<br>
                    *重磅商品申购权益，仅代表您拥有参与申购的资格，不表示您一定可以申购成功；<br>
                    *以上权益发布日为2019年03月25日，如有调整，以尊享服务介绍页内容为准。
                  </p>
                  <p class="p1">开通尊享服务的费用会计入消费积分和等级积分吗？</p>
                  <p class="p2">会</p>
              </div>
              <div :class="{yincan:this.act1[6].istrue}">
                  <p class="p1">益友会会员等级有几种？</p>
                  <p class="p2">
                        益友会会员目前为普通会员和金卡会员两种。
                  </p>
                  <p class="p1">金卡会员享有什么权益？</p>
                  <p class="p2">
                        1. 大益商城购买商品享有比普通会员更大折扣优惠;<br>
                        2. 享有限购产品更高购买量的特权；<br>
                        3. 享有专属产品优先购买权；<br>
                        4. 享有特供产品选购权；<br>
                        5. 享有试尝新品茶样的特惠；<br>
                        6. 购茶代存服务；<br>
                        7. 购买指定商品尊享极速物流；<br>
                        8. 更多权益敬请期待。
                  </p>
                  <p class="p1">如何成为金卡会员？</p>
                  <p class="p2">
                        大益商城实际消费金额达到1万人民币，升级为金卡会员。<br>
                        * 消费额统计时间点：在您收到商品，点击“确认收货”后的第3天，订单处于完全关闭状态时，进行统计。
                  </p>
                  <p class="p1">会籍的冻结、撤销</p>
                  <p class="p2">
                        【会籍冻结】<br>
                        如果您在益友会各平台账户同时符合以下条件，则益友会有权回收您的账户，并冻结您的会员会籍：<br>
                        1. 连续两年以上（含两年）未使用益友会平台账户登录益友会各平台；<br>
                        2. 平台账户余额为零；<br>
                        3. 不存在任何未到期的有效业务。<br>
                        【会籍撤销】<br>
                        当您的行为违反《益友会会员注册协议》，对益友会的声誉与权益构成重大损害，或对其他会员的权益造成严重损害时，益友会有权终止您的会籍并撤销会员账户，一旦终止会籍，则您在益友会及益友会各平台的会员权益终止。 (详情请认真阅读《益友会会员注册协议》）
                  </p>
              </div>
              <div :class="{yincan:this.act1[7].istrue}">
                  <p class="p1"> 大益商城，大益茶业集团旗下自营电商平台</p>
                  <p class="p2">
                        大益商城于2016年初正式上线，是云南大益茶业集团旗下的自营电商平台。由大益集团旗下子公司——北京益友会科技有限公司，负责相关产品的运营、销售。正品保障，好茶放心购。<br>
                        <br>
                        “借我金箍棒，斗转定乾坤！”2016年初，猴年生肖纪念茶“美猴乾坤”在大益商城耀世首发，开启大益重磅茶品线上销售新时代。伴随着十年皇茶“皇茶壹号”、等峰来“群峰之上”、人文类茶品“天地一流”等优秀茶品的接踵发售，大益商城逐渐被更多的益友认识、熟悉、信任。<br>
                         <br>
                        七十八年品质传承，不忘初心只做好茶。<br>
                        <br>
                        大益商城伴您：春夏秋冬，尽品普洱。年轮兜转，纵享人生。<br>
                        <br>
                        公司地址：北京市海淀区中关村北大街123号华腾科技大厦471房<br>
                        联系电话：400-618-7572<br>
                  </p>
              </div>
           </div>
       </div> 
       <div style="height:60px;"></div>
   </div>
</template>
<script>
// 购物指南详情
export default {
    data(){
        return{
           act:[
               {istrue:true},
               {istrue:false},
               {istrue:false},
               {istrue:false},
               {istrue:false},
               {istrue:false},
               {istrue:false},
               {istrue:false},
           ],
           act1:[
               {istrue:false},
               {istrue:true},
               {istrue:true},
               {istrue:true},
               {istrue:true},
               {istrue:true},
               {istrue:true},
               {istrue:true},
           ]
        }
    },
    methods:{
       cc(e){
          for(var i of this.act){
              i.istrue=false;
          }
          this.act[e].istrue=true;
          for(var a of this.act1){
              a.istrue=true;
          }
          this.act1[e].istrue=false;
       }
    },
    beforeCreate(){
        
    },
    created(){
        
    },
    // 渲染前
    beforeMount(){
        let id=parseInt(this.$route.params.id);
        this.cc(id);
    },
    mounted(){
     
    },
    watch:{
        // 监听路由
        $route(to,from){
           let id=parseInt(this.$route.params.id);
           this.cc(id);
        }
    }
} 
</script>
<style scoped>
.helper{
    background: #e5e5e5;
    margin-top:60px; 
  }
.helper1{
    display: flex;
    min-height:562px; 
    height:100%;
    margin: auto;
    width: 1200px;
    font-size:16px; 
    color:#8b8b8b;
    justify-content: space-between;
  }
  .helpper-left{
      width:240px;
      background:#fff;
  }
  ul>li{
    margin-bottom: 20px;
    padding-left: 30px;
    cursor: pointer;
  }
  .active{
    color: #44a870;
    font-size: 18px;
}
/* 隐藏 */
.yincan{display: none;}
/* 标题 */
.p1{
    margin-bottom: 10px;
    color: #484848;
    font-weight: 700;
    font-size: 18px;
    line-height: 25px;
}
/* 内容 */
.p2{
    margin-bottom: 20px;
    color: #767676;
    font-size: 14px;
    line-height: 20px;
}
.helpper-right{
    box-sizing: border-box;
    margin-left: 10px;
    padding: 30px;
    width: 950px;
    background-color: #fff;
}
</style>