# E-commerce-Website-Database-Management
In recent times, online retail platforms have gained popularity over traditional stores as the shopping behaviors are changing.
The main objective of this project is to develop an e-commerce platform model for a customer where they can register or buy a product i.e., it allows registered users to view and purchase the required products.
For the project, we have chosen to build the online shopping model for electronics including mobile phones, laptops, monitors, phone accessories, speakers etc.

![image](https://www.zeumic.com.au/wp-content/uploads/2018/01/zeumic-e-commerce-cycle-image.jpg)

## Database Description:
1)	Any user can register on the website and view the available products. Only registered users can purchase the products available. The **login** user will need to input information such as name, email address, date of birth, phone number, etc.
2)	When a customer makes the first purchase, new information related to the **payment** such as billing address, shipping address, card and/or bank details etc., will be added to the database.
3)	Each customer can place several **orders** at a single time. The customer can add multiple products (at least one) to a **shopping cart**.
4)	Each order will generate an **order items** entry which will hold the information of all the products that have been bought in each order being placed. 
5)	Each product can be sold by several **suppliers**. One supplier can be linked to multiple products. The user can choose the supplier’s name while making a purchase.
6)	The **products** sold on the website will contain information such as item number, name, category, availability  in stock or not, customer rating, etc.
7)	Each product will belong to a certain **category** depending on the type of item being sold. One product can belong to a single category.
8)	Each order can be assigned to a **courier** service that takes care of shipping the products to the customer.
9)	3 types of roles (supplier, customer, and admins) with different privileges granted will be available on the website.
* **Suppliers** are the source of the range of products available.
*	Once the visitor decides to purchase items, they need to register on the website. Such users then become **customers**.
* **Admins**, on the other hand, will have special privileges apart from the other roles. This will include adding new products, editing, or removing available products, marking products as out of stock, etc.

## Implementation in MySQL:
Data Generation:
The relational model has been translated to the database schema in MySQL. After creating the tables, we used the https://generatedata.com/generator to create the sample data for the database. We specified data type and attribute type name for each attribute of every table in the model to create data for corresponding tables. Further, we used insert queries to load the data in the database.

## Implementation in NoSQL:
A small part of the database model that we have created has been implemented in the Neo4j application as part of NoSQL implementation. This is a graph database that helps to easily visualize the relationship between different tables. Out of the 13 tables, we have implemented 5 important tables including Customer, Orders, Product, Category and Supplier. Cypher queries have been written to create these tables. Further, the relationships between these tables have been defined.

## Database Access Via Python (Application):
The database is accessed using Python and basic analytics and isualization is performed. The connection of MySQL to Python is done using ‘mysql.connector’ and ‘mycursor.execute’ is used to execute the query through python followed by converting the list into a dataframe using pandas library and finally using matplotlib and seaborn to plot the graphs for the analytics.
