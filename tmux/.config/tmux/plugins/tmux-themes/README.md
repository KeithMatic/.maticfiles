![Shellcheck](https://github.com/jeircul/tmux-themes/actions/workflows/shellcheck.yml/badge.svg)

# Tmux themes

## 📦 Installation via [TPM](https://github.com/tmux-plugins/tpm) (recommended)

1.  Add plugin to the list of TPM plugins in `.tmux.conf`:

    ``` tmux
    set -g @plugin 'jeircul/tmux-themes'
    ```
2.  Use <kbd>prefix</kbd>–<kbd>I</kbd> to install `tmux-themes`.
3.  When you want to update `tmux-themes` use <kbd>prefix</kbd>–<kbd>U</kbd>.

<details>
<summary>📦 Manual Installation</summary>

1. Clone the repo:

   ```sh
   git clone https://github.com/jeircul/tmux-themes ~/.config/tmux/plugins/
   ```
2. Add this line to the bottom of `.tmux.conf`:

   ```tmux
   run-shell ~/.config/tmux/plugins/tmux-themes/themes.tmux
   ```
3. Use <kbd>prefix</kbd>–<kbd>R</kbd> to Reload TMUX environment
</details>

## 🚀 Usage

Choose theme by adding one of the options to `.tmux.conf`:

### Default
- `set -g @tmux-statusline-theme 'tokyonight-night'`

### Other themes 
- `set -g @tmux-statusline-theme 'tokyonight-storm'`
- `set -g @tmux-statusline-theme 'tokyonight-moon'`
- `set -g @tmux-statusline-theme 'tokyonight-day'`
- `set -g @tmux-statusline-theme 'ayu-light'`
- `set -g @tmux-statusline-theme 'gruvbox-dark'`
- `set -g @tmux-statusline-theme 'solarized-light'`
- `set -g @tmux-statusline-theme 'solarized-dark'`
- `set -g @tmux-statusline-theme 'two-firewatch-dark'`

## ⚖ License

[MIT license](LICENSE)
