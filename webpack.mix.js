let mix = require('laravel-mix');

mix.js('src/scripts/app.js', 'dist/scripts/app.js')
    .vue({version: 3})
    .extract(
        ['underscore', 'popper.js']
    )
    .setPublicPath('dist');

mix.sass('src/styles/main.scss', 'dist/styles');

mix.copy('src/images', 'dist/images')
    .copy('src/fonts', 'dist/fonts'); 