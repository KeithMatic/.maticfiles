"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const fs_1 = require("fs");
const path_1 = require("path");
/**
 *
 *
 * @param {array} themesArray
 * @returns {array}
 */
function makeThemePath(themesArray) {
    const PATHS = [];
    themesArray.forEach((theme) => {
        const path = path_1.join(__dirname, '..', 'themes', `./${Object.keys(theme)}.json`);
        if (fs_1.existsSync(path)) {
            fs_1.unlinkSync(path);
        }
        PATHS.push(path);
    });
    return PATHS;
}
exports.makeThemePath = makeThemePath;
//# sourceMappingURL=makeThemePath.js.map