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
        $FName=filter_input(INPUT_POST,'FName');
        $LName=filter_input(INPUT_POST,'LName');
        $StSem=filter_input(INPUT_POST,'StSem');
        $StYear=filter_input(INPUT_POST,'StYear');
        $Supervisor=filter_input(INPUT_POST,'Supervisor');

        $query1="INSERT INTO PHDSTUDENT(StudentId, FName, LName, StSem, StYear, Supervisor) VALUES ('$StudentId','$FName','$LName','$StSem','$StYear','$Supervisor')";
        $query2="INSERT INTO SELFSUPPORT(StudentId) VALUES ('$StudentId')";
        if (($conn->query($query1)) and ($conn->query($query2) ))
        {
            echo "New record is inserted sucessfully";
        }
        else
        {
            echo "Error: ". $query ."". $conn->error;
        }    
                
        $conn=null;
    }
    ?>