<template>
    <div class="registration-page">
      <RegistrationList @update-status="updateStatus" />
    </div>
  </template>
  
  <script>
  import RegistrationList from '@/components/RegistrationList.vue';
  import { updateRegistrationStatus } from '@/api/registration';
  
  export default {
    components: { RegistrationList },
    methods: {
      updateStatus(registrationId, status) {
        updateRegistrationStatus(registrationId, status).then(() => {
          alert('状态更新成功');
        });
      },
    },
  };
  </script>
  
  <style scoped>
  .registration-page {
    max-width: 800px;
    margin: 0 auto;
  }
  </style>