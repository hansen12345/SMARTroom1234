<?php 
   
   $dbhost = 'smartroom.czjl1dned5qh.us-west-2.rds.amazonaws.com';
   $dbuser = 'front6';
   $dbpass = 'newfrontier';
   $conn = mysql_connect($dbhost, $dbuser, $dbpass);
   
   if(! $conn )
   {
     die('Could not connect: ' . mysql_error());
   }
   $sql = 'SELECT * FROM Component';
   mysql_select_db('SMARTRoom');
   $retval = mysql_query($sql, $conn); 
   
   if (!$retval ) {
   	die('Could not get data: ' . mysql_error());
   }

   $types = array();
   $room = "room";
   $inside = array();
    
   while($row = mysql_fetch_assoc($retval)) {
    $count++;
   	$room = "room$count";
   	/*$row_array[$room]['roomNumber'] = $row['roomNumber'];
   	$row_array[$room]['lamp'] = $row['lamp'];
   	$row_array[$room]['tv'] = $row['tv'];
   	$row_array[$room]['roomLight'] = $row['roomLight'];
   	$row_array[$room]['acUnit'] = $row['acUnit'];*/
    
    $inside = array($row_array[$room]['customer_id'] = $row['customer_id'], $row_array[$room]['room_name'] = $row['room_name'], $row_array[$room]['lamp'] = $row['lamp'], $row_array[$room]['tv'] = $row['tv'], $row_array[$room]['roomLight'] = $row['roomLight'], $row_array[$room]['acUnit'] = $row['acUnit']);
   }
    
   	array_push($types, $row_array);

   echo json_encode($types);
   
   $fp = fopen('results2.json', 'w');
   fwrite($fp, json_encode($types));


   mysql_close($conn);
?>
