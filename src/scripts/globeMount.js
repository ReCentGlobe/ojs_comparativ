// src/scripts/timelineMount.js
import createGlobe from 'cobe'
import { animate, onScroll, utils } from 'animejs';
import { createApp } from 'vue';
import RippleContainer from './vue/RippleContainer.vue';

export function mountGlobe() {
  const globeContainer = document.getElementById('globe-container');
  const rippleContainer = document.getElementById('ripple-container');
  const [ container ] = utils.$('.js-scrollcontainer');
  const debug = true;

  createApp(RippleContainer).mount(rippleContainer);

  if (globeContainer) {
    let phi = 0;
    createGlobe(globeContainer, {
      // Options for the globe
      devicePixelRatio: 2,
      width: 2000,
      height: 2000,
      phi: 0,
      theta: -0.3,
      dark: 1,
      diffuse: 0.75,
      scale: 1,
      mapSamples: 16000,
      mapBrightness: 2,
      opacity: 0.8,
      baseColor: [0.859, 0.918, 0.996],
      markerColor: [0.522, 0.173, 0.235],
      glowColor: [0.859, 0.918, 0.996],
      offset: [0, 0],
      markers: [
        { location: [37.7595, -122.4367], size: 0.03 },
        { location: [40.7128, -74.006], size: 0.1 },
      ],
      onRender: (state) => {
        // Called on every animation frame.
        // `state` will be an empty object, return updated params.
        state.phi = phi
        phi += 0.001
      },
    });

    animate('.js-cobe',{
      x: 100,
      autoplay: onScroll({ 
        container, 
        debug: false,
        sync: true,      
        leave: 'top bottom'
    })
  });

}
  }
  
