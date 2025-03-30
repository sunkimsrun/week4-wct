CREATE DATABASE lab5;
USE lab5;

-- Table: departments
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(45) NOT NULL
);

-- Table: faculty
CREATE TABLE faculty (
    faculty_id INT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Table: course
CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(45) NOT NULL,
    course_code INT UNIQUE NOT NULL,
    faculty_id INT,
    department_id INT,
    FOREIGN KEY (faculty_id) REFERENCES faculty(faculty_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Table: students
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Table: enrollments
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATETIME NOT NULL,
    grade VARCHAR(5) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- insert into student table
INSERT INTO `lab5`.`students` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `email`) VALUES ('1', 'sun', 'kimsrun', '1991-05-05', 'sunkimsrun11@gmail.com');
INSERT INTO `lab5`.`students` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `email`) VALUES ('2', 'tong', 'dara', '2000-04-12', 'dara@gmail.com');
INSERT INTO `lab5`.`students` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `email`) VALUES ('3', 'phat', 'makara', '2001-11-25', 'makara@gmail.com');
INSERT INTO `lab5`.`students` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `email`) VALUES ('4', 'khem', 'hong', '1999-07-06', 'hong@gmail.com');
INSERT INTO `lab5`.`students` (`student_id`, `first_name`, `last_name`, `date_of_birth`, `email`) VALUES ('5', 'long', 'seyha', '2004-01-02', 'seyha@gmail.com');

-- insert into department table
INSERT INTO `lab5`.`departments` (`department_id`, `department_name`) VALUES ('1', 'IT');
INSERT INTO `lab5`.`departments` (`department_id`, `department_name`) VALUES ('2', 'ITE');
INSERT INTO `lab5`.`departments` (`department_id`, `department_name`) VALUES ('3', 'MATH');

-- insert into faculty table
INSERT INTO `lab5`.`faculty` (`faculty_id`, `name`, `department_id`) VALUES ('1', 'Information Technology', '1');
INSERT INTO `lab5`.`faculty` (`faculty_id`, `name`, `department_id`) VALUES ('2', 'Faculty of Engineering', '2');
INSERT INTO `lab5`.`faculty` (`faculty_id`, `name`, `department_id`) VALUES ('3', 'Mathematics', '3');

-- insert into course table
INSERT INTO `lab5`. `course` (`course_id`,`course_name`,`course_code`,`faculty_id`,`department_id`) VALUES ('1','MATH','M1','3','3');
INSERT INTO `lab5`. `course` (`course_id`,`course_name`,`course_code`,`faculty_id`,`department_id`) VALUES ('2','Java','Ja1','2','2');
INSERT INTO `lab5`. `course` (`course_id`,`course_name`,`course_code`,`faculty_id`,`department_id`) VALUES ('3','Python','py1','1','1');
INSERT INTO `lab5`. `course` (`course_id`,`course_name`,`course_code`,`faculty_id`,`department_id`) VALUES ('4','Web Development','WCT1','2','2');
INSERT INTO `lab5`. `course` (`course_id`,`course_name`,`course_code`,`faculty_id`,`department_id`) VALUES ('5','Android Development','MAD1','2','2'); 

-- insert into enrollment table
INSERT INTO `lab5`.`enrollments` (`enrollment_id`, `student_id`, `course_id`, `enrollment_date`, `grade`) VALUES ('1', '1', '1', '2025-04-03', 'A');
INSERT INTO `lab5`.`enrollments` (`enrollment_id`, `student_id`, `course_id`, `enrollment_date`, `grade`) VALUES ('2', '2', '3', '2025-04-12', 'D');
INSERT INTO `lab5`.`enrollments` (`enrollment_id`, `student_id`, `course_id`, `enrollment_date`, `grade`) VALUES ('3', '4', '5', '2025-04-25', 'A');
INSERT INTO `lab5`.`enrollments` (`enrollment_id`, `student_id`, `course_id`, `enrollment_date`, `grade`) VALUES ('4', '1', '4', '2025-04-19', 'C');
INSERT INTO `lab5`.`enrollments` (`enrollment_id`, `student_id`, `course_id`, `enrollment_date`, `grade`) VALUES ('5', '3', '5', '2025-04-30', 'F');


-- Part 5: Insert Sample Data
INSERT INTO lab5.students (first_name, last_name, date_of_birth, email) 
VALUES ('Alice', 'Johnson', '2001-06-15', 'alice@example.com');




