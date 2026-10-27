// src/scripts/timelineMount.js
import { createApp } from 'vue';
import IssueTimeline from './vue/IssueTimeline.vue';

export function mountTimelineApp() {
  const timelineApp = document.getElementById('timeline-App');
  if (timelineApp) {
    // Issues are rendered into the page by ComparativChildThemePlugin::getPublishedIssues()
    const issues = JSON.parse(timelineApp.dataset.issues || '[]');
    createApp(IssueTimeline, { issues }).mount(timelineApp);
  }
}
