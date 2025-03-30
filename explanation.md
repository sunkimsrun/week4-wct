# 1. Retrieve All Students Enrolled in a Specific Course
```sql
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
```

**Explanation:** Retrieves student information with the course name for all students enrolled in ***(python)*** course and displaying their student_Id, first_name, last_name, and course name.

# 2. Retrieve Course Information by Student ID
```sql
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
```

**Explanation:** The stored procedure GetFacultyByDepartment will retrieves information about faculty members who belong to a ***(IT department)***. it will return the faculty_id, name, and department_name for all faculty members in the '**IT**' department.

# 3. List all courses a particular student is enrolled in
```sql
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
```

**Explanation:** Retrieves the courses which student is enrolled in based on their email address along with the course name and course code. When executed with a student's email as the ***(input parameter)***, it returns a list of courses the student is enrolled in. 

***For example, if call GetCoursesByStudent('sunkimsrun11@gmail.com'), it will show the courses that the student with this email is enrolled in, including their names and course codes.***


# 4. Retrieve students who have not enrolled in any course
```sql
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
```

**Explanation:** Retrieves the list of students who are not enrolled in any courses. this procedure will return a list of students' IDs, names, and email addresses for those who have not enrolled in any course. ***the result will show 2 students are not enrolled in any course***


# 5. Find the average grade of students in a specific course
```sql
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
```

**Explanation:** Calculates the average grade of students for a course based on the course name.  It assign values letter to grades (A = 4.0, B = 3.0, C = 2.0, D = 1.0, F = 0.0). it will return the course name and the average grade for the ***(example 'Python' course)***, based on the grades of students enrolled in it.

