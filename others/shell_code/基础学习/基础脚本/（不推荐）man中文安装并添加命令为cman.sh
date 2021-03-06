echo "*******************************************************************************"
echo " 安装wget并获取中文包"
echo "*******************************************************************************"
sudo yum install wget
wget https://src.fedoraproject.org/repo/pkgs/man-pages-zh-CN/manpages-zh-1.5.1.tar.gz/13275fd039de8788b15151c896150bc4/manpages-zh-1.5.1.tar.gz
echo "*******************************************************************************"
echo " 解压"
echo "*******************************************************************************"
sudo tar xzf manpages-zh-1.5.1.tar.gz
echo "*******************************************************************************"
echo " 编译安装"
echo "*******************************************************************************"
cd manpages-zh-1.5.1
sudo ./configure --prefix=/usr/local/zhman --disable-zhtw
sudo make
sudo make install
echo "*******************************************************************************"
echo " 添加环境变量"
echo "*******************************************************************************"
sudo echo "alias cman='man -M /usr/local/zhman/share/man/zh_CN'" >> ~/.bashrc
source ~/.bashrc
echo "*******************************************************************************"
echo " 配置成功，指令为cman"
echo "*******************************************************************************"
