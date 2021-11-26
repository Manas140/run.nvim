<h1 align="center">Run.nvim</h1>
<h4 align="center">snazzy floating window for file/script execution</h4>

<p align="center">
    <a href="https://github.com/Manas140/run.nvim/stargazers"><img src="https://img.shields.io/github/stars/Manas140/run.nvim?colorA=151515&colorB=6A9FB5&style=for-the-badge&logo=starship"></a>
    <a href="https://github.com/Manas140/run.nvim/issues"><img src="https://img.shields.io/github/issues/Manas140/run.nvim?colorA=151515&colorB=F4BF75&style=for-the-badge&logo=bugatti"></a>
    <a href="https://github.com/Manas140/run.nvim/network/members"><img src="https://img.shields.io/github/forks/Manas140/run.nvim?colorA=151515&colorB=788C4C&style=for-the-badge&logo=github"></a>
</p>


<p>
  <img src="preview.png">
</p>


## Instalation

### Packer
```lua
use 'Manas140/run.nvim'
```

### Manual Instalation
```sh
  git clone https://github.com/Manas140/run.nvim && cd run.nvim
  nvim --cmd "set rtp+=."
```

## Execute The Plugin
```
  Keybind - Control + E
  Command - :call Run()
```

## Supports
```
 - html    - rust  - sh
 - js      - lua   - go
 - python  - c     - cpp
-java (main class has to be named "App")
```
