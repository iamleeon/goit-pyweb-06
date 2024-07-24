import sqlite3


database_sql = "create_tables.sql"
database_db = "faculty.db"


def main():
    with open(database_sql, "r") as f:
        sql = f.read()

    with sqlite3.connect(database_db) as conn:
        cursor = conn.cursor()
        # Split the SQL script into individual statements
        sql_statements = sql.split(';')
        for statement in sql_statements:
            if statement.strip():  # Ignore empty statements
                cursor.execute(statement)
        conn.commit()  # Commit the changes if needed


if __name__ == '__main__':
    main()
