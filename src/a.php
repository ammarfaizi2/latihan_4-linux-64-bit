<?php

function me2($s)
{
	return sprintf("\033[1;33m0x%016s\033[0m", $s);
}

function me($s)
{
	$s = str_split(sprintf("%064s", decbin($s)), 8);
	$b = false;
	foreach ($s as &$v) {
		$v = $v;
		if ($v === "00000000") {
			$b or $v = "\033[0;31m00000000\033[0m";
		} else {
			$b = true;
		}
		$v = "\033[0;32m{$v}\033[0m";
	}

	unset($v);
	return implode($s, " ");
}

for ($i=0; $i < 8; $i++) {
	print me($a = 0x61462072616d6d41)." = \033[1;33m0x61462072616d6d41\033[0m\n";
	print me($b = 255 << ($i << 3))." = ".me2(dechex($b))."\n";
	var_dump($b);
	print "\033[1;36m".str_repeat("-", 75)."\033[0m and\n";
	$a = $a & $b;
	print me($a)." = ".me2(dechex($a))."\n";
	$b = $i << 3;
	$a = $a >> $b;
	print "\033[1;36m".str_repeat("-", 75)."\033[0m right shift {$b} bit\n";
	print me($a)." = ".me2(dechex($a))."\n";
	print chr(((0x61462072616d6d41 & (255 << ($i << 3)) ) >> ($i << 3))). " ";

	print "\n\n";
}
