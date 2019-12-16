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
        
        $InstructorId = filter_input(INPUT_POST, 'InstructorId');      
        $NewType='NTT';
        $OldType='Adjunct';

        

            $query = "UPDATE Instructor SET Type = '$NewType' WHERE InstructorId='$InstructorId' AND InstructorId IN (SELECT InstructorId FROM Instructor WHERE Type='$OldType')";
        
    
            if ($conn->query($query))
            {
                echo "Record updated sucessfully";

               /* $query1 = "SELECT * FROM INSTRUCTOR";
                $stmt = $conn->prepare($query1);
                $stmt->execute();
                $rows = $stmt->fetchALL(PDO::FETCH_ASSOC);


                echo"<table border='1'>";
                echo"<tr><td>InstructorId</td><td>First Name</td><td>Last Name</td><td>Start Date</td><td>Degree</td><td>Rank ID</td><td>Type</td><tr>\n";
                foreach ($rows as $row) 
                {
                    echo "<tr><td>{$row["InstructorId"]}</td><td>{$row["FName"]}</td><td>{$row["LName"]}</td><td>{$row["StartDate"]}</td><td>{$row["DEGREE"]}</td><td>{$row["Rank"]}</td><td>{$row["Type"]}</td><tr>\n";
                }
                echo"</table>";*/
            }
            else
            {
                echo "Error";
            }
        
        $conn=null;
    }
?>