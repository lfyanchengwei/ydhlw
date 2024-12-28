<template>
    <el-main>
      <event-form />
    </el-main>
  </template>
  
  <script>
  import EventForm from "@/components/EventForm";
  
  export default {
    name: "NewEvent",
    components: {
      EventForm,
    },
  };
  </script>
  