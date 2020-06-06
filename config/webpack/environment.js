const { environment } = require('@rails/webpacker')
// const { VueLoaderPlugin } = require('vue-loader')
const {VueLoaderPlugin} = require('vue-loader')
const vue = require('./loaders/vue')

module.exports = {
  module: {
    rules: [
      // ... other rules
      {
        test: /\.vue$/,
        loader: 'vue-loader'
      }
    ]
  },
  plugins: [
    // make sure to include the plugin!
    new VueLoaderPlugin()
  ]
}

module.exports = environment

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
environment.config.resolve.alias = {'vue$': 'vue/dist/vue.esm.js' }
module.exports = environment

const customConfig = require('./custom')
environment.config.merge(customConfig)

// jQueryとBootstapのJSを使えるように
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)
module.exports = environment