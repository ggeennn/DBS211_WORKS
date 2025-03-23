Lab 08 – ERD (Database Design Entity Relationship Diagrams) 
Objectives: 
The purpose of this lab is to introduce the students to the formal UML Entity Relationship Diagram.  This 
diagram is a Database Design diagram and show the entities, relationships, and cardinalities for the 
proposed database.  By the end of this lab, the student will be able to: 
• work with a simple scenario to find the entities and the relationship between entities. 
• define the relationship cardinality and optionality. 
• design a simple database using an ERD model. 
• simulate many-to-many relationships with in an ERD. 
Submission:  
Using the draw.io website or other provided by your professor, create the Crow’s Foot ERD.  
Save your lab file as a PDF file. You need to submit a single PDF file named 
DBS211_L08_Group_Number for this lab.  
The name(s), studentID’s of the students and the current date must be in the output 
document (make a box on the page and put the info in it) (Submissions without names and 
the date will receive a mark of zero (0)). 
Students MAY work in partners for this lab.  It is best to complete this lab through 
collaboration and shared thought.   
 
Tasks: 
Draw the corresponding crow’s foot ERD for the following scenario. Many-to-Many 
relationships should be broken into two 1-to-Many relationships using a bridge or 
junction entity. Label PK attributes and FK when applicable, use bold to indicate required 
fields. 
 
Bridge/Junction Entity: The bridge/junction entity is used to eliminate the many-to-many relationships. 
This entity sits between the two entities with the many-to-many relationship and this composite entity shares the 
primary keys from both tables. 
 
Show all PK’s and FK’s with your solution. 
First you need to find all entities. Next, list the attributes for each entity. Next, you need 
to find the relationship between each two entities if there is any relationship. Fix all 
many-to-many relationships. Finally, make sure all PKs and FKs are properly defined. 
 
For all entities, list their attributes. For example, for the students, we need to store 
student ID, student name and last name, email address, address, and phone number. 
You do not need to define all possible attributes. Just determine some important 
attributes. 
For each entity, you need to define a primary key. If there is a relationship between two 
entities make sure you define the corresponding foreign key in the child table.  
 
• Seneca College 
//contains many departments.  

• Each department 
//has many programs, but every program belongs to only one department.  
//Every department has many professors.  

• A professor 
//department：can work for only one department.  
//courses：A professor can teach many courses. 
• An advisor 
//can have one or more students assigned to them.

• Each section 
//is only taught by one professor (ignore the summer term) 

• A program 
//has many courses. 
//A program has many students studying in that program.  

• A course 
//can be a requirement of many programs.  
// A course can also be taught with many professors, via sections. 
A course can be taken by many students.
A new course may not be available yet so the course may not be taken by any student.

• A student 
//can study multiple programs. However, a student must register in at least in one program.  
A student may take many courses.  
A student, however, can be off from school and do not take any courses.  
//A student may have a program advisor. Having an advisor is optional for students so some students may not have any advisor.  

question：
1. need entity table for Seneca College?
2. advisor is professor?