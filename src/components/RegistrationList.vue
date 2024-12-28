<template>
    <el-container style="height:100%">
      <el-header>
        <span>报名列表</span>
      </el-header>
      <el-main>
        <div class="filters">
          <label for="eventId">活动筛选：</label>
          <el-select v-model="selectedEventId" placeholder="请选择活动" @change="fetchRegistrations">
            <el-option label="全部" value=""></el-option>
            <el-option v-for="event in events" :key="event.eventId" :label="event.title" :value="event.eventId"></el-option>
          </el-select>
        </div>
        <el-table
          :data="registrations"
          border
          stripe
          style="width: 100%; margin-top: 20px;"
          :height="400"
        >
          <el-table-column prop="username" label="用户名" align="center" width="100" />
          <el-table-column prop="title" label="报名活动" align="center" />
          <el-table-column prop="registeredAt" label="报名时间" align="center" width="200" />
          <el-table-column prop="registrationText" label="报名理由" align="center" />
          <el-table-column prop="status" label="状态" align="center" width="100" />
          <el-table-column label="操作" align="center" width="180">
            <template #default="scope">
              <el-button size="mini" type="primary" @click="updateStatus(scope.row.registrationId, 'approved')">通过</el-button>
              <el-button size="mini" type="danger" @click="updateStatus(scope.row.registrationId, 'rejected')">拒绝</el-button>
            </template>
          </el-table-column>
        </el-table>
        <div class="pagination">
          <el-pagination
            :current-page="currentPage"
            :page-size="pageSize"
            :total="total"
            layout="prev, pager, next"
            @current-change="handlePageChange"
          />
        </div>
      </el-main>
    </el-container>
  </template>
  
  
  
  
  <script> 
  import { getRegistrationList, updateRegistrationStatus } from '@/api/registration';
  import { getEventList } from '@/api/events'
  import RegistrationItem from './RegistrationItem.vue';
  
  export default {
    components: { RegistrationItem },
    data() {
        return {
            registrations: [],
            selectedEventId: '',
            isLoading: false,
            events: [],
            currentPage: 1,
            pageSize: 5,
            total: 0, // 总条数
      };
    },
    methods: {
      fetchRegistrations() {
        console.log(this.currentPage, this.pageSize,this.selectedEventId)
        getRegistrationList(this.selectedEventId,this.currentPage, this.pageSize )
          .then((response) => {
            console.log(response);
            this.isLoading = true;
            const { records, total } = response.data.data;
            this.registrations = records;
            this.total = total;
          })
          .catch((error) => {
            console.error("Failed to fetch registrations:", error);
            this.registrations = [];
          })
          .finally(() => {
            this.isLoading = false;
          });
      },
      updateStatus(registrationId, status) {
        updateRegistrationStatus(registrationId,  status )
          .then(() => {
            this.$message.success("状态更新成功！");
            this.fetchRegistrations();
          })
          .catch((error) => {
            console.error("Failed to update status:", error);
            this.$message.error("状态更新失败！");
          });
      },
      fetchEvents() {
        getEventList()
          .then((response) => {
            console.log(response);
            this.events = response.data.data.records;
          })
          .catch((error) => {
            console.error("Failed to fetch events:", error);
            this.events = [];
          });
      },
      handlePageChange(page) {
        this.currentPage = page;
        this.fetchRegistrations();
      },
    },
    mounted() {
      this.fetchRegistrations();
      this.fetchEvents();
    },
  };
  </script>
  
  <style scoped>
  .filters {
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    gap: 10px;
  }
  .filters label {
    font-weight: bold;
    margin-right: 10px;
  }
  .pagination {
    margin-top: 20px;
    text-align: center;
  }
  .el-header {
    background-color: #f5f5f5;
    padding: 15px;
    font-size: 18px;
    font-weight: bold;
    border-bottom: 1px solid #ddd;
    margin-bottom: 20px;
  }
  .el-main {
    padding: 0px;
    background-color: #fff;
  }
  .el-table th {
    background-color: #fafafa;
    color: #333;
    font-weight: bold;
    text-align: center;
  }
  .el-table tr:hover {
    background-color: #f9f9f9;
  }
  </style>
  