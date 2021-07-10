import psycopg2
# I'm passing cinnection object for instant commit
def read_data(connection):
    cursor = connection.cursor()
    # to confirm that data is inserted
    cursor.execute("SELECT * FROM test2;")
    results = cursor.fetchall()
    for row in results:
        print(row)

if __name__ == '__main__':
    connection = psycopg2.connect(
       database="jamee",
        user="postgres",
        password="VQfmJ)4@Fo>y2r[)w]U(5e+R",
        host="localhost",
        port="5432",
    )
    i = 1
    while i < 10000:
       read_data(connection)
       i += 1
    connection.close()

