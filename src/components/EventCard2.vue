<template>
    <el-card :body-style="{ padding: '20px' }" shadow="hover" class="event-card">
      <img :src="event.picUrl" alt="Event Image" class="event-image" />
      <h3>{{ event.title }}</h3>
      <p>{{ event.description }}</p>
      <p>
        <strong>时间：</strong> {{ new Date(event.eventDate).toLocaleString() }}
      </p>
      <p>
        <strong>地点：</strong> {{ event.location }}
      </p>
      <el-button type="primary" size="small" @click="$emit('viewDetails', event)">
        查看详情
      </el-button>
    </el-card>
  </template>
  
  <script>
  export default {
    props: {
      event: {
        type: Object,
        required: true,
      },
    },
  };
  </script>
  
  <style scoped>
  .event-card {
    margin: 20px;
  }
  .event-image {
    width: 100%;
    height: 150px;
    object-fit: cover;
    margin-bottom: 10px;
    border-radius: 5px;
  }
  </style>
  