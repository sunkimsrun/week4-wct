(# SQL Stored Procedures Explanation)

## 1. Retrieve All Students Enrolled in a Specific Course

### Procedure Name: `GetStudentsByCourse`

### SQL Code:
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
```
**Explanation:** dfdfdfdfdfdf.

## 2. Retrieve Course Information by Student ID
