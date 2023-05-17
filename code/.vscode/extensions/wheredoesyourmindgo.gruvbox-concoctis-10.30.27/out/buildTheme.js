"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const fs_1 = require("fs");
const util_1 = require("util");
const createSyntax_1 = require("./createSyntax");
/**
 *
 *
 * @param {string} path
 * @param {object} syntaxColors
 * @param {Function} themeWorkbench
 * @param {string} themeName
 * @returns {void}
 */
function buildTheme(path, syntaxColors, themeWorkbench, themeName) {
    return __awaiter(this, void 0, void 0, function* () {
        const syntaxWithColors = createSyntax_1.createSyntax(syntaxColors);
        const writeFileAsync = util_1.promisify(fs_1.writeFile);
        const theme = themeWorkbench(syntaxWithColors);
        try {
            yield writeFileAsync(path, JSON.stringify(theme, null, 3));
            console.log(`✔  ${themeName} theme built`);
        }
        catch (error) {
            console.error(`❗  ${error}`);
        }
    });
}
exports.buildTheme = buildTheme;
//# sourceMappingURL=buildTheme.js.map