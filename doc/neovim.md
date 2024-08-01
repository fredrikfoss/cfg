# Neovim

## Dependencies

```sh
sudo dnf install -y fswatch # file watcher (though not really required any longer)
sudo dnf install -y ripgrep # grep alternative
sudo dnf install -y fd-find # find alternative
```

## Install

```sh
dnf copr enable agriffis/neovim-nightly
dnf install -y neovim python3-neovim
```

## TODO

Maybe replace vim-matchup (related to nvim-treesitter).

When nvim-treesitter main branch becomes the default branch:

- nvim-treesitter branch main. Latest version of tree-sitter-cli, 0.22.6. As of now, Fedora installs 0.22.5, and the COPR doesn't install a newer version. Download binary directly from <https://github.com/tree-sitter/tree-sitter>.

- care.nvim: Completion plugin replacing cmp \
  <https://max397574.github.io/care.nvim>

- paq-nvim: Plugin manager \
  <https://github.com/savq/paq-nvim>

- lz.n: Lazy loading library \
  <https://github.com/nvim-neorocks/lz.n>

- mini.deps

- pckr
