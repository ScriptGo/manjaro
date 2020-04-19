
# Manjaro i3详细配置

## 安装

安装过程略   (注意，我使用的是 **Manjaro i3 Minimal版**)



## 镜像源

1. 配置镜像源

`sudo pacman-mirrors -i -c China -m rank`

2. 同步源

`sudo pacman -Syy`

3. 配置archlinuxcn

```shell
sudo vim /etc/pacman.conf  # 编辑pacman.conf文件
在文件的末尾加上下面两行内容：
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch

PS : 小彩蛋
在pacman.conf文件内找到 #Misc options，将其内容修改为：
Color
TotalDownload
VerbosePkgLists
ILoveCandy
```
4. 再次同步源

`sudo pacman -Syy`

5. 导入GPG key

`sudo pacman -S archlinuxcn-keyring`

6. 更新系统

`sudo pacman -Syyu`



## 修改目录名为英文

1. 首先安装字体(解决系统安装后出现的乱码)

```shell
sudo pacman -S ttf-jetbrains-mono ttf-sarasa-gothic
sudo pacman -S noto-fonts-cjk noto-fonts-emoji awesome-terminal-fonts ttf-font-awesome
```
2. 安装xdg-user-dirs-gtk

`sudo pacman -S xdg-user-dirs-gtk`
安装完成后，在终端依次执行下面的命令：
```shell
export LANG=en_US
xdg-user-dirs-gtk-update #执行完这步，会弹出来一个对话框，选择更新即可
export LANG=zh_CN
```
命令执行完成后注销或重启系统即可

3. 修改DPI

`vim ~/.Xresources ` # 终端执行此命令

将 `Xft.dpi`的值修改为 `125`

然后执行 `xrdb ~/.Xresources &`



## 软件安装

### 开发包

1. `sudo pacman -S --needed base-devel` # 必须安装,不然 makepkg会提示错误
2. `sudo pacman -S yay` # 从 Aur 中安装软件
3. `sudo pacman -S jre8-openjdk`# 有些软件需要

### i3相关

```shell
sudo pacman -S xfce4-terminal
sudo pacman -S i3blocks
sudo pacman -S rofi
```

### 常用

```shell
sudo pacman -S ffmpeg ffmpegthumbnailer  # 解码工具
sudo pacman -S mpv netease-cloud-music    # 播放器
sudo pacman -S google-chrome                          # 浏览器
sudo pacman -S gimp inkscape                           # 图片处理
sudo pacman -S android-tools android-udev # 刷机用的
sudo pacman -S simplescreenrecorder peek flameshot # 录屏、截图
sudo pacman -S screenkey                                     # 按键回显
sudo pacman -S doublecmd-gtk2                       # 资源管理
sudo pacman -S typora gvim visual-studio-code-bin    # 编辑器
sudo pacman -S baidunetdisk-bin                      # 百度网盘
sudo pacman -S transmission-gtk                      # 下载
sudo pacman -S unrar xarchiver gtkhash        # 压缩与校验
sudo pacman -S libreoffice                                    # 办公软件
sudo pacman -S timeshift aria2 uget                          # 系统备份
sudo pacman -S v2ray qv2ray                             # 科学上网
sudo pacman -S gparted                                       # 磁盘管理
sudo pacman -S gufw                                             # 防火墙
sudo pacman -S manjaro-settings-manager # manjaro系统设置工具
```

### CLI工具

```shell
sudo pacman -S tmux
sudo pacman -S net-tools
sudo pacman -S ctags shellcheck httpie

sudo pacman -S tk # python IDLE前端界面依赖
sudo pacman -S graphviz # 流程图制作工具包

# tldr: 简化 man 手册
# fd: 替换 find 的查找工具
# bat: 替换 cat 的文件内容查看工具
# exa: 替换 ls
# jq : 命令行下查看 json 文件

sudo pacman -S tldr fd bat exa jq
```

### 有意思的终端命令

```shell
sudo pacman -S neofetch fortune-mod cowsay
sudo pacman -S sl cmatrix
```

### 输入法

个人喜欢Rime
```shell
sudo pacman -S fcitx-rime
sudo pacman -S fcitx-im
sudo pacman -S fcitx-configtool
```

配置

