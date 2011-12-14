#!/usr/bin/php
<?php

/* Be Sure to replace CITYDATA in $url with your own city from Yahoo */

$url="http://weather.yahoo.com/united-states/georgia/cumming-12770525/";
//$url="http://weather.yahoo.com/forecast/CITYDATA.html";

$ch = curl_init();
$timeout = 0; // set to zero for no timeout
curl_setopt ($ch, CURLOPT_URL, $url);
curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt ($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
$file_contents = curl_exec($ch);
curl_close($ch);

$divStart = "<div class=\"forecast-icon\"";
$strEnd = "'); _background-image/* */: none;";
$start = strpos($file_contents, $divStart) + 50;
$end = strpos($file_contents, $strEnd);
$length = $end-$start;

$imagepath=substr($file_contents, $start , $length);
$image=imagecreatefrompng($imagepath);


imagealphablending($image, true);
imagesavealpha($image, true);
header('Content-Type: image/png');
imagepng($image);
?>
