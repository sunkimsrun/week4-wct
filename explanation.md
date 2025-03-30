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

**Explanation:** dfdfdfdfdfdf.

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

**Explanation:** dfdfdfdfdfdf.

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

**Explanation:** dfdfdfdfdfdf.


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

**Explanation:** dfdfdfdfdfdf.


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

**Explanation:** dfdfdfdfdfdf.

