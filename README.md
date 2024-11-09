# CS4416-Database-Systems-Project-2024
Concerts

## Task 1 
# DONE
Propose a modified schema to eliminate data redundancy and support: 
• multiple artists per album, song, and concert 
• multiple favourite artists per fan 
• shared tickets, i.e. multiple fans per ticket_id 
Write all CREATE TABLE statements for the modified schema, including PRIMARY KEY and 
FOREIGN KEY constraints, and save them in modified_concerts_schema.sql. 
In a separate file named data.sql, provide INSERT INTO statements for inserting some data into 
the tables of the modified schema. Please provide data for at least two artists, at least two 
albums, at least 2 concerts ad at least 2 fans who have purchased tickets for concerts.


## Task 2
Draw an entity-relationship diagram (ERD) for the modified schema using crow’s foot notation.

## Task 3
Create a view for the modified schema. The view must use a join and both GROUP BY and 
HAVING clauses. Aim at demonstrating advanced SQL skills. 

## Task 4
Write one BEFORE and one AFTER trigger for the modified schema.

## Task 5
Write a stored function that returns the total number of occupied seats for a given concert_id. 

## Task 6
Write a stored procedure that checks whether a given song_id is associated with a given 
album_id. If not, insert this association into the database. Additionally, adjust the song’s release 
date if it is later than the album’s.

## Task 7
Write a report with the following sections and save it as report.pdf.  
Sections: 
1. Contribution breakdown of each group member. If not provided, all members will 
receive equal marks. Significant differences in contributions will affect individual 
marks.  
2. Description of the platform used (e.g., XAMPP on Windows 11). If not provided, the 
default assumption is XAMPP on Windows 11. 
3. Description of the modifications made to the original schema and the reasons for 
these changes (Task 1). 
4. Your ERD (Task 2) and explanation, including any assumptions. 
5. Description of the view and the triggers (Tasks 3 and 4). Justify their usefulness. 
6. Any assumptions you have made when writing the function and the procedure 
(Tasks 5 and 6). 
7. Discussion on index requirements for efficient execution of the view, triggers, 
function, and procedure. Propose indexes and discuss use cases in which the 
proposed indexes are disadvantageous.

## Submission 
Submit the four files: 
a. modified_concerts_schema.sql (Task 1) 
b. data.sql (Task 1) 
c. code.sql containing the CREATE statements for your view, triggers, function and procedure 
(Tasks 3-6) 
d. report.pdf (Task 7) 

 ## DEADLINE 18:00 on Friday week 12
<img src="https://i.countdownmail.com/3p1e6t.gif" border="0" alt="countdownmail.com"/>
