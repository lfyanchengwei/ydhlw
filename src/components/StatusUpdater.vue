<template>
    <div class="status-updater">
      <label for="status">更改状态：</label>
      <select v-model="currentStatus" @change="updateStatus">
        <option value="pending">待处理</option>
        <option value="approved">已批准</option>
        <option value="rejected">已拒绝</option>
        <option value="participated">已参与</option>
      </select>
    </div>
  </template>
  
  <script>
  export default {
    props: {
      status: {
        type: String,
        required: true,
      },
    },
    data() {
      return {
        currentStatus: this.status,
      };
    },
    methods: {
      updateStatus() {
        this.$emit('update', this.currentStatus);
      },
    },
  };
  </script>
  
  <style scoped>
  .status-updater {
    margin-top: 10px;
  }
  </style>