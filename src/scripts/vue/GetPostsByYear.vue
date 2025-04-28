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
        <template v-for="post in posts.items" :key="post.id">
          <div class="w-full">
            <div class="text-sm text-gray-500 mb-1 font-sans">Vol {{ post.volume }} No {{ post.number }} ({{ post.year }})</div>
            <div class="mb-2">
              <a :href="post.publishedUrl" class="text-lg font-serif text-primary hover:text-accent transition focus:outline-none focus:ring-2 focus:ring-accent">{{ post.title.en_US }}</a>
            </div>
            <hr class="my-2 border-t border-gray-200" />
          </div>
        </template>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, watchEffect, defineProps } from "vue";
import axios from "axios";

const props = defineProps({
  yearItem: {
    type: String,
    required: true,
  },
});

const apiToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjQ0NzcwZWM3YzNmNzZjYTc3YTNlNDQ5OWNjZTkzY2ZlMGYzMTMwOTMi.iQv-aKKm7lyO1GtkdHJgy8wtCaLcaH5JpKq2q-BlJkc";

const showDetails = ref(false);
const posts = ref([]);
const toggled = ref(false);
const currentYear = ref(props.yearItem);
const loading = ref(false);
const error = ref("");

const toggleItem = () => {
  toggled.value = !toggled.value;
  loadIssueYear();
};

const loadIssueYear = async () => {
  loading.value = true;
  error.value = "";
  let postsUrl =
    `https://www.comparativ.net/index.php/v2/api/v1/issues?apiToken=${apiToken}`;
  if (currentYear.value !== undefined) {
    postsUrl += "&year=" + currentYear.value;
  }
  try {
    const response = await axios.get(postsUrl);
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
/* Add any additional custom styles here if needed */
</style>
