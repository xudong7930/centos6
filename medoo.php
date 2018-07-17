<?php
require  'Medoo.php';

use Medoo\Medoo;

$db = new Medoo(['database_type' => 'mysql','database_name' => 'homestead','server' => '127.0.0.1','username' => 'root','password' => '']);

// 是否存在
if ($db->has('transactions2', ['AND'=>['id[>]'=>1]])) {
	// do some
}
exit;

// 取得一条数据,单个字段
$s1 = $db->get('transactions2', '*', ['id' => 1]);
$s2 = $db->get('transactions2', 'txid', ['id' => 1]);
$s3 = $db->get('transactions2', ['from_address', 'to_address'], ['id' => 1]);
echo json_encode($s1, $s2, $s3);
exit;

// 字段替换
$db->replace('transactions2', [
	// 'coloumn_field' => ['old_value' => 'new_value']
	'coin' => ['eth' => 'ethh'],
], ['id'=>1]);
$affectedRows = $db->rowCount();
var_dump($affectedRows);
exit;

// 删除
$db->delete('transactions2', ['AND'=>['id[>]'=>10, 'category'=>"in"]]);
echo $data->rowCount();

// 更新
$db->update('transactions2', ['nodeid'=>23, 'age[+]'=>1], ['id[>]' => 10]);
$affectedRows = $db->rowCount();

// 插入一条
$db->insert('transactions2', [
	'nodeid'=>Medoo::raw('UUID()'),
	'lang[JSON]' => ['en','jp'], // json数据,
	'from_address'=>"0x30146933a3a0babc74ec0b3403bec69281ba5914",
	'to_address'=>'0x7b7c77751f3ed0bf600aeef7c04f0217cf8005f6',
	'txid'=>'0x877750ac174748a1ecf6a535daddbc062c9592d410e0864a9b0047f81a7c4675'
]);
$insertId = $db->id();
var_dump($insertId);
exit;

// 插入多条
$db->insert('transactions2', [
	[
		'nodeid'=>Medoo::raw('UUID()'),
		'lang[JSON]' => ['en','jp'], // json数据,
		'from_address'=>"0x30146933a3a0babc74ec0b3403bec69281ba5914",
		'to_address'=>'0x7b7c77751f3ed0bf600aeef7c04f0217cf8005f6',
		'txid'=>'0x877750ac174748a1ecf6a535daddbc062c9592d410e0864a9b0047f81a7c4675'
	]
]);
$affectedRows = $db->rowCount();
exit;

// 选择
$res = $db->select('transactions2', '*', ['
	id[>=]' => 20,"coin"=>"eth", 'category'=>'out', 'ORDER'=>['id'=>"DESC"], 'LIMIT'=>[10, 6]
]);
echo json_encode($res);