-- 1. Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.

SELECT c.CustomerId, c.FirstName, c.LastName, c.Country
FROM Customer c
WHERE Country != "USA";

-- 2. Provide a query only showing the Customers from Brazil.

SELECT c.CustomerId, c.FirstName, c.LastName, c.Country
FROM Customer c
WHERE Country = "Brazil";

-- 3. Provide a query showing the Invoices of customers who are from Brazil. 
-- The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

SELECT c.FirstName, c.LastName, i.InvoiceId, i.InvoiceDate, i.BillingCountry
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE c.Country = "Brazil";

SELECT i.InvoiceId, i.InvoiceDate, i.BillingCountry, c.FirstName, c.LastName
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
WHERE c.Country = "Brazil";

-- 4. Provide a query showing only the Employees who are Sales Agents.

SELECT * FROM Employee WHERE Title = "Sales Support Agent";

-- 5. Provide a query showing a unique/distinct list of billing countries from the Invoice table.

SELECT * FROM Invoice GROUP BY BillingCountry ORDER BY BillingCountry;

-- 6. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

SELECT e.FirstName, e.LastName, i.InvoiceId, i.InvoiceDate, i.Total
FROM Employee e
JOIN Customer c ON c.SupportRepId = e.EmployeeId
JOIN Invoice i ON c.CustomerId = i.CustomerId
WHERE e.Title = "Sales Support Agent";

-- 7. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

SELECT i.Total AS "Invoice Total", c.FirstName AS "Customer First Name", c.LastName AS "Customer Last Name", c.Country, e.FirstName AS "Sales Agent First Name", e.LastName AS "Sales Agent Last Name"
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
JOIN Employee e ON c.SupportRepId = e.EmployeeId;

-- 8. How many Invoices were there in 2009 and 2011?

SELECT Count()
FROM Invoice
WHERE InvoiceDate LIKE '%2009%';

SELECT Count()
FROM Invoice
WHERE InvoiceDate LIKE '%2011%';