##主要内容
> 这里的山路_十八_弯，这里的逗比*抱成*团。
> #### Markdown是什么？
> ### Markdown是什么？

## 正文
### 1.Markdown是什么? ###
**Markdown**是一种轻量级**标记语言**，它以纯文本格式编写文档，并最终以HTML格式发布。它最初一个perl脚本_Markdown.pl_

### 2.谁发明了Markdown? ###
它由[**Aaron Swartz**](http://www.aaronsw.com/)和**John Gruber**共同设计。

![Aaron Swartz](./resource/Aaron_Swartz.jpg)

### 3.为什么要试用它？ ###
+ 它简单已读，处处体现着**极简主义**的影子。
+ 兼容HTML,可以转换为HTML格式发布。
+ 跨平台试用
+ 摆脱Word（我不是认真的）


### 4.怎么使用？ ###
Markdown语法分为： **标题**，**段落**，**区块引用**，**代码区块**，**强调**，**列表**，**分割线**，**链接**，**图片**，**反斜杠 `\`**，**符号'`'**。

#### 4.1 标题 ####
两种形式：
1）使用`=`和`-`标记一级和二级标题。
一级标题
=======

二级标题
-------

2）使用`#`，可表示1-6级标题。
# 一级标题   
## 二级标题   
### 三级标题   
#### 四级标题   
##### 五级标题   
###### 六级标题 

#### 4.2 段落 ####
段落的前后要有空行，所谓的空行是指没有文字内容。  
若想在段内强制换行的方式是使用两个以上空格加上回车  

#### 4.3 区块引用 ####
在段落的每行或者只在第一行使用符号`>`

> 学如逆水行舟，不进则退。


#### 4.4 代码区块 ####
代码区块的建立是在每行加上4个空格或者一个制表符

C#代码:

	void main()
	{
		print_r("hello, Markdown");
	}

**注意**:需要和普通段落之间存在空行。


#### 4.5 强调 ####
在强调内容两侧分别加上`*`或者`_`

效果：
*斜体*，_斜体_  
**粗体**，__粗体__


#### 4.6 列表 ####
使用`·`、`+`、或`-`标记无序列表

+ 第一项
+ 第二项
+ 第三项


有序列表的标记方式是将上述的符号换成数字,并辅以`.`

1. 第一项
2. 第二项
3. 第三项

#### 4.7 分割线 ####
分割线最常使用就是三个或以上`*`，还可以使用`-`和`_`。

分割线1：

---

分割线1：

***

分割线1：

___


#### 4.8 链接 ####
链接可以由两种形式生成：**行内式**和**参考式**。 

**行内式**：
[Laravel FrameWork](https:://github.com/xudong7930/Markdown "Markdown")。


**参考式**：
[younghz的Markdown库][1]
[1]: https:://github.com/younghz/Markdown "Markdown"


#### 4.9 图片 ####
添加图片的形式和链接相似，只需在链接的基础上前方加一个`！`。
![Laravel PHP](./resource/Aaron_Swartz.jpg)

#### 4.10 反斜杠`\` ####
相当于**反转义**作用。使符号成为普通符号。

#### 4.11 符号'`' ####
`ctrl+alt+del`


#### 4.12 列表 ####

用`|`表示表格纵向边界，表头和表内容用`-`隔开，并可用`:`进行对齐设置，两边都有`:`则表示居中，若不加`:`则默认左对齐。

|代码库                                 |链接                                |
|:------------------------------------:|------------------------------------|
|MarkDown                              |[https://github.com/younghz/Markdown](https://github.com/younghz/Markdown "Markdown")|
|moos-young                            |[https://github.com/younghz/moos-young](https://github.com/younghz/moos-young "tianchi")|
