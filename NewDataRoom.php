<?php
    
    $dbhost = 'smartroom.czjl1dned5qh.us-west-2.rds.amazonaws.com';
    $dbuser = 'front6';
    $dbpass = 'newfrontier';
    $conn = mysql_connect($dbhost, $dbuser, $dbpass);
    
    if(! $conn )
    {
        die('Could not connect: ' . mysql_error());
    }
    $sql = 'SELECT SMARTRoom.Room.customer_id, Room.room_name, Room.room_id, Component.room_id, Component.component_name, Component.component_status From Room INNER JOIN Component ON Room.room_id = Component.room_id;';
    mysql_select_db('SMARTRoom');
    $retval = mysql_query($sql, $conn);
    
    if (!$retval) {
        die('Could not get data: ' . mysql_error());
    }
    
    $types = array();
    $room = "room";
    $inside = array();
    $count = 0;
    while($row = mysql_fetch_assoc($retval)) {
        $count++;
        $room = "comp$count";
        $inside = array($row_array[$room]['customer_id'] = $row['customer_id'], $row_array[$room]['room_name'] = $row['room_name'], $row_array[$room]['room_id'] = $row['room_id'], $row_array[$room]['component_name'] = $row['component_name'], $row_array[$room]['component_status'] = $row['component_status']);
        
    }
    
   	array_push($types, $row_array);
    //print_r(array_values($row_array));
    echo json_encode("File wrote from database successful")."\n\n";
    $fp = fopen('newResults.json', 'w');
    fwrite($fp, json_encode($types));
    mysql_close($conn);
?>

