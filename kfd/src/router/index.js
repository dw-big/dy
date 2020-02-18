import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)
const routes = [
  {
    path: '/',
    name: 'home',
    component: Home,
    meta: {
      title: '大益商城'
    }
  },
  {
    path: '/login',
    name: 'login',
    component: () => import(/* webpackChunkName: "login" */ '../views/login.vue'),
    // 设置当前title
    meta: {
      title: '登录大益商城'
    }
  },
  {
    path: '/register1',
    name: 'register1',
    component: () => import(/* webpackChunkName: "register1" */ '../views/register1.vue'),
    // 设置当前title
    meta: {
      title: '注册大益商城'
    }
  },
  {
    path: '/protocol',
    name: 'protocol',
    component: () => import(/* webpackChunkName: "protocol" */ '../views/protocol.vue'),
    // 设置当前title
    meta: {
      title: '大益商城注册协议'
    }
  },
  {
    path: '/helper/:id',
    name: 'helper',
    component: () => import(/* webpackChunkName: "helper" */ '../views/helper.vue'),
    // 设置当前title
    meta: {
      title: '常见问题'
    }
  },
  // 商品详情
  {
    path: '/commodity-detail/:id',
    name: 'commodityDetail',
    component: () => import(/* webpackChunkName: "commodityDetail" */ '../views/commodity-detail.vue')
  },
  // 商品列表
  {
    path: '/commodity-list/:title',
    name: 'commodityList',
    component: () => import(/* webpackChunkName: "commodityList" */ '../views/commodity-list.vue'),
    // 设置当前title
  },
  // 查询页面
  {
    path: '/search/:title',
    name: 'search',
    component: () => import(/* webpackChunkName: "search" */ '../views/search.vue'),
    // 设置当前title
    meta: {
      title: '大益商城搜索'
    }
  },
  // 购物车
  {
    path: '/shopping-cart',
    name: 'shoppingCart',
    component: () => import(/* webpackChunkName: "shoppingCart" */ '../views/shopping-cart.vue'),
    // 设置当前title
    meta: {
      title: '我的购物车'
    }
  },
  // 订单确认
  {
    path: '/shoppingBalance/:id',
    name: 'shoppingBalance',
    component: () => import(/* webpackChunkName: "shoppingBalance" */ '../views/shopping-balance.vue'),
    // 设置当前title
    meta: {
      title: '订单确认'
    }
  },
  // 个人中心
  {
    path: '/ucenter',
    name: 'ucenter',
    component: () => import(/* webpackChunkName: "ucenter" */ '../views/ucenter.vue'),
    // 子路由
    children:[
      // 我的订单
      {
        path:'/onents/:id',
        name:'onents',
        component: () => import(/* webpackChunkName: "onents" */ '../components/gerenzhongxin/order.vue'),
        // 设置当前title
        meta: {
          title: '个人中心'
        }
      },
      // 个人中心
      {
        path:'/ucenter/ucenterRighta',
        name:'ucenterRighta',
        component: () => import(/* webpackChunkName: "ucenterRighta" */ '../components/gerenzhongxin/ucenterRighta.vue'),
         // 设置当前title
         meta: {
          title: '个人中心'
        }
      },
      // 个人信息
      {
        path:'/account-related/personal',
        name:'personal',
        component: () => import(/* webpackChunkName: "personal" */ '../components/gerenzhongxin/personal.vue'),
         // 设置当前title
         meta: {
          title: '个人中心'
        }
      },
      // 手机认证
      {
        path:'/account-related/mobile',
        name:'mobile',
        component: () => import(/* webpackChunkName: "mobile" */ '../components/gerenzhongxin/mobile.vue'),
         // 设置当前title
         meta: {
          title: '个人中心'
        }
      },
      //登录密码
      {
        path:'/account-related/password',
        name:'password',
        component: () => import(/* webpackChunkName: "password" */ '../components/gerenzhongxin/password.vue'),
         // 设置当前title
         meta: {
          title: '个人中心'
        }
      },
      //茶票
      {
        path:'/shopping-related/coupon',
        name:'coupon',
        component: () => import(/* webpackChunkName: "coupon" */ '../components/gerenzhongxin/coupon.vue'),
         // 设置当前title
         meta: {
          title: '个人中心'
        }
      },
      //钱包
      {
        path:'/shopping-related/wallet',
        name:'wallet',
        component: () => import(/* webpackChunkName: "wallet" */ '../components/gerenzhongxin/wallet.vue'),
         // 设置当前title
         meta: {
          title: '个人中心'
        }
      },
      //收货信息
      {
        path:'/shopping-related/delivery',
        name:'delivery',
        component: () => import(/* webpackChunkName: "delivery" */ '../components/gerenzhongxin/delivery.vue'),
         // 设置当前title
         meta: {
          title: '个人中心'
        }
      },
      //开票信息
      {
        path:'/shopping-related/invoice',
        name:'invoice',
        component: () => import(/* webpackChunkName: "invoice" */ '../components/gerenzhongxin/invoice.vue'),
         // 设置当前title
         meta: {
          title: '个人中心'
        }
      },
      //存茶服务
      {
        path:'/friends-service/savetea',
        name:'savetea',
        component: () => import(/* webpackChunkName: "savetea" */ '../components/gerenzhongxin/savetea.vue'),
         // 设置当前title
         meta: {
          title: '个人中心'
        }
      },
      //站内消息
      {
        path:'/friends-service/message',
        name:'message',
        component: () => import(/* webpackChunkName: "message" */ '../components/gerenzhongxin/message.vue'),
         // 设置当前title
         meta: {
          title: '个人中心'
        }
      },
    ],
    // 设置当前title
    meta: {
      title: '个人中心'
    }
  },
  {
    path:'/shoppingPay',
    name:'shoppingPay',                     //打包生成js文件的名字      路由的位子
    component: () => import(/* webpackChunkName: "shoppingPay" */ '../views/shopping-pay.vue'),
     // 设置当前title
     meta: {
      title: '订单支付'
    }
  }
  // 懒加载
  // {
  //   path: '/about',
  //   name: 'about',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
