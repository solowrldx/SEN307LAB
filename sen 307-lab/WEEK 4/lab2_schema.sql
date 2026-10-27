-- VUA-SEN307 Lab 2: course-registration schema (3NF)
-- Import in MySQL Workbench with File > Import > Reverse Engineer MySQL Create Script

CREATE TABLE Department (
  dept_id   INT NOT NULL AUTO_INCREMENT,
  dept_name VARCHAR(100) NOT NULL,
  PRIMARY KEY (dept_id)
) ENGINE=InnoDB;

CREATE TABLE Student (
  student_id INT NOT NULL AUTO_INCREMENT,
  matric_no  VARCHAR(20) NOT NULL,
  full_name  VARCHAR(100) NOT NULL,
  dept_id    INT NOT NULL,
  PRIMARY KEY (student_id),
  UNIQUE KEY uq_student_matric (matric_no),
  CONSTRAINT fk_student_dept FOREIGN KEY (dept_id) REFERENCES Department (dept_id)
) ENGINE=InnoDB;

CREATE TABLE Lecturer (
  lecturer_id   INT NOT NULL AUTO_INCREMENT,
  lecturer_name VARCHAR(100) NOT NULL,
  dept_id       INT NOT NULL,
  PRIMARY KEY (lecturer_id),
  CONSTRAINT fk_lecturer_dept FOREIGN KEY (dept_id) REFERENCES Department (dept_id)
) ENGINE=InnoDB;

CREATE TABLE Course (
  course_id    INT NOT NULL AUTO_INCREMENT,
  course_code  VARCHAR(20) NOT NULL,
  course_title VARCHAR(100) NOT NULL,
  PRIMARY KEY (course_id),
  UNIQUE KEY uq_course_code (course_code)
) ENGINE=InnoDB;

CREATE TABLE Enrolment (
  enrolment_id INT NOT NULL AUTO_INCREMENT,
  student_id   INT NOT NULL,
  course_id    INT NOT NULL,
  session      VARCHAR(20) NOT NULL,
  PRIMARY KEY (enrolment_id),
  CONSTRAINT fk_enrolment_student FOREIGN KEY (student_id) REFERENCES Student (student_id),
  CONSTRAINT fk_enrolment_course  FOREIGN KEY (course_id)  REFERENCES Course (course_id)
) ENGINE=InnoDB;

CREATE TABLE Teaching (
  teaching_id INT NOT NULL AUTO_INCREMENT,
  course_id   INT NOT NULL,
  lecturer_id INT NOT NULL,
  session     VARCHAR(20) NOT NULL,
  PRIMARY KEY (teaching_id),
  CONSTRAINT fk_teaching_course   FOREIGN KEY (course_id)   REFERENCES Course (course_id),
  CONSTRAINT fk_teaching_lecturer FOREIGN KEY (lecturer_id) REFERENCES Lecturer (lecturer_id)
) ENGINE=InnoDB;
