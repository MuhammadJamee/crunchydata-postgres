import psycopg

connection = psycopg.connect(
    database="jamee",
    user="testuser",
    password="datalake",
    host="localhost",
    port="5432",
    )

# We need cursor for execution of SQL queries
cursor = connection.cursor()
cursor.execute("select * from test2;")
results = cursor.fetchall()
for row in results:
    print(row)
connection.close()
