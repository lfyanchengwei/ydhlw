<template>
    <el-container>
      <el-header>
        <h2>活动列表</h2>
      </el-header>
      <el-main>
        <el-row :gutter="20">
          <el-col :span="8" v-for="event in events" :key="event.eventId">
            <EventCard2 :event="event" @viewDetails="handleViewDetails" />
          </el-col>
        </el-row>
        <el-pagination
          :current-page="pageNum"
          :page-size="pageSize"
          :total="total"
          layout="prev, pager, next"
          @current-change="handlePageChange"
        />
      </el-main>
    </el-container>
  </template>
  
  <script>
  import axios from "axios";
  import EventCard2 from "@/components/EventCard2.vue";
  
  export default {
    components: { EventCard2 },
    data() {
      return {
        events: [],
        pageNum: 1,
        pageSize: 6,
        total: 0,
      };
    },
    created() {
      this.fetchEvents();
    },
    methods: {
      handlePageChange(newPage) { 
        this.pageNum = newPage; // 更新当前页码 
        this.fetchEvents(); // 重新获取数据 
      }, 
      async fetchEvents() {
        console.log(this.pageNum,this.pageSize);
        const res = await axios.get("/api/events/list", {
          params: { pageNum: this.pageNum, pageSize: this.pageSize },
        });
        if (res.data.code === 1) {
          this.events = res.data.data.records;
          this.total = res.data.data.total;
        }
      },
      handleViewDetails(event) {
        this.$router.push({ name: "EventDetail", params: { eventId: event.eventId } });
      },
    },
  };
  </script>
  