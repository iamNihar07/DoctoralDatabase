<?php
    $host = "localhost";
    $dbusername = "root";   
    $dbpassword = "";
    $dbname = "doctoral";
    // Create connection
    $conn = new PDO('mysql:host='.$host.';dbname='.$dbname, $dbusername, $dbpassword);
    // Check connection
    if(!$conn) 
    {
    die("Connection failed");
    }
    else 
    {  
        
        $StudentId=filter_input(INPUT_POST,'StudentId');
        
        $tempquery = "SELECT StudentId FROM PHDSTUDENT WHERE StudentId='$StudentId'";
        $statement = $conn->query($tempquery);
        $temp=$statement->fetchColumn(0);
        //echo $temp;

        if($temp==$StudentId)
        {

            $query1="DELETE FROM SELFSUPPORT WHERE Studentid='$StudentId'";
            $query2="DELETE FROM PHDSTUDENT WHERE Studentid='$StudentId'";
            if (($conn->query($query1)) and ($conn->query($query2) ))
            {
                echo "Record Deleted successfully";
            }
            else
            {
                echo "Error: ". $query ."". $conn->error;
            }    
                
        }
        else
        {
            echo "Record not found";
        }

        $conn=null;
    }
    ?>