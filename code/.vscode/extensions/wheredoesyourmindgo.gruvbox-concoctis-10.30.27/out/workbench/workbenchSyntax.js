"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function default_1(palette, name, type, tokenColors) {
    var _a, _b, _c, _d, _e, _f;
    // const selectionBg = `${palette.bg6}f0`;
    // const selectionBg = `${palette.darkAqua}40`
    // const selectionBg = `${palette.darkBlue}40`;
    // const selectionBg = `${palette.darkRed}40`;
    let selectionBgBase;
    const { selectionColor } = palette;
    switch (selectionColor) {
        case 'green':
            selectionBgBase = palette.darkGreen;
            break;
        case 'purple':
            selectionBgBase = palette.darkPurple;
            break;
        case 'red':
            selectionBgBase = palette.darkRed;
            break;
        case 'orange':
            selectionBgBase = palette.darkOrange;
            break;
        case 'yellow':
            selectionBgBase = palette.darkYellow;
            break;
        case 'aqua':
            selectionBgBase = palette.darkAqua;
            break;
        case 'blue':
            selectionBgBase = palette.darkBlue;
            break;
        case 'grey':
            selectionBgBase = palette.grey2;
            break;
        default:
            selectionBgBase = palette.bg9;
    }
    const selectionBg = `${selectionBgBase}${type === 'dark' ? '59' : '33'}`; // 35% and 20% respectively
    return {
        name,
        type,
        colors: {
            // ---------------------------
            // Editor Base Colors
            // ---------------------------
            'selection.background': selectionBg,
            descriptionForeground: palette.fg1,
            errorForeground: `${palette.red}FF`,
            'widget.shadow': '#00000044',
            'editor.background': palette.bg,
            'editor.foreground': palette.fg,
            'editorLineNumber.foreground': palette.bg8,
            'editorLineNumber.activeForeground': palette.fg1,
            'editorCursor.foreground': `${palette.fg}`,
            // ---------------------------
            // Badge
            // ---------------------------
            'badge.background': palette.yellow,
            'badge.foreground': palette.bg0,
            // ---------------------------
            // Activity Bar
            // ---------------------------
            'activityBar.background': palette.bg,
            'activityBar.dropBackground': palette.bg,
            'activityBar.foreground': palette.grey0,
            'activityBar.inactiveForeground': palette.bg8,
            'activityBar.border': palette.bg0,
            'activityBarBadge.background': palette.yellow,
            'activityBarBadge.foreground': palette.bg0,
            'activityBar.activeBackground': `${palette.fg}26`,
            'activityBar.activeBorder': palette.yellow,
            // ---------------------------
            // Sidebar
            // ---------------------------
            'sideBar.background': palette.bg1,
            'sideBar.foreground': `${palette.grey1}FF`,
            'sideBar.border': palette.bg0,
            'sideBar.dropBackground': palette.bg1,
            'sideBarTitle.foreground': `${palette.grey1}FF`,
            'sideBarSectionHeader.background': palette.bg4,
            'sideBarSectionHeader.foreground': `${palette.grey1}FF`,
            'sideBarSectionHeader.border': palette.bg0,
            // ---------------------------
            // Status Bar
            // ---------------------------
            'statusBar.background': palette.bg1,
            'statusBar.foreground': palette.grey2,
            'statusBar.border': palette.bg0,
            'statusBar.debuggingBackground': `${palette.red}`,
            'statusBar.debuggingForeground': palette.bg,
            'statusBar.debuggingBorder': `${palette.red}`,
            'statusBar.noFolderForeground': palette.grey1,
            'statusBar.noFolderBackground': palette.bg1,
            'statusBar.noFolderBorder': palette.bg1,
            'statusBarItem.activeBackground': `${palette.bg4}a0`,
            'statusBarItem.hoverBackground': palette.bg2,
            'statusBarItem.prominentBackground': `${palette.grey2}`,
            'statusBarItem.prominentHoverBackground': `${palette.grey1}`,
            // ---------------------------
            // Button
            // ---------------------------
            'button.background': `${palette.grey2}`,
            'button.foreground': palette.bg,
            'button.hoverBackground': `${palette.grey1}`,
            // ---------------------------
            // Dropdown
            // ---------------------------
            'dropdown.background': `${palette.bg4}`,
            'dropdown.border': `${palette.bg4}`,
            'dropdown.foreground': palette.grey1,
            // ---------------------------
            // Editor Marker Navigation
            // ---------------------------
            'editorMarkerNavigation.background': `${palette.bg2}`,
            'editorMarkerNavigationError.background': `${palette.red}FF`,
            'editorMarkerNavigationWarning.background': `${palette.yellow}`,
            'editorMarkerNavigationInfo.background': `${palette.aqua}`,
            // ---------------------------
            // Errors and warnings
            // ---------------------------
            'editorError.border': palette.bg,
            'editorError.foreground': `${palette.red}FF`,
            'editorWarning.border': palette.bg,
            'editorWarning.foreground': palette.orange,
            'editorInfo.border': palette.bg,
            'editorInfo.foreground': palette.yellow,
            'editorHint.border': palette.bg,
            'editorHint.foreground': `${palette.blue}FF`,
            // ---------------------------
            // Editor Groups and Tabs
            // ---------------------------
            'editorGroup.emptyBackground': palette.bg,
            'editorGroup.border': palette.bg0,
            'editorGroup.dropBackground': `${palette.bg5}60`,
            // ---------------------------
            // Editor Group Header
            // ---------------------------
            'editorGroupHeader.noTabsBackground': palette.bg2,
            'editorGroupHeader.tabsBackground': palette.bg2,
            'editorGroupHeader.tabsBorder': palette.bg2,
            // ---------------------------
            // Editor Tabs
            // ---------------------------
            'tab.activeBackground': palette.bg,
            'tab.unfocusedActiveBackground': palette.bg,
            'tab.activeForeground': palette.yellow,
            'tab.border': palette.bg2,
            'tab.inactiveBackground': palette.bg2,
            'tab.inactiveForeground': palette.grey1,
            'tab.unfocusedActiveForeground': palette.grey1,
            'tab.unfocusedInactiveForeground': palette.grey1,
            'tab.activeBorderTop': palette.yellow,
            'tab.activeModifiedBorder': `${palette.blue}FF`,
            'tab.activeBorder': palette.bg,
            'tab.unfocusedActiveBorder': palette.bg,
            'tab.unfocusedHoverBackground': `${palette.bg9}21`,
            // ---------------------------
            // Text Colors
            // ---------------------------
            'textBlockQuote.background': palette.bg1,
            'textBlockQuote.border': `${palette.grey2}`,
            'textCodeBlock.background': palette.bg1,
            'textLink.activeForeground': palette.blue,
            'textLink.foreground': palette.blue,
            'textPreformat.foreground': palette.yellow,
            'textSeparator.foreground': palette.bg1,
            // ---------------------------
            // Welcome Page
            // ---------------------------
            'walkThrough.embeddedEditorBackground': palette.bg1,
            'welcomePage.buttonBackground': palette.bg1,
            'welcomePage.buttonHoverBackground': `${palette.bg2}a0`,
            // ---------------------------
            // Input Control
            // ---------------------------
            'input.background': `${palette.bg}80`,
            'input.border': `${palette.bg4}`,
            'input.foreground': `${palette.fg}`,
            'input.placeholderForeground': palette.grey1,
            'inputOption.activeBorder': palette.grey0,
            'inputValidation.errorBorder': `${palette.red}`,
            'inputValidation.errorBackground': `${palette.darkRed}`,
            'inputValidation.errorForeground': `${palette.fg}`,
            'inputValidation.infoBorder': `${palette.blue}`,
            'inputValidation.infoBackground': `${palette.darkBlue}`,
            'inputValidation.infoForeground': `${palette.fg}`,
            'inputValidation.warningBorder': `${palette.yellow}`,
            'inputValidation.warningBackground': `${palette.darkYellow}`,
            'inputValidation.warningForeground': `${palette.fg}`,
            // ---------------------------
            // Editor Widgets
            // ---------------------------
            'editorWidget.background': `${palette.bg4}`,
            'editorWidget.border': palette.bg0,
            'editorHoverWidget.background': `${palette.bg4}`,
            'editorHoverWidget.border': palette.bg0,
            'editorSuggestWidget.background': `${palette.bg4}`,
            'editorSuggestWidget.border': palette.bg0,
            'editorSuggestWidget.foreground': palette.grey1,
            'editorSuggestWidget.highlightForeground': palette.yellow,
            'editorSuggestWidget.selectedBackground': `${palette.bg5}`,
            // ---------------------------
            // Gutter
            // ---------------------------
            'editorGutter.background': palette.bg,
            'editorGutter.addedBackground': `${palette.darkGreen}a0`,
            'editorGutter.deletedBackground': `${palette.red}FF`,
            'editorGutter.modifiedBackground': `${palette.darkBlue}a0`,
            'editorGutter.commentRangeForeground': palette.grey0,
            // ---------------------------
            // Selection Colors
            // ---------------------------
            'editor.selectionBackground': selectionBg,
            'editor.selectionHighlightBackground': `${palette.bg7}78`,
            'editor.inactiveSelectionBackground': `${palette.fg}55`,
            'editor.wordHighlightStrongBackground': `${palette.darkAqua}30`,
            'editor.wordHighlightBackground': `${palette.bg4}b0`,
            'editor.findMatchBackground': `${palette.darkRed}40`,
            'editor.findMatchHighlightBackground': `${palette.darkAqua}40`,
            'editor.findRangeHighlightBackground': `${palette.darkPurple}40`,
            'editor.hoverHighlightBackground': `${palette.bg9}3f`,
            'editor.lineHighlightBackground': `${palette.bg3}80`,
            'editor.lineHighlightBorder': palette.bg4,
            'editor.rangeHighlightBackground': `${palette.darkBlue}30`,
            'editorLink.activeForeground': `${palette.green}`,
            'editorWhitespace.foreground': `${palette.bg8}`,
            'editorIndentGuide.background': `${palette.bg4}FF`,
            'editorIndentGuide.activeBackground': `${palette.bg7}FF`,
            'editorBracketMatch.background': `${palette.bg9}22`,
            'editorBracketMatch.border': palette.grey0,
            'editorRuler.foreground': `${palette.darkPurple}`,
            // ---------------------------
            // Code Lens
            // ---------------------------
            'editorCodeLens.foreground': `${palette.grey1}`,
            // ---------------------------
            // Integrated Terminal Colors
            // ---------------------------
            'terminal.ansiBlack': type === 'dark' ? `${palette.bg2}` : `${palette.fg0}`,
            'terminal.ansiRed': (_a = palette.neutralRed) !== null && _a !== void 0 ? _a : `${palette.red}`,
            'terminal.ansiGreen': (_b = palette.neutralGreen) !== null && _b !== void 0 ? _b : `${palette.green}`,
            'terminal.ansiYellow': (_c = palette.neutralYellow) !== null && _c !== void 0 ? _c : `${palette.yellow}`,
            'terminal.ansiBlue': (_d = palette.neutralBlue) !== null && _d !== void 0 ? _d : `${palette.blue}`,
            'terminal.ansiMagenta': (_e = palette.neutralPurple) !== null && _e !== void 0 ? _e : `${palette.purple}`,
            'terminal.ansiCyan': (_f = palette.neutralAqua) !== null && _f !== void 0 ? _f : `${palette.aqua}`,
            'terminal.ansiWhite': type === 'dark' ? `${palette.fg}` : `${palette.grey1}`,
            'terminal.ansiBrightBlack': type === 'dark' ? `${palette.grey1}` : `${palette.fg}`,
            'terminal.ansiBrightRed': `${palette.red}`,
            'terminal.ansiBrightGreen': `${palette.green}`,
            'terminal.ansiBrightYellow': `${palette.yellow}`,
            'terminal.ansiBrightBlue': `${palette.blue}`,
            'terminal.ansiBrightMagenta': `${palette.purple}`,
            'terminal.ansiBrightCyan': `${palette.aqua}`,
            'terminal.ansiBrightWhite': type === 'dark' ? `${palette.fg0}` : `${palette.bg2}`,
            'terminal.background': palette.bg,
            'terminal.foreground': palette.fg,
            'terminalCursor.background': palette.bg,
            'terminalCursor.foreground': palette.fg,
            // ---------------------------
            // Merge Conflicts
            // ---------------------------
            'merge.border': `${palette.bg}80`,
            'merge.currentContentBackground': `${palette.darkBlue}40`,
            'merge.currentHeaderBackground': `${palette.darkBlue}80`,
            'merge.incomingContentBackground': `${palette.darkAqua}40`,
            'merge.incomingHeaderBackground': `${palette.darkAqua}80`,
            'merge.commonContentBackground': `${palette.darkAqua}40`,
            'merge.commonHeaderBackground': `${palette.grey1}`,
            'editorOverviewRuler.currentContentForeground': `${palette.darkBlue}`,
            'editorOverviewRuler.incomingContentForeground': `${palette.darkAqua}80`,
            'editorOverviewRuler.commonContentForeground': `${palette.grey1}`,
            'editorOverviewRuler.border': palette.bg,
            // ---------------------------
            // Notification Colors
            // ---------------------------
            'notificationCenter.border': `${palette.bg4}`,
            'notificationCenterHeader.foreground': palette.grey1,
            'notificationCenterHeader.background': `${palette.bg4}`,
            'notificationToast.border': `${palette.bg4}`,
            'notifications.foreground': `${palette.fg}`,
            'notifications.background': `${palette.bg4}`,
            'notifications.border': `${palette.bg4}`,
            'notificationLink.foreground': palette.grey1,
            // ---------------------------
            // Diff
            // ---------------------------
            'diffEditor.insertedTextBackground': `${palette.darkAqua}26`,
            'diffEditor.removedTextBackground': `${palette.darkRed}21`,
            // ---------------------------
            // Debug
            // ---------------------------
            'debugToolBar.background': palette.bg1,
            'debugExceptionWidget.background': palette.bg1,
            'debugExceptionWidget.border': palette.bg,
            // ---------------------------
            // Extensions
            // ---------------------------
            'extensionButton.prominentForeground': palette.bg,
            'extensionButton.prominentBackground': `${palette.grey2}`,
            'extensionButton.prominentHoverBackground': `${palette.grey1}`,
            focusBorder: `${palette.bg4}`,
            foreground: palette.fg,
            // ---------------------------
            // Panel
            // ---------------------------
            'panel.background': palette.bg,
            'panel.border': `${palette.bg0}`,
            'panelTitle.activeBorder': `${palette.grey1}`,
            'panelTitle.activeForeground': palette.yellow,
            'panelTitle.inactiveForeground': palette.grey1,
            // ---------------------------
            // Peek View Colors
            // ---------------------------
            'peekView.border': palette.grey0,
            'peekViewEditor.background': `${palette.bg2}`,
            'peekViewEditor.matchHighlightBackground': `${palette.darkYellow}50`,
            'peekViewEditor.matchHighlightBorder': palette.grey0,
            'peekViewEditorGutter.background': `${palette.bg2}`,
            'peekViewResult.background': palette.bg1,
            'peekViewResult.fileForeground': `${palette.fg}`,
            'peekViewResult.lineForeground': palette.grey1,
            'peekViewResult.matchHighlightBackground': `${palette.bg4}`,
            'peekViewResult.selectionBackground': `${palette.bg4}`,
            'peekViewResult.selectionForeground': palette.grey1,
            'peekViewTitle.background': palette.bg1,
            'peekViewTitleDescription.foreground': palette.grey1,
            'peekViewTitleLabel.foreground': `${palette.fg}`,
            // ---------------------------
            // Progress Bar
            // ---------------------------
            'progressBar.background': palette.yellow,
            // ---------------------------
            // Scroll Bar
            // ---------------------------
            'scrollbar.shadow': '#00000044',
            'scrollbarSlider.activeBackground': `${palette.bg9}ad`,
            'scrollbarSlider.background': `${palette.bg9}80`,
            'scrollbarSlider.hoverBackground': `${palette.bg9}62`,
            // ---------------------------
            // Git status colors in File Explorer
            // ---------------------------
            'gitDecoration.addedResourceForeground': `${palette.green}`,
            'gitDecoration.modifiedResourceForeground': `${palette.blue}`,
            'gitDecoration.deletedResourceForeground': `${palette.red}`,
            'gitDecoration.untrackedResourceForeground': palette.yellow,
            'gitDecoration.ignoredResourceForeground': `${palette.grey2}`,
            'gitDecoration.conflictingResourceForeground': `${palette.purple}a0`,
            'gitDecoration.submoduleResourceForeground': `${palette.orange}a0`,
            // ---------------------------
            // Quick Picker
            // ---------------------------
            'pickerGroup.border': `${palette.fg0}1a`,
            'pickerGroup.foreground': palette.grey0,
            // ---------------------------
            // Lists and Trees
            // ---------------------------
            'list.activeSelectionBackground': `${palette.bg}99`,
            'list.activeSelectionForeground': `${palette.fg0}`,
            'list.dropBackground': `${palette.bg2}80`,
            'list.focusBackground': `${palette.bg}80`,
            'list.focusForeground': `${palette.fg0}`,
            'list.highlightForeground': palette.yellow,
            'list.hoverBackground': `${palette.bg2}99`,
            'list.hoverForeground': `${palette.fg0}`,
            'list.inactiveFocusBackground': `${palette.bg3}80`,
            'list.inactiveSelectionBackground': `${palette.bg3}80`,
            'list.inactiveSelectionForeground': `${palette.grey2}`,
            'list.errorForeground': `${palette.red}`,
            'list.warningForeground': `${palette.yellow}`,
            'listFilterWidget.background': `${palette.bg}80`,
            'listFilterWidget.outline': `${palette.blue}FF`,
            'listFilterWidget.noMatchesOutline': `${palette.red}FF`,
            'tree.indentGuidesStroke': `${palette.grey0}`,
            // ---------------------------
            // Settings Editor Colors
            // ---------------------------
            'settings.headerForeground': palette.fg,
            'settings.modifiedItemIndicator': palette.green,
            'settings.dropdownListBorder': `${palette.fg}88`,
            'settings.dropdownBackground': `${palette.bg4}`,
            'settings.dropdownForeground': `${palette.aqua}`,
            'settings.dropdownBorder': `${palette.bg4}`,
            'settings.checkboxBackground': `${palette.bg4}`,
            'settings.checkboxForeground': `${palette.orange}`,
            'settings.checkboxBorder': `${palette.bg4}`,
            'settings.textInputBackground': `${palette.bg4}`,
            'settings.textInputForeground': `${palette.blue}`,
            'settings.textInputBorder': `${palette.bg4}`,
            'settings.numberInputBackground': palette.bg1,
            'settings.numberInputForeground': `${palette.purple}`,
            'settings.numberInputBorder': palette.bg1,
            // ---------------------------
            // Breadcrumbs
            // ---------------------------
            'breadcrumb.foreground': palette.grey1,
            'breadcrumb.background': palette.bg,
            'breadcrumb.focusForeground': palette.yellow,
            'breadcrumb.activeSelectionForeground': `${palette.fg}`,
            'breadcrumbPicker.background': `${palette.bg4}`,
            // ---------------------------
            // Title bar
            // Note: These colors are currently only supported on macOS.
            // ---------------------------
            'titleBar.activeBackground': palette.bg1,
            'titleBar.activeForeground': palette.fg,
            'titleBar.inactiveBackground': palette.bg1,
            'titleBar.inactiveForeground': palette.grey1,
            // ---------------------------
            // Custom title bar and menus
            // Note: These colors are currently only supported on Windows and Linux.
            // ---------------------------
            'menu.background': `${palette.bg4}`,
            'menu.foreground': palette.grey1,
            'menu.selectionBackground': `${palette.bg2}`,
            'menu.selectionForeground': palette.yellow,
            'menu.selectionBorder': `${palette.bg}`,
            'menu.separatorBackground': palette.yellow,
            'menubar.selectionBackground': `${palette.bg}`,
            'menubar.selectionForeground': palette.yellow,
            'menubar.selectionBorder': `${palette.bg}`,
            // ---------------------------
            // Snippets
            // ---------------------------
            'editor.snippetTabstopHighlightBackground': `${palette.bg5}a0`,
            'editor.snippetTabstopHighlightBorder': `${palette.bg}`,
            'editor.snippetFinalTabstopHighlightBackground': `${palette.darkGreen}40`,
            'editor.snippetFinalTabstopHighlightBorder': `${palette.bg}`,
            // ---------------------------
            // Minimap
            // ---------------------------
            'minimap.findMatchHighlight': `${palette.darkAqua}CC`,
            'minimap.errorHighlight': `${palette.darkRed}80`,
            'minimap.warningHighlight': `${palette.darkYellow}80`,
            'minimapGutter.addedBackground': `${palette.darkGreen}a0`,
            'minimapGutter.modifiedBackground': `${palette.darkBlue}a0`,
            'minimapGutter.deletedBackground': `${palette.darkRed}a0`,
            'minimap.backround': `${palette.bg}99`
        },
        tokenColors
    };
}
exports.default = default_1;
//# sourceMappingURL=workbenchSyntax.js.map