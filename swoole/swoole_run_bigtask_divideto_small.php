<?php
// 大任务划分成多个小任务
// 将循环执行的任务，划分为多个进程执行，提高工作效率
require "./Medoo.php";

use Medoo\Medoo;

$workers = []; 
$process_num = 5;

// 循环创建进程
for ($i=0; $i < $process_num; $i++) { 
	$process = new swoole_process(function(swoole_process $worker) use ($i, $process_num){
		// sleep(mt_rand(1,10));
		
		// 每个进程创建一个redis,mysql实例s
		$db = new Medoo(['database_type' => 'mysql','database_name' => 'homestead','server' => '127.0.0.1','username' => 'root','password' => '']);

		$total = $db->count("transactions2");
		$limit = ceil($total / $process_num);
		$skip = $limit * $i;

		$records = $db->select('transactions2', '*', ['LIMIT'=>[$skip, $limit]]);
		$datas = SplFixedArray::fromArray($records);
		$str = "";
		foreach ($datas as $item) {
			// sleep(mt_rand(1,10));
			$str .= json_encode($item).PHP_EOL;
		}

		file_put_contents("./log/hi_".date('Hisu').mt_rand().".txt", $str);

	}, true);

	$process->name("task_{$i}");
	$pid = $process->start();

	if ($pid) {
		$workers[$pid] = $process;
	}
}

// close process
foreach($workers as $pid => $process) {
	$res = $process->close();
	echo "pid: $pid closed".PHP_EOL;
}
