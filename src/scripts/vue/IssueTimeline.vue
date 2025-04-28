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
        v-if="year === activeYear"
        :year-item="year"
        :id="'volume-' + year"
        v-for="year in filteredYears"
        :key="year"
      />
      <PostByYear
        v-else
        :year-item="yearElse"
        :id="'volume-' + yearElse"
        v-for="yearElse in filteredYears"
        :key="yearElse"
      ></PostByYear>
    </ul>
  </div>
</template>

<script setup>
  import { ref, onMounted, computed } from "vue";
  import axios from "axios";
  import PostByYear from "./GetPostsByYear.vue";
  import ListYears from "./ListYears.vue";

  const apiToken =
    "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjQ0NzcwZWM3YzNmNzZjYTc3YTNlNDQ5OWNjZTkzY2ZlMGYzMTMwOTMi.iQv-aKKm7lyO1GtkdHJgy8wtCaLcaH5JpKq2q-BlJkc";

  const title = "Comparativ";
  const posts = ref([]);
  const loading = ref("");
  const years = ref([]);
  const year_pre = ref([]);
  const open = ref(false);
  const activeYear = ref("");

  const toggle = () => {
    open.value = !open.value;
  };

  const resetYear = () => {
    activeYear.value = "";
  };

  const getYears = () => {
    loading.value = true;

    const currentYear = new Date().getFullYear();
    for (let year = currentYear; year >= 1991; year--) {
      years.value.push(year);
    }
    //console.log(years.value);

    /* let postsUrl =
    "https://comparativ.net/index.php/v2/index.php/comparativ/api/v1/issues";
  axios
    .get(postsUrl)
    .then((response) => {
      year_pre.value = response.data;

      // Removes Duplicates from Array and returns unique Items via underscore
      years_unsorted = _.uniq(_.map(year_pre.value, "year"));

      // Sort list descending
      years.value = years_unsorted.sort(function (a, b) {
        return b - a;
      });

      loading.value = false;
    })
    .catch((e) => {
      console.log(e);
    }); */
  };

  const loadIssueYear = () => {
    loading.value = true;
    let postsUrl = `https://www.comparativ.net/index.php/v2/api/v1/issues?apiToken=${apiToken}`;

    axios
      .get(postsUrl)
      .then((response) => {
        posts.value = response.data;
        loading.value = false;
      })
      .catch((e) => {
        console.log(e);
      });
  };

  const handleClickYear = (year) => {
    //console.log("SelectedYear: " + year)
    activeYear.value = year;
  };

  const filteredYears = computed(() => {
    if (activeYear.value) {
      //console.log("ActiveYear: " + activeYear.value)
      return [activeYear.value];
    } else {
      return years.value;
    }
  });

  onMounted(() => {
    getYears();
    document.title = title;
    loadIssueYear();
  });
</script>

<style scoped>
/* Add any additional custom styles here if needed */
</style>
