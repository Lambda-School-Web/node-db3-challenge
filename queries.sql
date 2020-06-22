-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select c.CategoryName as Category, p.ProductName as "Product Name" 
    from Product as p 
    join Category as c on p.CategoryId = c.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id as "Order ID", s.CompanyName as "Company Name" 
    FROM [Order] as o 
    JOIN Shipper as s on o.ShipVia = s.Id 
    where o.OrderDate < "2012-08-09";

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select p.ProductName as "Product Name", od.Quantity as Quantity 
    from OrderDetail as od 
    join Product as p on od.ProductID = p.Id 
    where od.OrderID = 10251 order by p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select o.Id as "Order ID", c.CompanyName as "Company Name", e.LastName as "Employee's Last Name" 
    from [Order] as o 
    join Customer as c on o.CustomerId = c.Id 
    join Employee as e on o.EmployeeId = e.Id;

-- STRETCH Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 9 records.
select c.CategoryName as Category, count(p.ProductName) as "Product Quantity" 
    from Categories as c 
    join Products as p on c.CategoryID = p.CategoryID 
    group by c.CategoryName

-- STRETCH Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
select od.OrderID as "Order ID", sum(od.Quantity) as "Item Count" 
    from OrderDetails as od 
    group by od.OrderID