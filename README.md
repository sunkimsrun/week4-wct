# week4-wct

# Assignment: Database Design and Implementation

 # Scenario: University Course Registration System
  A university wants to develop a Course Registration System to manage student enrollments, courses, and faculty. The system should allow students to register for courses, track their progress, and allow faculty members to manage course content and student grades. Your task is to design and implement the database for this system, covering all steps from entity modeling to SQL table creation.
 
 # Part 1: Identify Entities and Relationships
 
  Analyze the scenario and identify the main entities involved in the system. Your design should include:
  - Students: Can register for multiple courses.
  - Courses: Each has a unique code and is taught by a faculty member.
  - Faculty: Teaches multiple courses but belongs to only one department.
  - Departments: Manages multipl faculty members and courses.
  - Enrollments: Represents the relationship between students and courses, including enrollment date and grade.
  - 
 # Part 2: Draw the ER Diagram
  Use an ER diagram to model the relationships between the entities, defining primary keys, attributes, and cardinalities. Tools like MySQL Workbench or Draw.io can be used.
  
 # Part 3: Transform the ER Model into Relational Tables
  Convert your ER diagram into relational tables. Ensure to define primary keys, foreign keys, and constraints.
  
 # Part 4: Create SQL Tables
 CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

 # Part 5: Insert Sample Data
INSERT INTO students (first_name, last_name, date_of_birth, email) 
VALUES ('Alice', 'Johnson', '2001-06-15', 'alice@example.com');
 
# Part 6: Querying the Database
 Write SQL queries to answer:
 1. Retrieve all students who enrolled in a specific course.
 2. Find all faculty members in a particular department.
 3. List all courses a particular student is enrolled in.
 4. Retrieve students who have not enrolled in any course.
 5. Find the average grade of students in a specific course.

 # Submission Guidelines
 - ER Diagram (image or PDF).
 - SQL file with CREATE TABLE and INSERT statements.
 - SQL queries with explanations.
 - Screenshots of query results.
   
 # Bonus (Optional)
 - Implement a trigger to update a student's GPA when a grade is updated.
 - Design a stored procedure to enroll a student in a course.

# Evaluation Criteria
 - Correct entity identification and relationships.
 - Well-structured ER diagram.- Accurate transformation of entities into relational tables.
 - Proper use of SQL constraints and normalization.
 - Functional SQL queries that return correct results