-- Query the Database
-- 1.Retrieve all students who enrolled in a specific course.
SELECT s.student_id, s.first_name, s.last_name, s.date_of_birth, s.email, c.course_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id
WHERE c.course_name = 'Python';

-- 2. Find all faculty members in a particular department
SELECT f.faculty_id, f.name, d.department_name
FROM faculty f
JOIN departments d ON f.department_id = d.department_id
WHERE d.department_name = 'IT';

-- 3. List all courses a particular student is enrolled in
SELECT s.student_id, s.first_name, s.last_name, c.course_name, c.course_code
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN course c ON e.course_id = c.course_id
WHERE s.email = 'sunkimsrun11@gmail.com';

-- 4. Retrieve students who have not enrolled in any course
SELECT s.student_id, s.first_name, s.last_name, s.email
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

-- 5. Find the average grade of students in a specific course
SELECT c.course_name, AVG(CASE 
    WHEN e.grade = 'A' THEN 4.0 
    WHEN e.grade = 'B' THEN 3.0 
    WHEN e.grade = 'C' THEN 2.0 
    WHEN e.grade = 'D' THEN 1.0 
    WHEN e.grade = 'F' THEN 0.0 
    ELSE NULL END) AS average_grade
FROM enrollments e
JOIN course c ON e.course_id = c.course_id
WHERE c.course_name = 'Python'
GROUP BY c.course_name;




-- Create the Procedure
-- 1. Retrieve all students who enrolled in a specific course
DELIMITER //
CREATE PROCEDURE GetStudentsByCourse(IN course_name_param VARCHAR(45))
BEGIN
    SELECT s.student_id, s.first_name, s.last_name, c.course_name
    FROM students s
    JOIN enrollments e ON s.student_id = e.student_id
    JOIN course c ON e.course_id = c.course_id
    WHERE c.course_name = course_name_param;
END //
DELIMITER ;

CALL GetStudentsByCourse('python');


-- 2. Find all faculty members in a particular department
DELIMITER //
CREATE PROCEDURE GetFacultyByDepartment(IN dept_name_param VARCHAR(45))
BEGIN
    SELECT f.faculty_id, f.name, d.department_name
    FROM faculty f
    JOIN departments d ON f.department_id = d.department_id
    WHERE d.department_name = dept_name_param;
END //
DELIMITER ;

CALL GetFacultyByDepartment('IT');


-- 3. List all courses a particular student is enrolled in
DELIMITER //
CREATE PROCEDURE GetCoursesByStudent(IN student_email_param VARCHAR(100))
BEGIN
    SELECT s.student_id, s.first_name, s.last_name, c.course_name, c.course_code
    FROM students s
    JOIN enrollments e ON s.student_id = e.student_id
    JOIN course c ON e.course_id = c.course_id
    WHERE s.email = student_email_param;
END //
DELIMITER ;

CALL GetCoursesByStudent('sunkimsrun11@gmail.com');

-- 4. Retrieve students who have not enrolled in any course
DELIMITER //
CREATE PROCEDURE GetStudentsWithoutEnrollment()
BEGIN
    SELECT s.student_id, s.first_name, s.last_name, s.email
    FROM students s
    LEFT JOIN enrollments e ON s.student_id = e.student_id
    WHERE e.student_id IS NULL;
END //
DELIMITER ;

CALL GetStudentsWithoutEnrollment();

-- 5. Find the average grade of students in a specific course
DELIMITER //
CREATE PROCEDURE GetAverageGradeByCourse(IN course_name_param VARCHAR(45))
BEGIN
    SELECT c.course_name, AVG(CASE 
        WHEN e.grade = 'A' THEN 4.0 
        WHEN e.grade = 'B' THEN 3.0 
        WHEN e.grade = 'C' THEN 2.0 
        WHEN e.grade = 'D' THEN 1.0 
        WHEN e.grade = 'F' THEN 0.0 
        ELSE NULL END) AS average_grade
    FROM enrollments e
    JOIN course c ON e.course_id = c.course_id
    WHERE c.course_name = course_name_param
    GROUP BY c.course_name;
END //
DELIMITER ;

CALL GetAverageGradeByCourse('Python');



-- get all data in each table again in lab5
SELECT * FROM students;

SELECT * FROM enrollments;

SELECT * FROM faculty;

SELECT * FROM course;

SELECT * FROM departments;
