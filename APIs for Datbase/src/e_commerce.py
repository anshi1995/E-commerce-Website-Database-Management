import bottle
import mysql.connector
from bottle import run, get

app = application = bottle.default_app()


mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="Selva@251064",
    database='ecommerce_DB'
)
mycursor = mydb.cursor()

@get('/get_top_categories')
def get_top_categories():

    mycursor.execute("SELECT ct.CategoryName AS Category, COUNT(oi.OrderID) AS Total_Orders FROM Category ct INNER JOIN Product p ON ct.CategoryID = p.CategoryID INNER JOIN OrderItems oi ON p.ProductID = oi.ProductID GROUP BY p.CategoryID ORDER BY Total_Orders DESC;")
    result = mycursor.fetchall()
  

    return{'output': result}

@get('/get_top_selling_products')
def get_top_selling_products():

    mycursor.execute("SELECT p.ProductName AS Product, COUNT(oi.OrderID) AS Total FROM Product p INNER JOIN OrderItems oi ON p.ProductID = oi.ProductID GROUP BY oi.ProductID ORDER BY Total DESC limit 5;")
    result = mycursor.fetchall()
  

    return{'output': result}

@get('/get_top_customers')
def get_top_customers():

    mycursor.execute("SELECT c.FirstName, c.LastName AS CustomerName, COUNT(o.OrderID) AS Total_Orders FROM Customer c INNER JOIN Orders o ON c.CustomerID = o.CustomerID GROUP BY c.CustomerID ORDER BY Total_Orders DESC;")
    result = mycursor.fetchall()
  

    return{'output': result}

@get('/get_most_preferred_payment')
def get_most_preferred_payment():

    mycursor.execute("SELECT PaymentType, COUNT(*) AS Number_of_Times FROM Payment GROUP BY PaymentType ORDER BY Number_of_Times DESC;")
    result = mycursor.fetchall()
  

    return{'output': result}

if __name__ == '__main__':
    bottle.run(host = '127.0.0.1', port = 8000)