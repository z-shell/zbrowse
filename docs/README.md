<!-- markdownlint-disable MD041 -->
<div align="center"><table style="width:100%;height:auto">
 <tr align="justify" margin-left="auto" margin-right="auto"><td align="center">
  <h1>
  <a href="https://github.com/z-shell/zi">
    <img src="https://github.com/z-shell/zi/raw/main/docs/images/logo.svg" alt="Logo" width="80" height="80" />
  </a>
  ❮ ZI ❯ Plugin - Zbrowse
  </h1>
<h3>
  <a href="https://github.com/orgs/z-shell/discussions/">《❔》Ask a Question </a>
  <a href="https://z.digitalclouds.dev/search/">《💡》Search Wiki </a>
  <a href="https://github.com/z-shell/community/issues/new?assignees=&labels=%F0%9F%91%A5+member&template=membership.yml&title=team%3A+">《💜》Join </a>
  <a href="https://digitalclouds.crowdin.com/z-shell/">《🌐》Localize </a>
</h3>
</td></tr>
<tr><td align="center"><p>
  <a title="Crowdin" target="_self" href="https://crowdin.digitalclouds.dev/z-shell">
    <img align="center" src="https://badges.crowdin.net/e/f108c12713ee8526ac878d5671ad6e29/localized.svg" />
  </a>
  <a title="License GPL-3.0" target="_self" href="https://www.gnu.org/licenses/gpl-3.0/">
    <img align="center" src="https://img.shields.io/badge/License-GPL%20v3-blue.svg" alt="Project License" />
  </a>
  <a title="VIM" target="_self" href="https://github.com/z-shell/zi-vim-syntax/">
    <img align="center" src="https://img.shields.io/badge/--019733?logo=vim" alt="VIM" />
  </a>
  <a title="ZBrowse" target="_self" href="https://open.vscode.dev/z-shell/zbrowse/">
    <img
      align="center"
      src="https://img.shields.io/badge/--007ACC?logo=visual%20studio%20code&logoColor=ffffff"
      alt="Visual Studio Code"
    />
  </a></p>
  <p>
    <a href="https://asciinema.org/a/122018" target="_blank">
      <img align="center" src="https://asciinema.org/a/122018.svg" width="100%" heigh="auto" />
    </a>
  </p><p>
    <img align="center" src="https://github.com/z-shell/zbrowse/raw/main/docs/images/zbrowse.png" width="100%" heigh="auto" />
  </p>
</td></tr><tr><td align="left"><br />

When doing shell work, it is often the case that `echo $variable` is invoked multiple times, to check result of a loop, etc. 

With ZBrowse, you just need to press `Ctrl-B`, which invokes the `ZBrowse` – `Zshell` variable browser.

## Installation

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

### [ZI](https://github.com/z-shell/zi)

Add `zi load z-shell/zbrowse` to your `.zshrc` file. ZI will handle
cloning the plugin for you automatically the next time you start zsh. To update
run `zi update z-shell/zbrowse` (`update-all` can also be used).

### Antigen

Add `antigen bundle z-shell/zbrowse` to your `.zshrc` file. Antigen will handle
cloning the plugin for you automatically the next time you start zsh.

### Oh-My-Zsh

1. `cd ~/.oh-my-zsh/custom/plugins`
2. `git clone git@github.com:z-shell/zbrowse.git`
3. Add `zbrowse` to your plugin list

### Zgen

Add `zgen load z-shell/zbrowse` to your .zshrc file in the same place you're doing
your other `zgen load` calls.

</td></tr><tr><td align="center"><h2 align="left">Credits</h2>
 <a href="https://trunk.io" rel="nofollow">
  <img style="width:140;height:40px" src="https://storage.googleapis.com/digital-space/img/brand/trunk/trunk-white.svg" alt="Trunk" />
 </a>
 <a href="https://crowdin.com/?utm_source=badge&utm_medium=referral&utm_campaign=badge-add-on" rel="nofollow">
  <img style="width:140;height:40px" src="https://space.ss-o.workers.dev/img/brand/crowdin/localization-at-dark-rounded@2x.png" srcset="https://badges.crowdin.net/badge/light/crowdin-on-dark.png 1x,https://badges.crowdin.net/badge/light/crowdin-on-dark@2x.png 2x"alt="Crowdin | Agile localization for tech companies" />
 </a>
 <a href="https://www.digitalocean.com/?refcode=090bdb63f800&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge" rel="nofollow">
  <img style="width:140;height:40px" src="https://web-platforms.sfo2.digitaloceanspaces.com/WWW/Badge%203.svg" alt="DigitalOcean Referral Badge" />
 </a>
  <a href="https://cloudflare.com" rel="nofollow">
    <img style="width:140;height:40px" src="https://storage.googleapis.com/digital-space/img/brand/cloudflare/cf-logo-v-rgb.png" alt="Cloudflare" />
  </a>
 </td></tr></table></div>
