PHP正则
===================

[PHP正则:http://www.phpliveregex.com](http://www.phpliveregex.com)


# 基础元素
|元字符|说明|元字符|说明|元字符|说明|
|:--:|:--:||:--:|:--:||:--:|:--:|
| **[abc]** |A、B或C的单个字符| **.** |任何单个字符|**(...)** |匹配一切|
| **[^abc]** |除A、B或C以外的任何单个字符| **\s** |任何空白字符|**(aÌb)** |匹配a or b|
| **[a-z]** |在任何单个字符a-z| **\S** |任何非空白字符|**a?** |匹配零或一个a|
| **[a-zA-Z]** |范围内的任意单个字符A-Z和a-z| **\d** |任何数字|**a\*** |匹配零或多个a|
| **^** |匹配一行以xx开始| **\D** |任何非数字|**a+** |匹配一个或多个a|
| **$** |匹配一行以xx结束| **\w** |任何字符（字母、数字、下划线）|**a{3}** |匹配3个a|
| **\A** |匹配字符串以xx开始| **\W** |任何非文字字符|**a{3,}** |匹配3个以上的a|
| **\z** |匹配字符串以xx结束| **\b** |任何单词边界|**a{3,6}** |匹配最少3个,最多6个a|


# 选项
* **i** 不区分大小写
* **m** 按多行字符串处理
* **s** 按单行字符串处理
* **x** 正则中忽略空白
* **A** 仅在字符串开始处匹配
* **D** 仅在字符串结尾处匹配
* **U** 默认非贪婪匹配

# PHP正则函数
## preg_match
```PHP
<?php

$input_line = <<<EOF
last_name, first_name
bjorge, philip
kardashian, kim
mercury, freddie
EOF;

preg_match("/(.*), (.*)/", $input_line, $output_array); // 仅匹配一次
echo json_ecode($output_array);

输出: 
["last_name, first_name", "last_name", "first_name"]
```

## preg_match_all
```PHP
<?php

$input_line = <<<EOF
last_name, first_name
bjorge, philip
kardashian, kim
mercury, freddie
EOF;

preg_match_all("/(.*), (.*)/", $input_line, $output_array); // 仅匹配多次
echo json_ecode($output_array);

输出:
[
    ["last_name, first_name", "bjorge, philip", "kardashian, kim", "mercury, freddie"],
    ["last_name", "bjorge", "kardashian", "mercury"],
    ["first_name", "philip", "kim", "freddie"]
]
```

## preg_replace
```PHP
<?php

$input_line = <<<EOF
last_name, first_name
bjorge, philip
kardashian, kim
mercury, freddie
EOF;
$s = preg_replace("/(.*), (.*)/", "$0 --替换为--> $2 $1", $input_line);
echo($s);
输出:
last_name, first_name --替换为--> first_name last_name
bjorge, philip --替换为--> philip bjorge
kardashian, kim --替换为--> kim kardashian
mercury, freddie --替换为--> freddie mercury
```


## preg_grep
```PHP
<?php

$input_line = <<<EOF
last_name, first_name
bjorge, philip
kardashian, kim
mercury, freddie
EOF;
$s = preg_grep("/(.*), (.*)/", explode("\n", $input_line));
echo json_ecode($s);

输出:
["last_name, first_name","bjorge, philip","kardashian, kim","mercury, freddie"]
```
