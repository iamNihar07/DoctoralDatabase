Project 1 Phase 3, Fall 2019, CSE 3330
Done by - Nihar Gupte (1001556441) and Ruta Vaghasia (1001608968)

There are four queries to be executed and displayed using the web interface.
We used Model View Controller Pattern to get input, manipulate the database and display the message/results.

For Query 1, run query1.php which automatically calls insert.php and inserts records into PHDSTUDENT and SELFSUPPORT for Student Richard White.
-Input required: StudentId, FName, LName, StSem, StYear, Supervisor for Richard White

For Query 2, run query2.php which automatically calls delete.php and deletes records pertaining to Richard White.
-Input required: StudentId for Richard White

For Query 3, run query3.php which automatically calls update.php and updates the Instructor type from Adjunct to NTT.
-Input required: InstructorId for an instructor who is ADJUNCT and want to change to NTT. Does not update if instructor is not of Adjunct type.

For Query 4, run query4.php which automatically calls display.php and displays the tuples in a tabular form.
-Input required: StudentId for the student whose records are desired.