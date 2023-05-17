"use strict";
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// src/index.ts
var src_exports = {};
__export(src_exports, {
  activate: () => activate,
  deactivate: () => deactivate
});
module.exports = __toCommonJS(src_exports);
var import_vscode3 = require("vscode");

// src/utils/configuration.ts
var import_vscode = require("vscode");
var Configuration = class {
  configuration;
  constructor() {
    this.configuration = import_vscode.workspace.getConfiguration("tailwindcss-highlight");
  }
  get languages() {
    return this.configuration.get("languages") ?? [];
  }
  get configs() {
    const variants = this.configuration.get("variants") ?? {};
    const configs = this.configuration.get("configs") ?? {};
    return {
      ...configs,
      ...Object.entries(variants).reduce((acc, [key, value]) => {
        acc[`variants:${key}`] = {
          enable: value.enable ?? true,
          options: {
            color: value.color
          },
          regex: `(?<=[:\`'"\\s])(${value.variants.join("|")}):`
        };
        return acc;
      }, {})
    };
  }
};

// src/utils/decoration.ts
var import_vscode2 = require("vscode");

// src/utils/utils.ts
function getClassNames(targetText) {
  const arr = [];
  const regexes = [
    /(?:\b(?:class(?:Name)?|tw)\s*=\s*(?:(?:{([^>}]+)})|(["'`][^"'`]+["'`])))/,
    /(?:(clsx|classnames)\()([^)]+)\)/
  ];
  const regex = new RegExp(regexes.map((r) => r.source).join("|"), "gm");
  const classNameMatches = targetText.matchAll(regex);
  for (const classNameMatch of classNameMatches) {
    const stringMatches = classNameMatch[0].matchAll(
      /(?:["'`]([\s\S.:/${}()[\]"']+)["'`])/g
    );
    for (const stringMatch of stringMatches) {
      if (classNameMatch.index != null && stringMatch.index != null) {
        arr.push({
          start: classNameMatch.index + stringMatch.index,
          value: stringMatch[0]
        });
      }
    }
  }
  return arr;
}
function getUtility(targetText, regex) {
  const arr = [];
  const matches = targetText.matchAll(regex);
  for (const match of matches) {
    if (match.index != null) {
      arr.push({
        start: match.index,
        end: match.index + match[0].length,
        value: match[0]
      });
    }
  }
  return arr;
}

// src/utils/decoration.ts
var Decoration = class {
  timer;
  configuration;
  decorators;
  options = {
    backgroundColor: "",
    borderStyle: "dashed",
    borderWidth: "0 0 1px 0"
  };
  enable = true;
  constructor(configuration) {
    this.timer = void 0;
    this.configuration = configuration;
    this.decorators = Object.entries(configuration.configs).filter((config) => config[1].enable ?? this.enable).sort((a) => {
      if (a[0].startsWith("variants:") && !["variants:other", "variants:responsive"].includes(a[0])) {
        return -1;
      }
      return 0;
    }).map((config) => {
      return {
        regex: config[1].regex,
        decorator: import_vscode2.window.createTextEditorDecorationType(
          config[1].options ?? this.options
        )
      };
    });
  }
  decorate(editor) {
    if (editor == null)
      return;
    const document = editor.document;
    const text = document.getText();
    const classNames = getClassNames(text);
    this.decorators.forEach((decorator) => {
      const regex = new RegExp(decorator.regex, "g");
      const chars = [];
      classNames.forEach((className) => {
        const utilities = getUtility(className.value, regex);
        utilities.forEach((utility) => {
          const start = document.positionAt(className.start + utility.start);
          const end = document.positionAt(className.start + utility.end);
          const range = new import_vscode2.Range(start, end);
          chars.push({ range });
        });
        editor.setDecorations(decorator.decorator, chars);
      });
    });
  }
  update(configuration) {
    if (configuration != null) {
      this.configuration = configuration;
      this.decorators = Object.entries(configuration.configs).filter((config) => config[1].enable ?? this.enable).map((config) => {
        return {
          regex: config[1].regex,
          decorator: import_vscode2.window.createTextEditorDecorationType(
            config[1].options ?? this.options
          )
        };
      });
    }
    const editor = import_vscode2.window.activeTextEditor;
    if (editor == null)
      return;
    const languageId = editor.document.languageId;
    if (!this.configuration.languages.includes(languageId))
      return;
    if (this.timer != null) {
      clearTimeout(this.timer);
      this.timer = void 0;
    }
    this.timer = setTimeout(() => {
      this.decorate(editor);
    }, 20);
  }
  dispose() {
    this.decorators.forEach((decorator) => {
      decorator.decorator.dispose();
    });
  }
};

// src/index.ts
async function activate(context) {
  const configuration = new Configuration();
  const decoration = new Decoration(configuration);
  decoration.update();
  import_vscode3.window.onDidChangeActiveTextEditor(
    () => {
      decoration.update();
    },
    null,
    context.subscriptions
  );
  import_vscode3.workspace.onDidChangeTextDocument(
    () => {
      decoration.update();
    },
    null,
    context.subscriptions
  );
  import_vscode3.workspace.onDidChangeConfiguration(
    () => {
      const configuration2 = new Configuration();
      decoration.update(configuration2);
    },
    null,
    context.subscriptions
  );
}
async function deactivate() {
  const configuration = new Configuration();
  const decoration = new Decoration(configuration);
  decoration.dispose();
}
// Annotate the CommonJS export names for ESM import in node:
0 && (module.exports = {
  activate,
  deactivate
});
