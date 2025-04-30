<template>
  <div :class="'volume-' + yearItem + ' bg-white border border-gray-200 rounded-xl p-4 mb-8 shadow-sm'">
    <div>
      <div class="w-full mb-2">
        <h4 class="text-xl font-serif font-bold text-primary border-b border-gray-100 pb-2 mb-4">{{ yearItem }}</h4>
      </div>
      <div v-if="loading" class="flex items-center justify-center py-8">
        <span class="text-gray-400 animate-pulse">Loading…</span>
      </div>
      <div v-else-if="error" class="text-red-600 py-4">
        {{ error }}
      </div>
      <div v-else-if="!posts.items || posts.items.length === 0" class="text-gray-400 py-4">
        No issues found for this year.
      </div>
      <div v-else class="space-y-4">
        <PostListItem v-for="post in posts.items" :key="post.id" :post="post" />
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, watchEffect, defineProps } from "vue";
import axios from "axios";
import { API_CONFIG } from "./config.js";
import PostListItem from "./PostListItem.vue";

const props = defineProps({
  yearItem: {
    type: String,
    required: true,
  },
});

const posts = ref({ items: [] });
const loading = ref(false);
const error = ref("");

const loadIssueYear = async () => {
  loading.value = true;
  error.value = "";
  let postsUrl = `${API_CONFIG.apiBaseUrl}`;
  if (props.yearItem !== undefined) {
    postsUrl += `?year=${props.yearItem}`;
  }
  try {
    const response = await axios.get(postsUrl, {
      headers: {
        Authorization: `Bearer ${API_CONFIG.apiToken}`
      }
    });
    posts.value = response.data;
  } catch (e) {
    error.value = "Failed to load issues. Please try again later.";
    posts.value = { items: [] };
  } finally {
    loading.value = false;
  }
};

watchEffect(() => {
  loadIssueYear();
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
