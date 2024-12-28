<template>
    <div class="registration-item">
      <p><strong>用户名：</strong>{{ registration.username }}</p>
      <p><strong>报名活动：</strong>{{ registration.title }}</p>
      <p><strong>报名时间：</strong>{{ new Date(registration.registeredAt).toLocaleString() }}</p>
      <p><strong>状态：</strong>{{ registration.status }}</p>
      <StatusUpdater
        :status="registration.status"
        @update="(status) => $emit('update-status', registration.registrationId, status)"
      />
    </div>
  </template>
  
  <script>
  import StatusUpdater from './StatusUpdater.vue';
  
  export default {
    props: {
      registration: {
        type: Object,
        required: true,
      },
    },
    components: { StatusUpdater },
  };
  </script>
  
  <style scoped>
  .registration-item {
    border: 1px solid #ddd;
    padding: 15px;
    margin-bottom: 10px;
  }
  </style>