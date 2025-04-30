# Comparativ OJS Theme
Official theme for the Comparativ journal.

Tested up to OJS 3.4.0

## Installation
1. Download the latest release from the [releases page](https://github.com/ReCentGlobe/ojs_comparativ/releases).
2. Upload the theme to your OJS installation in the `plugins/themes` directory.
3. Go to the `Website Settings` page and select the `Comparativ` theme.
4. Enable the theme in the `Website Settings` page.

## Development
1. Clone the repository.
2. Install the dependencies with `pnpm install` (see [pnpm](https://pnpm.io/)).
3. Run `pnpm run development` to build the theme.
4. Run `pnpm run watch` to watch for changes and rebuild the theme.
5. Run `pnpm run production` to build the theme for production.

### Useful Commands
- `pnpm run vite:dev` — Start Vite dev server for Vue components and Tailwind CSS
- `pnpm run vite:build` — Build assets using Vite
- `pnpm run development` — Build theme assets using Laravel Mix
- `pnpm run watch` — Watch for changes and rebuild assets
- `pnpm run production` — Build optimized assets for production

### Project Structure
- `src/` — Source files (JavaScript, Vue, SCSS, images, fonts)
- `dist/` — Compiled assets (created after build)
- `templates/` — OJS template overrides
- `locale/` — Localization files
- `package.json` — Project dependencies and scripts
- `vite.config.js` — Vite configuration
- `webpack.mix.js` — Laravel Mix configuration

### Requirements
- Node.js (v18+ recommended)
- [pnpm](https://pnpm.io/) package manager

## Version Compatibility
* Version 1.0.0 is compatible with OJS 3.4.0

## License
This theme is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for more details.

The font used in this theme is [Gidole](http://gidole.github.io/) and is licensed under the [SIL Open Font License](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL).
