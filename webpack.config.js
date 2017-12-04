var CopyWebpackPlugin = require("copy-webpack-plugin");
var extractCSS = require("extract-text-webpack-plugin");

module.exports = {
  entry: __dirname + "/web/js/app.js",
  output: {
    path: __dirname + "/priv/static",
    filename: "js/app.js"
  },
  plugins: [
    new CopyWebpackPlugin([{ from: __dirname + "/web/static" }])
  ]
};
