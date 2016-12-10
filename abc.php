<?php
$arr = array(
	array('name' => 'tom', 'age' => 20),
	array('name' => 'tom1', 'age' => 30),
	array('name' => 'tom2', 'age' => 430),
);

foreach ($arr as $k => $v)
{
	//$v['gender'] = '男';
	$arr[$k]['gender'] = '男';
}

var_dump($arr);