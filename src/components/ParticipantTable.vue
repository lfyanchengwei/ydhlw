<template>
    <div>
    <el-table :data="participants" style="width: 100%">
      <el-table-column prop="username" label="姓名" />
      <el-table-column prop="email" label="邮箱" />
      <el-table-column prop="phone" label="电话" />
      <el-table-column label="签到状态">
        <template #default="scope">
          <el-tag :type="scope.row.status === 'participated' ? 'success' : 'info'">
            {{ scope.row.status === 'participated' ? '已参加' : '未签到' }}
          </el-tag>
          <el-button
            v-if="scope.row.status !== 'participated'"
            size="mini"
            @click="updateStatus(scope.row)"
          >
            签到
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      v-model="pageNum"
      :page-size="pageSize"
      :total="total"
      layout="prev, pager, next"
      @current-change="fetchParticipants"
    />
  </div>
  </template>
  
  <script>
  import axios from "axios";
  import { getRegistrationList, updateRegistrationStatus } from '@/api/registration';

  export default {
    props: {
      eventId: {
        type: Number,
        required: true,
      },
    },
    data() {
      return {
        participants: [],
        pageNum: 1,
        pageSize: 5,
        total: 0,
      };
    },
    watch: {
      eventId: {
        immediate: true,
        handler(newVal) {
          if (newVal) {
            this.fetchParticipants();
          }
        },
      },
    },
    created() {
      this.fetchParticipants();
    },
    methods: {
      async fetchParticipants() {
          if (!this.eventId) return; // 确保 eventId 存在
          const res = await axios.get(
            "/api/registration/listPassed",
            { params: { eventId: this.eventId, pageNum: this.pageNum, pageSize: this.pageSize } }
          );
          if (res.data.code === 1) {
            this.participants = res.data.data.records.map((p) => ({
              ...p,
              status: p.status,
            }));
            console.log(this.participants);
            this.total = res.data.data.total;
          }
        },
        updateStatus(participant) {
        updateRegistrationStatus(participant.registrationId, "participated")
          .then(() => {
            this.$message.success("签到成功！");
            participant.status = "participated";
          })
          .catch((error) => {
            console.error("Failed to update status:", error);
            this.$message.error("签到失败！");
          });
      },
      },
      // async handleCheckIn(participant) {
      //   console.log(participant)
      //   await axios.get("http://127.0.0.1:8883/api/registration/updateRegistrationStatus", {
      //     params: { registrationId: participant.registrationId, status: "participated" },
      //   });
      //   participant.status = "participated";
      // },
      
  };
  </script>
  