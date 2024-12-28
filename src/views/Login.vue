<template>
    <div class="login-page">
      <el-card class="login-card">
        <div class="login-title">请先登录</div>
        <el-form :model="loginForm" :rules="rules" ref="loginForm" label-width="80px">
          <el-form-item label="邮箱" prop="email">
            <el-input v-model="loginForm.email" placeholder="请输入邮箱"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="password">
            <el-input
              v-model="loginForm.password"
              placeholder="请输入密码"
              show-password
              type="password"
            ></el-input>
          </el-form-item>
          <el-form-item>
            <el-button
              type="primary"
              :loading="loading"
              @click="handleLogin"
              class="login-button"
            >
              登录
            </el-button>
          </el-form-item>
        </el-form>
      </el-card>
    </div>
  </template>
  
  <script>
  import { mapActions } from "vuex";
  
  export default {
    name: "Login",
    data() {
      return {
        loginForm: {
          email: "",
          password: "",
        },
        loading: false,
        rules: {
          email: [{ required: true, message: "请输入邮箱", trigger: "blur" }],
          password: [{ required: true, message: "请输入密码", trigger: "blur" }],
        },
      };
    },
    methods: {
      ...mapActions(["login"]),
      async handleLogin() {
        this.$refs.loginForm.validate(async (valid) => {
          if (valid) {
            this.loading = true;
            try {
              await this.login(this.loginForm);
              this.$message.success("登录成功！");
              this.$router.push("/eventList");
            } catch (error) {
              this.$message.error(error.message || "登录失败");
            } finally {
              this.loading = false;
            }
          }
        });
      },
    },
  };
  </script>
  
  <style scoped>
  .login-page {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #f5f7fa;
  }
  
  .login-card {
    width: 400px;
    padding: 20px;
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
  }
  
  .login-title {
    text-align: center;
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 20px;
  }
  
  .login-button {
    width: 100%;
  }
  </style>
  