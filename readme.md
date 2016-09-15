# Writer for Vim
### Opinionated writing settings for Vim with Markdown preview

This are my collected and preferred setting for writing in Vim tucked away in
a single plugin.

## Installation

The best way to install is with a plugin manager like [Vundle](https://github.com/gmarik/Vundle.vim) or [Pathogen](https://github.com/tpope/vim-pathogen).

### Vundle:

```vim
" Add to .vimrc
Plugin 'nathanlong/vim-writer'
```

### Pathogen:
```bash
git clone https://github.com/nathanlong/vim-writer.git ~/.vim/bundle/writer
```

## Default Commands

I've built some simple commands into the plugin, all of these can be remapped:

| Command | Map | Description |
|:------- |:--- |:----------- |
| :Writer | `<leader>wr` | Toggles writer on and off in fullscreen mode. |
| :WriterWrap | `<leader>wp` | Toggle between hard and soft text wrapping. |
| :WriterPreview | `<leader>wp` | Generates a Markdown preview. |

Example remapping:

```vim
nnoremap <D-R> :Writer<CR>
```
