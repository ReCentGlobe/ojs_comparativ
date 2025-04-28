<template>
  <li :uk-filter-control="'volume-' + yearItem" class="inline-block">
    <a
      href="#"
      role="button"
      @click.prevent="toggleItem"
      class="px-3 py-1 rounded font-sans text-sm text-primary hover:text-accent bg-gray-100 hover:bg-gray-200 transition border border-gray-200 mr-2 mb-2 shadow-sm focus:outline-none focus:ring-2 focus:ring-accent"
      :aria-pressed="isActive ? 'true' : 'false'"
      :tabindex="0"
    >
      {{ yearItem }}
    </a>
  </li>
</template>

<script setup>
import { defineProps, defineEmits, computed } from "vue";

const props = defineProps({
  yearItem: {
    type: String,
    required: true,
  },
  activeYear: {
    type: String,
    default: "",
  },
});

const emit = defineEmits(["update:yearItem"]);

const isActive = computed(() => props.activeYear === props.yearItem);

const toggleItem = () => {
  emit("update:yearItem", props.yearItem);
};

</script>

<style scoped>
/* Add any additional custom styles here if needed */
</style>
