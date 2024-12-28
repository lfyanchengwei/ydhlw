<template>
    <el-header class="custom-header">
      <div class="header-content">
        <div class="header-title">活动报名助手管理端</div>
        <div class="header-actions">
          <el-button type="text" class="action-btn">帮助</el-button>
          <el-button type="text" class="action-btn">设置</el-button>
          <el-button type="text" class="action-btn">退出</el-button>
        </div>
      </div>
    </el-header>
  </template>
  
  <script>
  export default {
    name: "CustomHeader",
  };
  </script>
  
  <style scoped>
  .custom-header {
    background-color: #f5f7fa; /* 柔和背景色 */
    color: #333; /* 字体颜色 */
    padding: 0 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 阴影增强层次感 */
    display: flex;
    align-items: center;
    height: 60px; /* 适中的高度 */
  }
  
  .header-content {
    display: flex;
    justify-content: space-between;
    width: 100%;
    align-items: center;
  }
  
  .header-title {
    font-size: 20px; /* 标题字体大小 */
    font-weight: bold; /* 加粗标题 */
    letter-spacing: 0.5px; /* 增加字母间距 */
  }
  
  .header-actions {
    display: flex;
    gap: 10px; /* 操作按钮间距 */
  }
  
  .action-btn {
    font-size: 14px;
    color: #666; /* 柔和按钮颜色 */
    padding: 5px 10px;
    border-radius: 4px;
    transition: background-color 0.3s ease, color 0.3s ease;
  }
  
  .action-btn:hover {
    background-color: #e4e7ed; /* 按钮悬停背景色 */
    color: #333; /* 悬停字体颜色 */
  }
  </style>
  