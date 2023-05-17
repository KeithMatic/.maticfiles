"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const workbench_1 = require("./workbench");
const buildAllThemes_1 = require("./buildAllThemes");
exports.THEMES = [
    { darkMedium: workbench_1.darkMedium },
    { lightMedium: workbench_1.lightMedium },
    { darkSoft: workbench_1.darkSoft },
    { lightSoft: workbench_1.lightSoft },
    { darkHard: workbench_1.darkHard },
    { lightHard: workbench_1.lightHard }
];
if (typeof buildAllThemes_1.buildAllThemes === "function") {
    buildAllThemes_1.buildAllThemes(exports.THEMES);
}
//# sourceMappingURL=build.js.map