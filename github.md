github
======

[Git](https://git-scm.com)

## 1 git项目文件夹重命名
git clone https://github.com/xudong7930/centos6.git yet-another6

## 2 git全局设置
git config --global user.name='xudong7930'
git config --global user.email='xudong7930@gmail.com'
git config --global core.editor='subl'

## 3 重置到指定的版本
git reset --hard d33e848a0c3d8374928695ea37c6c8d9fa19361c

## 4 修改commit信息
git commit --amend -m "first commit 3"

## 5. 添加所有文件
git add .   "添加所有的文件"
git checkout -- filename "忽略指定的文件修改"

## 6. 分支管理
git branch //查看所有分支
git branch testing //新建一个分支
git branch -b testing //新建一个分支并切换到此分支下
git branch -d testing //删除指定分支
git checkout testing //切换到指定分支
git checkout -b testing //新建一个分支并切换到此分支下
git merge testing //将testing分支合并到当前分支