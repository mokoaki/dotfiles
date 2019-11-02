module.exports = {
  root: true,
  extends: ["standard"],
  env: {
    // "jest/globals": true,
    // "node": true,
    // "commonjs": true,
    // "sourceType": "script",
    // "es6": true,
    // "browser": true
  },
  // "plugins": [
  //   "jest"
  // ],
  parserOptions: {
    sourceType: "module",
    ecmaVersion: 2019
  },
  rules: {
    quotes: ["error", "double"],
    semi: "off",
    "brace-style": ["error", "stroustrup"]
  }
}
