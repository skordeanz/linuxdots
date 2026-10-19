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

Machine with nothing cloned yet — one line:

```sh
curl -sL https://raw.githubusercontent.com/skordeanz/linuxdots/main/install.sh | bash
```

From a clone you already have:

```sh
git clone https://github.com/skordeanz/linuxdots.git ~/.linuxdots
cd ~/.linuxdots
./install.sh                 # every package
./install.sh <name>...       # only the packages you name
./install.sh --list          # package names
./install.sh --help          # usage
```

Re-running updates the repo and restows, so it's safe to run any time.

Packages: `bash` `bin` `foot` `git` `herdr` `hypr` `nvim` `omarchy` `starship` `tmux` `uwsm` `voxtype` `xcompose` `zed`
