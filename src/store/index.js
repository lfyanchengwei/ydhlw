import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    user: null,
  },
  mutations: {
    setUser(state, user) {
      state.user = user;
    },
    clearUser(state) {
      state.user = null;
    },
  },
  actions: {
    async login({ commit }, { email, password }) {
      console.log("Login successful")
      try {
        const response = await axios.post("/api/users/login", {
          email,
          password,
        });
        const { code, data } = response.data;
        if (code !== 1 || data.role !== "admin") {
          throw new Error("登录失败：无管理员权限");
        }
        commit("setUser", {
          userId: data.userId,
          username: data.username,
          email: data.email,
          phone: data.phone,
        });
      } catch (error) {
        throw error;
      }
    },
  },
  getters: {
    isAuthenticated(state) {
      return !!state.user;
    },
    userInfo(state) {
      return state.user || {};
    },
  },
});
