//Alex Hansen 2017-2-12


<?php
    $host = "smartroom.czjl1dned5qh.us-west-2.rds.amazonaws.com";
    $db = "SMARTRoom";
    $user = "front5";
    $pass = "fronttoback";
    
    $connection = mysql_connect($host, $user, $pass);
    
    if(!$connection)
    {
        die("Database server connection failed.");
    }
    else
    mysql_select_db('SMARTRoom');
    $sql = "UPDATE Component SET component_status = 'ON' WHERE component_id = 6";
    
    if ($connection == TRUE) {
      //$postonOff = $_REQUEST['data'];
        mysql_query($sql);
        echo "added";
    } else {
        echo "Error: " . $sql . "<br>" . $connection->error;
    }
    mysql_close($connection);
?>
<?php
    $host = "smartroom.czjl1dned5qh.us-west-2.rds.amazonaws.com";
    $db = "SMARTRoom";
    $user = "front5";
    $pass = "fronttoback";
    $connection = mysql_connect($host, $user, $pass);
    
    if(!$connection)
    {
        die("Database server connection failed.");
    }
    else{
        mysql_select_db('SMARTRoom');
        $status =$_POST["status"];
        $component =$_POST["room"];
        if ($status == "ON"){
            $new = ("ON");
        }
        else{
            $new = ("OFF");
        }
        $room_id = intval($component);
        $posted = mysql_query("UPDATE Component SET component_status ='".$new."'WHERE component_id=6");
    }
    echo ("status =$new");
    //echo ("$compUP");
    echo ("component =$room_id");
    //echo(status_update);
    if (!$posted){
        echo "Error ";
    }else{
        echo "added";
    }
    mysql_close($connection);
?>
