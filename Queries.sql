INSERT INTO Department (D_Number, D_Name, D_Phone, Office_Location, Chairperson_Professor_SSN)
VALUES
('CPSC', 'Computer Science', '657-278-3163', 'Computer Science Building, Room 202', '123-45-6789'),
('ENGL', 'English', '657-278-3163', 'Gordon Halls, Room 323B', '345-67-8901'),
('MATH', 'Mathematics', '657-278-3163', 'McCarthy Hall, Room 154', '234-56-7890');

INSERT INTO Professor (SSN, Name, Title, Sex, Salary, Phone, Degree, Address)
VALUES
('123-45-6789', 'Bernie Howell', 'Assistant Professor', 'M', 80000, '1-714-774-7821', 'PhD', '123 Main St CA 92702'),
('234-56-7890', 'Lisa Schaefer', 'Professor', 'F', 100000, '1-714-772-3485', 'PhD', '456 South West St CA 92865'),
('345-67-8901', 'Renato Archer', 'Professor', 'M', 120000, '1-714-819-2304', 'PhD', '789 Oakland St CA 92843');

INSERT INTO Course (C_Number, Title, Textbook, Units, D_Number, Prerequesite_Course_Number)
VALUES
('CPSC 121', 'Introduction to Computer Science', 'Starting Out with C++', 3, 'CPSC', NULL),
('CPSC 131', 'Data Structures and Programming Techniques', 'Data Structures and Algorithms in C++', 3, 'CPSC', 'CPSC 121'),
('ENGL 101', 'Composition and Rhetoric', 'The Norton Field Guide to Writing', 3, 'ENGL', NULL),
('MATH 150A', 'Calculus I', 'Calculus: Early Transcendentals', 4, NULL);

INSERT INTO Section (S_Number, C_Number, Classroom, Capacity, Meeting_Day, Beginning_Time, End_Time) VALUES 
('Section 01', 'CPSC 121', 'CS Building, Room 201', 30, 'MWF', '09:00:00', '09:50:00'),
('Section 02', 'CPSC 121', 'CS Building, Room 332', 25, 'TTH', '11:00:00', '12:20:00'),
('Section 01', 'CPSC 131', 'CS Building, Room 201', 40, 'MW', '01:00:00', '02:20:00'),
('Section 02', 'CPSC 131', 'CS Building, Room 605', 20, 'TTH', '03:30:00', '04:50:00'),
('Section 01', 'ENGL 101', 'Gordon Halls, Room 202', 35, 'MWF', '11:00:00', '11:50:00'),
('Section 01', 'MATH 150A', 'McCarthy Hall, Room 601', 30, 'TTH', '10:00:00', '11:20:00');

UPDATE Section 
SET P_SSN = '123-45-6789'
WHERE S_Number = 'Section 01' AND C_Number = 'CPSC 121';

UPDATE Section 
SET P_SSN = '123-45-6789'
WHERE S_Number = 'Section 02' AND C_Number = 'CPSC 121';

UPDATE Section 
SET P_SSN = '123-45-6789'
WHERE S_Number = 'Section 01' AND C_Number = 'CPSC 131';

UPDATE Section 
SET P_SSN = '123-45-6789'
WHERE S_Number = 'Section 02' AND C_Number = 'CPSC 131';

UPDATE Section 
SET P_SSN = '345-67-8901'
WHERE S_Number = 'Section 01' AND C_Number = 'ENGL 101';

UPDATE Section 
SET P_SSN = '234-56-7890'
WHERE S_Number = 'Section 01' AND C_Number = 'MATH 150A';

INSERT INTO Student (ID, Fname, Lname, Address, Phone, D_Number)
VALUES
('103749882', 'Donny', 'Vazquez', '1232 Maryland St', '714-555-1212', 'CPSC'),
('932233223', 'Samuel', 'Patton', '4567 N. Hamilton St', '714-555-2121', 'CPSC'),
('123358250', 'Hazel', 'Merritt', '7890 Oakland St', '714-555-3434', 'CPSC'),
('796862879', 'Alice', 'Williams', '3213 Maple St', '714-555-4545', 'CPSC'),
('997342361', 'David', 'Lee', '987 North Cherry Drive St', '714-555-5656', 'ENGL'),
('339862886', 'Mary', 'Jones', '654 Lincoln St', '714-555-6767', 'ENGL'),
('736974249', 'Mark', 'Davis', '876 Cheddar Ave', '714-555-7878', 'MATH'),
('414101389', 'Karen', 'Taylor', '5434 South Birch St', '714-555-8989', 'MATH');

INSERT INTO Enroll (Student, C_Number, S_Number, Grade)
VALUES 
    ('103749882', 'CPSC 121', 'Section 01', 'B'),
    ('932233223', 'CPSC 131', 'Section 01', 'A-'),
    ('123358250', 'ENGL 101', 'Section 01', 'C'),
    ('796862879', 'MATH 150A', 'Section 02', 'D+'),
    ('997342361', 'CPSC 121', 'Section 02', 'B-'),
    ('339862886', 'CPSC 131', 'Section 02', 'C+'),
    ('736974249', 'ENGL 101', 'Section 02', 'A'),
    ('414101389', 'MATH 150A', 'Section 01', 'C-'),
    ('103749882', 'ENGL 101', 'Section 01', 'B+'),
    ('932233223', 'MATH 150A', 'Section 01', 'D-'),
    ('123358250', 'CPSC 121', 'Section 02', 'F'),
    ('796862879', 'CPSC 131', 'Section 02', 'C'),
    ('997342361', 'ENGL 101', 'Section 02', 'A-'),
    ('339862886', 'MATH 150A', 'Section 02', 'B+'),
    ('736974249', 'CPSC 121', 'Section 01', 'B-'),
    ('414101389', 'CPSC 131', 'Section 01', 'D'),
    ('103749882', 'MATH 150A', 'Section 02', 'C+'),
    ('932233223', 'ENGL 101', 'Section 02', 'A'),
    ('123358250', 'CPSC 131', 'Section 01', 'B'),
    ('736974249', 'MATH 150A', 'Section 01', 'C-');