```shell
vim ~/.xprofile # 编辑 .xprofile 文件
在文件中加入以下代码:
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```
重启后生效

### 游戏

```shell
sudo pacman -S warsow
yay -S quake3-urbanterror
```

## 配置

### 配置zsh

1. 安装 oh-my-zsh

`sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

安装完成后,提示输入用戶密码切换 shell, 然后注销或者重启系统即可使用 zsh

2. 安装主题

`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k`

3. 安装插件

自动补全:
`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

语法高亮:
`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`

4. 修改 `.zshrc`文件

```shell
修改 ZSH_THEME 为 ZSH_THEME='powerlevel10k/powerlevel10k'
将下面内容加入文件：
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting) # 找到 plugins=(git)修改为前面的内容
bindkey ',' autosuggest-accept #使用逗号补全
```

5. 重载文件

`source .zshrc`

### 触摸板

使用 `xinput list` # 查看设备
`xinput --disable "ETPS/2 Elantech Touchpad"` # 禁用触摸板



### 蓝牙配置

`sudo pacman -S bluez bluez-utils blueman` # 安装软件

启动服务

```shell
sudo systemctl start bluetooth
sudo systemctl enable bluetooth 
```

然后打开 `blueman`设置即可

**蓝牙耳机已连接但是没有声音**

`sudo pacman -S pulseaudio-bluetooth pavucontrol pulseaudio-alsa pulseaudio-bluetooth-a2dp-gdm-fix
` # 安装这些软件

`sudo systemctl restart bluetooth` # 重启蓝牙服务

启动pulseaudio服务
```shell
pulseaudio -k                      # 确保没有pulseaudio启动
pulseaudio --start              # 启动pulseaudio服务
```


### tmux

```shell
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```



### conky

修改配置文件路径
`sudo vim /usr/bin/start_conky_maia` # 编辑此文件

```shell
conky -c ~/.config/conky/shortcuts &&  # 修改为你的conkyrc存放位置
conky -c ~/.config/conky/system &&       # 修改为你的conkyrc存放位置
```



## 系统美化

美化资源存放位置
```shell
主题存放目录 : /usr/share/themes 或 ~/.local/share/themes
图标存放目录 : /usr/share/icons 或~/.local/share/icons
字体存放目录 : /usr/share/fonts 或 ~/.local/share/fonts
```
`yay -S gtk-theme-arc-git` # 主题

`sudo pacman -S variety`  # 壁纸切换软件

### 光标主题

在i3wm，设置好主题后，主题不正常工作，可以修改以下配置文件

```shell
1. 编辑  ~/.Xresources 文件中添加以下这一行即可:

Xcursor.theme: Azenis

如果有问题，可以在 ~/.xinitrc 或 .xprofile 加入下面命令:

xrdb ~/.Xresources &

2. 编辑 ~/.icons/default/index.theme 文件：

[icon theme] 
Inherits=Azenis

3. 编辑 ~/.gtkrc-2.0 文件：
gtk-cursor-theme-name="Azenis"

4. 编辑 ~/.config/gtk-3.0/settings.ini 文件：
gtk-cursor-theme-name=Azenis
```

**就算修改了以下文件，在某些应用仍然不能正常工作**



### grub 美化

`sudo vim  /etc/default/grub` # 修改grub文件
```shell
GRUB_TIMEOUT_STYLE=hide # 修改为 menu，开机显示grub引导画面
GRUB_TIMEOUT=15 # 修改为 5
GRUB_DISABLE_RECOVERY=true # 修改为 false
```
**最后更新grub，别忘记!!!**

`sudo update-grub`



**也可以使用别人写好的脚本美化**

```shell
从下面的链接下载文件，然后执行，并重启即可
https://github.com/vinceliuice/grub2-themes

sudo ./install.sh -t      # install Tela theme
sudo ./install.sh -r -t  # Remove Tela theme
```



## 语言包

打开 `manjaro setting`  安装缺失的语言包



## 开发环境配置



### MongoDB

1. 安装

`yay -S mongodb-bin mongodb-tools-bin mongodb-compass`

2. 安装完成后，执行下面的命令

`libtool --finish /usr/lib`

3. 配置

```shell
sudo mkdir -p /data/db                  #创建目录(数据库存放处)
sudo chown -R $USER /data/db #修改目录权限
```

