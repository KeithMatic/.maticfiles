"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.deactivate = exports.activate = void 0;
const vscode = require("vscode");
const data = require("./properties.json");
const properties = data;
function activate(context) {
    const hoverProvider = {
        provideHover(doc, pos, token) {
            const range = doc.getWordRangeAtPosition(pos, /[a-z\-]+\s*:/ig);
            if (range === undefined) {
                return;
            }
            const initialValue = getInitialValue(doc.getText(range));
            if (initialValue === undefined) {
                return;
            }
            return new vscode.Hover(getText(initialValue));
        }
    };
    let disposable = vscode.languages.registerHoverProvider(['css', 'less', 'sass', 'scss'], hoverProvider);
    context.subscriptions.push(disposable);
}
exports.activate = activate;
function getInitialValue(word) {
    return properties[word.slice(0, -1).trim()].initial;
}
function getText(initialValue) {
    let value = '';
    if (Array.isArray(initialValue)) {
        const props = initialValue.map(item => {
            return `* ${item}: \`${properties[item].initial}\``;
        });
        value = `
Initial value

As each of the properties:

${props.join('\n')}
		`;
    }
    else {
        value = `Initial value: \`${initialValue}\``;
    }
    return new vscode.MarkdownString(value);
}
function deactivate() { }
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map