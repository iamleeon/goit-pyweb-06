import faker
import sqlite3

from datetime import datetime, date
from faker.providers import BaseProvider
from random import randint, choice


STUDENTS_NUMBER = 30
GROUPS_NUMBER = 3
TEACHERS_NUMBER = 5
SUBJECTS_NUMBER = 4


class UniversitySubjectProvider(BaseProvider):
    def university_subject(self):
        faculty_subjects = [
            "Mathematics", "English", "History", "Geography", "Biology",
            "Chemistry", "Physics", "Physical Education", "Art", "Music",
            "Computer Science", "Economics", "Psychology", "Sociology",
            "Political Science", "Literature", "Foreign Languages", "Philosophy",
            "Religious Studies", "Drama"
        ]
        return choice(faculty_subjects)


def generate_fake_data(students_number, groups_number, teachers_number, subjects_number) -> tuple():
    fake_students = []
    fake_groups = []
    fake_teachers = []
    fake_subjects = []

    fake_data = faker.Faker()
    fake_data.add_provider(UniversitySubjectProvider)

    for _ in range(students_number):
        fake_students.append(fake_data.name())

    for _ in range(groups_number):
        fake_groups.append(fake_data.city())

    for _ in range(teachers_number):
        fake_teachers.append(fake_data.name())

    for _ in range(subjects_number):
        fake_subjects.append(fake_data.university_subject())

    return fake_students, fake_groups, fake_teachers, fake_subjects


def prepare_data(students, groups, teachers, subjects) -> tuple():
    for_students = []
    for student in students:
        for_students.append((student, randint(1, GROUPS_NUMBER)))

    for_groups = []
    for group in groups:
        for_groups.append((group, ))

    for_teachers = []
    for teacher in teachers:
        for_teachers.append((teacher, ))

    for_subjects = []
    for subject in subjects:
        for_subjects.append((subject, randint(1, TEACHERS_NUMBER)))

    for_marks = []
    for month in range(1, 12 + 1):
        mark_date = datetime(2024, randint(1, 6), randint(1, 28)).date()
        for student in range(1, STUDENTS_NUMBER + 1):
            for_marks.append((
                randint(0, 100),
                mark_date,
                randint(1, SUBJECTS_NUMBER),
                student
            ))

    return for_students, for_groups, for_teachers, for_subjects, for_marks


def adapt_date(d):
    return d.isoformat()


def convert_date(s):
    return datetime.strptime(s.decode(), "%Y-%m-%d").date()


sqlite3.register_adapter(date, adapt_date)
sqlite3.register_converter("date", convert_date)


def insert_data_to_db(students, groups, teachers, subjects, marks) -> None:
    with sqlite3.connect("faculty.db") as conn:
        cursor = conn.cursor()

        sql_to_students = """INSERT INTO students(student_name, group_id_fn) VALUES (?, ?)"""
        cursor.executemany(sql_to_students, students)

        sql_to_groups = """INSERT INTO groups(group_name) VALUES (?)"""
        cursor.executemany(sql_to_groups, groups)

        sql_to_teachers = """INSERT INTO teachers(teacher_name) VALUES (?)"""
        cursor.executemany(sql_to_teachers, teachers)

        sql_to_subjects = """INSERT INTO subjects(subject_name, teacher_id_fn) VALUES (?, ?)"""
        cursor.executemany(sql_to_subjects, subjects)

        sql_to_marks = """INSERT INTO marks(mark_value, mark_date, subject_id_fn, student_id_fn) VALUES (?, ?, ?, ?)"""
        cursor.executemany(sql_to_marks, marks)

        conn.commit()


if __name__ == '__main__':
    students, groups, teachers, subjects, marks = prepare_data(*generate_fake_data(
        STUDENTS_NUMBER, GROUPS_NUMBER, TEACHERS_NUMBER, SUBJECTS_NUMBER))
    insert_data_to_db(students, groups, teachers, subjects, marks)
