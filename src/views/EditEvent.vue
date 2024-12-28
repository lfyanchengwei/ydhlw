<template>
    <div>
      <EditEventForm :eventId="$route.params.id" />
    </div>
  </template>
  
  <script>
  import EditEventForm from "@/components/EditEventForm.vue";
  
  export default {
    name: "EditEvent",
    components: { EditEventForm },
  };
  </script>
  