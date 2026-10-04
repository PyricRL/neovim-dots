{ pkgs, ... }:
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

    # formatters
    stylua
    nixfmt
    prettier
    shfmt
    black
    clang-tools
    rustfmt
    markdownlint-cli2

    # lsp servers
    lua-language-server
    rust-analyzer
    clang
    ccls
    qt6.qtdeclarative
    nixd
    typescript-language-server
    pyright
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
      flash-nvim
      conform-nvim
      trouble-nvim
      noice-nvim
      lualine-nvim
      oil-nvim
      mini-nvim
      nvim-notify

      (nvim-treesitter.withPlugins (
        p: with p; [
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
        ]
      ))
    ];
    dev.pyricConf = {
      pure = ./nvim;
      impure = "";
    };
  };
}
