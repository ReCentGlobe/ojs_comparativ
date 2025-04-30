<template>
  <div class="post-list-item border-b border-gray-100 py-3">
    <div class="flex flex-col">
      <div class="text-sm text-gray-500 mb-1 font-sans">
        Vol. {{ post.volume }} No. {{ post.number }} ({{ post.year }})
      </div>
      <div class="mb-2">
        <a :href="post.publishedUrl" class="text-lg font-serif text-primary hover:text-accent transition focus:outline-none focus:ring-2 focus:ring-accent">
          {{ post.title.en || post.title.de || post.identification }}
        </a>
      </div>
      <div v-if="post.doiObject && post.doiObject.doi" class="mb-1">
        <a :href="post.doiObject.resolvingUrl" class="text-xs text-blue-600 hover:underline" target="_blank" rel="noopener">DOI: {{ post.doiObject.doi }}</a>
      </div>
    </div>
  </div>
</template>

<script setup>
import { defineProps } from 'vue';

const props = defineProps({
  post: {
    type: Object,
    required: true,
  },
});

function stripHtml(html) {
  if (!html) return '';
  return html.replace(/<[^>]*>/g, '').replace(/\n+/g, ' ').trim();
}

function truncateDescription(text) {
  if (!text) return '';
  const maxLines = 3;
  const maxLen = 90;
  const words = text.split(' ');
  let lines = [], line = '';
  for (let word of words) {
    if ((line + ' ' + word).trim().length > maxLen) {
      lines.push(line.trim());
      line = word;
      if (lines.length === maxLines) break;
    } else {
      line += ' ' + word;
    }
  }
  if (lines.length < maxLines && line) lines.push(line.trim());
  let result = lines.join(' ');
  if (words.length > 0 && lines.length === maxLines && (line || words.length > maxLines * 10)) {
    result += '…';
  }
  return result;
}
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
