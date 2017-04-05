<?php 
   
   $dbhost = '127.0.0.1:3306';
   $dbuser = 'root';
   $dbpass = 'Pngflip94!';
   $conn = mysql_connect($dbhost, $dbuser, $dbpass);
   
   if(! $conn )
   {
     die('Could not connect: ' . mysql_error());
   }
   $sql = 'SELECT * FROM Rooms';
   mysql_select_db('testRoomData');
   $retval = mysql_query($sql, $conn); 
   
   if (!$retval ) {
   	die('Could not get data: ' . mysql_error());
   }

   $file = file_get_contents(dataRoom.php);
   

   mysql_close($conn);
?>
