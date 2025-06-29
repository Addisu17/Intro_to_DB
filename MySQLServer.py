import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Establish connection to MySQL server (without specifying a database)
        connection = mysql.connector.connect(
            host='localhost',  # Use your MySQL host, typically 'localhost' or '127.0.0.1'
            user='your_username',  # Replace with your MySQL username
            password='your_password'  # Replace with your MySQL password
        )

        # Check if connection was successful
        if connection.is_connected():
            cursor = connection.cursor()

            # SQL command to create database
            create_db_query = "CREATE DATABASE IF NOT EXISTS alx_book_store"
            
            # Execute the query
            cursor.execute(create_db_query)
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        # Handle connection errors
        print(f"Error: Unable to connect to the database. {e}")

    finally:
        # Ensure that the connection is closed
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("Connection closed.")

# Run the function to create the database
create_database()
