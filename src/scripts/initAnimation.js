// src/scripts/initAnimation.js
import { animate, createSpring } from 'animejs';

export function initMenuAnimation() {
  animate('.jsmenu', {
    scale: [
      { to: 1.25, ease: 'inOut(3)', duration: 200 },
      { to: 1, ease: createSpring({ stiffness: 300 }) }
    ],
    loop: true,
    loopDelay: 250,
  });
  console.log('Anime App Loaded');
}
