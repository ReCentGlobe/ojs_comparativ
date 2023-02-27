let mix = require('laravel-mix');

mix.js('src/scripts/app.js', 'dist/scripts')
    .vue()
    .extract(['vue', 'underscore', 'popper.js'])
    .setPublicPath('dist');

mix.sass('src/styles/main.scss', 'dist/styles');

mix.copy('src/images', 'dist/images')
    .copy('src/fonts', 'dist/fonts');