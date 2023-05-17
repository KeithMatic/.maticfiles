"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.deactivate = exports.activate = void 0;
const vscode = require("vscode");
const utils_1 = require("./utils");
const path = require("path");
const triggerBeforeCurrentWord = (document, position) => {
    const range = document.getWordRangeAtPosition(position);
    if (!range) {
        return false;
    }
    const previousCharRange = new vscode.Range(range.start.translate(0, -1), range.start);
    const previousChar = document.getText(previousCharRange);
    if (previousChar === ".") {
        return true;
    }
    return false;
};
const isStyle = (document, position) => {
    const line = (0, utils_1.getCurrentLine)(document, position);
    const word = document.getText(document.getWordRangeAtPosition(position));
    const x = triggerBeforeCurrentWord(document, position);
    return true;
};
function activate(context) {
    let disposable = vscode.languages.registerHoverProvider("typescriptreact", {
        async provideHover(document, position, token) {
            const r = document.getWordRangeAtPosition(position)?.end;
            if (!r) {
                return;
            }
            const line = (0, utils_1.getCurrentLine)(document, position);
            const words = (0, utils_1.getWords)(line, r);
            if (words === "" || words.indexOf(".") === -1) {
                return;
            }
            const [obj, field] = words.split(".");
            const importModule = (0, utils_1.findImportModule)(document.getText(), obj);
            if (importModule === "") {
                return;
            }
            // Get the contents of the related module file
            const contents = await (0, utils_1.readModuleFile)(importModule, path.dirname(document.uri.fsPath));
            // Find the specific class being referenced
            const cbegin = contents.indexOf(`.${field}`);
            const cend = contents.indexOf("}", cbegin);
            const text = contents.substring(cbegin, cend + 1);
            const formatted = "```css\n" + text + "\n```";
            return new vscode.Hover(formatted);
        },
    });
    context.subscriptions.push(disposable);
}
exports.activate = activate;
// this method is called when your extension is deactivated
function deactivate() { }
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map