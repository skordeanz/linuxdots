<div align="center">
<pre>
╭──────────────────────────────────╮
│                                  │
│        l i n u x d o t s         │
│                                  │
╰──────────────────────────────────╯
</pre>
</div>

## Install

```sh
git clone https://github.com/skordeanz/linuxdots.git ~/.linuxdots
cd ~/.linuxdots
git submodule update --init --recursive   # plugins
stow -t ~ */                              # everything
```

<sub>On an empty <code>$HOME</code>, install a subset with <code>--no-folding</code> so stow doesn't turn <code>~/.config</code> itself into a symlink: <code>stow -t ~ --no-folding hypr nvim</code></sub>
