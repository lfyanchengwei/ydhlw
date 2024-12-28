import Vue from 'vue';
import App from './App.vue';
import router from './router'; // 引入路由配置
import store from './store';

import ElementUI from 'element-ui'; // 引入 Element UI
import 'element-ui/lib/theme-chalk/index.css'; // 引入 Element UI 的样式
import axios from 'axios'; // 引入 axios 用于 API 调用

// 配置 Vue 全局使用的插件
Vue.use(ElementUI);


// 配置 axios
axios.defaults.baseURL = 'http://154.8.140.108:8883'; // 设置全局 API 基础路径http://154.8.140.108:8883  http://127.0.0.1:8883
Vue.prototype.$axios = axios; // 将 axios 绑定到 Vue 原型上，便于全局使用

Vue.config.productionTip = false; // 关闭生产模式下的提示

router.beforeEach((to, from, next) => {
  // 设置动态标题
  document.title = to.meta.title || '活动管理系统';
  const isAuthenticated = store.getters.isAuthenticated;
  if (to.matched.some((record) => record.meta.requiresAuth) && !isAuthenticated) {
    next("/login");
  } else {
    next();
  }
});

// 创建 Vue 实例并挂载到 DOM
new Vue({
  router, // 注入路由
  store,
  render: (h) => h(App),
}).$mount('#app');
