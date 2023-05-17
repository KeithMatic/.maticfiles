"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.deactivate = exports.activate = void 0;
const vscode = require("vscode");
const path_1 = require("path");
const webviewContent_1 = require("./webviewContent");
function activate(context) {
    let disposable = vscode.commands.registerCommand('open.git.cheatsheet', () => {
        const assetsRoot = vscode.Uri.file((0, path_1.join)(context.extensionPath, 'assets'));
        const panel = vscode.window.createWebviewPanel('gitCheatsheet', 'Git Cheatsheet', vscode.ViewColumn.Beside, {
            localResourceRoots: [assetsRoot],
            enableScripts: true
        });
        const assetsPath = panel.webview.asWebviewUri(assetsRoot);
        const cspSource = panel.webview.cspSource;
        panel.webview.html = (0, webviewContent_1.getWebviewContent)(cspSource, assetsPath);
        panel.webview.onDidReceiveMessage((command) => {
            vscode.env.clipboard.writeText(command)
                .then(() => {
                vscode.window.showInformationMessage(`Command copied: ${command}`);
            }, () => {
                vscode.window.showErrorMessage('Copy failed');
            });
        }, undefined, context.subscriptions);
    });
    context.subscriptions.push(disposable);
}
exports.activate = activate;
function deactivate() { }
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map