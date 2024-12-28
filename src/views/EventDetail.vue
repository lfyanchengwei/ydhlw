<template>
    <el-container>
      <el-header>
        <h2>{{ event.title }}</h2>
        <p>{{ event.description }}</p>
        <p><strong>时间：</strong>{{ event.eventDate }}</p>
        <p><strong>地点：</strong>{{ event.location }}</p>
      </el-header>
      <el-main style="padding: 20px;margin-top: 100px;">
        <ParticipantTable :eventId="event.eventId" />
      </el-main>
    </el-container>
  </template>
  
  <script>
  import axios from "axios";
  import ParticipantTable from "@/components/ParticipantTable.vue";
  
  export default {
    components: { ParticipantTable },
    data() {
      return {
        event: {},
      };
    },
    created() {
      this.fetchEventDetails();
    },
    methods: {
      async fetchEventDetails() {
        const eventId = this.$route.params.eventId;
        const res = await axios.get(`/api/events/get?eventId=${eventId}`);
        if (res.data.code === 1) {
          this.event = res.data.data;
        }
      },
    },
  };
  </script>
  