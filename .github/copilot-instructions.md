# OJS Comparativ Theme Development Guide

## Project Overview
This is a custom OJS (Open Journal Systems) theme for the Comparativ journal, built with PHP/Smarty templates, Vue.js components, and Tailwind CSS. The theme extends the default OJS theme with modern UI components and interactive features.

## Architecture & Key Concepts

### OJS Theme Structure
- **Main Plugin**: `ComparativChildThemePlugin.inc.php` - extends ThemePlugin, inherits from `defaultthemeplugin`
- **Templates**: `templates/` - Smarty `.tpl` files override default OJS templates
- **Assets**: Built via Vite into `dist/` with manifest-based loading
- **Localization**: `locale/` contains translation strings for theme-specific content

### Template Hierarchy
```
templates/frontend/
├── components/          # Reusable UI components (header, footer, sectionHeader)
├── objects/            # Content objects (article_summary, article_details)
├── pages/              # Full page templates (article, issue, search)
└── plugins/            # Plugin-specific template overrides
```

### Modern Asset Pipeline
The theme uses **dual build systems**:
- **Vite** (primary): `src/main.js` → `dist/` with manifest.json for production
- **Laravel Mix** (legacy): `webpack.mix.js` for fallback builds

Key files:
- `src/main.js` - Entry point importing styles, Vue components, and interactive features
- `vite.config.js` - Modern build configuration with Vue and Tailwind
- `ComparativChildThemePlugin.inc.php` - Manifest-based asset loading with `getManifest()`, `assetUrl()`, `cssUrls()`

## Development Workflows

### Essential Commands
```bash
# Primary development (Vite)
pnpm run vite:dev          # Start dev server with HMR
pnpm run vite:build        # Production build

# Legacy development (Mix)
pnpm run development       # Build assets
pnpm run watch            # Watch mode
pnpm run production       # Optimized build
```

### Vue.js Integration
Vue components are "sprinkled" into OJS pages:
- **Global mounting**: `mountSprinkledVueApps()` finds `.vue-app` class elements
- **Specific apps**: `mountTimelineApp()` for `#timeline-App`, `mountGlobe()` for interactive globe
- **Components**: Located in `src/scripts/vue/` and `src/components/`

Example Vue component usage in templates:
```smarty
<div id="timeline-App" class="vue-app">
  <!-- Vue component mounts here -->
</div>
```

### Template Compatibility Patterns
**Critical OJS version compatibility fixes:**
- Use `$publication->getData('galleys')` not `$article->getGalleys()`
- Check `$galley->getData('urlRemote')` not `$galley->getRemoteUrl()`
- Always check `isset($publication)` before accessing publication data
- Verify author methods exist before calling (e.g., `$authorUserGroup && $authorUserGroup->showTitle`)

## Project-Specific Conventions

### CSS/Styling
- **Tailwind CSS** with typography plugin for prose content
- **Custom colors**: Primary blue (`#13335c`), accent orange, defined in Tailwind config
- **Component patterns**: Use `.obj_article_summary`, `.item`, `.label/.value` for consistent spacing

### Interactive Features
- **Globe animation**: COBE-powered 3D globe with ripple effects on homepage
- **Issue timeline**: Vue-powered filterable issue browser with API integration
- **Abstract toggles**: Vanilla JS accordion for article abstracts
- **Mobile navigation**: Custom mobile menu with animation

### Smarty Template Best Practices
- Use semantic blocks: `{capture}` for building complex variables
- Check variables before use: `{if $variable}` prevents undefined errors
- Escape output: `{$variable|escape}` for security
- Include context: Pass required data to child templates explicitly

### API Integration
Vue components connect to OJS REST API:
- `src/scripts/vue/config.js` - API configuration
- Issue data fetching in `GetPostsByYear.vue` and `IssueTimeline.vue`
- Uses axios with bearer token authentication

## Common Debugging Patterns

### Template Errors
OJS template compilation errors often occur from:
1. **Method compatibility**: Check if methods exist in your OJS version before calling
2. **Variable scope**: Ensure variables are passed to included templates
3. **Null safety**: Always verify objects exist before accessing properties

### Asset Loading Issues
If styles/scripts don't load:
1. Check `dist/.vite/manifest.json` exists after build
2. Verify `getManifest()` method in plugin finds manifest
3. Ensure build output matches expected paths in `assetUrl()` method

### Vue Component Issues
Components not mounting:
1. Verify element has correct ID/class for mounting
2. Check browser console for Vue errors
3. Ensure component imports are correct in `vueAppLoader.js`

## File Patterns to Follow

When creating new templates, follow existing patterns:
- **Article templates**: See `article_summary.tpl` for layout structure
- **Page templates**: Include header, sectionHeader, content, footer pattern
- **Vue components**: Use composition API with `<script setup>` syntax
- **Styling**: Apply Tailwind utilities, avoid custom CSS unless necessary
