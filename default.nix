{ pkgs, lib, ... }:
{
  appName = "nvim";
  enable = true;
  
  initLua = ''
    require("pyricConf")
  '';

  extraBinPath = with pkgs; [
    git
    ripgrep
    fd
    wl-clipboard
    xclip
  ];

  plugins = {
    start = with pkgs.vimPlugins; [
      ayu-vim

      gitsigns-nvim
      nvim-lspconfig
      nvim-tree-lua
      blink-cmp
      telescope-nvim
      plenary-nvim
      which-key-nvim
      indent-blankline-nvim
      nvim-autopairs

      (nvim-treesitter.withPlugins (p: with p; [
        lua
        nix
        typescript
        javascript
        html
        css
        json
        markdown
        bash
        python
        c
        cpp
        rust
        qmljs
      ]))
    ];
    dev.pyricConf = {
      pure = ./nvim;
      impure = "";
    };
  };
}
