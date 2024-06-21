CREATE TABLE Department (
  D_Number VARCHAR(10) PRIMARY KEY,
  D_Name VARCHAR(50),
  D_Phone VARCHAR(20),
  Office_Location VARCHAR(50)
);

ALTER TABLE Department
ADD COLUMN Chairperson_Professor_SSN VARCHAR(14),
ADD CONSTRAINT fk_Chairperson_Professor_SSN
FOREIGN KEY (Chairperson_Professor_SSN)
REFERENCES Professor (SSN);


CREATE TABLE Professor (
  SSN VARCHAR(14) NOT NULL PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Title VARCHAR(50),
  Sex CHAR(1),
  Salary DECIMAL(10,2),
  Phone VARCHAR(20),
  Degree VARCHAR(50),
  Address VARCHAR(100)
);

CREATE TABLE Course (
  C_Number VARCHAR(10) NOT NULL PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Textbook VARCHAR(255),
  Units INT,
  D_Number VARCHAR(10) NOT NULL,
  Prerequisite_Course_Number VARCHAR(10),
  FOREIGN KEY (D_Number) REFERENCES Department (D_Number),
  FOREIGN KEY (Prerequisite_Course_Number) REFERENCES Course (C_Number)
);

CREATE TABLE Section (
    S_Number VARCHAR(15) NOT NULL,
    C_Number VARCHAR(10) NOT NULL,
    Classroom VARCHAR(50),
    Capacity INT,
    Meeting_Day VARCHAR(10),
    Beginning_Time TIME,
    End_Time TIME,
    PRIMARY KEY (S_Number, C_Number),
    FOREIGN KEY (C_Number) REFERENCES Course(C_Number)
);

ALTER TABLE Section
ADD COLUMN P_SSN CHAR(11),
ADD CONSTRAINT FK_Section_Professor
FOREIGN KEY (P_SSN)
REFERENCES Professor(SSN);

CREATE TABLE Student (
    ID VARCHAR(10) NOT NULL PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    Address VARCHAR(100),
    Phone VARCHAR(20),
    D_Number VARCHAR(10) NOT NULL,
    FOREIGN KEY (D_Number) REFERENCES Department(D_Number)
);

CREATE TABLE Student_Minor (
    Student_ID VARCHAR(10) NOT NULL,
    Department_Number VARCHAR(10) NOT NULL,
    PRIMARY KEY (Student_ID, Department_Number),
    FOREIGN KEY (Student_ID) REFERENCES Student(ID),
    FOREIGN KEY (Department_Number) REFERENCES Department(D_Number)
);

CREATE TABLE Enroll (
    Student VARCHAR(10) NOT NULL,
    C_Number VARCHAR(10) NOT NULL,
    S_Number VARCHAR(15) NOT NULL,
    Grade VARCHAR(2),
    PRIMARY KEY (Student, C_Number),
    FOREIGN KEY (Student) REFERENCES Student(ID),
    FOREIGN KEY (C_Number) REFERENCES Course(C_Number),
    FOREIGN KEY (S_Number) REFERENCES Section(S_Number)
);
