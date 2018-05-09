const path = require('path');

const env = process.env.NODE_ENV;
const production = env === 'production';

module.exports = {
  mode: env || 'development',
  devtool: production ? 'source-maps' : 'eval',
  entry: './js/app.js',
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
    ],
  },
  resolve: {
    modules: ['node_modules', path.resolve(__dirname, 'js')],
    extensions: ['.js'],
  },
};
