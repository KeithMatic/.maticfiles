return {
  "CRAG666/code_runner.nvim",
  config = true,
  filetype = {
    python = "python3 -u",
    typescript = "deno run",
    typescriptreact = "deno run",
    javascript = "node",
    javascriptreact = "node",
    go = "go run",
    cpp = "g++ -std=c++17 -o %:r %",
    c = "gcc -o %:r %",
    lua = "lua %",
    bash = "bash %",
    zsh = "zsh %",
    fish = "fish %",
    java = "javac % && java %:r",
  --   rust = { "cd $dir &&",
  --   "rustc $fileName &&",
  --   "$dir/$fileNameWithoutExt"
  -- },
  rust = {"cd $dir && cargo run -q $fileName"},
    -- // rust = "cd $dir && rustc $fileName && $dir$fileNameWithoutExt",
    sass = "sass --style expanded",
    scss = "scss --style expanded",
    mojo = "mojo run"
  }
}
