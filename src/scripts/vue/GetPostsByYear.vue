<template>
  <div class="uk-padding-large uk-padding-remove-horizontal" :class="'volume-' + yearItem">
    <div>
      <div class="uk-width-1-1">
        <h4 class="uk-h4 uk-heading-bullet">{{ yearItem }}</h4>
      </div>
      <div uk-grid class="uk-grid uk-grid-stack">
        <template v-for="post in posts.items" :key="post.id">
          <div uk-grid class="uk-width-1-1">
            <div class="uk-width-1-1 uk-text-meta">Vol {{ post.volume }} No {{ post.number }} ({{ post.year }})</div>
            <div class="uk-width-1-1 uk-margin-remove uk-grid-margin">
              <a :href="post.publishedUrl" class="uk-link-reset">{{ post.title.en_US }}</a>
            </div>
            <div class="uk-width-1-1 uk-grid-margin">
              <hr>
            </div>
          </div>
        </template>
      </div>
    </div>
<!--    <li class="timeline-header">
      <a @click="toggleItem">
        <span class="tag is-primary">{{ yearItem }}</span>
      </a>
    </li>

    <li v-show="toggled"  class="timeline-item"  v-for="post in posts.items" :key="post.id">
      <div class="timeline-marker"></div>
      <div class="timeline-content">
        <p class="heading">
          Vol {{ post.volume }} No {{ post.number }} ({{ post.year }})
        </p>
        <p>
          <a :href="post.publishedUrl">{{ post.title.en_US }}</a>
        </p>
      </div>
    </li>-->
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

  const apiToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjQ0NzcwZWM3YzNmNzZjYTc3YTNlNDQ5OWNjZTkzY2ZlMGYzMTMwOTMi.iQv-aKKm7lyO1GtkdHJgy8wtCaLcaH5JpKq2q-BlJkc"

  const showDetails = ref(false);
  const posts = ref([]);
  const toggled = ref(false);
  const currentYear = ref(props.yearItem);

  const toggleItem = () => {
    toggled.value = !toggled.value;
    loadIssueYear();
  };

  const loadIssueYear = () => {
    //Vue.set(this, "loading", true);
    let postsUrl =
      `https://www.comparativ.net/index.php/v2/api/v1/issues?apiToken=${apiToken}`;
    if (currentYear.value !== undefined) {
      postsUrl += "&year=" + currentYear.value;
    }

    axios
      .get(postsUrl)
      .then((response) => {
        posts.value = response.data;
        //Vue.set(this, "loading", false);
      })
      .catch((e) => {
        console.log(e);
      });
  };

  watchEffect(() => {
    loadIssueYear();
  });
</script>

<style></style>
