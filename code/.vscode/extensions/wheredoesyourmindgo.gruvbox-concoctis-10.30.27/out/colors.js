"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const palette_1 = require("./palette");
function producePalette(palette) {
    return {
        comment: palette.grey1,
        comment_emphasis: palette.grey2,
        text: palette.fg,
        keyword: palette.purple,
        variable: palette.fg,
        annotation: palette.fg1,
        constant: palette.yellow,
        tag: palette.orange,
        string: palette.green,
        stringInterpolated: palette.green,
        number: palette.red,
        function: palette.aqua,
        support: palette.aqua,
        misc: palette.blue,
        invalid: palette.red
    };
}
function getColors() {
    const { lightMediumPalette, darkMediumPalette, darkSoftPalette, lightSoftPalette, lightHardPalette, darkHardPalette } = palette_1.getPalette();
    return {
        darkMedium: producePalette(darkMediumPalette),
        lightMedium: producePalette(lightMediumPalette),
        darkSoft: producePalette(darkSoftPalette),
        lightSoft: producePalette(lightSoftPalette),
        darkHard: producePalette(darkHardPalette),
        lightHard: producePalette(lightHardPalette)
    };
}
exports.getColors = getColors;
//# sourceMappingURL=colors.js.map