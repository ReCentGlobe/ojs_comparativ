// src/scripts/timelineMount.js
import { createApp } from 'vue';
import IssueTimeline from './vue/IssueTimeline.vue';

export function mountTimelineApp() {
  const timelineApp = document.getElementById('timeline-App');
  if (timelineApp) {
    createApp(IssueTimeline).mount('#timeline-App');
  }
}
