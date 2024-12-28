// const { defineConfig } = require('@vue/cli-service')
// const path = require("path");
// module.exports = defineConfig({
//   transpileDependencies: true,
//   configureWebpack: {
//     resolve: {
//       alias: {
//         '@': path.resolve(__dirname, 'src')
//       }
//     }
//   }
// })
const path = require('path')
function resolve(dir) {
  return path.join(__dirname, dir)
}
module.exports = {
  configureWebpack: {
    resolve: {
      alias: {
        // eslint-disable-next-line no-undef
        '@': resolve('src'),
      },
    },
  },
  lintOnSave: false
}
