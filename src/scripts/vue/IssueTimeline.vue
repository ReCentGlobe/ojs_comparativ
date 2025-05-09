<template>
  <div>
    <ul class="flex flex-wrap gap-2 mb-6">
      <li :class="['inline-block', 'rounded', 'border', 'border-gray-200', 'bg-gray-100', 'hover:bg-gray-200', 'transition', 'shadow-sm', 'font-sans', 'text-sm', 'text-primary', 'hover:text-accent', { 'ring-2 ring-accent': activeYear == '' }]">
        <a href="#" @click.prevent="resetYear" class="block px-3 py-1 rounded focus:outline-none focus:ring-2 focus:ring-accent" aria-pressed="true" tabindex="0">All</a>
      </li>
      <ListYears
        v-for="year in years"
        :key="year"
        :year-item="year"
        :active-year="activeYear"
        @update:year-item="handleClickYear"
        :class="[{'ring-2 ring-accent': year === activeYear}]"
      />
    </ul>
    <ul class="timeline js-filter">
      <PostByYear
        v-for="year in filteredYears"
        :key="year"
        :year-item="year"
        :id="'volume-' + year"
      />
    </ul>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from "vue";
import axios from "axios";
import PostByYear from "./GetPostsByYear.vue";
import ListYears from "./ListYears.vue";
import { API_CONFIG } from "./config.js";

const posts = ref([]);
const loading = ref(false);
const years = ref([]);
const activeYear = ref("");

const resetYear = () => {
  activeYear.value = "";
};

const getYears = () => {
  loading.value = true;
  const currentYear = new Date().getFullYear();
  for (let year = currentYear; year >= 1991; year--) {
    years.value.push(year);
  }
  loading.value = false;
};

const loadIssueYear = () => {
  loading.value = true;
  let postsUrl = `${API_CONFIG.apiBaseUrl}`;
  axios
    .get(postsUrl, {
      headers: {
        Authorization: `Bearer ${API_CONFIG.apiToken}`
      }
    })
    .then((response) => {
      posts.value = response.data;
      loading.value = false;
    })
    .catch((e) => {
      loading.value = false;
    });
};

const handleClickYear = (year) => {
  activeYear.value = year;
};

const filteredYears = computed(() => {
  if (activeYear.value) {
    return [activeYear.value];
  } else {
    return years.value;
  }
});

onMounted(() => {
  getYears();
  document.title = API_CONFIG.siteTitle;
  loadIssueYear();
});
</script>

<style scoped>
/* Add any additional custom styles here if needed */
</style>
