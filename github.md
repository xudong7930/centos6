github
======

[Git官网](https://git-scm.com)

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



# command
## git diff
文件的状态: untracked, staged, unstaged
```
git diff #unstaged
git diff HEAD  #staged, unstaged
git diff --cached #staged
```

## git commit
```
git commit #正常提交
git commit -m "some message" #带备注的提交
git commit --amend --no-eidt #将变更的文件提交到上次提交的位置,并且不锈钢注释
```

## git reset
```
git reset 1.php #将已经add后的文件恢复为modify状态
git rest --hard HEAD #将指针移到HEAD版本
git rest --hard HEAD~2 #将指针移到HEAD的前2个版本
git rest --hard HEAD@{2} #将指针移到HEAD的前2个版本
git rest --hard a1d2f4e #退回到指定版本
```

## git log
git log --online #查看提交日志
git reflog #查看版本变化(reset)日志


## git checkout
git checkout -- 1.py #将指定文件退回到上一个版本
git checkout a1d2f4e -- 1.py #将指定文件退回到指定版本
git checkout master

## git merge
git merge
git merge --no-ff -m "keep merge info" develop #分支合并


# git rebase
```
git rebase master #在dev上重新更新基于xx主版本开发的东西
git rebase --continue #继续rebase
git rebase --skip #跳过rebase
git rebase --abort #取消rebase
```

## git stash 临时修改
```
git stash #将当期修改的文件放到缓存区,做完其他工作后(新建分支)再返回接着做
git statsh pop #将缓存区的修改的文件恢复到本地
```

## git push 推送到远端
```
git push -u origin master|develop #将本地分支master/develop推送到远端
```

## git的hooks
* 在.git/hooks中有一些内置的脚本,用于代码更新,提交之前之后执行,没有.sample


## git的upstream和downstream
* 对于从远程库中clone或fetch得到的本地分支，都在远程库中有一个upstream分支
* 从本地分支A push 到远程分支B,则B是A的upstream,A是B的downstream
* git push -u origin master #-u表示远程分支设置为upstream
* 本质是修改远程和本地分支的不停的合并.


[Git-Flow工作流]
##安装
> brew install git-flow-avh  

* master只能是产品代码,不能在这里修改代码
* develop专门用于开发新功能

#开始新功能 git flow feature start|finish|publish|track|diff|rebase|checkout|pull|delete
```
git flow feature #列出所有开发分支
git flow feature start branch-name  #1.新建一个feature/branch-name的分支
git flow feature finish branch-name  #2.完成开发(删除功能分支,合并到develop)
git flow release start 1.1.5  #3.经过在develop上完全的测试,发布版本到release,对release进行测试
git flow hotfix start missing-link #4.在release版本测试中发现了一些错误.但此时无论是release还是develop上修改都是不合适的.因此用hotfix分支解决错误
git flow hotfix finish missing-link #5.完成hotfix分支的错误修复
```

[GitLab私有代码托管]
* 官网: https://gitlab.com


# github搜索
0. watch-持续收到该项目的动态
	fork-复制项目到自己的github仓库中
	star-点赞
	clone-下载项目到本地
	follow-关注项目的作者

1. in搜索
```
seckill in:name  在项目名称中搜索
seckill in:description 在项目描述中搜索
seckill in:readme 在项目readme文件中搜索
seckill in:name,description,readme 在项目名称和描述中搜索
```

2. star和fork搜素

```
websocket stars:>=500 #搜索star大于500的项目
websocket forks:>=500 #搜索fork大于500的项目
websocket stars:>500 forks:>=500 #组合使用
```

3. awesome搜索

```sh
awesome macos
```

4. 高亮代码
https://github.com/xudong7930/doc-centos6/src/redis.md#L20



















