"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const colors_1 = require("./colors");
const makeThemePath_1 = require("./makeThemePath");
const buildTheme_1 = require("./buildTheme");
/**
 *
 *
 * @param {array} themesArray
 * @returns {void}
 */
const buildAllThemes = (themesArray) => {
    const THEMES_PATH = makeThemePath_1.makeThemePath(themesArray);
    const colors = colors_1.getColors();
    themesArray.forEach((theme) => {
        let themeEntries = Object.entries(theme);
        let themeName = themeEntries[0][0];
        let themeWorkbench = themeEntries[0][1];
        THEMES_PATH.find((path) => {
            if (path.includes(themeName)) {
                buildTheme_1.buildTheme(path, colors[themeName], themeWorkbench, themeName);
            }
        });
    });
};
exports.buildAllThemes = buildAllThemes;
//# sourceMappingURL=buildAllThemes.js.map