4. 启动服务
```shell
sudo systemctl start mongodb.service  # 启动服务
sudo systemctl enable mongodb.service # 开机自启
```
5. 安装数据库管理工具

`yay -S datagrip`



### Python

1. 修改 pip 源

`sudo pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/`

2. 安装模块

```shell
yay idle-python3.7 # IDLE
sudo pip install flake8 # 语法检查工具
sudo pip install isort # 导入模块整理工具
sudo pip install yapf # google开发的代码格式化工具

sudo pip install PySimpleGUI  # gui模块
sudo pip install pyecharts pyecharts_snapshot # 图表模块

sudo pip install pandas matplotlib scipy

sudo pip install vim-vint  # vimscript 语法检查工具
sudo conda install pymongo   # mongodb连接工具
```

安装 spyder 和 kite

sudo pip install spyder # 打开spyder自动安装 kite

3. 为`Jupyter QtConsole`创建启动器

首先切换到 `/usr/share/applications/`，然后执行下面到操作

```shell
sudo vim JupyterQtConsole.desktop # 创建JupyterQtConsole.desktop

输入以下内容
[Desktop Entry]
Encoding=UTF-8
Name=Jupyter Qtconsole
GenericName=Jupyter Qtconsole
Comment=Jupyter Qtconsole
Exec=/usr/bin/jupyter-qtconsole
Icon=/Jupyter
Terminal=false
Type=Application
Categories=IDE;Development
```
最后赋予可以执行权限

`sudo chmod +x JupyterQtConsole.desktop `

更新pip

sudo pip install pip --upgrade

pip命令

pip install 包名           # 安装包
pip list                  # 列出当前安装的包
pip list --outdate        # 查看可升级的包
pip install 包名 --upgrade # 升级包

### Docker

1. 安装 Docker

`sudo pacman -S docker`

2. 配置

```shell
sudo groupadd docker  # 创建docker组
sudo gpasswd -a  ${USER} docker # 将当前用户添加到docker组中
```

3. 切换到docker组

```shell
sudo systemctl restart docker # 重启 docker 服务
newgrp docker # 注意，这一步是必须的
```

4. 测试docker是否安装成功

`sudo docker run hello-world` 

```shell
启动docker服务
sudo systemctl start docker

查看docker服务的状态
sudo systemctl status docker

设置docker开机启动服务
sudo systemctl enable docker
sudo systemctl restart docker #  重启docker

Arch下面删除Docker

sudo pacman -Rns docker删除Docker包，同时删除其依赖的包

删除Docker运行过程中产生的镜像、容器等文件。用户生成的配置文件需要手工删除。

sudo rm -rf /var/lib/docker
```



### VirtualBox

1. 安装virtualBox,选择内核模块
2. 安装sudo pacman -S linux-headers5.4

安装扩展包
`yay -S virtualbox-ext-oracle`

将当前登录用户加入 vboxusers 组
`sudo gpasswd -a $USER vboxusers`

将VirtualBox模块添加到内核中。或者 直接重启机器
`sudo modprobe vboxdrv`
安装增强包



### MPV 配置

安装完成后，先运行一下MPV以便生成配置文件
核心配置文件: ~/.config/mpv/mpv.conf
按键配置文件: ~/.config/mpv/input.conf

| 按键       | 功能                                  |
| ---------- | ------------------------------------- |
| 右方向键   | 前进 5 秒                             |
| 左方向键   | 后退 5 秒                             |
| 上方向键   | 前进 60 秒                            |
| 下方向键   | 后退 60 秒                            |
| f          | 切换是否全屏                          |
| v          | 显示/隐藏字幕                         |
| T          | 切换是窗口始终置顶                    |
| s          | 截屏，有字幕                          |
| S          | 截屏，无字幕                          |
| o          | 显示进度条与时间，2 秒后消失          |
| 9 或 /     | 音量 -20 或 *音量 +2                  |
| Space 或 p | 播放/暂停                             |
| <>         | 上一个/下一个（播放列表中）           |
| Enter      | 下一个（播放列表中）                  |
| q/Q        | 停止播出并退出/保存当前播放进度并退出 |
| i          | 显示视频的详情参数                    |
| m          | 静音                                  |
