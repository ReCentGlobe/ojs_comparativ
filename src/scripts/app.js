import { createApp } from 'vue';
import IssueTimeline from './vue/IssueTimeline.vue';




/**
 * VUE Stuff
 * @type {boolean}
 */
const app = createApp(IssueTimeline);

/**
 * SearchBar
 */

function searchToggle() {
    var searchHolder = $('.search-holder');

    if (searchHolder.hasClass('active')) {
        searchHolder.removeClass('active');
    } else {
        searchHolder.addClass('active');
    }
}
window.searchToggle = searchToggle;

/**
 * NAV Mobile Toggle
 */

document.addEventListener('DOMContentLoaded', function () {


    console.log('Anime App Loaded');

    app.mount('#timeline-App');

    // Get all "navbar-burger" elements
    var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

    // Check if there are any navbar burgers
    if ($navbarBurgers.length > 0) {

        // Add a click event on each of them
        $navbarBurgers.forEach(function ($el) {
            $el.addEventListener('click', function () {

                // Get the target from the "data-target" attribute
                var target = $el.dataset.target;
                var $target = document.getElementById(target);

                // Toggle the class on both the "navbar-burger" and the "navbar-menu"
                $el.classList.toggle('is-active');
                $target.classList.toggle('is-active');

            });
        });
    }

});

/**
 * QUick Preview
 */

function closest(el, selector) {
    var matchesFn;

    // find vendor prefix
    ['matches', 'webkitMatchesSelector', 'mozMatchesSelector', 'msMatchesSelector', 'oMatchesSelector'].some(function (fn) {
        if (typeof document.body[fn] == 'function') {
            matchesFn = fn;
            return true;
        }
        return false;
    });

    var parent;

    // traverse parents
    while (el) {
        parent = el.parentElement;
        if (parent && parent[matchesFn](selector)) {
            return parent;
        }
        el = parent;
    }

    return null;
}
