<table align="center">
 <tr align="justify" margin-left="auto" margin-right="auto"><td align="center">
  <h1 align="center">
  <a href="https://github.com/z-shell/zi">
    <img src="https://github.com/z-shell/zi/raw/main/docs/images/logo.svg" alt="Logo" width="80px" height="80px" />
  </a>
  ❮ ZI ❯ Plugin - Zbrowse
  </h1>
<h3 align="center">
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

<p>When doing shell work, it is often the case that <code>echo $variable</code> is invoked multiple times, to check the result of a loop, etc.</p>
<p>With ZBrowse, you just need to press <code>Ctrl-B</code>, which invokes the <code>ZBrowse</code> – <code>Zshell</code> variable browser.</p>
<h2 id="installation">Installation</h2>
<p>First, install the <a href="https://github.com/z-shell/zui">ZUI</a> plugin (it&#39;s a UI library).</p>
<p><strong>The plugin is &quot;standalone&quot;</strong>, which means that only sourcing it is needed. So to
install, unpack <code>zbrowse</code> somewhere and add</p>
<pre><code class="lang-zsh">source {where-zbrowse-is}/zbrowse<span class="hljs-selector-class">.plugin</span><span class="hljs-selector-class">.zsh</span>
</code></pre>
<p>to <code>zshrc</code>.</p>
<p>If using a plugin manager, then <code>ZI</code> is recommended, but you can use any
other too, and also install with <code>Oh My Zsh</code> (by copying a directory to
<code>~/.oh-my-zsh/custom/plugins</code>).</p>
<h3 id="-zi-https-github-com-z-shell-zi-"><a href="https://github.com/z-shell/zi">ZI</a></h3>
<p>Add <code>zi load z-shell/zbrowse</code> to your <code>.zshrc</code> file. ZI will handle
cloning the plugin for you automatically the next time you start zsh. To update
run <code>zi update z-shell/zbrowse</code> (<code>update-all</code> can also be used).</p>
<h3 id="antigen">Antigen</h3>
<p>Add <code>antigen bundle z-shell/zbrowse</code> to your <code>.zshrc</code> file. Antigen will handle
cloning the plugin for you automatically the next time you start zsh.</p>
<h3 id="oh-my-zsh">Oh-My-Zsh</h3>
<ol>
<li><code>cd ~/.oh-my-zsh/custom/plugins</code></li>
<li><code>git clone git@github.com:z-shell/zbrowse.git</code></li>
<li>Add <code>zbrowse</code> to your plugin list</li>
</ol>
<h3 id="zgen">Zgen</h3>
<p>Add <code>zgen load z-shell/zbrowse</code> to your .zshrc file in the same place you&#39;re doing
your other <code>zgen load</code> calls.</p>

</td></tr><tr><td align="center"><h2 align="left">Credits</h2>
 <a href="https://trunk.io" rel="nofollow">
  <img style="width:140;height:40px" src="https://storage.googleapis.com/digital-space/img/brand/trunk/trunk-white.svg" alt="Trunk" />
 </a>
 <a href="https://crowdin.com/?utm_source=badge&utm_medium=referral&utm_campaign=badge-add-on" rel="nofollow">
  <img style="width:140px;height:40px" src="https://space.ss-o.workers.dev/img/brand/crowdin/localization-at-dark-rounded@2x.png" srcset="https://badges.crowdin.net/badge/light/crowdin-on-dark.png 1x,https://badges.crowdin.net/badge/light/crowdin-on-dark@2x.png 2x"alt="Crowdin | Agile localization for tech companies" />
 </a>
 <a href="https://www.digitalocean.com/?refcode=090bdb63f800&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge" rel="nofollow">
  <img style="width:140px;height:40px" src="https://web-platforms.sfo2.digitaloceanspaces.com/WWW/Badge%203.svg" alt="DigitalOcean Referral Badge" />
 </a>
  <a href="https://cloudflare.com" rel="nofollow">
    <img style="width:140px;height:40px" src="https://storage.googleapis.com/digital-space/img/brand/cloudflare/cf-logo-v-rgb.png" alt="Cloudflare" />
  </a>
 </td></tr></table>
