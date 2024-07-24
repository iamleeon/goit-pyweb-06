-- Table: Students
DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_name VARCHAR(255) UNIQUE NOT NULL,
    group_id_fn INTEGER,
    FOREIGN KEY (group_id_fn) REFERENCES groups (id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Table: Groups
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_name VARCHAR(255) UNIQUE NOT NULL
);

-- Table: Teachers
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    teacher_name VARCHAR(255) UNIQUE NOT NULL
);

-- Table: Subjects
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subject_name VARCHAR(255) UNIQUE NOT NULL,
    teacher_id_fn INTEGER,
    FOREIGN KEY (teacher_id_fn) REFERENCES teachers (id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Table: Marks
DROP TABLE IF EXISTS marks;
CREATE TABLE marks (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    mark_value INTEGER NOT NULL,
    mark_date DATETIME NOT NUll,
    subject_id_fn INTEGER,
    student_id_fn INTEGER,
    FOREIGN KEY (subject_id_fn) REFERENCES subjects (id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (student_id_fn) REFERENCES students (id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
