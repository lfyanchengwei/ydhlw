<template>
  <el-container>
    <el-header><customHeader></customHeader></el-header>
    <el-container>
      <el-aside width="250px">
        <el-menu
        default-active="2"
        class="el-menu-vertical-demo"
        @open="handleOpen"
        @close="handleClose"
        background-color="#f5f4f1"
        text-color="#000"
        active-text-color="#ffd04b"
        style="height: 100vh;"
        router>
 
          <el-submenu index="1">
            <template slot="title">
              <i class="el-icon-location"></i>
              <span>活动管理</span>
            </template>
              <el-menu-item index="/newEvent">新增活动</el-menu-item>
              <el-menu-item index="/eventList">活动列表</el-menu-item>
          </el-submenu>

          <el-submenu index="2">
            <template slot="title">
              <i class="el-icon-location"></i>
              <span>报名管理</span>
            </template>
            <el-menu-item index="/registrationPending">报名审批</el-menu-item>
            <el-menu-item index="/eventOverview">活动名单</el-menu-item>
          </el-submenu>
        
          <el-submenu index="3">
            <i class="el-icon-document"></i>
            <template>
              <i class="el-icon-edit-outline"></i>
              <span slot="title">用户管理</span>
            </template>
            <el-menu-item index="/userList">用户名单</el-menu-item>
          </el-submenu>
        </el-menu>
      </el-aside>
      <el-main style="padding-left: 0;padding-right:0;">
        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
import customHeader from '@/components/CustomHeader.vue'
export default {
  name: "App",
  components: {
    customHeader
  },
};
</script>

<style>
body {
  margin: 0;
  font-family: Arial, sans-serif;
}
</style>
