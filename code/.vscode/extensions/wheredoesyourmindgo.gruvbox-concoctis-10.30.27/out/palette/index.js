"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const utils_1 = require("../utils");
const darkMedium_1 = require("./material/darkMedium");
const lightMedium_1 = require("./material/lightMedium");
const darkSoft_1 = require("./material/darkSoft");
const lightSoft_1 = require("./material/lightSoft");
const darkHard_1 = require("./material/darkHard");
const lightHard_1 = require("./material/lightHard");
const darkMedium_2 = require("./mix/darkMedium");
const lightMedium_2 = require("./mix/lightMedium");
const darkSoft_2 = require("./mix/darkSoft");
const lightSoft_2 = require("./mix/lightSoft");
const darkHard_2 = require("./mix/darkHard");
const lightHard_2 = require("./mix/lightHard");
const darkMedium_3 = require("./original/darkMedium");
const lightMedium_3 = require("./original/lightMedium");
const darkSoft_3 = require("./original/darkSoft");
const lightSoft_3 = require("./original/lightSoft");
const darkHard_3 = require("./original/darkHard");
const lightHard_3 = require("./original/lightHard");
function getPalette() {
    const utils = new utils_1.default();
    const config = utils.getConfiguration();
    const { selectionColor, usePalette } = config;
    if (usePalette === 'original') {
        return {
            darkMediumPalette: Object.assign(Object.assign({}, darkMedium_3.default), { selectionColor }),
            darkSoftPalette: Object.assign(Object.assign({}, darkSoft_3.default), { selectionColor }),
            darkHardPalette: Object.assign(Object.assign({}, darkHard_3.default), { selectionColor }),
            lightMediumPalette: Object.assign(Object.assign({}, lightMedium_3.default), { selectionColor }),
            lightSoftPalette: Object.assign(Object.assign({}, lightSoft_3.default), { selectionColor }),
            lightHardPalette: Object.assign(Object.assign({}, lightHard_3.default), { selectionColor })
        };
    }
    else if (usePalette === 'mix') {
        return {
            darkMediumPalette: Object.assign(Object.assign({}, darkMedium_2.default), { selectionColor }),
            darkSoftPalette: Object.assign(Object.assign({}, darkSoft_2.default), { selectionColor }),
            darkHardPalette: Object.assign(Object.assign({}, darkHard_2.default), { selectionColor }),
            lightMediumPalette: Object.assign(Object.assign({}, lightMedium_2.default), { selectionColor }),
            lightSoftPalette: Object.assign(Object.assign({}, lightSoft_2.default), { selectionColor }),
            lightHardPalette: Object.assign(Object.assign({}, lightHard_2.default), { selectionColor })
        };
    }
    else {
        return {
            darkMediumPalette: Object.assign(Object.assign({}, darkMedium_1.default), { selectionColor }),
            darkSoftPalette: Object.assign(Object.assign({}, darkSoft_1.default), { selectionColor }),
            darkHardPalette: Object.assign(Object.assign({}, darkHard_1.default), { selectionColor }),
            lightMediumPalette: Object.assign(Object.assign({}, lightMedium_1.default), { selectionColor }),
            lightSoftPalette: Object.assign(Object.assign({}, lightSoft_1.default), { selectionColor }),
            lightHardPalette: Object.assign(Object.assign({}, lightHard_1.default), { selectionColor })
        };
    }
}
exports.getPalette = getPalette;
//# sourceMappingURL=index.js.map