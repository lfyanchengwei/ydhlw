import Vue from 'vue';
import Router from 'vue-router';

import EventList from "@/views/EventList";
import Login from "@/views/Login";
import EventListPage from '@/views/EventOverview.vue'; // 活动列表页面
import EventDetailPage from '@/views/EventDetail.vue'; // 活动详情页面

Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/login",
      name: "Login",
      component: Login,
      meta: { title:'登录' },
    },
    {
      path: "/newEvent",
      name: "NewEvent",
      component: () => import("@/views/NewEvent.vue"),
      meta: { requiresAuth: true,title:'增加活动' }, // 需要登录
    },
    {
      path: "/eventList",
      name: "EventList",
      component: EventList,
      meta: { requiresAuth: true, title:'活动列表' }, // 需要登录
    },
    {
      path:"/registrationPending",
      name: "RegistrationPending",
      component: () => import("@/views/RegistrationPage.vue"),
      meta: { requiresAuth: true,title:'报名列表' }, // 需要登录
    },
    {
      path: '/eventOverview',
      name: 'EventList',
      component: EventListPage,
      meta: { title: '活动情况' }, // 设置页面标题
    },
    {
      path: '/event/:eventId',
      name: 'EventDetail',
      component: EventDetailPage,
      meta: { title: '活动详情' },
      props: true, // 将路由参数注入到组件 props 中
    },
    {
      path: "/editEvent/:eventId",
      name: "EditEvent",
      component: () => import("@/views/EditEvent.vue"),
      meta: { title:'编辑活动', requiresAuth: true }, // 需要登录
      props: true,
    },
    // 默认路径重定向
    { path: '*', redirect: '/login' },
    
  ],
});
