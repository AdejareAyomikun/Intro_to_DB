#!/usr/bin/env python3

import os
import sys

try:
    import mysql.connector
    from mysql.connector import errorcode
except Exception as e:
    print("Error: mysql-connector-python is required. Install with: pip install mysql-connector-python")
    sys.exit(1)


def get_db_config():
    return {
        'host': os.environ.get('MYSQL_HOST', '127.0.0.1'),
        'user': os.environ.get('MYSQL_USER', 'root'),
        'password': os.environ.get('MYSQL_PASSWORD', ''),
        'port': int(os.environ.get('MYSQL_PORT', 3306)),
    }


def create_database(cursor, db_name: str):
    try:
        sql = "CREATE DATABASE IF NOT EXISTS alx_book_store DEFAULT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci'"
        cursor.execute(sql)
        print(f"Database '{db_name}' created successfully!")
    except mysql.connector.Error as err:
        print(f"Failed creating database: {err}")
        raise


def main():
    db_name = 'alx_book_store'
    config = get_db_config()

    conn = None
    try:
        conn = mysql.connector.connect(**config)
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Access denied. Check your username or password.")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Error: The specified database does not exist.")
        else:
            print(f"Error: Could not connect to MySQL server: {err}")
        sys.exit(1)

    try:
        cursor = conn.cursor()
        create_database(cursor, db_name)
    except Exception:
        sys.exit(1)
    finally:
        try:
            if cursor is not None:
                cursor.close()
        except NameError:
            pass
        try:
            if conn is not None and conn.is_connected():
                conn.close()
        except NameError:
            pass


if __name__ == '__main__':
    main()
