// https://vitejs.dev/config/#build-polyfillmodulepreload
import 'vite/modulepreload-polyfill';
import './styles';
import { setupMobileNav } from './scripts/mobile-nav.js';
import { initMenuAnimation } from './scripts/initAnimation.js';
import { mountSprinkledVueApps } from './scripts/vueAppLoader.js';
import { mountTimelineApp } from './scripts/timelineMount.js';

// Initialize mobile nav
setupMobileNav();

// Run menu animation and mount Vue apps on DOMContentLoaded
document.addEventListener('DOMContentLoaded', function () {
  initMenuAnimation();
  mountSprinkledVueApps();
  mountTimelineApp();
  console.log('Vue is running!');
});


