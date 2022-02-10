<h2 align="center">
  <a href="https://github.com/z-shell/zi">
    <img src="https://github.com/z-shell/zi/raw/main/docs/images/logo.svg" alt="Logo" width="80" height="80" />
  </a>
❮ ZI ❯ Plugin - ZBrowse
</h2>

- [Introduction](#introduction)
- [Installation](#installation)
  - [ZI](#zi)
  - [Antigen](#antigen)
  - [Oh-My-Zsh](#oh-my-zsh)
  - [Zgen](#zgen)

# Introduction

When doing shell work, it is often the case that `echo $variable` is invoked multiple times,
to check result of a loop, etc. With ZBrowse, you just need to press `Ctrl-B`, which invokes the `ZBrowse` – `Zshell`
variable browser:

![ZBrowse](https://github.com/z-shell/zbrowse/edit/main/docs/images/zbrowse.png)

(you can resize the video like any web page)

[![asciicast](https://asciinema.org/a/122018.png)](https://asciinema.org/a/122018)

# Installation

First install the [ZUI](https://github.com/z-shell/zui) plugin (it's an UI library).

**The plugin is "standalone"**, which means that only sourcing it is needed. So to
install, unpack `zbrowse` somewhere and add

```zsh
source {where-zbrowse-is}/zbrowse.plugin.zsh
```

to `zshrc`.

If using a plugin manager, then `ZI` is recommended, but you can use any
other too, and also install with `Oh My Zsh` (by copying directory to
`~/.oh-my-zsh/custom/plugins`).

## [ZI](https://github.com/z-shell/zi)

Add `zi load z-shell/zbrowse` to your `.zshrc` file. ZI will handle
cloning the plugin for you automatically the next time you start zsh. To update
run `zi update z-shell/zbrowse` (`update-all` can also be used).

## Antigen

Add `antigen bundle z-shell/zbrowse` to your `.zshrc` file. Antigen will handle
cloning the plugin for you automatically the next time you start zsh.

## Oh-My-Zsh

1. `cd ~/.oh-my-zsh/custom/plugins`
2. `git clone git@github.com:z-shell/zbrowse.git`
3. Add `zbrowse` to your plugin list

## Zgen

Add `zgen load z-shell/zbrowse` to your .zshrc file in the same place you're doing
your other `zgen load` calls.
