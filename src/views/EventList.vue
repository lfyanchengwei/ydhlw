<template>
    <el-main>
      <div class="event-list">
        <el-row :gutter="20">
          <el-col :span="8" v-for="event in events" :key="event.eventId">
            <EventCard
              :event="event"
              @edit="handleEdit"
              @delete="handleDelete"
            />
          </el-col>
        </el-row>
        <el-pagination
          :current-page="pageNum"
          :page-size="pageSize"
          :total="total"
          layout="prev, pager, next"
          @current-change="handlePageChange"
        />
      </div>
    </el-main>
  </template>
  
  <script>
  import axios from "axios";
  import EventCard from "@/components/EventCard";
  import {getEvents} from "@/api/events";
  
  export default {
    name: "EventList",
    components: { EventCard },
    data() {
      return {
        events: [],
        pageNum: 1,
        pageSize: 6,
        total: 0
      };
    },
    methods: {
      handlePageChange(newPage) { 
        this.pageNum = newPage; // 更新当前页码 
        this.fetchEvents(); // 重新获取数据 
      }, 
      fetchEvents() {
        getEvents(this.pageNum, this.pageSize)
          .then((res) => {
            this.events = res.data.data.records;
            this.total = res.data.data.total;
          })
      },
      handleEdit(eventId) {
        this.$router.push(`/events/edit/${eventId}`);
      },
      handleDelete(eventId) {
        this.$confirm("确定删除此活动吗？", "提示", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
        })
          .then(() => {
            // 发送删除请求
            axios
              .get("/api/events/delete")
              .then((res) => {
                if (res.data.code === 1) {
                  this.$message.success("活动已删除！");
                } else {
                  this.$message.error("删除失败！");
                }
              })
              .catch(() => {
                this.$message.error("网络错误，无法加载删除！");
              });
            this.events = this.events.filter((event) => event.eventId !== eventId);
            
          })
          .catch(() => {
            this.$message.info("已取消删除操作");
          });
      },
    },
    created() {
      this.fetchEvents();
    },
  };
  </script>
  
  <style scoped>
  .event-list {
    padding: 20px;
  }
  </style>
  