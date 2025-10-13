const fs = require('fs');
const path = require('path');
const { defineConfig } = require("cypress");
module.exports = defineConfig({
  e2e: {
    // baseUrl: "https://10.234.233.245",
    baseUrl: "https://192.168.80.249",
    viewportWidth: 1280,
    viewportHeight: 720,
    setupNodeEvents(on, config) {
      on('task', {
        renameDownloadedFile({ oldName, newName }) {
          const downloadsFolder = config.downloadsFolder;
          const oldPath = path.join(downloadsFolder, oldName);
          const newPath = path.join(downloadsFolder, newName);

          if (fs.existsSync(oldPath)) {
            fs.renameSync(oldPath, newPath);
            return newPath;
          }
          return null;
        }
      });
    },
    downloadsFolder: 'cypress/downloads',
  },
  chromeWebSecurity: false,
  // Add this to keep duplicate files
  env: {
    overwriteDownloads: false,
  },
});
