import sqlite3
import os

def execute_queries(db_path, sql_file_path):

    # connect to dataBase

    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()

    # read SQL file
    with open(sql_file_path, 'r', encoding='utf-8') as f:
        sql_script = f.read()

    #  it is possible to exist so many queres on sql so must to divide
    queries = sql_script.split(';')
    for q in queries:
        q = q.strip()
        if not q:
            continue
        print("Executing query:\n", q)
        try:
            cursor.execute(q)
            rows = cursor.fetchall()

            # print a few of first rows

            for row in rows[:10]:
                print(row)
            print("... total rows:", len(rows))
            print("-" * 40)
        except sqlite3.Error as e:
            print("Error in query:", e)
            print("Skipped this query.")
    conn.close()

if __name__ == '__main__':

    # dataBase and SQL path

    db_path = os.path.join(os.path.dirname(__file__), '..', 'chinook.db')
    sql_file_path = os.path.join(os.path.dirname(__file__), '..', 'sql', 'queries.sql')
    execute_queries(db_path, sql_file_path)

