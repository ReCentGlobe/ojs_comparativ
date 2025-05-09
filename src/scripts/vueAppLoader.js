// src/scripts/vueAppLoader.js
import { createApp } from 'vue';

// Dynamically import all components in /src/components
const modules = import.meta.glob('../components/*.vue', { eager: true });
const components = {};
for (const path in modules) {
  components[modules[path].default.__name] = modules[path].default;
}

export function mountSprinkledVueApps() {
  for (const el of document.getElementsByClassName('vue-app')) {
    createApp({
      template: el.innerHTML,
      components
    }).mount(el);
  }
}
