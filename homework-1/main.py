import csv
import psycopg2
file_customers_data = '/home/semen/postgres_home/postgres-homeworks/homework-1/north_data/customers_data.csv'
file_orders_data = '/home/semen/postgres_home/postgres-homeworks/homework-1/north_data/orders_data.csv'
file_employees_data = '/home/semen/postgres_home/postgres-homeworks/homework-1/north_data/employees_data.csv'


def opening(file_name):
    with (open(file_name)
          as csvfile):
        list_1 = []
        filereader = csv.reader(csvfile)
        next(filereader)
        for elem in filereader:
            list_1.append(elem)
        return list_1


conn = psycopg2.connect(
    host='localhost',
    database='north',
    user='postgres',
    password='1523618095'
)
try:
    with conn:
        cur = conn.cursor()
        rows_customs = opening(file_customers_data)
        rows_orders = opening(file_orders_data)
        rows_employees = opening(file_employees_data)
        cur.executemany("INSERT INTO customers VALUES (%s, %s, %s)", rows_customs)
        cur.executemany("INSERT INTO orders VALUES (%s, %s, %s, %s, %s)", rows_orders)
        cur.executemany("INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)", rows_employees)


finally:

    conn.close()

