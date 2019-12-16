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
        if($query = "SELECT P.StudentId, P.FName, P.LName, P.StSem, P.StYear, P.Supervisor, MP.MId, MP.PassDate FROM PHDSTUDENT AS P,MILESTONE AS M,MILESTONESPASSED AS MP WHERE P.StudentId=MP.StudentId AND M.MId=MP.MId AND P.StudentId='$StudentId' ORDER BY P.StudentId ASC")  
        {            
            if($query==null)
            {
                echo "No Record Available";
                die();
            }  
            else
            {
                $stmt = $conn->prepare($query);
                $stmt->execute();
                $rows = $stmt->fetchALL(PDO::FETCH_ASSOC);


                echo"<table border='4'>";
                echo"<tr><td> StudentId </td><td>First Name</td><td>Last Name</td><td>Start Semester</td><td>Start Year</td><td>Supervisor ID</td><td>Milestone ID</td><td>Pass Date</td><tr>\n";
                foreach ($rows as $row) 
                {
                    echo "<tr><td>{$row["StudentId"]}</td><td>{$row["FName"]}</td><td>{$row["LName"]}</td><td>{$row["StSem"]}</td><td>{$row["StYear"]}</td><td>{$row["Supervisor"]}</td><td>{$row["MId"]}</td><td>{$row["PassDate"]}</td><tr>\n";
                }
                echo"</table>";
                
            }
        }
        $conn=null;
    }
    ?>