<?php

import('lib.pkp.classes.plugins.ThemePlugin');

class ComparativChildThemePlugin extends ThemePlugin {
    /**
     * Initialize the theme's styles, scripts and hooks. This is only run for
     * the currently active theme.
     *
     * @return null
     */
    public function init() {

        // Initialize the parent theme
        $this->setParent('defaultthemeplugin');

        $this->addStyle('comparativ','dist/styles/app.bundle.css' );

        // Remove Default Scripts
        $this->removeScript('popper', 'js/lib/popper/popper.js');
        $this->removeScript('bsUtil', 'js/lib/bootstrap/util.js');
        $this->removeScript('bsDropdown', 'js/lib/bootstrap/dropdown.js');
        $this->removeScript('default', 'js/main.js');

        // Add Polyfills

        // Load Vendor
        $this->addScript('Vendor', 'dist/scripts/vendor.bundle.js');
        // Load App
        $this->addScript('App', 'dist/scripts/app.bundle.js');

        // Add navigation menu areas for this theme
        $this->addMenuArea(array('primary', 'user', 'footer'));
        $this->addMenuArea(array('primary', 'user', 'footer2'));
        $this->addMenuArea(array('primary', 'user', 'footer3'));
        $this->addMenuArea(array('primary', 'user', 'footer4'));



    }

    /**
     * Get the display name of this plugin
     * @return string
     */
    function getDisplayName() {
        return __('plugins.themes.comparativ.name');
    }

    /**
     * Get the description of this plugin
     * @return string
     */
    function getDescription() {
        return __('plugins.themes.comparativ.description');
    }

}

?>
