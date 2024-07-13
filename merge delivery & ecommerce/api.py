from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import mysql.connector
from mysql.connector import Error
from datetime import datetime
import uvicorn

app = FastAPI()

class Invoice(BaseModel):
    customer_name: str
    customer_address: str
    cost: float
    description: str
    status: str
    company_id: int

def connect_to_database():
    try:
        connection = mysql.connector.connect(
            host='host.docker.internal',  # Change this if your MySQL server is not on localhost
            database='delivery_database',  # Replace 'delivery_database' with your actual database name
            user='root',  # Replace 'root' with your actual database user
            password=''  # Replace '' with your actual database password
        )
        return connection
    except Error as e:
        print("Error while connecting to MySQL", e)
        return None

@app.post("/invoices/")
def create_invoice(invoice: Invoice):
    connection = connect_to_database()
    if connection is None or not connection.is_connected():
        raise HTTPException(status_code=500, detail="Could not connect to the database")

    try:
        cursor = connection.cursor()
        insert_query = """
        INSERT INTO invoices (created_at, updated_at, customer_name, customer_address, cost, description, status, company_id)
        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """
        new_invoice = (
            datetime.now().strftime('%Y-%m-%d %H:%M:%S'),  # created_at
            datetime.now().strftime('%Y-%m-%d %H:%M:%S'),  # updated_at
            invoice.customer_name,
            invoice.customer_address,
            invoice.cost,
            invoice.description,
            invoice.status,
            invoice.company_id
        )
        cursor.execute(insert_query, new_invoice)
        connection.commit()
        return {"message": "New invoice inserted successfully"}
    except Error as e:
        raise HTTPException(status_code=500, detail=str(e))
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed")

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=4000)
