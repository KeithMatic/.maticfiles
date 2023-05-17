"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const vscode_1 = require("vscode");
const utils_1 = require("./utils");
const buildAllThemes_1 = require("./buildAllThemes");
const themes_1 = require("./themes");
function activate() {
    let utils = new utils_1.default();
    // regenerate theme files when user configuration changes
    vscode_1.workspace.onDidChangeConfiguration((event) => {
        utils.detectConfigChanges(event, () => {
            buildAllThemes_1.buildAllThemes(themes_1.themes);
            utils.promptToReload();
        });
    });
    // regenerate theme files and prompt for reload if it's newly installed but the user settings are not default
    if (utils.isNewlyInstalled() &&
        !utils.isDefaultConfiguration(utils.getConfiguration())) {
        buildAllThemes_1.buildAllThemes(themes_1.themes);
        utils.promptToReload();
    }
}
exports.activate = activate;
function deactivate() { }
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map