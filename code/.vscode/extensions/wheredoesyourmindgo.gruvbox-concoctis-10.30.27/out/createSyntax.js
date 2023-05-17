"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const syntax_1 = require("./syntax");
const utils_1 = require("./utils");
/**
 *
 *
 * @param {object} syntaxColors
 * @returns {object}
 */
function createSyntax(syntaxColors) {
    const utils = new utils_1.default();
    const config = utils.getConfiguration();
    const { useItalicFont, useBoldFont } = config;
    syntaxColors = Object.entries(syntaxColors);
    return syntax_1.default.map((element) => {
        const name = element.name.toLowerCase();
        syntaxColors.forEach((item) => {
            if (name === item[0].toLowerCase()) {
                element.settings.foreground = item[1];
            }
        });
        element.settings.fontStyle = ''; // Always reset fontStyle. Will fix issue with unselecting multiple options.
        if (name === 'bold' && useBoldFont) {
            element.settings.fontStyle = 'bold';
        }
        if (name === 'italic' && useItalicFont) {
            element.settings.fontStyle = 'italic';
        }
        if (name === 'bold-italic' && (useBoldFont || useItalicFont)) {
            if (useItalicFont && useBoldFont) {
                element.settings.fontStyle = 'bold italic';
            }
            else if (!useItalicFont && useBoldFont) {
                element.settings.fontStyle = 'bold';
            }
            else {
                element.settings.fontStyle = 'italic';
            }
        }
        return element;
    });
}
exports.createSyntax = createSyntax;
//# sourceMappingURL=createSyntax.js.map