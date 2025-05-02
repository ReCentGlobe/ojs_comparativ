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
  // Accordion for article abstract
  document.querySelectorAll('.toggle-abstract-btn').forEach(function(btn) {
    btn.addEventListener('click', function() {
      var abs = btn.nextElementSibling;
      var showText = btn.getAttribute('data-show-text');
      var hideText = btn.getAttribute('data-hide-text');
      var expanded = btn.getAttribute('aria-expanded') === 'true';
      if (!expanded) {
        abs.classList.remove('hidden');
        btn.innerText = hideText;
        btn.setAttribute('aria-expanded', 'true');
        btn.classList.add('bg-primary-lightest');
      } else {
        abs.classList.add('hidden');
        btn.innerText = showText;
        btn.setAttribute('aria-expanded', 'false');
        btn.classList.remove('bg-primary-lightest');
      }
    });
  });
  console.log('Vue is running!');
});


