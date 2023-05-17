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
const vscode_1 = require("vscode");
const fs_1 = require("fs");
const path_1 = require("path");
class Utils {
    detectConfigChanges(event, onConfigChange) {
        if (event.affectsConfiguration('gruvboxConcoctis')) {
            onConfigChange();
        }
    }
    getConfiguration() {
        let workspaceConfiguration = vscode_1.workspace.getConfiguration('gruvboxConcoctis');
        return {
            usePalette: workspaceConfiguration.get('usePalette'),
            useBoldFont: workspaceConfiguration.get('useBoldFont'),
            useItalicFont: workspaceConfiguration.get('useItalicFont'),
            selectionColor: workspaceConfiguration.get('selectionColor')
        };
    }
    writeFile(path, data) {
        return __awaiter(this, void 0, void 0, function* () {
            return new Promise((resolve, reject) => {
                fs_1.writeFile(path, JSON.stringify(data, null, 2), (err) => err ? reject(err) : resolve());
            });
        });
    }
    isNewlyInstalled() {
        const flagPath = path_1.join(__dirname, '../temp', 'flag.txt');
        if (!fs_1.existsSync(flagPath)) {
            this.writeFile(flagPath, '');
            return true;
        }
        else {
            return false;
        }
    }
    promptToReload() {
        const action = 'Reload';
        vscode_1.window
            .showInformationMessage('Reload required.', action)
            .then((selectedAction) => {
            if (selectedAction === action) {
                vscode_1.commands.executeCommand('workbench.action.reloadWindow');
            }
        });
    }
    isDefaultConfiguration(configuration) {
        return (configuration.usePalette !== 'material' &&
            configuration.useBoldFont !== true &&
            configuration.useItalicFont === true &&
            configuration.selectionColor === 'neutral');
    }
}
exports.default = Utils;
//# sourceMappingURL=utils.js.map