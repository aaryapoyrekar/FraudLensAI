from faker import Faker
import random
from database import get_connection

fake = Faker("en_IN")


def generate_customer():
    return (
        fake.first_name(),
        fake.last_name(),
        fake.unique.email(),
        fake.msisdn()[:10],
        fake.date_between(start_date="-60y", end_date="-18y"),
        random.choice(["Male", "Female"]),
        random.choice(["Active", "Inactive"])
    )


conn = get_connection()
cursor = conn.cursor()

query = """
INSERT INTO customers
(
    first_name,
    last_name,
    email,
    phone,
    date_of_birth,
    gender,
    account_status
)
VALUES (%s,%s,%s,%s,%s,%s,%s)
"""

for _ in range(50):
    cursor.execute(query, generate_customer())

conn.commit()

cursor.close()
conn.close()

print("✅ 50 customers inserted successfully!")