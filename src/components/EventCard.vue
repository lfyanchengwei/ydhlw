<template>
    <el-card class="event-card" :body-style="{ padding: '20px' }">
      <img :src="event.picUrl" alt="活动图片" class="event-img" />
      <h3 class="event-title">{{ event.title }}</h3>
      <p class="event-description">{{ event.description }}</p>
      <ul class="event-details">
        <li>时间：{{ formatDate(event.eventDate) }}</li>
        <li>地点：{{ event.location }}</li>
        <li>报名截止：{{ formatDate(event.registrationDeadline) }}</li>
      </ul>
      <div class="event-actions">
        <el-button type="text" @click="$emit('edit', event.eventId)">编辑</el-button>
        <el-button type="text" @click="$emit('delete', event.eventId)">删除</el-button>
      </div>
    </el-card>
  </template>
  
  <script>
  export default {
    name: "EventCard",
    props: {
      event: {
        type: Object,
        required: true,
      },
    },
    methods: {
      formatDate(dateStr) {
        const date = new Date(dateStr);
        return date.toLocaleString();
      },
    },
  };
  </script>
  
  <style scoped>
  .event-card {
    border: 1px solid #ebeef5;
    transition: box-shadow 0.3s;
  }
  .event-card:hover {
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
  }
  .event-img {
    width: 100%;
    height: 150px;
    object-fit: cover;
    border-radius: 4px;
    margin-bottom: 10px;
  }
  .event-title {
    font-size: 18px;
    font-weight: bold;
    margin: 0 0 10px;
  }
  .event-description {
    font-size: 14px;
    color: #666;
    margin: 0 0 10px;
  }
  .event-details {
    font-size: 14px;
    color: #333;
    list-style: none;
    padding: 0;
    margin: 0 0 10px;
  }
  .event-details li {
    margin: 4px 0;
  }
  .event-actions {
    display: flex;
    justify-content: flex-end;
  }
  </style>
  