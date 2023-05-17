"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.readModuleFile = exports.findImportModule = exports.getWords = exports.getCurrentLine = void 0;
const fs_1 = require("fs");
const p = require("path");
const genImportRegExp = (key) => {
    const file = "(.+\\.(\\S{1,2}ss|stylus|styl))";
    const fromOrRequire = "(?:from\\s+|=\\s+require(?:<any>)?\\()";
    const requireEndOptional = "\\)?";
    const pattern = `\\s${key}\\s+${fromOrRequire}["']${file}["']${requireEndOptional}`;
    return new RegExp(pattern);
};
const getCurrentLine = (document, position) => {
    return document.lineAt(position).text;
};
exports.getCurrentLine = getCurrentLine;
const getWords = (line, position) => {
    const text = line.slice(0, position.character);
    const convertText = text.replace(/(\?\.)/g, ".");
    const index = convertText.search(/[a-zA-Z0-9._]*$/);
    if (index === -1) {
        return "";
    }
    return convertText.slice(index);
};
exports.getWords = getWords;
const findImportModule = (text, key) => {
    const re = genImportRegExp(key);
    const results = re.exec(text);
    if (!!results && results.length > 0) {
        return results[1];
    }
    else {
        return "";
    }
};
exports.findImportModule = findImportModule;
const readModuleFile = async (filePath, currentDir) => {
    const realPath = p.resolve(currentDir, filePath);
    const contents = await fs_1.promises.readFile(realPath, "utf-8");
    return contents;
};
exports.readModuleFile = readModuleFile;
//# sourceMappingURL=index.js.map