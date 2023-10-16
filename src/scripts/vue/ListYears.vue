<template>
<li :uk-filter-control="'volume-' + yearItem">
  <a href="#" role="button" @click.prevent="toggleItem">{{ yearItem }}</a>
</li>
</template>

<script setup>
import { ref, watchEffect, defineProps, defineEmits } from "vue";

const props = defineProps({
  yearItem: {
    type: String,
    required: true,
  },
});

const emit = defineEmits(["update:yearItem"]);

const toggleItem = () => {
  emit("update:yearItem", props.yearItem);
};

</script>