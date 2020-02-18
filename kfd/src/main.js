import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
// 引入矢量图
import"./font/iconfont.css"
// 全局引入header组件
import myheader from './components/header.vue'
// 全局引入foot组件
import myfoot from './components/foot.vue'
// 全局引入errtishi
import ErrTishi from './components/ErrTishi.vue'
// 全局引入商品列表
import shoplist from './components/shoplist.vue'
// 猜你喜欢
import xihuan from './components/cainixihuan.vue'
// 步骤条
import buzhoutiao from './components/buzhoutiao.vue'
// 引入头像上传组件
import upate from './components/upate.vue'

// *****引入axios模块*****
import axios from "axios";
// 配置访问服务器基础路径
axios.defaults.baseURL="http://127.0.0.1:5050/";
// 发送请求保存session信息
axios.defaults.withCredentials=true;
// 注册
Vue.prototype.axios=axios;
// 引入vue-cookies组件  用于保存登录状态
import VueCookies from 'vue-cookies'
// 注册vue-cookies对象
Vue.use(VueCookies)
// 引入element-ui
import ElementUI from 'element-ui';
// 引入element-ui样式
import 'element-ui/lib/theme-chalk/index.css';
// 注册ElementUI
Vue.use(ElementUI);
// 建立header标签
Vue.component("my-header",myheader);
// 建立foot标签
Vue.component("my-foot",myfoot);
// 建立ErrTishi标签  错误提示
Vue.component("err-tishi",ErrTishi);
// 建立商品列表标签
Vue.component("shop-list",shoplist);
// 猜你喜欢
Vue.component("you-xihuan",xihuan);
// 建立步骤条标签
Vue.component("my-buzhoutiao",buzhoutiao)
// 建立上传图片标签
Vue.component( "my-upate",upate)

Vue.config.productionTip = false
// 动态改变导航栏title
router.beforeEach((to, from, next) => {
  /* 路由发生变化修改页面title */
  if (to.meta.title) {
    document.title = to.meta.title
  }
  next()
})
// 定义全局函数
// Vue.prototype.changeData = function (e){
 
// }
// 自定义聚焦指令 focus   使用v-focus
Vue.directive('focus', {
  inserted(el){
    el.focus()
  }
})
// 跳转后返回顶部
router.afterEach((to,from,next) => {
  window.scrollTo(0,0);
 })
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
