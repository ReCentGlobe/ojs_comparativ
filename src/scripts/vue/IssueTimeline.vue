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
        :issues="issuesByYear[year]"
        :id="'volume-' + year"
      />
    </ul>
  </div>
</template>

<script setup>
import { ref, computed } from "vue";
import PostByYear from "./GetPostsByYear.vue";
import ListYears from "./ListYears.vue";

const props = defineProps({
  issues: {
    type: Array,
    default: () => [],
  },
});

const activeYear = ref("");

const resetYear = () => {
  activeYear.value = "";
};

const issuesByYear = computed(() => {
  const byYear = {};
  for (const issue of props.issues) {
    (byYear[String(issue.year)] ??= []).push(issue);
  }
  return byYear;
});

const years = computed(() =>
  Object.keys(issuesByYear.value).sort((a, b) => b - a)
);

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
</script>

<style scoped>
/* Add any additional custom styles here if needed */
</style>
