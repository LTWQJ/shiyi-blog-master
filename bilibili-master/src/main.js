import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './plugins/element.js'
// axios请求数据
import axios from "axios"
// 导入lodash
import _ from 'lodash'
// 1.图片懒加载
// npm install vue-lazyload --save
import VueLazyLoad from 'vue-lazyload'

// 导入防止多次点击的节流方法
import preventReClick from './preventReClick'
Vue.use(preventReClick)

// 解决跨域问题
// import '../vue.config.js'

// 导入全局样式表
import './assets/css/global.css'

import NavBar from "./components/common/NavBar";
import VFooter from "./components/common/footer/VFooter"

// 注入工具
Vue.prototype.$lodash = _;

Vue.prototype.$axiosbili = axios

// 事件总线 发射:this.$bus.$emit('aaaa')  接收:this.$bus.$on('aaaa',function)
Vue.prototype.$bus = new Vue()

Vue.config.productionTip = false

// 注册为全局组件
Vue.component('nav-bar', NavBar)
Vue.component('v-footer', VFooter)

// 2.使用懒加载的插件   3.修改img :src -> v-lazy
Vue.use(VueLazyLoad, {
  // 占位图: 还没加载完，用这个图片代替
  loading: require('./assets/img/bilibili.png')
})

//路由操作 解决跨域问题
router.beforeEach((to, from, next) => {
  /* 路由发生变化修改页面meta */
  if (to.meta.content) {
    let head = document.getElementsByTagName('head');
    let meta = document.createElement('meta');
    meta.name = to.meta.name;
    meta.content = to.meta.content;
    head[0].appendChild(meta)
  }
  /* 路由发生变化修改页面title */
  if (to.meta.title) {
    document.title = to.meta.title;
  }
  next()
});

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
