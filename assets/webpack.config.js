const path = require('path');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

const env = process.env.NODE_ENV;
const production = env === 'production';

module.exports = {
  mode: env || 'development',
  devtool: production ? 'source-maps' : 'eval',
  entry: './js/app.js',
  plugins: [
    new MiniCssExtractPlugin({
      filename: "[name].css",
      chunkFilename: "[id].css"
    })
  ],
  output: {
    path: path.resolve(__dirname, '../priv/static/js'),
    filename: 'app.js',
    publicPath: '/',
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
        },
      },
      {
        test: /.(scss|sass|css)$/i,
        use: [
          production ? MiniCssExtractPlugin.loader : 'style-loader',
          'css-loader',
          'postcss-loader',
          'sass-loader',
        ],
      },
    ]
  },
  resolve: {
    modules: ['node_modules', path.resolve(__dirname, 'js')],
    extensions: ['.js'],
  }
};
