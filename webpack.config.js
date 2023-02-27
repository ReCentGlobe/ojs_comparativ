const path = require('path');
const webpack = require('webpack');
const ChunkManifestPlugin = require('chunk-manifest-webpack-plugin');
const WebpackChunkHash = require('webpack-chunk-hash');
const ExtractTextPlugin = require('extract-text-webpack-plugin');



module.exports = {
    context: path.resolve(__dirname, 'src'),
    entry: {
        app: ["./scripts/app.js",
            "./styles/main.scss"],
        vendor: ['popper.js','underscore'],
    },
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'scripts/[name].bundle.js',
    },

    plugins: [
        new webpack.optimize.ModuleConcatenationPlugin(),
        new webpack.HashedModuleIdsPlugin(),
        new WebpackChunkHash(),
        new webpack.optimize.CommonsChunkPlugin({
            name: 'vendor',
            minChunks: Infinity,
        }),
        new ChunkManifestPlugin({
            filename: 'chunk-manifest.json',
            manifestVariable: 'webpackManifest',
            inlineManifest: true,
        }),
        new ExtractTextPlugin({
            filename: 'styles/[name].bundle.css',
            allChunks: true,
        }),
        new webpack.ProvidePlugin({
            underscore: "underscore"
        }),
    ],

    module: {
        rules: [
            {
                test: /\.js$/i,
                exclude: [/node_modules/],
                use: [{
                    loader: 'babel-loader',
                }],
            },

            {
                test: /\.css$/i,
                use:  ExtractTextPlugin.extract({
                    use: [{
                        loader: 'css-loader',
                        options: { importLoaders: 1 },
                    }],
                }),
            },

            {
                test: /\.vue$/,
                loader: 'vue-loader'
            },

            {
                test: /\.(sass|scss)$/i,
                use: ExtractTextPlugin.extract({
                    use: [
                    { loader: 'cache-loader' },
                    { loader: 'css-loader'},
                    { loader: 'sass-loader'},
                    ],

                }),
            },
            {
                test: /.(ttf|otf|eot|svg|woff(2)?)(\?[a-z0-9]+)?$/,
                use: [{
                    loader: 'file-loader',
                    options: {
                        name: '[name].[ext]',
                        outputPath: 'fonts/',    // where the fonts will go
                        publicPath: '../'       // override the default path
                    }
                }]
            }
            // Loaders for other file types can go here
        ],
    },
    resolve: {
        modules: [
            'node_modules',
            'bower_components',
        ],
        alias: {
            'vue$': 'vue/dist/vue.esm.js', // 'vue/dist/vue.common.js' for webpack 1
        },
        enforceExtension: false,
    },
};