import psycopg

def get_connection():
    return psycopg.connect(
        host="localhost",
        dbname="FraudLensAI",
        user="postgres",
        password="Aarya@123",   # Replace with your password
        port=5432
    )

# Create connection
conn = get_connection()

# Create cursor
cursor = conn.cursor()

# Execute query
cursor.execute("SELECT * FROM customers")

# Fetch data
rows = cursor.fetchall()

# Print data
for row in rows:
    print(row)

# Close resources
cursor.close()
conn.close()