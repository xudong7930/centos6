github
======

[Git](https://git-scm.com)

## 配置文件(~/.gitconfig)
```yml
[user]
	name = xudong7930
	email = xudong7930@gmail.com
[core]
	autocrlf = input
	editor = subl
```



## 1 git项目文件夹重命名
git clone https://github.com/xudong7930/centos6.git yet-another6

## 2 git全局设置
git config --global user.name='xudong7930'
git config --global user.email='xudong7930@gmail.com'
git config --global core.editor vim  "编辑器"
git config --global --list "列出git配置"

## 3 重置到指定的版本
git reset --hard d33e848a0c3d8374928695ea37c6c8d9fa19361c

## 4 修改commit信息
git commit --amend -m "first commit 3"

## 5. 添加所有文件
git add .   "添加所有的文件"
git checkout -- filename "忽略指定的文件修改"
git diff filename "比较文件的更改"
git help stash "查看帮助"
git log '查看git日志'
git log --oneline --graph '查看一行日志'

## 6. 分支管理
git branch //查看所有分支
git branch testing //新建一个分支
git branch -b testing/some-feature //新建一个分支并切换到此分支下
git branch -d testing //删除指定分支
git checkout testing //切换到指定分支
git checkout -b testing //新建一个分支并切换到此分支下
git merge testing //将testing分支合并到当前分支

## 7.stash
git stash '将当前的变更保存,以便切换到其它分支操作'
git stash list '列出stash'
git stash pop '恢复之前的变更'
git stash apply stash@{0} '恢复之前的变更'
git stash drop stash@{0} '移除指定的stash'

## rebase
git rebase master '在分支上同步master的提交'
git rebase -i master '交互性的同步master提交'

## github
空项目:
git init
git add .
git commit -m "first commit"
git remote add origin https://github.com/xudong7930/learning-git.git
git push -u origin master

已存在git项目:
git remote add origin https://github.com/xudong7930/learning-git.git
git push -u origin master
