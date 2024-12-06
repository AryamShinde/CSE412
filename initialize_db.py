import psycopg2
from psycopg2 import sql

# Connection details
DB_HOST = "localhost"
DB_NAME = "group_project"
DB_USER = "postgres"
DB_PASSWORD = "yourpassword"

# SQL statements to create tables
CREATE_TABLES = [
    """
    CREATE TABLE IF NOT EXISTS Customer (
        CustomerID SERIAL PRIMARY KEY,
        Name VARCHAR(255),
        Email VARCHAR(255) UNIQUE,
        Username VARCHAR(50) UNIQUE,
        Password VARCHAR(255)
    );
    """,
    """
    CREATE TABLE IF NOT EXISTS MenuItem (
        ItemID SERIAL PRIMARY KEY,
        Name VARCHAR(255),
        Description TEXT,
        Price DECIMAL(10, 2),
        Category VARCHAR(50)
    );
    """,
    """
    CREATE TABLE IF NOT EXISTS Reservation (
        ReservationID SERIAL PRIMARY KEY,
        CustomerID INT REFERENCES Customer(CustomerID),
        ReservationTime TIMESTAMP,
        PartySize INT,
        Status VARCHAR(50),
        SpecialRequests TEXT
    );
    """,
    """
    CREATE TABLE IF NOT EXISTS Review (
        ReviewID SERIAL PRIMARY KEY,
        CustomerID INT REFERENCES Customer(CustomerID),
        MenuItemID INT REFERENCES MenuItem(ItemID),
        Rating INT CHECK (Rating BETWEEN 1 AND 5),
        Comment TEXT,
        ReviewDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    """,
    """
    CREATE TABLE IF NOT EXISTS RestaurantTable (
        TableID SERIAL PRIMARY KEY,
        Capacity INT,
        Location VARCHAR(100)
    );
    """
]

# Seed data for tables
SEED_DATA = [
    # Customers
    """
    INSERT INTO Customer (Name, Email, Username, Password)
    VALUES 
    ('John Doe', 'john@example.com', 'johndoe', 'hashedpassword1'),
    ('Jane Smith', 'jane@example.com', 'janesmith', 'hashedpassword2')
    ON CONFLICT DO NOTHING;
    """,
    # Menu Items
    """
    INSERT INTO MenuItem (Name, Description, Price, Category)
    VALUES 
    ('Caesar Salad', 'Salad with romaine lettuce, croutons, and parmesan', 7.99, 'Appetizer'),
    ('Grilled Chicken', 'Grilled chicken with sides', 14.99, 'Main Course')
    ON CONFLICT DO NOTHING;
    """
]

# Initialize database connection
def get_db_connection():
    conn = psycopg2.connect(
        host=DB_HOST,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASSWORD
    )
    return conn

# Create tables and seed data
def initialize_database():
    conn = get_db_connection()
    cur = conn.cursor()

    try:
        # Create tables
        for query in CREATE_TABLES:
            cur.execute(query)

        # Seed data
        for query in SEED_DATA:
            cur.execute(query)

        conn.commit()
        print("Database initialized successfully.")
    except Exception as e:
        print(f"An error occurred: {e}")
    finally:
        cur.close()
        conn.close()

if __name__ == "__main__":
    initialize_database()
