[TOC]
# Manjaro i3详细配置

## 安装

安装过程略(注意，我使用的是==Manjaro i3 Minimal版==)

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
sudo pacman -S ttf-cascadia-code ttf-fira-code ttf-jetbrains-mono ttf-sarasa-gothic
sudo pacman -S ttf-hack noto-fonts-cjk noto-fonts-emoji awesome-terminal-fonts ttf-font-awesome
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

## 软件安装

### 开发包

1. `sudo pacman -S --needed base-devel` # 必须安装,不然 makepkg会提示错误
2. `sudo pacman -S yay` # 从 Aur 中安装软件
3. `sudo pacman -S python-pip` # 安装 python 模块管理工具
4. `sudo pacman -S jre8-openjdk`# 有些软件需要

### i3相关

```shell
sudo pacman -S xfce4-terminal  # 这个好用，自带透明
sudo pacman -S i3blocks              # i3bar插件
sudo pacman -S rofi                       # 程序启动器
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
sudo pacman -S typora gvim visual-studio-code-bin                                 # 编辑器
sudo pacman -S baidunetdisk-bin                      # 百度网盘
sudo pacman -S transmission-gtk                      # 下载
sudo pacman -S unrar xarchiver gtkhash        # 压缩与校验
sudo pacman -S libreoffice                                    # 办公软件
sudo pacman -S timeshift                                      # 系统备份
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

有意思的终端命令
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
sudo pacman -S warsow  # fps
yay -S quake3-urbanterror # fps
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
bindkey ',' autosuggest-accept #使用逗号补全
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting) # 找到 plugins=(git)修改为前面的内容
```
5. 重载文件

`source .zshrc`

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

### grub 美化

`sudo vim  /etc/default/grub` # 修改grub文件
```shell
GRUB_TIMEOUT_STYLE=hide # 修改为 menu，开机显示grub引导画面
GRUB_TIMEOUT=15 # 修改为 5
GRUB_DISABLE_RECOVERY=true # 修改为 false
```
==最后更新grub，别忘记!!!==

`sudo update-grub`

==也可以使用别人写好的脚本美化，前提是要执行上面的命令==

```shell
从下面的链接下载文件，然后执行，并重启即可
https://github.com/vinceliuice/grub2-themes

sudo ./install.sh -t    # install Tela theme
sudo ./install.sh -r -t # Remove Tela theme
```
## 语言包

打开 `manjaro setting`  安装缺失的语言包


## MariDB

1. 安装

`sudo pacman -S mariadb mariadb-clients`

2. 安装完成后，初始化数据库

`sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql`

3. 启动服务
```shell
sudo systemctl start mariadb        #启动 MariaDb 服务
sudo systemctl enable mariadb    #开机自启动
```

4. 为root用户添加密码

`sudo mysqladmin -u root password "root"`

5. 修改编码

```shell
sudo vim /etc/my.cnf # 编辑此文件，加入下面的内容

[client]
default-character-set = utf8mb4
[mysqld]
collation_server = utf8mb4_unicode_ci
character_set_client = utf8mb4
character_set_server = utf8mb4
skip-character-set-client-handshake
[mysql]
default-character-set = utf8mb4
```

6. 登录数据库

`mysql -uroot -p ` # 回车后，输入root用户的密码即可


## MongoDB

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

## Python

1. 修改 pip 源

`sudo pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/`

2.更新pip

`sudo pip install pip --upgrade `

3. 安装常用模块

```shell
yay idle-python3.7                 # IDLE
sudo pip install yapf              # google 开发的代码格式化工具
sudo pip install flake8          #语法检查工具
sudo pip install isort             #导入模块整理工具
sudo pip install PySimpleGUI  # gui模块
sudo pip install pyecharts pyecharts_snapshot # 图表模块
sudo pip install pandas matplotlib scipy  # 数据分析
sudo pip install vim-vint  # vimscript 语法检查工具
sudo pip install pymongo   # mongodb连接工具
sudo pip install spyder        # 数据分析IDE
```



### Jupyter QtConsole

为Jupyter QtConsole创建启动器

```shell
sudo vim /usr/share/applications/JupyterQtConsole.desktop # JupyterQtConsole.desktop

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