# 配置日用Manjaro i3

manjaro是基于archlinux的一个发行版, 之前一直用的archlinux, 现在发现manjaro是开箱即用的archlinux, 安装时间大大减少!如果想要看裸archlinux的话可以看[这里][0].  

## linux安装
在manjaro的[首页][1]下载i3版本的镜像及sha1,sha256文件, 为了方便叙述,`manjaro-*.iso`来代替所下载的iso文件  

### linux环境
check sha1\sha256  
`sha1sum -c manjaro-*.iso`  
写入u盘  
`sudo dd if=manjaro-*.iso of=/dev/u盘对应的设备 bs=4M status=progress`  

### windows环境
使用工具[rufus][2]来制作镜像, 比较傻瓜就略过了  

### 安装linux
使用镜像启动后能看到选择界面, 其中要改的的是语言和驱动, 最好选闭源的驱动, 语言看喜好  

选完了然后选中boot回车就行了  

重启后进入live系统, 这个系统主要是用来体验的, 你做出的对系统的改变是没有用的. 在弹出的界面选中launch installer就能傻瓜式的安装了.  

建议把系统安在一块整的SSD上, 分区的话建议选manual, 先把老的分区删掉, 然后全部建新的. 我的习惯是boot 500MB, / 100GB, swap 10G, 其他用作/home(256SSD, 仅供参考), /opt可以挂普通硬盘.  

注意可能会提示缺少efi分区,需要按照提示建一个500MB的分区供efi使用. 建议多系统的话注意不要把boot写到windows的硬盘上. 或者用`sudo update-grub`添加windows到启动项里面.  

## linux初始化

### 更新源
其实源是可以共用archlinux的.  

/etc/pacman.d/mirrorlist  
找到中国的源然后放到最上面, 例如:  
`Server = http://mirrors.tuna.tsinghua.edu.cn/manjaro/stable/$repo/$arch`  

/etc/pacman.conf 最后加入  
```  bash
[arch4edu]  
SigLevel = Never  
Server = https://mirrors.tuna.tsinghua.edu.cn/arch4edu/$arch  
  
[archlinuxcn]  
SigLevel = Optional TrustAll  
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch  
```
更新系统到最新  
`sudo pacman -Syu`  

### 剪贴板设置
右键右下角的剪贴板选中自动复制等选项  

### 软件包

#### 字体
`sudo pacman -S powerline-fonts awesome-terminal-fonts wqy-microhei wqy-zenhei ttf-fira-code`  
查看已经安装的字体:  
`fc-list|cut -d: -f2`  
强制刷新字体缓存:  
`fc-cache -fv`  

#### terminal
首先推荐使用terminator  
`sudo pacman -S terminator zsh`  
oh-my-zsh  
`$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`  

#### 浏览器等
`sudo pacman -S chromium shadowsocks`  
然后  
`cp /etc/shadowsocks/example.json /opt/conf/ss.json`  
开启服务:  
`sslocal -c /opt/conf/ss.json --log-file /opt/logs/ss.log -d start --pid-file /opt/run/ss.pid`  
代理模式开启chromium:  
`chromium --proxy-server=socks5://127.0.0.1:1080`  

#### 输入法
`sudo pacman -S fcitx-im fcitx-configtool fcitx-cloudpinyin fcitx-rime fcitx-skin-material`  

#### 工具组件类
`sudo pacman -S aria2 feh xcompmgr mlocate typora`  

#### yaourt
`sudo pacman -S yaourt`  

#### 开发工具
jdk:  
`sudo pacman-S jdk8-openjdk`  
jetbrain 大礼包:  
`sudo pacman -S android-studio pycharm-community-edition intellij-idea-ultimate-edition`  
炼丹:  
`sudo pacman -S python-tensorflow-opt-cuda python-pytorch-cuda`  
其他:  
`sudo pacman -S gitkraken visual-studio-code-bin autojump`  
python包:  
`sudo pacman -S python-matplotlib`  

#### 其他
`pacman -S netease-cloud-music virtualbox`  
`yaourt -S gitkraken`  

#### 可选
`yaourt -S lib32-nss-mdns crossover ttf-symbola`  

#### 微信 qq office  
可以用crossover中的qq或者tim  
但是微信没有很好的解决方案, 可以使用web版微信  
不过最简单的方法还是虚拟机开共享文件夹, 记得要装增强功能  

#### 虚拟机的iso源
`https://msdn.itellyou.cn/`  

### 配置
配置上传到[github][3]了,仅供参考, 以下为对该配置的说明  

#### git

自行修改用户名和邮箱及ssh备注  

```  bash
git config --global user.name kinderlas  
git config --global user.email kinderlas@mail.com  
ssh-keygen -C 'kinderlas@manjaro'  
git config --global http.proxy 'socks5://127.0.0.1:1080'  
git config --global https.proxy 'socks5://127.0.0.1:1080'  
```
如果要取消代理  
```  bash
git config --global --unset http.proxy  
git config --global --unset https.proxy  
```
#### gradle
#### 输入法
```  bash
export GTK_IM_MODULE=fcitx  
export XMODIFIERS=@im=fcitx  
export QT_IM_MODULE=fcit  
```
#### 高分屏
修改.Xresource文件中的dpi为:  
`Xft.dpi: 180`  
生效:  
`xrdb -merge .Xresources`  
#### 默认程序
.config/mimeapps.list 中修改相应的desktop就行了  
#### autojump
.zshrc的plugins中加入autojump  
```  bash
plugins=(  
  git  
  autojump  
)  
```
将下面这句话加到`.zshrc`的最后面  
`[[ -s ~/.autojump/etc/profile.d/autojump.sh ]] && . ~/.autojump/etc/profile.d/autojump.sh`  
####  快捷键  
关于i3有一篇很棒的[博客][3], 我的配置里面把jkl;改成了hjkl, 默认的配置对我来说有点难以接受...  
#### 自动换壁纸 
/opt/wallpaper/auto-change.sh  
```  bash
#!/bin/sh  
while true; do  
  arr=(`find /opt/wallpaper -type f \( -name '*.jpg' -o -name '*.png' \)|shuf -n2`)  
  bg0=${arr[0]}  
  bg1=${arr[1]}  
  #feh --bg-fill $bg0 --bg-fill $bg1  
  feh --bg-scale $bg0 --bg-scale $bg1  
  sleep 30m  
done  
```
这个脚本是对应双屏的, 有需要的自行修改  

#### 开机启动
在`.i3/config`文件中加入  
```  bash
exec --no-startup-id fcitx  
exec --no-startup-id sslocal -c /opt/conf/ss.json --log-file /opt/logs/ss.log -d start --pid-file /opt/run/ss.pid  
exec --no-startup-id nohup sh /opt/wallpaper/auto-change.sh > /dev/null 2>&1 &  
```

[0]: https://docs.google.com/document/d/1ImLV9Vl7ojfzyuUIbg4rf2h4xgX2ap2ditnYTqG9Pyo/edit?usp=sharing
[1]: https://manjaro.org/community-editions/
[2]: https://rufus.akeo.ie/?locale=zh_CN
[3]: https://github.com/Kinderlas/config-manjaro-i3
