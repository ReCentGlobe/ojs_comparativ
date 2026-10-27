<template>
  <div :class="'volume-' + yearItem + ' bg-white border border-gray-200 rounded-xl p-4 mb-8 shadow-sm'">
    <div>
      <div class="w-full mb-2">
        <h4 class="text-xl font-serif font-bold text-primary border-b border-gray-100 pb-2 mb-4">{{ yearItem }}</h4>
      </div>
      <div v-if="issues.length === 0" class="text-gray-400 py-4">
        No issues found for this year.
      </div>
      <div v-else class="space-y-4">
        <PostListItem v-for="post in issues" :key="post.id" :post="post" />
      </div>
    </div>
  </div>
</template>

<script setup>
import { defineProps } from "vue";
import PostListItem from "./PostListItem.vue";

const props = defineProps({
  yearItem: {
    type: String,
    required: true,
  },
  issues: {
    type: Array,
    default: () => [],
  },
});
</script>

<style scoped>
.line-clamp-3 {
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis;
  line-clamp: 3;
}
</style>
