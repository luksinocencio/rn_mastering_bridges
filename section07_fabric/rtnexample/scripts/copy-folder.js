const fs = require('fs-extra');
const path = require('path');

const paths = {
  source: path.resolve(__dirname, '../android/app/src/main/java'),
  dest: path.resolve(__dirname, '../android/src/main/java'),
};

fs.removeSync(paths.dest);
fs.ensureDirSync(paths.dest);

fs.copySync(paths.source, paths.dest);

console.log('Copied folder');

// execute
// node .\scripts\copy-folder.js
