<p align="center">
  <img src="https://img.shields.io/badge/Neovim-0.9%2B-brightgreen?style=for-the-badge&logo=neovim&logoColor=brightgreen" alt="Neovim 0.9+">
  <img src="https://img.shields.io/badge/License-MIT-red?style=for-the-badge&logo=open-source-initiative&logoColor=red" alt="License: MIT">
  <img src="https://img.shields.io/badge/Blood-Powered-ff0000?style=for-the-badge" alt="Blood Powered">
</p>

<h1 align="center">🩸 BloodRed Neovim 🩸</h1>

# 🩸 BloodRed Neovim

A truly living Neovim configuration:  
**Modular. Fast. Bloody. Alive.**

BloodRed is a hyper-charged Neovim setup featuring:

- 🔥 Lightning fast startup
- 🧛 Dynamic blood-themed animations (BloodRain, BloodStorm, BloodMoon)
- ⚡ Lazy-loaded plugins
- 🎯 Telescope, Treesitter, Mason, LSP, Debugging (DAP), Alpha dashboard
- 🩸 Full BloodRed color theming and random quotes
- 🌑 Auto switch to BloodMoon mode at night
- 🩸 Real animated BloodRain falling on dashboard <-- needs some work still

Welcome to the ultimate dark coder's Neovim.

---

# 🩸 BloodRed Neovim - Dependencies

Before you start up BloodRed Neovim, install these critical tools:  
(*Tested on macOS and Linux. Windows? 🦇 Stay in the shadows.*)

## 🔥 Essential Tools (Install First)

| Tool         | Purpose                           | Install Command (macOS)                           | Install Command (Linux)                |
|:-------------|:----------------------------------|:--------------------------------------------------|:---------------------------------------|
| ripgrep      | live grep search (Telescope)      | `brew install ripgrep`                            | `sudo apt install ripgrep`             |
| fd           | file search acceleration          | `brew install fd`                                 | `sudo apt install fd-find`             |
| nodejs + npm | required for some LSP servers     | `brew install node`                               | `sudo apt install nodejs npm`          |
| python3      | required for plugins              | `brew install python`                             | `sudo apt install python3 python3-pip` |
| ruby         | required for ruby neovim provider | (pre-installed) or `brew install ruby`            | `sudo apt install ruby`                |

---

## 🔥 Blood Modules (Global npm/gem/pip installs)

| Tool                     | Purpose                            | Install Command           |
|:-------------------------|:-----------------------------------|:--------------------------|
| neovim (Node provider)   | Enable node support                | `npm install -g neovim`   |
| neovim (Python provider) | Enable python support              | `pip install neovim`      |
| neovim (Ruby provider)   | Enable ruby support                | `gem install neovim`      |
| prettier                 | Code formatter for JS, TS, etc.    | `npm install -g prettier` |
| eslint                   | JS/TS linter                       | `npm install -g eslint`   |
| black                    | Python code formatter              | `pip install black`       |
| debugpy                  | Python debugger (DAP adapter)      | `pip install debugpy`     |

---

## 🧛 Final Summoning Steps

1. Install everything above ✅
2. Clone BloodRed Neovim repo:
   ```bash
   git clone https://github.com/yourusername/bloodred-nvim.git ~/.config/nvim
