import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  // 共享数据   储存数据
  state: {
    // 商品数量
    count:0,
    // 购物车数据
    countList:[],
    // 总钱数
    yuan:0,
    // 收货地址列表
    list:[],
    // 立即购买
    goumai:{},
    // 保存付款时的金额
    fkyuan:0,
    // 买单时的商品
    maidan:[]
  },
  // (2).修改共享数据
  // 提交更新数据的方法,必须是同步的
  mutations:{
    // 修改  所有
    addCount(state,n){state.count=n},
    // 加多个数量
    addmCount(state,n){state.count+=n},
    // 清空数量
    clearCount(state){state.count=0},
    // 设置购物车数据
    addcartlist(state,n){state.countList=n},
    // 删除一个商品数据
    deleteListOnce(state,n){state.countList.splice(n,1)},
    // 添加购物车新数据
    xincartlist(state,n){
      let i=true;
       for(let item of state.countList){
          if(item.shopp_id==n.shopp_id){
              item.shopp_count+=n.shopp_count;
              i=false;
          }
       };
       if(i)state.countList.push(n);
    },
    //清空购物车数据
    clearcartlist(state){state.countList=[]},
    //设置用户名
    setFname(state,n){state.fname=n},
    // 设置收货地址信息
    setList(state,n){state.list=n},
    // 修改默认
    updateList1(state,n){
      for(let item of state.list){
        item.is_default=false;
      }
      state.list[n].is_default=true;
    },
    // 修改默认  编辑时
    updateList3(state,n){
      for(let item of state.list){
        item.is_default=false;
        if(item.aid==n.aid){
          item.is_default=true;
        }
      }
    },
  //  添加
    updateList2(state,n){
       // 无默认地址的情况下添加
      if(n.is_default==false){
        state.list.push(n)
      }else{
         // 有新默认地址的情况添加
        for(let item of state.list){
          item.is_default=false;
        }
        state.list.unshift(n);
      }
    },
    // 删除一个收货地址
    deleteListSH(state,n){state.list.splice(n,1)},
    // 删除所有收货地址
    celarListSH(state){state.list=[]},
    // 设置购买商品
    setGoumai(state,n){state.goumai=n},
    // 设置买单商品
    setmaidan(state,n){state.maidan.push(n)},
    // 买单商品清空
    clearmaidan(state){state.maidan=[]},
    // 设置付款的金额
    setfkyuan(state,n){state.fkyuan=n},
    // 清除付款的金额
    clearfkyuan(state){state.fkyuan=0}
  },
  // 从基本数据(state)派生的数据,相当于state的计算属性
  getters:{
      // 得到购物车数量
      getCount(state){
        state.count=0;
        for(let item of state.countList){
            state.count+=item.shopp_count;
        }
        return state.count
      },
      // 得到所有购物车数据
      getSYcartlist(state){return state.countList},
      // 得到后三条数据
      getstcartlist(state){return state.countList.slice(-3)},
      // 得到总金额
      getyuan(state){
        state.yuan=0;
        for(let item of state.countList){
           state.yuan+=item.shopp_count*item.shopp_price;
        }
        return state.yuan;
      },
      // 得到收货地址信息
      getList(state){return state.list},
      // 得到购物商品
      getGoumai(state){return state.goumai},
      // 获取付款金额
      getfkyuan(state){return state.fkyuan},
      // 获取买单的商品
      getmaidan(state){return state.maidan}
  },
  // 异步使用action
  actions:{
      
  },
  // 模块化vuex，可以让每一个模块拥有自己的state、mutation、action、getters,使得结构非常清晰，方便管理。
  modules:{

  }
})
