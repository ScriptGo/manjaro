# Vim配置说明

vimrc文件存放目录
```vim
Linux:    用户目录(~/.vimrc)
Windows:  存放在vim的安装目录(c:\vim\_vimrc)
```

```vim

|--- autoload (用来存放插件管理器vim-plug)
|    |--- plug.vim
|
|--- config (存放各种配置文件)
|    |--- base.vim            # 基础配置
|    |--- map.vim            # 按键配置
|    |--- plugins.vim      # 要安装的插件
|    |--- confige.vim      # 插件配置
|--- Plugged (存放安装插件的目录)
|--- vimrc (全局配置文件，主要用来加载config目录下的各种配置文件)
```
