// Mobile nav toggle for hamburger menu
export function setupMobileNav(navId = 'navigationPrimary', btnId = 'mobile-nav-toggle') {
  const nav = document.getElementById(navId);
  const btn = document.getElementById(btnId);
  if (!nav || !btn) return;

  function handleResize() {
    if (window.innerWidth >= 768) {
      nav.classList.remove('hidden');
    } else {
      nav.classList.add('hidden');
    }
  }
  window.addEventListener('resize', handleResize);
  handleResize();

  btn.addEventListener('click', function() {
    nav.classList.toggle('hidden');
  });

  nav.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', () => {
      if (window.innerWidth < 768) {
        nav.classList.add('hidden');
      }
    });
  });
}

// Auto-initialize if running in browser and elements exist
if (typeof window !== 'undefined') {
  window.addEventListener('DOMContentLoaded', () => {
    setupMobileNav();
  });
}
