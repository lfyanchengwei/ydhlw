<template>
    <el-card class="event-form-card">
      <h2 class="form-title">创建新活动</h2>
      <el-form ref="eventForm" :model="form" :rules="rules" label-width="120px">
        <el-form-item label="活动标题" prop="title">
          <el-input v-model="form.title" placeholder="请输入活动标题"></el-input>
        </el-form-item>
        <el-form-item label="活动描述" prop="description">
          <el-input
            type="textarea"
            v-model="form.description"
            placeholder="请输入活动描述"
          ></el-input>
        </el-form-item>
        <el-form-item label="活动地点" prop="location">
          <el-input v-model="form.location" placeholder="请输入活动地点"></el-input>
        </el-form-item>
        <el-form-item label="活动时间" prop="eventDate">
          <el-date-picker
            v-model="form.eventDate"
            type="datetime"
            placeholder="请选择活动时间"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="报名截止时间" prop="registrationDeadline">
          <el-date-picker
            v-model="form.registrationDeadline"
            type="datetime"
            placeholder="请选择报名截止时间"
          ></el-date-picker>
        </el-form-item>
        <el-form-item label="活动人数" prop="capacity">
          <el-input-number v-model="form.capacity" :min="1"></el-input-number>
        </el-form-item>
        <el-form-item label="活动封面图" prop="picUrl">
          <el-upload
            class="upload-demo"
            action=""
            :http-request="uploadImage"
            :show-file-list="false"
            accept="image/*"
          >
            <el-button type="primary">上传图片</el-button>
          </el-upload>
          <div v-if="form.picUrl" class="uploaded-image-preview">
            <p>已上传图片：</p>
            <el-link type="primary" :underline="false" :href="form.picUrl" target="_blank">
              {{ form.picUrl }}
            </el-link>
          </div>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm">提交</el-button>
          <el-button @click="resetForm">重置</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </template>
  
  <script>
  export default {
    name: "EventForm",
    data() {
      return {
        form: {
          title: "",
          description: "",
          location: "",
          eventDate: "",
          registrationDeadline: "",
          capacity: 1,
          picUrl: "",
          createdBy: this.$store.state.user.username, // 自动填充用户名
        },
        rules: {
          title: [{ required: true, message: "请输入活动标题", trigger: "blur" }],
          description: [{ required: true, message: "请输入活动描述", trigger: "blur" }],
          location: [{ required: true, message: "请输入活动地点", trigger: "blur" }],
          eventDate: [{ required: true, message: "请选择活动时间", trigger: "change" }],
          registrationDeadline: [{ required: true, message: "请选择截止时间", trigger: "change" }],
          capacity: [{ required: true, message: "请输入活动人数", trigger: "blur" }],
          picUrl: [{ required: true, message: "请输入图片链接", trigger: "blur" }],
        },
      };
    },
    methods: {
      async submitForm() {
        this.$refs.eventForm.validate(async (valid) => {
          if (valid) {
            try {
              const response = await this.$axios.post("/api/events/new", this.form);
              if (response.data.code === 1) {
                this.$message.success("活动创建成功！");
                this.$router.push("/eventList"); // 跳转到活动列表页
              } else {
                this.$message.error(response.data.msg || "创建失败");
              }
            } catch (error) {
              this.$message.error("请求失败，请稍后再试");
            }
          }
        });
      },
      resetForm() {
        this.$refs.eventForm.resetFields();
      },
      async uploadImage(params) {
        const formData = new FormData();
        formData.append("file", params.file);
          
        try {
          const response = await this.$axios.post("/api/events/upload", formData, {
            headers: { "Content-Type": "multipart/form-data" },
          });
          if (response.data.code === 1) {
            this.form.picUrl = response.data.data; // 自动填充图片链接
            this.$message.success("图片上传成功！");
          } else {
            this.$message.error(response.data.msg || "图片上传失败");
          }
        } catch (error) {
          this.$message.error("上传失败，请稍后再试");
        }
        params.onSuccess(); // 通知 `el-upload` 上传完成
      } ,
    },
  };
  </script>
  
  <style scoped>
  .event-form-card {
    max-width: 600px;
    margin: 20px auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  }
  
  .form-title {
    text-align: center;
    font-size: 20px;
    margin-bottom: 20px;
  }

  .upload-demo {
  margin-bottom: 10px;
}

.uploaded-image-preview {
  margin-top: 10px;
  color: #606266;
}
  </style>
  