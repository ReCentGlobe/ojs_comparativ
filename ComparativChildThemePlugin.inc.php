<?php

use APP\facades\Repo;
use APP\issue\Collector;
use APP\services\NavigationMenuService;
use PKP\config\Config;
use PKP\navigationMenu\NavigationMenuItem;
use PKP\plugins\ThemePlugin;

class ComparativChildThemePlugin extends ThemePlugin
{

    public function getManifest()
    {
        $manifestPath = __DIR__ . '/dist/.vite/manifest.json';
        if (!file_exists($manifestPath)) {
            return [];
        }
        $content = file_get_contents($manifestPath);
        $json = json_decode($content, true);
        if (!is_array($json)) {
            return [];
        }
        return $json;
    }

    public function assetUrl(string $entry): string
    {
        $manifest = $this->getManifest();
        if (isset($manifest[$entry]['file'])) {
            $file = $manifest[$entry]['file'];
            return '/' . ltrim('dist/' . $file, '/');
        }
        return '';
    }

    public function jsPreloadImports(string $entry): string
    {
        $res = '';
        foreach ($this->importsUrls($entry) as $url) {
            $res .= '<link rel="modulepreload" href="'
                . $url
                . '">';
        }
        return $res;
    }

    public function importsUrls(string $entry): array
    {
        $urls = [];
        $manifest = $this->getManifest();
        if (!empty($manifest[$entry]['imports'])) {
            foreach ($manifest[$entry]['imports'] as $imports) {
                if (isset($manifest[$imports]['file'])) {
                    $urls[] = '/' . ltrim('dist/' . $manifest[$imports]['file'], '/');
                }
            }
        }
        return $urls;
    }

    public function cssUrls(string $entry): array
    {
        $urls = [];
        $manifest = $this->getManifest();
        if (!empty($manifest[$entry]['css'])) {
            foreach ($manifest[$entry]['css'] as $file) {
                $urls[] = '/' . ltrim('dist/' . $file, '/');
            }
        }
        return $urls;
    }

    /**
     * Initialize the theme's styles, scripts and hooks. This is only run for
     * the currently active theme.
     *
     * @return null
     */
    public function init()
    {

        // Initialize the parent theme
        $this->setParent('defaultthemeplugin');

        foreach ($this->cssUrls('main.js') as $css) {
            $this->addStyle('comparativ', $css);
        }

        // Remove Default Scripts
        $this->removeScript('popper', 'js/lib/popper/popper.js');
        $this->removeScript('bsUtil', 'js/lib/bootstrap/util.js');
        $this->removeScript('bsDropdown', 'js/lib/bootstrap/dropdown.js');
        $this->removeScript('default', 'js/vendor.js');

        // Add Polyfills

        // Add main.js as a module
        $this->addScript('comparativ', $this->assetUrl('main.js'), ['type' => 'module']);

        // Load Vendor
        //$this->addScript('Vendor', 'dist/scripts/vendor.js');
        // Load App
        //$this->addScript('App', 'dist/scripts/app.js');

        // Add navigation menu areas for this theme
        $this->addMenuArea(array('primary', 'user', 'footer'));
        $this->addMenuArea(array('primary', 'user', 'footer2'));
        $this->addMenuArea(array('primary', 'user', 'footer3'));
        $this->addMenuArea(array('primary', 'user', 'footer4'));


        HookRegistry::register ('TemplateManager::display', array($this, 'loadTemplateData'));
    }

    /**
     * Get the display name of this plugin
     * @return string
     */
    function getDisplayName()
    {
        return __('plugins.themes.comparativ.name');
    }

    /**
     * Get the description of this plugin
     * @return string
     */
    function getDescription()
    {
        return __('plugins.themes.comparativ.description');
    }

    /**
     * Fired when the `TemplateManager::display` hook is called.
     *
     * @param string $hookname
     * @param array $args [$templateMgr, $template, $sendContentType, $charset, $output]
     */
    public function loadTemplateData($hookname, $args) {

        // Retrieve the TemplateManager
        $templateMgr = $args[0];

        // Attach a custom piece of data to the TemplateManager
        $myCustomData = $this->jsPreloadImports('main.js');
        $templateMgr->assign('comparativImports', $myCustomData);

        return false;
    }

}

?>
