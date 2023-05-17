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
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.activate = void 0;
const path_1 = __importDefault(require("path"));
const vscode_1 = require("vscode");
const icons_1 = __importDefault(require("./icons"));
function capitalize(s) {
    return s.charAt(0).toUpperCase() + s.slice(1).toLowerCase();
}
function getTextTransform() {
    return vscode_1.workspace.getConfiguration('where-am-i').get('textTransfrom');
}
function getIcon() {
    return vscode_1.workspace.getConfiguration('where-am-i').get('icon');
}
function alignPriority() {
    return +vscode_1.workspace.getConfiguration('where-am-i').get('alignPriority');
}
function getTemplate() {
    return vscode_1.workspace.getConfiguration('where-am-i').get('template');
}
function getColorful() {
    return vscode_1.workspace.getConfiguration('where-am-i').get('colorful');
}
function getColor() {
    return vscode_1.workspace.getConfiguration('where-am-i').get('color');
}
function getProjectSetting() {
    return vscode_1.workspace.getConfiguration('where-am-i').get('projectSetting');
}
function setProjectSetting(v) {
    vscode_1.workspace.getConfiguration('where-am-i').update('projectSetting', v, vscode_1.ConfigurationTarget.Global);
}
function selectIcon(value) {
    return __awaiter(this, void 0, void 0, function* () {
        const items = icons_1.default.map(i => ({
            label: `$(${i})`,
            description: i,
        }));
        const result = yield vscode_1.window.showQuickPick(items, {
            placeHolder: value,
            matchOnDetail: true,
            matchOnDescription: true,
        });
        return (result === null || result === void 0 ? void 0 : result.description) || value;
    });
}
function getAlign() {
    const align = vscode_1.workspace.getConfiguration('where-am-i').get('align');
    switch (align) {
        case 'left':
            return vscode_1.StatusBarAlignment.Left;
        case 'right':
            return vscode_1.StatusBarAlignment.Right;
        default:
            return vscode_1.StatusBarAlignment.Left;
    }
}
function getProjectPath() {
    if (Array.isArray(vscode_1.workspace.workspaceFolders)) {
        if (vscode_1.workspace.workspaceFolders.length === 1) {
            return vscode_1.workspace.workspaceFolders[0].uri.path;
        }
        else if (vscode_1.workspace.workspaceFolders.length > 1) {
            const activeTextEditor = vscode_1.window.activeTextEditor;
            if (activeTextEditor) {
                const workspaceFolder = vscode_1.workspace.workspaceFolders.find((folder) => activeTextEditor.document.uri.path.startsWith(folder.uri.path));
                if (workspaceFolder)
                    return workspaceFolder.uri.path;
            }
        }
    }
}
function stringToColor(str) {
    let hash = 0;
    for (let i = 0; i < str.length; i++)
        hash = str.charCodeAt(i) + ((hash << 5) - hash);
    let colour = '#';
    for (let i = 0; i < 3; i++) {
        const value = (hash >> (i * 8)) & 0xFF;
        colour += (`00${value.toString(16)}`).substr(-2);
    }
    return colour;
}
function getProjectColor(projectName) {
    if (!getColorful())
        return;
    if (!projectName)
        return getColor() || undefined;
    return getColor() || stringToColor(projectName);
}
const textTransforms = {
    uppercase: (t) => t.toUpperCase(),
    lowercase: (t) => t.toLowerCase(),
    capitalize: (t) => t.trim().split(/-|_/g).map(capitalize).join(' '),
};
function getProjectName(projectPath) {
    const projectName = path_1.default.basename(projectPath);
    const transform = getTextTransform();
    if (textTransforms[transform])
        return textTransforms[transform](projectName);
    return projectName;
}
function activate(context) {
    let onDidChangeWorkspaceFoldersDisposable;
    let onDidChangeActiveTextEditorDisposable;
    const statusBarItem = vscode_1.window.createStatusBarItem(getAlign(), alignPriority());
    let projectPath;
    let projectName = '';
    let statusBarName = '';
    let statusBarColor;
    let statusBarIcon;
    function updateStatusBarItem() {
        projectPath = getProjectPath();
        if (!projectPath) {
            statusBarItem.text = '';
            statusBarItem.hide();
            return;
        }
        const projectSetting = getProjectSetting()[projectPath];
        projectName = (projectSetting === null || projectSetting === void 0 ? void 0 : projectSetting.name) || getProjectName(projectPath);
        statusBarIcon = (projectSetting === null || projectSetting === void 0 ? void 0 : projectSetting.icon) || getIcon();
        statusBarName = getTemplate()
            .replace(/{project-name}/, projectName)
            .replace(/{icon}/, `$(${statusBarIcon})`);
        statusBarColor = (projectSetting === null || projectSetting === void 0 ? void 0 : projectSetting.color) || getProjectColor(projectPath);
        statusBarItem.text = statusBarName;
        statusBarItem.color = statusBarColor;
        statusBarItem.command = 'workbench.action.quickSwitchWindow';
        statusBarItem.show();
    }
    function updateSubscription() {
        if (!onDidChangeWorkspaceFoldersDisposable) {
            (onDidChangeWorkspaceFoldersDisposable = vscode_1.workspace.onDidChangeWorkspaceFolders(() => {
                updateSubscription();
                updateStatusBarItem();
            }));
        }
        if (Array.isArray(vscode_1.workspace.workspaceFolders)) {
            if (vscode_1.workspace.workspaceFolders.length > 1) {
                if (!onDidChangeActiveTextEditorDisposable)
                    onDidChangeActiveTextEditorDisposable = vscode_1.window.onDidChangeActiveTextEditor(() => updateStatusBarItem());
            }
            else {
                if (onDidChangeActiveTextEditorDisposable)
                    onDidChangeActiveTextEditorDisposable.dispose();
            }
        }
    }
    context.subscriptions.push(statusBarItem);
    vscode_1.commands.registerCommand('where-am-i.config', () => __awaiter(this, void 0, void 0, function* () {
        var _a, _b;
        if (!projectName || !projectPath)
            return;
        projectName = (_a = yield vscode_1.window.showInputBox({
            value: projectName,
            prompt: 'Project Name',
        })) !== null && _a !== void 0 ? _a : projectName;
        if (getColorful()) {
            statusBarColor = (_b = yield vscode_1.window.showInputBox({
                value: statusBarColor,
                prompt: 'Project Color',
            })) !== null && _b !== void 0 ? _b : statusBarColor;
        }
        statusBarIcon = yield selectIcon(statusBarIcon);
        const settings = getProjectSetting();
        if (!settings[projectPath])
            settings[projectPath] = {};
        const projectSetting = settings[projectPath];
        projectSetting.name = projectName;
        projectSetting.color = statusBarColor;
        projectSetting.icon = statusBarIcon;
        setProjectSetting(settings);
        updateStatusBarItem();
    }));
    vscode_1.workspace.onDidChangeConfiguration(() => {
        updateSubscription();
        updateStatusBarItem();
    });
    updateSubscription();
    updateStatusBarItem();
}
exports.activate = activate;
//# sourceMappingURL=extension.js.map